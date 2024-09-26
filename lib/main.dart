
import 'package:ecommerceapp/provider.dart';
import 'package:ecommerceapp/screens/splashscreen.dart';
import 'package:ecommerceapp/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  shared.init();
  runApp(ChangeNotifierProvider(
      create: (context) => Model(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trendshop',
      theme: ThemeData(
        fontFamily: 'Satoshi',
        
        useMaterial3: true,
      ),
      home:  Splashscreen(),
    );
  }
}
