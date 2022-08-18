import 'package:direnc_uygulamasi/home_page.dart';
import 'package:flutter/material.dart';
import 'package:widget_utils/widget_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Resistor Calculate",
        home: WidgetUtilsBuilder(
          responsiveParams: ResponsiveParams(allowTextScale: false),
          builder: (_) {
            return const HomePage();
          },
        ));
  }
}
