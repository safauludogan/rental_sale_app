import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/companents/custom_tabbar.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/string_constant.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_home/add_listing_home_viewmodel.dart';

class AddListingHomeView extends StatefulWidget {
  const AddListingHomeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddListingHomeViewState createState() => _AddListingHomeViewState();
}

class _AddListingHomeViewState extends AddListingViewModel {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        appBar: AppBar(
          title: const Text(StringConstant.addListing),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {},
          backgroundColor: ColorConstant.floatActionColor,
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: -5,
          child: customTabbar(),
        ),
        body: mainBody(),
      ),
    );
  }
}
