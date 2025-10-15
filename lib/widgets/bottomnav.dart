import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendoor_app/controller/bottomnavcontroller.dart';


class VendrooBottomNavBar extends StatelessWidget {
  const VendrooBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<BottomNavProvider>(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      currentIndex: navProvider.currentIndex,
      onTap: (index) => navProvider.changeTab(index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.local_offer_outlined), label: 'Offers'),
        BottomNavigationBarItem(icon: Icon(Icons.car_crash), label: 'Ride'),
        BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: 'Buy & Sell'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: 'Chat'),
      ],
    );
  }
}
