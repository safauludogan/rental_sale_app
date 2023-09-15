// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bicycle_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BicycleModelAdapter extends TypeAdapter<BicycleModel> {
  @override
  final int typeId = 70;

  @override
  BicycleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BicycleModel(
      id: fields[0] as String?,
      brand: fields[1] as String?,
      wheelSize: fields[2] as String?,
      frameSize: fields[3] as String?,
      frameType: fields[4] as String?,
      frontBrake: fields[5] as String?,
      rearBrake: fields[6] as String?,
      numberOfGears: fields[7] as String?,
      modelYear: fields[8] as int?,
      price: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, BicycleModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.brand)
      ..writeByte(2)
      ..write(obj.wheelSize)
      ..writeByte(3)
      ..write(obj.frameSize)
      ..writeByte(4)
      ..write(obj.frameType)
      ..writeByte(5)
      ..write(obj.frontBrake)
      ..writeByte(6)
      ..write(obj.rearBrake)
      ..writeByte(7)
      ..write(obj.numberOfGears)
      ..writeByte(8)
      ..write(obj.modelYear)
      ..writeByte(9)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BicycleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BicycleModel _$BicycleModelFromJson(Map<String, dynamic> json) => BicycleModel(
      id: json['id'] as String?,
      brand: json['brand'] as String?,
      wheelSize: json['wheelSize'] as String?,
      frameSize: json['frameSize'] as String?,
      frameType: json['frameType'] as String?,
      frontBrake: json['frontBrake'] as String?,
      rearBrake: json['rearBrake'] as String?,
      numberOfGears: json['numberOfGears'] as String?,
      modelYear: json['modelYear'] as int?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$BicycleModelToJson(BicycleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'wheelSize': instance.wheelSize,
      'frameSize': instance.frameSize,
      'frameType': instance.frameType,
      'frontBrake': instance.frontBrake,
      'rearBrake': instance.rearBrake,
      'numberOfGears': instance.numberOfGears,
      'modelYear': instance.modelYear,
      'price': instance.price,
    };
