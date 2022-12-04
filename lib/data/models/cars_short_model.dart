class CarsShortDataModel {
  int id;
  String car_model;
  num average_price;
  String logo;
  int established_year;

  CarsShortDataModel(
      {required this.logo,
      required this.id,
      required this.average_price,
      required this.car_model,
      required this.established_year});

  factory CarsShortDataModel.fromJson(Map<String, dynamic> json) {
    return CarsShortDataModel(
      logo: json["logo"],
      id: json["id"],
      average_price: json["average_price"],
      car_model: json["car_model"],
      established_year: json["established_year"],
    );
  }
}
