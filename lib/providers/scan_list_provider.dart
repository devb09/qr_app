import 'package:flutter/material.dart';
import 'package:qr_app/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];

  String tipoSeleccionado = 'http';

  nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    nuevoScan.id = id;

    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }
  }

  cargarScans() async {
    final scansResponse = await DBProvider.db.getAllScans();
    scans = [...scansResponse!];
    notifyListeners();
  }

  cargarScansporTipo(String tipo) async {
    final scansResponse = await DBProvider.db.getScansByType(tipo);
    scans = [...scansResponse!];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    final scansResponse = await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  borrarPorID(int id) async {
    final scansResponse = await DBProvider.db.deleteScan(id);
    cargarScansporTipo(tipoSeleccionado);
  }
}
