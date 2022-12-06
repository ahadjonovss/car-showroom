import 'package:car_showroom/components/routes/routes.dart';
import 'package:car_showroom/view_models/carsviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoutes.generateRote,
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splash,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.black,
        primarySwatch: Colors.blue,
      ),
    );
  }
}