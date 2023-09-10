import 'package:hive_flutter/adapters.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/car_model.dart';

abstract class ICacheManager<T> {
  ICacheManager(this.key);

  final String key;
  Box<CarModel>? box;

  Future<void> init() async {
    if (!(box?.isOpen ?? false)) {
      registerAdapters();
      box = await Hive.openBox(key.toString());
    }
  }

  void addItems(List<T> items);
  void putItems(List<T> items);
  T? getItem(String key);
  List<T>? getValues();
  T? putItem(String key, T item);
  Future<void> removeItem(String item);
  Future<void> clearAll() async => await box?.clear();
  void registerAdapters();
}
