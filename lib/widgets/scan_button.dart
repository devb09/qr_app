import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/scan_list_provider.dart';
import 'package:qr_app/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'CANCEL', false, ScanMode.QR);

        // final barcodeScanRes = 'https://fernando-herrera.com';
        // final barcodeScanRes = 'geo:6.173509, -75.334725';

        if(barcodeScanRes == '-1') return;
        //como no se necesita re dibujar la funcion que daria error por eso el listen en false
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        // final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        final nuevoScan2 = await scanListProvider.nuevoScan(barcodeScanRes);

        // launchUrlScan(context, nuevoScan);
        launchUrlScan(context, nuevoScan2);
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}
