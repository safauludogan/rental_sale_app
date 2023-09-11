import 'package:flutter/material.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/add_listing_car_view.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_home/add_listing_home_view.dart';

abstract class AddListingViewModel extends State<AddListingHomeView> {
  TabBarView mainBody() {
    return TabBarView(children: [
      const AddListingCarView(),
      Container(
        color: Colors.green,
      ),
      Container(
        color: Colors.blue,
      ),
    ],);
  }
}
