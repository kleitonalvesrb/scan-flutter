import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String codBarras = '';
  String qrCode = "";

  Future<void> barCodeScan() async {
    String bar = await FlutterBarcodeScanner.scanBarcode("#ff6666","Cancel",false,ScanMode.DEFAULT);
    // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        // "#ff6666", "Cancel", false, ScanMode.QR);
    // String qrCodeScanRes = await FlutterBarcodeScanner()
    print(bar);
    setState(() {
      codBarras = bar;
    });
  }

  Future<void> qrCodeScan() async {
    String bar = await FlutterBarcodeScanner.scanBarcode("#ff6666","Cancel",false,ScanMode.QR);
    // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        // "#ff6666", "Cancel", false, ScanMode.QR);
    // String qrCodeScanRes = await FlutterBarcodeScanner()
    print(bar);
    setState(() {
      qrCode = bar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // margin: EdgeInsets.zero,
            children: [
              TextField( 
              keyboardType: TextInputType.number,
              onChanged: (text) {
                // doSearch(context, text);
              },
              controller: TextEditingController(text: codBarras),
              decoration: InputDecoration(
                hintText: 'Digite o código de barras',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    print('abrir a camera');
                    barCodeScan();
                  },
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    size: 30,
                    color: Colors.black,

                  ),
                ),
              ),
            ),
            const Divider(height: 3, color: Colors.red,),
            TextField( 
              keyboardType: TextInputType.number,
              onChanged: (text) {
                // doSearch(context, text);
              },
              controller: TextEditingController(text: qrCode),
              decoration: InputDecoration(
                hintText: 'Digite o código de barras',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    print('abrir a camera');
                    qrCodeScan();
                  },
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ]
          ),
        ),
      ),
    );
  }
}
