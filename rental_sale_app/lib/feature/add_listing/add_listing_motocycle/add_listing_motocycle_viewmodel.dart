import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/constants/date_constant.dart';
import 'package:rental_sale_app/core/enums/brand.dart';
import 'package:rental_sale_app/core/enums/colors.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/vehicle_model.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_home/add_listing_home_viewmodel.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_motocycle/add_listing_motocycle_view.dart';
import 'package:rental_sale_app/product/manager/cache_manager.dart';
import 'package:rental_sale_app/product/manager/vehicle_cache_manager.dart';
import 'package:uuid/uuid.dart';

abstract class AddListingMotoCycleViewModel
    extends State<AddListingMotocycleView> {
  late List<String> brandList = [];
  late List<String> colorList = [];
  late final ICacheManager<VehicleModel> cacheManager;
  VehicleModel vehicleModel = VehicleModel();
  @override
  void initState() {
    super.initState();
    vehicleModel = vehicleModel.copyWith(vehicleType: VehicleType.MOTOCYCLE);
    cacheManager.clearAll();

    brandList = List.generate(
      MotoCycleBrand.values.length,
      (index) => MotoCycleBrand.values[index].name,
    );
    colorList = List.generate(
      EnumColor.values.length,
      (index) => EnumColor.values[index].name,
    );
    vehicleModel = vehicleModel.copyWith(
        brand: brandList.first,
        color: colorList.first,
        year: DateConstant.date.year);
    cacheManager = VehicleCacheManager(vehicleModel);
    // fetchDatas();

    AddListingViewModel.instance.whenComplate = saveDataToHive;
  }

  Future<void> fetchDatas() async {
    await cacheManager.init();
    final carModel = cacheManager.getValues();
    print(carModel);
  }

  Future<void> saveDataToHive() async {
    final uuid = const Uuid().v4();
    vehicleModel = vehicleModel.copyWith(id: uuid);
    if (vehicleModel.id == null ||
        vehicleModel.brand == null ||
        vehicleModel.model == null ||
        vehicleModel.price == null ||
        vehicleModel.year == null ||
        vehicleModel.color == null) {
      print("La motor ekle");
      return;
    }
    await cacheManager.putItem(
      uuid,
      vehicleModel,
    );
  }
}
