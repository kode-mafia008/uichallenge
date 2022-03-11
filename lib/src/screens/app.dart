import 'package:flutter/material.dart';
import '../navigation/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Flurorouter.setupRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/dropdown',
      onGenerateRoute: Flurorouter.router.generator,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
