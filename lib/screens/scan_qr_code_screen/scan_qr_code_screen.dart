import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../controller/data_controller.dart';



class ScanQrCodeScreen extends StatelessWidget {

   ScanQrCodeScreen({super.key});

   final ScanQrCodeController controller = Get.put(ScanQrCodeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!controller.hasPermission.value) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text("Scan QR Code"),
          actions: [
            IconButton(
              icon: Obx(() => Icon(controller.isFlashOn.value ? Icons.flash_on : Icons.flash_off)),
              onPressed: controller.toggleFlash,
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 350,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                margin: const EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: MobileScanner(
                    controller: controller.scannerController,
                    onDetect: (barcodes) {
                      final barcode = barcodes.barcodes.first;
                      if (barcode.rawValue != null) {
                        controller.getECode(barcode.rawValue.toString());
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Align the QR Code within the frame",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
    });
  }
}
