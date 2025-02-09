import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scanner_app/screens/e_code_screen/e_code_screen.dart';
import '../../controller/data_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  BannerAd? bannerAd;

  void loadBannerAd() {
    bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-7278830824707729/1195700970',
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {});
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    )..load();
  }

  final ScanQrCodeController controller = Get.put(ScanQrCodeController());


  @override
  void initState() {
    super.initState();
    loadBannerAd();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: Obx(() {
         return GestureDetector(
              onTap: () {
                controller.toggleFlash();
              },
              child: Icon(controller.isFlashOn.value ? Icons.flash_off : Icons.flash_on,color: Colors.white));
        }

        ),

        title:  Text('Halal Food', style: TextStyle(fontSize: 22.h, color: Colors.white)),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 4,
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ECodeScreen()));
          }, child: Text("E-Code", style: TextStyle(color: Colors.white, fontSize: 22.h),))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 40.h),
              Text(
                "Scan a barcode or QR code to check if the food is Halal, Haram, or Mushbooh",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.h, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 45.h),
              Text(
                "Tap to scan now!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28.h, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 24.h),

              // QR Scanner Section
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
                      color: Colors.teal.withOpacity(0.1),
                      border: Border.all(color: Colors.teal),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(50.r),
                      child: Icon(
                        Icons.qr_code_scanner,
                        size: 120.r,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                )
                    : SizedBox(
                  height: 250.h,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 6,
                    margin: EdgeInsets.all(16.r),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: MobileScanner(
                        controller: controller.scannerController,
                        onDetect: (barcodes) {
                          final barcode = barcodes.barcodes.first;
                          if (barcode.rawValue != null) {
                            _playSound();
                            if (!controller.getCodeLoading.value) {
                              controller.getECode(barcode.rawValue.toString());
                            }
                          }
                        },
                      ),
                    ),
                  ),
                );
              }),

              SizedBox(height: 50.h),

              Spacer(),

              bannerAd != null
                  ? SizedBox(
                // width: bannerAd!.size.width.toDouble(),
                height: bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: bannerAd!),
              )
                  : SizedBox(),

            ],
          ),
        ),
      ),
    );
  }


  final AudioPlayer _audioPlayer = AudioPlayer();


  void _playSound() async {
    await _audioPlayer.play(AssetSource('sound.mp3'), volume: 2);
  }
}
