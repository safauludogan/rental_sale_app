import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/enums/card_brand.dart';
import 'package:rental_sale_app/core/enums/colors.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/add_listing_car_view.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/car_model.dart';
import 'package:rental_sale_app/product/cache_manager.dart';
import 'package:rental_sale_app/product/car_cache_manager.dart';
import 'package:uuid/uuid.dart';

abstract class AddListingCarViewModel extends State<AddListingCarView> {
  /* _homeService = HomeService(NetworkManager.instance);
    cacheManager = UserCacheManager('userCacheNew');
    fetchDatas(); */
  late List<String> brandList = [];
  late List<String> carColor = [];
  late final ICacheManager<CarModel> cacheManager;
  CarModel myCarModel = CarModel();
  DateTime date = DateTime(2016);
  late String choosedBrand;
  final carBrandController = TextEditingController();
  final carModelController = TextEditingController();
  final carColorController = TextEditingController();
  final carModelYearController = TextEditingController();
  final carPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();

    brandList = List.generate(
      CarBrand.values.length,
      (index) => CarBrand.values[index].name,
    );
    carColor = List.generate(
      CarColor.values.length,
      (index) => CarColor.values[index].name,
    );

    myCarModel = myCarModel.copyWith(
      brand: brandList.first,
      color: carColor.first,
      year: date.year,
    );
    cacheManager = CarCacheManager(myCarModel);
    fetchDatas();
  }

  @override
  void dispose() {
    super.dispose();
    carBrandController.dispose();
    carModelController.dispose();
    carColorController.dispose();
    carModelYearController.dispose();
    carPriceController.dispose();
  }

  Future<void> fetchDatas() async {
    await cacheManager.init();
    //final carModel = cacheManager.getValues();
  }

  Future<void> saveDataToHive() async {
    final uuid = const Uuid().v4();
    myCarModel = myCarModel.copyWith(id: uuid);
    if (myCarModel.id == null ||
        myCarModel.brand == null ||
        myCarModel.model == null ||
        myCarModel.price == null ||
        myCarModel.year == null ||
        myCarModel.color == null) return;
    await cacheManager.putItem(
      uuid,
      myCarModel,
    );
    print("Kayıt başarılı");
  }

  DropdownButton<String> dropdownButton({
    required List<String> list,
    required String choosedValue,
    required void Function(String) onItemSelected,
  }) {
    return DropdownButton<String>(
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem(value: value, child: Text(value.toUpperCase()));
      }).toList(),
      style: TextStyle(color: ColorConstant.textColor),
      value: choosedValue,
      onChanged: (value) => onItemSelected.call(value!),
    );
  }
}
