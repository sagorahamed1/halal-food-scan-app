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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:scanner_app/food_model.dart';

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
    "E100": "⚠️ Mushbooh",
    "E101": "⚠️ Mushbooh",
    "E102": "✅ Halal",
    "E103": "⚠️ Mushbooh",
    "E104": "⚠️ Mushbooh",
    "E105": "⚠️ Mushbooh",
    "E107": "✅ Halal",
    "E110": "⚠️ Mushbooh",
    "E120": "❌ Haram",
    "E122": "⚠️ Mushbooh",
    "E123": "⚠️ Mushbooh",
    "E124": "❌ Haram",
    "E127": "⚠️ Mushbooh",
    "E128": "⚠️ Mushbooh",
    "E129": "✅ Halal",
    "E131": "⚠️ Mushbooh",
    "E132": "⚠️ Mushbooh",
    "E133": "✅ Halal",
    "E140": "⚠️ Mushbooh",
    "E150a": "✅ Halal",
    "E150b": "✅ Halal",
    "E150c": "✅ Halal",
    "E150d": "✅ Halal",
    "E151": "✅ Halal",
    "E153": "⚠️ Mushbooh",
    "E154": "✅ Halal",
    "E155": "⚠️ Mushbooh",
    "E160a": "⚠️ Mushbooh",
    "E160b": "✅ Halal",
    "E160c": "✅ Halal",
    "E160d": "⚠️ Mushbooh",
    "E160e": "⚠️ Mushbooh",
    "E160f": "⚠️ Mushbooh",
    "E161a": "⚠️ Mushbooh",
    "E161b": "⚠️ Mushbooh",
    "E161c": "⚠️ Mushbooh",
    "E161d": "⚠️ Mushbooh",
    "E161e": "⚠️ Mushbooh",
    "E161f": "⚠️ Mushbooh",
    "E161g": "⚠️ Mushbooh",
    "E162": "⚠️ Mushbooh",
    "E163": "✅ Halal",
    "E170": "✅ Halal",
    "E171": "✅ Halal",
    "E172": "✅ Halal",
    "E173": "✅ Halal",
    "E174": "✅ Halal",
    "E175": "✅ Halal",
    "E180": "⚠️ Mushbooh",
    "E200": "✅ Halal",
    "E201": "✅ Halal",
    "E202": "✅ Halal",
    "E203": "✅ Halal",
    "E210": "⚠️ Mushbooh",
    "E211": "✅ Halal",
    "E212": "✅ Halal",
    "E213": "⚠️ Mushbooh",
    "E214": "⚠️ Mushbooh",
    "E215": "✅ Halal",
    "E216": "⚠️ Mushbooh",
    "E217": "✅ Halal",
    "E218": "✅ Halal",
    "E219": "✅ Halal",
    "E220": "✅ Halal",
    "E221": "✅ Halal",
    "E222": "✅ Halal",
    "E223": "✅ Halal",
    "E224": "✅ Halal",
    "E226": "✅ Halal",
    "E227": "✅ Halal",
    "E228": "✅ Halal",
    "E230": "✅ Halal",
    "E231": "✅ Halal",
    "E232": "✅ Halal",
    "E233": "✅ Halal",
    "E234": "⚠️ Mushbooh",
    "E235": "✅ Halal",
    "E239": "✅ Halal",
    "E242": "✅ Halal",
    "E249": "✅ Halal",
    "E250": "✅ Halal",
    "E251": "✅ Halal",
    "E252": "⚠️ Mushbooh",
    "E260": "✅ Halal",
    "E261": "✅ Halal",
    "E262": "✅ Halal",
    "E263": "✅ Halal",
    "E270": "⚠️ Mushbooh",
    "E280": "⚠️ Mushbooh",
    "E281": "✅ Halal",
    "E282": "✅ Halal",
    "E283": "✅ Halal",
    "E284": "✅ Halal",
    "E285": "✅ Halal",
    "E290": "✅ Halal",
    "E296": "✅ Halal",
    "E297": "✅ Halal",
    "E300": "✅ Halal",
    "E301": "✅ Halal",
    "E302": "✅ Halal",
    "E304": "⚠️ Mushbooh",
    "E306": "⚠️ Mushbooh",
    "E307": "✅ Halal",
    "E308": "✅ Halal",
    "E309": "✅ Halal",
    "E310": "✅ Halal",
    "E311": "✅ Halal",
    "E312": "✅ Halal",
    "E315": "✅ Halal",
    "E316": "✅ Halal",
    "E319": "⚠️ Mushbooh",
    "E320": "⚠️ Mushbooh",
    "E321": "⚠️ Mushbooh",
    "E322": "✅ Halal",
    "E325": "⚠️ Mushbooh",
    "E326": "⚠️ Mushbooh",
    "E327": "⚠️ Mushbooh",
    "E330": "✅ Halal",
    "E331": "✅ Halal",
    "E332": "✅ Halal",
    "E333": "✅ Halal",
    "E334": "⚠️ Mushbooh",
    "E335": "⚠️ Mushbooh",
    "E336": "⚠️ Mushbooh",
    "E337": "⚠️ Mushbooh",
    "E338": "✅ Halal",
    "E339": "⚠️ Mushbooh",
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
                      getECode(barcode.rawValue.toString());
                      print('-----------------------------a--------${barcode}');
                      print('-----------------------------b--------${barcode.rawValue}');
                      print('-----------------------------c--------${barcode.contactInfo?.name}');
                      print('-----------------------------d--------${barcode.url}');
                      print('-----------------------------e--------${barcode.sms}');
                      print('-----------------------------f--------${barcode.type}');

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

  Future<void> getECode(String barcode) async {
    final url = Uri.parse('https://world.openfoodfacts.org/api/v0/product/$barcode.json');

    try {
      final response = await http.get(url);

      print("-------------------code : ${response.statusCode}   \n ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 1) {
          // FoodModel food = data;
          String productName = data['product']['product_name'] ?? 'Unknown Product';
          String eCode = data['product']['additives_tags'][0] ?? '$barcode';

          print("📦 Product: $productName");
          print("🔢 E-Code: $eCode");
          // print("=== food code : ${food.code}");
          print("=== food product : ${data['product']['additives_tags']}");
          _processScannerData(eCode);
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




