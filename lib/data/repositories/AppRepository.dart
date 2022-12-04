import 'package:car_showroom/data/services/cars_short_model_service.dart';

class AppRepository{
  getAllCars()=>CarsApiService.getAllCars();
  getCarById(int id)=>CarsApiService.getCarById(id);

}