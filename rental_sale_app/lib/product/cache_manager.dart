import 'package:hive_flutter/adapters.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/car_model.dart';
import 'package:rental_sale_app/product/hive_model.dart';

abstract class ICacheManager<T extends HiveModel<T>> {
  ICacheManager(this.model);
  T model;
  Box<CarModel>? box;

  Future<void> init() async {
    if (!(box?.isOpen ?? false)) {
      registerAdapters();

      box = await Hive.openBox(model.modelKey);
    }
  }

  Future<void> addItems(List<T> items);
  Future<void> putItems(List<T> items);
  T? getItem(String id);
  List<T>? getValues();
  Future<void> putItem(String key, T model);
  Future<void> removeItem(String item);
  Future<void> clearAll() async => await box?.clear();
  void registerAdapters();
}
