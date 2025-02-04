// import 'package:flutter/material.dart';
// import 'package:scanner_app/screens/scan_qr_code_screen/scan_qr_code_screen.dart';
//
// import 'genarate_qr_code.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const HomeScreen());
//   }
// }
//
//
//
//
//
//
//
//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("QR Code Generator and Scanner"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         child: Column(
//           children: [
//
//             SizedBox(height: 100),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const ScanQrCodeScreen()));
//                 },
//                 child: const Text("QR Code Scan")),
//             const SizedBox(height: 50),
//
//
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const GenerateQRCodeScreen()));
//                 },
//                 child: const Text("QR Code Generator"))
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//



import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> getECode(String barcode) async {
  final url = Uri.parse('https://world.openfoodfacts.org/api/v0/product/$barcode.json');

  try {
    final response = await http.get(url);

    print("-------------------code : ${response.statusCode}   \n ${response.body}");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 1) {
        String productName = data['product']['product_name'] ?? 'Unknown Product';
        String eCode = data['product']['code'] ?? 'N/A';

        print("📦 Product: $productName");
        print("🔢 E-Code: $eCode");
      } else {
        print("❌ No product found for this barcode.");
      }
    } else {
      print("⚠️ Error fetching data.");
    }
  } catch (e) {
    print("🚨 Exception: $e");
  }
}

// স্ক্যান করা বারকোড দিয়ে API কল করুন
void main() {
  // getECode("5601019400598"); // এখানে আপনার বারকোড নম্বর দিন
  // getECode("5601019400598"); // এখানে আপনার বারকোড নম্বর দিন
  getECode("5601019400598"); // এখানে আপনার বারকোড নম্বর দিন
}
