// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehicleModelAdapter extends TypeAdapter<VehicleModel> {
  @override
  final int typeId = 50;

  @override
  VehicleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VehicleModel(
      id: fields[0] as String?,
      brand: fields[1] as String?,
      model: fields[2] as String?,
      color: fields[3] as String?,
      price: fields[4] as String?,
      year: fields[5] as int?,
      vehicleType: fields[6] as VehicleType?,
    );
  }

  @override
  void write(BinaryWriter writer, VehicleModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.brand)
      ..writeByte(2)
      ..write(obj.model)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.year)
      ..writeByte(6)
      ..write(obj.vehicleType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VehicleTypeAdapter extends TypeAdapter<VehicleType> {
  @override
  final int typeId = 60;

  @override
  VehicleType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return VehicleType.MOTOCYCLE;
      case 1:
        return VehicleType.CAR;
      default:
        return VehicleType.MOTOCYCLE;
    }
  }

  @override
  void write(BinaryWriter writer, VehicleType obj) {
    switch (obj) {
      case VehicleType.MOTOCYCLE:
        writer.writeByte(0);
        break;
      case VehicleType.CAR:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      id: json['id'] as String?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      color: json['color'] as String?,
      price: json['price'] as String?,
      year: json['year'] as int?,
      vehicleType:
          $enumDecodeNullable(_$VehicleTypeEnumMap, json['vehicleType']),
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'model': instance.model,
      'color': instance.color,
      'price': instance.price,
      'year': instance.year,
      'vehicleType': _$VehicleTypeEnumMap[instance.vehicleType],
    };

const _$VehicleTypeEnumMap = {
  VehicleType.MOTOCYCLE: 'MOTOCYCLE',
  VehicleType.CAR: 'CAR',
};
