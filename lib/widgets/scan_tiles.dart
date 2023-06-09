import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/scan_list_provider.dart';
import 'package:qr_app/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;
  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          scanListProvider.borrarPorID(scans[index].id!);
        },
        background: Container(
          color: Colors.red,
        ),
        child: ListTile(
          leading: Icon(
            tipo == 'http' ? Icons.telegram : Icons.map_outlined,
            color: Theme.of(context).primaryColor,
          ),
          title: Text('${scans[index].valor}'),
          subtitle: Text('${scans[index].id}'),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onTap: () {
            launchUrlScan(context, scans[index]);
          },
        ),
      ),
    );
  }
}
