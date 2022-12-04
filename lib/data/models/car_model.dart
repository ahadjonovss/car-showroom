class Car {
  Car({
    required this.id,
    required this.carModel,
    required this.logo,
    required this.establishedYear,
    required this.averagePrice,
    required this.description,
    required this.carPics,
  });

  int id;
  String carModel;
  String logo;
  int establishedYear;
  int averagePrice;
  String description;
  List<String> carPics;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
    id: json["id"],
    carModel: json["car_model"],
    logo: json["logo"],
    establishedYear: json["established_year"],
    averagePrice: json["average_price"],
    description: json["description"],
    carPics: List<String>.from(json["car_pics"].map((x) => x)),
  );

}
