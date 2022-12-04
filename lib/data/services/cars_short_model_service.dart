import 'dart:convert' as convert;
import 'package:car_showroom/data/models/cars_short_model.dart';
import 'package:http/http.dart' as http;

import '../models/car_model.dart';
class CarsApiService{
  static Future<List?> getAllCars() async {

    String url="https://easyenglishuzb.free.mockoapp.net/companies";
    Uri uri=Uri.parse(url);
    var response= await http.get(uri);
    if(response.statusCode==200){
      var jsonResponse= convert.jsonDecode(response.body);
      return jsonResponse.map((e)=>CarsShortDataModel.fromJson(e)).toList();

    }
    return null;

  }
  static Future<Car?> getCarById(int id) async {

    String url="https://easyenglishuzb.free.mockoapp.net/companies/$id";
    Uri uri=Uri.parse(url);
    var response= await http.get(uri);
    if(response.statusCode==200){
      var jsonResponse= convert.jsonDecode(response.body);
      return Car.fromJson(jsonResponse);

    }
    return null;

  }
}