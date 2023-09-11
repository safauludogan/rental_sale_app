import 'package:flutter/cupertino.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/date_constant.dart';
import 'package:rental_sale_app/core/constants/padding_constant.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/car_model.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) => customDatePicker;

  CarModel myCarModel = CarModel();

  Widget get customDatePicker => CupertinoButton(
        onPressed: () => showDialog(
          CupertinoDatePicker(
            initialDateTime: DateConstant.date,
            mode: CupertinoDatePickerMode.monthYear,
            onDateTimeChanged: (DateTime newDate) {
              setState(
                () => DateConstant.date = newDate,
              );
              myCarModel = myCarModel.copyWith(year: newDate.year);
            },
          ),
        ),
        child: Text(
          '${DateConstant.date.year}',
          style: TextStyle(
            color: ColorConstant.textColor,
            fontSize: 22,
          ),
        ),
      );

  void showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 200,
        padding: PaddingConstant.onlyTop6,
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
}
