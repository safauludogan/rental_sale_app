import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_home/add_listing_home_view.dart';

import 'package:rental_sale_app/feature/my_account/my_account_view.dart';
import 'package:rental_sale_app/feature/rental_sale_favorite/rental_sale_favorite_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //    _titleText(context),
          const SizedBox(
            height: 20,
          ),
          _cards(context,
              title: "Satış ve Kiralama",
              subtitle: "Araç,Bisiklet ve Motosiklet Kiralama ve Satın alma",
              widget: const RentalSaleFavoriteView()),
          _divider(),
          _cards(context,
              title: "İlan Ver",
              subtitle: "Araç,Bisiklet ve Motosiklet",
              widget: const AddListingHomeView()),
          _divider(),
          _cards(context,
              title: "Hesabım",
              subtitle: "İlanlarım,Favorilerim,Sepetim",
              widget: const MyAccountView()),
        ],
      ),
    );
  }

  Divider _divider() {
    return const Divider(
      color: Colors.grey,
    );
  }

  Card _cards(context,
      {required String title,
      required String subtitle,
      required Widget widget}) {
    return Card(
      color: ColorConstant.floatActionColor,
      child: ListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => widget,
        )),
        leading: Icon(
          Icons.car_rental,
          color: ColorConstant.textColor,
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: ColorConstant.textColor),
        ),
        trailing: Icon(
          Icons.add_outlined,
          color: ColorConstant.textColor,
        ),
      ),
    );
  }
}
