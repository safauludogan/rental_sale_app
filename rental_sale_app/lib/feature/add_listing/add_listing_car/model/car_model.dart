// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:rental_sale_app/core/constants/hive_constant.dart';
import 'package:rental_sale_app/product/hive_model.dart';

part 'car_model.g.dart';

@HiveType(typeId: HiveConstant.userTypeId)
@JsonSerializable()
class CarModel extends HiveModel<CarModel> {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? brand;
  @HiveField(2)
  String? model;
  @HiveField(3)
  String? color;
  @HiveField(4)
  String? price;
  @HiveField(5)
  int? year;

  CarModel({
    this.id,
    this.brand,
    this.model,
    this.color,
    this.price,
    this.year,
  });

  CarModel copyWith({
    String? id,
    String? brand,
    String? model,
    String? color,
    String? price,
    int? year,
  }) {
    return CarModel(
      id: id ?? this.id,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      color: color ?? this.color,
      price: price ?? this.price,
      year: year ?? this.year,
    );
  }

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return _$CarModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CarModelToJson(this);
  }

  @override
  String toString() {
    return 'CarModel(id: $id, brand: $brand, model: $model, color: $color, price: $price, year: $year)';
  }
}
