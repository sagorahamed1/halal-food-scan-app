import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:scanner_app/data/e_code.dart';

class ScanQrCodeController extends GetxController {
  RxBool isScannerOpen = false.obs;
  var hasPermission = false.obs;
  var isFlashOn = false.obs;
  late MobileScannerController scannerController;

  @override
  void onInit() {
    super.onInit();
    scannerController = MobileScannerController();
    checkPermission();
  }

  Future<void> checkPermission() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      hasPermission.value = true;
      print("✅ Camera permission granted!");
      scannerController.start();
      update();
    } else {
      hasPermission.value = false;
      print("❌ Camera permission denied!");
    }
  }

  void toggleFlash() {
    isFlashOn.value = !isFlashOn.value;
    scannerController.toggleTorch();
  }

  void toggleScannerOpen() {
    isScannerOpen.value = !isScannerOpen.value;
    if (isScannerOpen.value) {
      scannerController.start();
      update();
    } else {
      scannerController.stop();
    }
  }



  Future<void> processScannerData(String data) async {
    scannerController.stop();
    String halalStatus = checkHalalStatus(data);

    Get.defaultDialog(
      title: "Scan Result",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Halal Status: $halalStatus",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: halalStatus.contains("Haram") ? Colors.red : Colors.green,
            ),
          ),
          const SizedBox(height: 10),
          SelectableText(data, style: const TextStyle(fontSize: 16)),
        ],
      ),
      textConfirm: "OK",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
        scannerController.start();
      },
    );
  }


  String checkHalalStatus(String data) {
    // Extract the E-code part from the "en:e471" format
    final eCode = data.split(":").last.toUpperCase(); // Get the part after ':'

    for (var code in ECode.eCodeStatus.keys) {
      if (eCode.contains(code)) {
        return ECode.eCodeStatus[code]!;
      }
    }

    return "Unknown";
  }

  _processScannerData({
    String? halalStatus,
    String? foodImage,
    String? foodName,
    String? ingredients,
    String? rawValue,
  }) async {
    // Check Halal Status
    String status = checkHalalStatus(rawValue ?? '');

    // Show Bottom Sheet
    Get.bottomSheet(
      Container(
        padding:  EdgeInsets.all(16.r),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 20.h),

            Center(
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.green)
                    ),
                    child: Image.network(foodImage ?? '', errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.image); // Show an error icon if the image fails to load
                    }, height: 200.h, width: 200.w, fit: BoxFit.cover),
                  ),

                  SizedBox(height: 10.h),

                  SelectableText(
                    foodName ?? 'Unknown Food',
                    style: TextStyle(fontSize: 18.h, fontWeight: FontWeight.w700),
                  ),

                ],
              ),
            ),

            SizedBox(height: 30.h),


            Text(
              "Scan Result",
              style: TextStyle(
                fontSize: 22.h,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10.h),

            Text("Ingredients: $ingredients",        style: TextStyle(
              fontSize: 22.h,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),),

            Text(
              "Status: $status",
              style: TextStyle(
                fontSize: 16.h,
                fontWeight: FontWeight.bold,
                color: status.contains("Haram") ? Colors.red : Colors.green,  // Color based on status
              ),
            ),
             SizedBox(height: 10.h),



            SizedBox(height: 10.h),

            SelectableText(
              rawValue?.split(":").last.toUpperCase()  ?? 'Unknown Food',
              style: TextStyle(fontSize: 16.h),
            ),
             SizedBox(height: 20.h),

            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();  // Close the bottom sheet
                  scannerController.start();  // Restart the scanner
                },
                child: const Text("OK"),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }


  RxBool getCodeLoading = false.obs;
  Future<void> getECode(String barcode) async {
    getCodeLoading(true);
    toggleScannerOpen();
    update();
    final url = Uri.parse('https://world.openfoodfacts.org/api/v7/product/$barcode.json');

    try {
      final response = await http.get(url);
      print("-------------------code : ${response.statusCode} \n ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 1) {
          String productName = data['product']['product_name'] ?? 'Unknown Product';
          String eCode = (data['product']?['additives_tags'] != null &&
              (data['product']?['additives_tags'] as List).isNotEmpty)
              ? data['product']!['additives_tags'][0]
              : barcode;

          String foodImage = data['product']['selected_images']['front']['display']['fr'] ?? '';
          print("📦 Product: $productName");
          print("🔢 E-Code: $eCode");

          // Call the processScannerData with necessary details
          _processScannerData(
            halalStatus: checkHalalStatus(eCode),
            foodImage: foodImage,
            foodName: productName,
            rawValue: eCode,
          );
        } else {
          print("❌ No product found for this barcode.");
          _processScannerData(
            halalStatus: checkHalalStatus(barcode),
            foodImage: "foodImage",
            foodName: "❌ No product found for this barcode.",
            rawValue: barcode,
          );
          update();
          scannerController.stop();
        }
        getCodeLoading(false);
      } else {
        print("⚠️ Error fetching data.");
        _processScannerData(
          halalStatus: checkHalalStatus(barcode),
          foodImage: "foodImage",
          foodName: "❌ No product found for this barcode.",
          rawValue: barcode,
        );
        update();
        scannerController.stop();
        getCodeLoading(false);
      }
    } catch (e, s) {
      getCodeLoading(false);
      print("🚨 Exception: $e");
      print("🚨 StackTrace: $s");
    }
  }


}



