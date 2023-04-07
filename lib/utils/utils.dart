import 'package:flutter/cupertino.dart';
import 'package:qr_app/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlScan(BuildContext context, ScanModel scan) async {
  final Uri _url = Uri.parse(scan.valor);
  if (scan.tipo == 'http') {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
