
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:rental_sale_app/core/companents/custom_date_picker.dart';
import 'package:rental_sale_app/core/companents/custom_dropdown.dart';
import 'package:rental_sale_app/core/companents/custom_tabbar.dart';
import 'package:rental_sale_app/core/companents/custom_textfield.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/padding_constant.dart';
import 'package:rental_sale_app/core/constants/string_constant.dart';
import 'package:rental_sale_app/core/extensions/context_extension.dart';
import 'package:rental_sale_app/core/utils/textformfield_format.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/add_listing_car_viewmodel.dart';

class AddListingCarView extends StatefulWidget {
  const AddListingCarView({super.key});

  @override
  State<AddListingCarView> createState() => _AddListingCarState();
}

class _AddListingCarState extends AddListingCarViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton.small(
        onPressed: saveDataToHive,
        backgroundColor: ColorConstant.floatActionColor,
        child: const Icon(Icons.add),
      ),
      body: _mainBody(context),
      bottomNavigationBar: _mainBottomBar(),
    );
  }

  BottomAppBar _mainBottomBar() {
    return BottomAppBar(
      notchMargin: -6,
      child: customTabbar(),
    );
  }

  SingleChildScrollView _mainBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: PaddingConstant.paddingAll16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(30),
            _choosedBrand(),
            const Gap(20),
            carModel(),
            const Gap(20),
            _choosedCarColor(),
            const Gap(20),
            _carModelYear(context),
            const Gap(20),
            carPrice(),
          ],
        ),
      ),
    );
  }

  Row _carModelYear(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          StringConstant.carModelYear,
          style: context.textTheme.titleMedium
              ?.copyWith(color: ColorConstant.textColor),
        ),
        const CustomDatePicker(),
      ],
    );
  }

  Widget carPrice() {
    return CustomTextField(
      controller: carPriceController,
      icon: const Icon(Icons.edit),
      hintText: StringConstant.enterCarPrice,
      inputType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter(),
      ],
      action: TextInputAction.done,
      onChanged: (p0) {
        myCarModel = myCarModel.copyWith(price: p0);
      },
    );
  }

  Widget carModel() {
    return CustomTextField(
      icon: const Icon(Icons.mode_outlined),
      hintText: StringConstant.carModelEntry,
      inputType: TextInputType.name,
      action: TextInputAction.next,
      onChanged: (value) {
        myCarModel = myCarModel.copyWith(model: value);
      },
    );
  }

  Row _choosedCarColor() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          StringConstant.carColor,
          style: context.textTheme.titleMedium
              ?.copyWith(color: ColorConstant.textColor),
        ),
        CustomDropDownButton(
          choosedValue: myCarModel.color ?? colorList.first,
          list: colorList,
          onItemSelected: (String value) {
            setState(() {
              myCarModel = myCarModel.copyWith(color: value);
            });
          },
        ),
      ],
    );
  }

  Row _choosedBrand() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          StringConstant.carBrand,
          style: context.textTheme.titleMedium
              ?.copyWith(color: ColorConstant.textColor),
        ),
        CustomDropDownButton(
          choosedValue: myCarModel.brand ?? brandList.first,
          list: brandList,
          onItemSelected: (String value) {
            setState(() {
              myCarModel = myCarModel.copyWith(brand: value);
            });
          },
        ),
      ],
    );
  }
}

/* SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: PaddingConstant.paddingAll16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(30),
            _choosedBrand(context),
            const Gap(20),
            carModel(),
            const Gap(20),
            _choosedCarColor(context),
            const Gap(20),
            carModelYear(context),
            const Gap(20),
            carPrice(),
          ],
        ),
      ),
    ); 
    */
