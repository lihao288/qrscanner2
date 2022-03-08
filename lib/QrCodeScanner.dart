import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qrscanner2/ButtonWidget.dart';

class QrCodeScanner extends StatefulWidget {
  QrCodeScanner({Key? key}) : super(key: key);

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  String qrCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF313131),
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          "QR Code Scanner",
          style: TextStyle(fontFamily: "Sofia"),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Scan Result',
              style: TextStyle(
                fontSize:  16,
                color: Colors.white54,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              '$qrCode',
              style: TextStyle(
              fontSize: 28,
                color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(
              height: 50.0,
            ),
            ButtonWidget(text: 'Scan Qr Code', onClicked: () => scanQrCode(), color: Colors.black26,
            ),
          ],
        ),
      )
    );
  }

  Future<void> scanQrCode() async {
    try {
      final qrCode  = await FlutterBarcodeScanner.scanBarcode(
        '#5fa693',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode.isEmpty
            ? ''
            : qrCode == '-1'
              ? ''
              : qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version';
    }
  }
}