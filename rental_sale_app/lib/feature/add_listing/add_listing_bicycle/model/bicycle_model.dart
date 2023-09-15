import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rental_sale_app/core/constants/hive_constant.dart';

part 'bicycle_model.g.dart';

@HiveType(typeId: HiveConstant.userTypeId3)
@JsonSerializable()
class BicycleModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? brand;
  @HiveField(2)
  String? wheelSize;
  @HiveField(3)
  String? frameSize;
  @HiveField(4)
  String? frameType;
  @HiveField(5)
  String? frontBrake;
  @HiveField(6)
  String? rearBrake;
  @HiveField(7)
  String? numberOfGears;
  @HiveField(8)
  int? modelYear;
  @HiveField(9)
  int? price;

  BicycleModel copyWith({
    String? id,
    String? brand,
    String? wheelSize,
    String? frameSize,
    String? frameType,
    String? frontBrake,
    String? rearBrake,
    String? numberOfGears,
    int? modelYear,
    int? price,
  }) {
    return BicycleModel(
      id: this.id,
      brand: this.brand,
      wheelSize: this.wheelSize,
      frameSize: this.frameSize,
      frameType: this.frameType,
      frontBrake: this.frontBrake,
      rearBrake: this.rearBrake,
      numberOfGears: this.numberOfGears,
      modelYear: this.modelYear,
      price: this.price,
    );
  }

  BicycleModel({
    this.id,
    this.brand,
    this.wheelSize,
    this.frameSize,
    this.frameType,
    this.frontBrake,
    this.rearBrake,
    this.numberOfGears,
    this.modelYear,
    this.price,
  });
  factory BicycleModel.fromJson(Map<String, dynamic> json) {
    return _$BicycleModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BicycleModelToJson(this);
}
