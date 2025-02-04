// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class ScanQrCodeScreen extends StatefulWidget {
//   const ScanQrCodeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
// }
//
// class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
//   bool hasPermission = false;
//   bool isFlashOn = false;
//   late MobileScannerController scannerController;
//
//   @override
//   void initState() {
//     super.initState();
//     scannerController = MobileScannerController();
//     _checkPermission();
//   }
//
//   Future<void> _checkPermission() async {
//     final status = await Permission.camera.request();
//     if (status.isGranted) {
//       setState(() {
//         hasPermission = true;
//       });
//       await Future.delayed(Duration(seconds: 1)); // ক্যামেরা লোডের জন্য বিলম্ব
//       scannerController.start(); // ক্যামেরা চালু করো
//     } else {
//       setState(() {
//         hasPermission = false;
//       });
//     }
//   }
//
//   void _toggleFlash() {
//     setState(() {
//       isFlashOn = !isFlashOn;
//       scannerController.toggleTorch();
//     });
//   }
//
//   Future<void> _processScannerData(String? data) async {
//     if (data == null) return;
//
//     scannerController.stop();
//     String type = "Text";
//
//     if (data.startsWith("dk")) {
//       type = "Contact";
//     } else if (data.startsWith("http") || data.startsWith("https")) {
//       type = "URL";
//     }
//
//     showModalBottomSheet(
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       context: context,
//       builder: (context) => DraggableScrollableSheet(
//         initialChildSize: 0.6,
//         minChildSize: 0.4,
//         maxChildSize: 0.9,
//         builder: (context, scrollController) => Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Text(
//                   "Scan Result",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text("Type: $type", style: TextStyle(fontSize: 16)),
//               const SizedBox(height: 10),
//               Expanded(
//                 child: SingleChildScrollView(
//                   controller: scrollController,
//                   child: SelectableText(data, style: TextStyle(fontSize: 16)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!hasPermission) {
//       return Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(), // লোডিং ইনডিকেটর
//         ),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Scan QR Code"),
//         actions: [
//           IconButton(
//             icon: Icon(isFlashOn ? Icons.flash_on : Icons.flash_off),
//             onPressed: _toggleFlash,
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 350,
//             child: Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//               elevation: 4,
//               margin: const EdgeInsets.all(16),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: MobileScanner(
//                   controller: scannerController,
//                   onDetect: (barcodes) {
//                     final barcode = barcodes.barcodes.first;
//                     if (barcode.rawValue != null) {
//                       _processScannerData(barcode.rawValue);
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             "Align the QR Code within the frame",
//             style: TextStyle(fontSize: 16, color: Colors.grey),
//           ),
//           SizedBox(height: 30),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     scannerController.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  bool hasPermission = false;
  bool isFlashOn = false;
  late MobileScannerController scannerController;

  @override
  void initState() {
    super.initState();
    scannerController = MobileScannerController();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      setState(() {
        hasPermission = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      scannerController.start();
    }
  }

  void _toggleFlash() {
    setState(() {
      isFlashOn = !isFlashOn;
      scannerController.toggleTorch();
    });
  }

  final Map<String, String> eCodeStatus = {
    "E120": "❌ Haram", "E441": "❌ Haram", "E470": "❌ Haram",
    "E471": "⚠️ Doubtful", "E472": "⚠️ Doubtful", "E542": "❌ Haram",
    "E904": "⚠️ Doubtful", "E920": "❌ Haram",
    "E100": "✅ Halal", "E101": "✅ Halal", "E140": "✅ Halal",
    "E160a": "✅ Halal", "E162": "✅ Halal", "E200": "✅ Halal",
    "E202": "✅ Halal", "E210": "✅ Halal", "E211": "✅ Halal",
    "E300": "✅ Halal", "E301": "✅ Halal", "E306": "✅ Halal",
    "E406": "✅ Halal", "E410": "✅ Halal", "E412": "✅ Halal",
    "E440": "✅ Halal", "E900": "✅ Halal", "E901": "✅ Halal",
    "E902": "✅ Halal", "E903": "✅ Halal",
  };

  String checkHalalStatus(String data) {

    for (var code in eCodeStatus.keys) {
      if (data.contains(code)) {
        return eCodeStatus[code]!;
      }
    }
    return "Unknown";
  }

  Future<void> _processScannerData(dynamic data) async {
    if (data == null) return;

    scannerController.stop();
    dynamic halalStatus = checkHalalStatus(data);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Scan Result"),
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
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              scannerController.start();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!hasPermission) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code"),
        actions: [
          IconButton(
            icon: Icon(isFlashOn ? Icons.flash_on : Icons.flash_off),
            onPressed: _toggleFlash,
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
                  controller: scannerController,
                  onDetect: (barcodes) {
                    final barcode = barcodes.barcodes.first;
                    if (barcode.rawValue != null) {
                      print('-----------------------------a--------${barcode}');
                      print('-----------------------------b--------${barcode.rawValue}');
                      print('-----------------------------c--------${barcode.contactInfo?.name}');
                      print('-----------------------------d--------${barcode.url}');
                      print('-----------------------------e--------${barcode.sms}');
                      print('-----------------------------f--------${barcode.type}');
                      _processScannerData(barcode.rawValue);
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
  }

  @override
  void dispose() {
    scannerController.dispose();
    super.dispose();
  }
}