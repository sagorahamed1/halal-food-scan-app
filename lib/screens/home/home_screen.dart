import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../controller/data_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScanQrCodeController controller = Get.put(ScanQrCodeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Scan a barcode or QR code to check if the food is Halal, Haram, or Mushbooh",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22.h, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 50.h),
            Text(
              "Tap to scan now!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.h, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 24.h),
            Obx(() {
              return !controller.isScannerOpen.value
                  ? GestureDetector(
                      onTap: () async {
                        await controller.checkPermission();
                        if (controller.hasPermission.value) {
                          controller.toggleScannerOpen();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: Colors.blueAccent),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(40.r),
                          child: Icon(Icons.qr_code_scanner, size: 100.r),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 200.h,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 4,
                        margin: const EdgeInsets.all(16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: MobileScanner(
                            controller: controller.scannerController,
                            onDetect: (barcodes) {
                              final barcode = barcodes.barcodes.first;
                              if (barcode.rawValue != null) {
                                controller
                                    .getECode(barcode.rawValue.toString());
                              }
                            },
                          ),
                        ),
                      ),
                    );
            }),
            SizedBox(height: 100.h),
            ElevatedButton(
              onPressed: () {
                controller.toggleFlash();
              },
              child: Obx(
                () =>
                    Text(controller.isFlashOn.value ? "Flash OFF" : "Flash ON"),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
