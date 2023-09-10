import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/padding_constant.dart';
import 'package:rental_sale_app/core/enums/card_brand.dart';
import 'package:rental_sale_app/core/enums/colors.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/add_listing_car_view.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/car_model.dart';
import 'package:rental_sale_app/product/cache_manager.dart';
import 'package:rental_sale_app/product/car_cache_manager.dart';

abstract class AddListingCarViewModel extends State<AddListingCarView> {
  /* _homeService = HomeService(NetworkManager.instance);
    cacheManager = UserCacheManager('userCacheNew');
    fetchDatas(); */
  List<CarModel>? items;
  late final ICacheManager<CarModel> cacheManager;
  @override
  void initState() {
    super.initState();
    choosedBrand = brandList.last;
    choosedColor = carColor.first;
    cacheManager = CarCacheManager('carCache');
    //   fetchDatas();
  }

  Future<void> fetchDatas() async {
    await cacheManager.init();
    if (cacheManager.getValues()?.isNotEmpty ?? false) {
      items = cacheManager.getValues();
      print(items);
      print('veriler Kaydedildi.');
    }
    setState(() {});
  }

  DateTime date = DateTime(2016);
  late final DropdownButton currencyDropdownButton;
  late String choosedBrand;
  late String choosedColor;
  final carBrandController = TextEditingController();
  final carModelController = TextEditingController();
  final carColorController = TextEditingController();
  final carModelYearController = TextEditingController();
  final carPriceController = TextEditingController();
  static List<String> brandList = <String>[
    (CarBrand.audi.name),
    (CarBrand.bmw.name),
    (CarBrand.fiat.name),
    (CarBrand.honda.name),
    (CarBrand.mercedes.name),
    (CarBrand.nissan.name),
    (CarBrand.renaulth.name),
    (CarBrand.toyota.name),
    (CarBrand.volkswagen.name)
  ];
  static List<String> carColor = <String>[
    CarColor.black.name,
    CarColor.blue.name,
    CarColor.brown.name,
    CarColor.green.name,
    CarColor.grey.name,
    CarColor.red.name,
    CarColor.silver.name,
    CarColor.white.name,
  ];

  DropdownButton<String> dropdownButton({
    required List<String> list,
    required String choosedValue,
    required Function(String) onItemSelected,
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

  Padding textFormField(
      {TextEditingController? controller,
      String? labelText,
      List<TextInputFormatter>? inputFormatters,
      required Icon icon,
      required String hintText,
      required TextInputType inputType,
      required TextInputAction action}) {
    return Padding(
      padding: PaddingConstant.onlyRight3,
      child: TextFormField(
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            icon: icon,
            labelText: labelText,
            hintText: hintText,
            hintStyle: TextStyle(color: ColorConstant.textColor)),
        keyboardType: inputType,
        textInputAction: action,
      ),
    );
  }
}
