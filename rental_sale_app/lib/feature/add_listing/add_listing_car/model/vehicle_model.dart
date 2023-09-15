// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:rental_sale_app/core/constants/hive_constant.dart';
import 'package:rental_sale_app/product/database/hive_model.dart';

part 'vehicle_model.g.dart';

@HiveType(typeId: HiveConstant.vehicleTypeId)
enum VehicleType {
  @HiveField(0)
  MOTOCYCLE,
  @HiveField(1)
  CAR,
}

@HiveType(typeId: HiveConstant.vehicleId)
@JsonSerializable()
class VehicleModel extends HiveModel<VehicleModel> {
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

  @HiveField(6)
  VehicleType? vehicleType;

  VehicleModel({
    this.id,
    this.brand,
    this.model,
    this.color,
    this.price,
    this.year,
    this.vehicleType,
  });

  VehicleModel copyWith({
    String? id,
    String? brand,
    String? model,
    String? color,
    String? price,
    int? year,
    VehicleType? vehicleType,
  }) {
    return VehicleModel(
      id: id ?? this.id,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      color: color ?? this.color,
      price: price ?? this.price,
      year: year ?? this.year,
      vehicleType: vehicleType ?? this.vehicleType,
    );
  }

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return _$VehicleModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VehicleModelToJson(this);
  }

  @override
  String toString() {
    return 'VehicleModel(id: $id, brand: $brand, model: $model, color: $color, price: $price, year: $year, vehicleType: $vehicleType)';
  }
}
