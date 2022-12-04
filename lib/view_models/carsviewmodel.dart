import 'package:car_showroom/data/repositories/AppRepository.dart';
import 'package:flutter/cupertino.dart';
import '../data/models/car_model.dart';
class CarsViewModel extends ChangeNotifier{
  bool isLoading=false;
  List? cars;
  Car? car;

  getCars() async {
    notify(false);
    cars=await AppRepository.getAllCars();
    notify(true);
  }

  getCarById(int id) async {
    notify(false);
    car=await AppRepository.getCarById(id);
    notify(true);
  }

  notify(bool value){
    isLoading=value;
    notifyListeners();
  }



}