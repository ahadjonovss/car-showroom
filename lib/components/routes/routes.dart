import 'package:car_showroom/ui/home/detailes_page.dart';
import 'package:car_showroom/ui/home/home_page.dart';
import 'package:car_showroom/ui/home/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteName{
  static const home="home";
  static const splash="splash";
  static const detailes="detailes";
}

class AppRoutes{

  static Route generateRote(RouteSettings settings){
    dynamic args=settings.arguments;

    switch(settings.name){
      case RouteName.home:
        return MaterialPageRoute(builder: (_)=>const HomePage());
      case RouteName.splash:
        return MaterialPageRoute(builder: (_)=>const SplashPage());
      case RouteName.detailes:
        return MaterialPageRoute(builder: (_)=> DetailesPage(car: args,));
      default: return MaterialPageRoute(builder: (_)=>const Scaffold());
    }

  }
}