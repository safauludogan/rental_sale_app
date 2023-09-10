import 'package:hive_flutter/adapters.dart';
import 'package:rental_sale_app/core/constants/hive_constant.dart';
part 'car_model.g.dart';

@HiveType(typeId: HiveConstant.userTypeId)
class CarModel {
  @HiveField(0)
  String? brand;
  @HiveField(1)
  String? model;
  @HiveField(2)
  String? color;
  @HiveField(3)
  String? price;
  @HiveField(4)
  int? year;

  CarModel({this.brand, this.model, this.color, this.price, this.year});

  CarModel.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    model = json['model'];
    color = json['color'];
    price = json['price'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand'] = brand;
    data['model'] = model;
    data['color'] = color;
    data['price'] = price;
    data['year'] = year;
    return data;
  }
}
