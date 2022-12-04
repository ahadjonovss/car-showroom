import 'package:car_showroom/data/services/cars_short_model_service.dart';

class AppRepository{
  static getAllCars()=>CarsApiService.getAllCars();
  static getCarById(int id)=>CarsApiService.getCarById(id);

}