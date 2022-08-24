import 'package:flutter/cupertino.dart';
import 'package:tikitiki/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
        title: 'tikitiki',
        theme: CupertinoThemeData(
          primaryColor: CupertinoColors.systemPink,
        ),
        home: Home());
  }
}
