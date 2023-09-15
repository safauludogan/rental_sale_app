import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/companents/custom_tabbar.dart';

class RentalSaleFavoriteView extends StatefulWidget {
  const RentalSaleFavoriteView({super.key});

  @override
  State<RentalSaleFavoriteView> createState() => _RentalSaleFavoriteState();
}

class _RentalSaleFavoriteState extends State<RentalSaleFavoriteView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          notchMargin: 8,
          shape: const CircularNotchedRectangle(),
          child: customTabbar(),
        ),
        body: TabBarView(
          children: [
            const CarScaffold(),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

class CarScaffold extends StatelessWidget {
  const CarScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
