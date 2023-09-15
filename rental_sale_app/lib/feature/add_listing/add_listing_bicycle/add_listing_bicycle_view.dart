import 'package:flutter/material.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_bicycle/add_listing_bicycle_viewmodel.dart';

class AddListingBicycleView extends StatefulWidget {
  const AddListingBicycleView({super.key});

  @override
  State<AddListingBicycleView> createState() => _AddListingBicycleViewState();
}

/* 
Marka
Jant Boyu
Kadro Boyu
Kadro Türü
Ön Fren
Arka Fren
Vites Sayısı
Model Yılı
Fiyatı


 */
class _AddListingBicycleViewState extends AddListingBicycleViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
