import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCodeScreen extends StatefulWidget {
  const GenerateQRCodeScreen({super.key});

  @override
  State<GenerateQRCodeScreen> createState() => _GenerateQRCodeScreenState();
}

class _GenerateQRCodeScreenState extends State<GenerateQRCodeScreen> {
  String name = "Bangladesh forms the sovereign part of the historic and ethnolinguistic region of Bengal, which was divided during the Partition of India in 1947 as part of a Muslim union with Pakistan, which it separated from in a bloody independence war in 1971. The country has a Bengali Muslim majority";
  String email = "john@example.com";
  String phone = "1234567890";

  @override
  Widget build(BuildContext context) {
    String qrData = "$name\n$email\n$phone";

    return Scaffold(
      appBar: AppBar(title: const Text('Generate QR Code')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 100),

            Center(
              child: SizedBox(
                  height: 200,
                  width: 200,
                  child: QrImageView(data: name)),
            )
          ],
        ),
      ),
    );
  }


  void shareQRCode()async{
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = "${directory}/qr_code.png";
    // final capture = await _
  }
}