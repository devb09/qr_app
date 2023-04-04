import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/scan_list_provider.dart';

class MapsHistorialScreen extends StatelessWidget {
  const MapsHistorialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
        
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(
          Icons.map_outlined,
          color: Theme.of(context).primaryColor,
        ),
        title: Text('${scans[index].valor}'),
        subtitle: Text('${scans[index].id}'),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
        onTap: () {
          print(scans[index].id.toString());
        },
      ),
    );
  }
}
