import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/pages/home.dart';
import 'package:qr_app/providers/scan_list_provider.dart';
import 'package:qr_app/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UiProvider()),
        ChangeNotifierProvider(create: (context) => ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
        },
        theme: ThemeData(primarySwatch: Colors.deepPurple),
      ),
    );
  }
}
