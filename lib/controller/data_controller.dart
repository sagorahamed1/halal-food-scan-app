import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:scanner_app/data/e_code.dart';

class ScanQrCodeController extends GetxController {
  var hasPermission = false.obs;
  var isFlashOn = false.obs;
  late MobileScannerController scannerController;

  @override
  void onInit() {
    super.onInit();
    scannerController = MobileScannerController();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      hasPermission.value = true;
      await Future.delayed(const Duration(seconds: 1));
      scannerController.start();
    }
  }

  void toggleFlash() {
    isFlashOn.value = !isFlashOn.value;
    scannerController.toggleTorch();
  }

  String checkHalalStatus(String data) {
    for (var code in ECode.eCodeStatus.keys) {
      if (data.contains(code)) {
        return ECode.eCodeStatus[code]!;
      }
    }
    return "Unknown";
  }

  Future<void> processScannerData(dynamic data) async {
    if (data == null) return;
    scannerController.stop();
    dynamic halalStatus = checkHalalStatus(data);

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


  Future<void> getECode(String barcode) async {
    final url = Uri.parse('https://world.openfoodfacts.org/api/v0/product/$barcode.json');

    try {
      final response = await http.get(url);
      print("-------------------code : ${response.statusCode}   \n ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 1) {
          String productName = data['product']['product_name'] ?? 'Unknown Product';
          String eCode = data['product']['additives_tags'][0] ?? '$barcode';

          print("📦 Product: $productName");
          print("🔢 E-Code: $eCode");
          print("=== food product : ${data['product']['additives_tags']}");
          processScannerData(eCode);
        } else {
          print("❌ No product found for this barcode.");
        }
      } else {
        print("⚠️ Error fetching data.");
      }
    } catch (e, s) {
      print("🚨 Exception: $e");
      print("🚨 Exception: $s");
    }
  }
}