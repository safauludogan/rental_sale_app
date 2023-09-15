import 'package:hive_flutter/adapters.dart';
import 'package:rental_sale_app/core/constants/hive_constant.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/vehicle_model.dart';
import 'package:rental_sale_app/product/manager/cache_manager.dart';

class VehicleCacheManager extends ICacheManager<VehicleModel> {
  VehicleCacheManager(super.model);

  @override
  VehicleModel? getItem(String id) => box?.get(id);

  @override
  List<VehicleModel>? getValues() => box?.values.toList();

  @override
  Future<void> putItem(String key, VehicleModel model) async =>
      box?.put(key, model);

  @override
  Future<void> registerAdapters() async {
    if (!Hive.isAdapterRegistered(HiveConstant.vehicleId)) {
      Hive.registerAdapter(VehicleModelAdapter());
    }
    if (!Hive.isAdapterRegistered(HiveConstant.vehicleTypeId)) {
      Hive.registerAdapter(VehicleTypeAdapter());
    }
  }

  @override
  Future<void> removeItem(String item) async => await box?.delete(item);
}

/* 
  @override
  Future<void> addItems(List<CarModel> items) async {
    await box?.addAll(items);
  } */

/*   @override
  Future<void> putItems(List<CarModel> items) async {
    return await box
        ?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.brand, e))));
  }
 */
