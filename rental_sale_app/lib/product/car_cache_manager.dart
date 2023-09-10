import 'package:hive_flutter/adapters.dart';
import 'package:rental_sale_app/core/constants/hive_constant.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/car_model.dart';
import 'package:rental_sale_app/product/cache_manager.dart';

class CarCacheManager extends ICacheManager<CarModel> {
  CarCacheManager(super.model);

  @override
  Future<void> addItems(List<CarModel> items) async {
    await box?.addAll(items);
  }

  @override
  Future<void> putItems(List<CarModel> items) async {
    return await box
        ?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.brand, e))));
  }

  @override
  CarModel? getItem(String id) => box?.get(id);

  @override
  List<CarModel>? getValues() => box?.values.toList();

  @override
  Future<void> putItem(String key, CarModel model) async =>
      box?.put(key, model);

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstant.userTypeId)) {
      Hive.registerAdapter(CarModelAdapter());
    }
  }

  @override
  Future<void> removeItem(String item) async => await box?.delete(item);
}
