import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:rental_sale_app/core/companents/custom_tabbar.dart';
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
        onPressed: () async {
          if (items?.isNotEmpty ?? false) {
            cacheManager.addItems(items!);
            print('veriler Kaydedildi.');
          }
        },
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
  }

  Padding carPrice() {
    return textFormField(
        controller: carPriceController,
        icon: const Icon(Icons.edit),
        hintText: StringConstant.enterCarPrice,
        inputType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CurrencyInputFormatter(),
        ],
        action: TextInputAction.done);
  }

  Padding carModel() {
    return textFormField(
        icon: const Icon(Icons.mode_outlined),
        hintText: StringConstant.carModelEntry,
        inputType: TextInputType.name,
        action: TextInputAction.next);
  }

  Row _choosedCarColor(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          StringConstant.carColor,
          style: context.textTheme.titleMedium
              ?.copyWith(color: ColorConstant.textColor),
        ),
        dropdownButton(
          list: AddListingCarViewModel.carColor,
          choosedValue: choosedColor,
          onItemSelected: (String value) {
            setState(() {
              choosedColor = value;
            });
          },
        )
      ],
    );
  }

  Row _choosedBrand(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          StringConstant.carBrand,
          style: context.textTheme.titleMedium
              ?.copyWith(color: ColorConstant.textColor),
        ),
        dropdownButton(
          list: AddListingCarViewModel.brandList,
          choosedValue: choosedBrand,
          onItemSelected: (String value) {
            setState(() {
              choosedBrand = value;
            });
          },
        )
      ],
    );
  }

  Row carModelYear(BuildContext context) {
    showDialog(Widget child) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 200,
          padding: const EdgeInsets.only(top: 6.0),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          StringConstant.carModelYear,
          style: context.textTheme.titleMedium
              ?.copyWith(color: ColorConstant.textColor),
        ),
        CupertinoButton(
          onPressed: () => showDialog(
            CupertinoDatePicker(
              initialDateTime: date,
              mode: CupertinoDatePickerMode.monthYear,
              onDateTimeChanged: (DateTime newDate) {
                setState(() => date = newDate);
              },
            ),
          ),
          child: Text(
            '${date.year}',
            style: TextStyle(
              color: ColorConstant.textColor,
              fontSize: 22.0,
            ),
          ),
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
    ); */