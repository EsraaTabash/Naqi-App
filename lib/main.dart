import 'package:flutter/material.dart';
import 'package:naqi/screens/gate/splash_screen.dart';
import 'model/sp_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.initSharedPreferances();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplachScreen(),
      //NewUserScreen(),
      theme: ThemeData(
        textTheme: const TextTheme(
          titleSmall: TextStyle(fontFamily: 'Cairo', fontSize: 22.0),
        ),
      ),
    );
  }
}
