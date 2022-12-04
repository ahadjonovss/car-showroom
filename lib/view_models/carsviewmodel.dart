import 'package:car_showroom/data/models/cars_short_model.dart';
import 'package:car_showroom/data/repositories/AppRepository.dart';
import 'package:flutter/cupertino.dart';
import '../data/models/car_model.dart';
class CarsViewModel extends ChangeNotifier{

  bool isLoading=false;
  CarsShortDataModel? cars;
  Car? car;

  getCars() async {
    notify(true);
    cars=await AppRepository.getAllCars();
    notify(false);
  }

  getCarById(int id) async {
    notify(true);
    car=await AppRepository.getCarById(id);
    notify(false);
  }

  notify(bool value){
    isLoading=value;
    notifyListeners();
  }



}