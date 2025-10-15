
  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendoor_app/controller/providers.dart';

Widget buildBannerCard(String asset, Color color) {
    return Container(
      width: 130,
      height: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        border: Border.all(color: Colors.blueGrey[500]!,width: 2),
        
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          asset,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildCategory(String label, String imageservice) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(imageservice,fit: BoxFit.cover,)),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            
            style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w700,),
            maxLines: 2,
          ),
        ],
      ),
    );
  }




Widget buildTabButton(BuildContext context, String label, int index) {
  final tabProvider = Provider.of<TabProvider>(context);
  bool isSelected = tabProvider.selectedTab == index;

  return GestureDetector(
    onTap: () {
      tabProvider.setTab(index);
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? const Color(0xFFFFCC33) : Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget buildTabContent(BuildContext context) {
  final selectedTab = context.watch<TabProvider>().selectedTab;

  if (selectedTab == 0) {
    return _buildAllItems();
  } else if (selectedTab == 1) {
    return _buildProductItems();
  } else {
    return _buildServiceItems();
  }
}

  Widget _buildAllItems() {
    return SizedBox(
              height: 220,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
               padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildProductCard('Beef Burger', '₹300', '1 nos', 'assets/vendroburger.webp'),
                   _buildProductCard('Onion ', '₹45', '1kg','assets/vendonion.jpg'),
                   _buildProductCard('Wireless Headphone', '599', '1', 'assets/vendoheadphones.webp'),
                   _buildProductCard('Cleaning Service', '₹299', '1 person','assets/cleaning servies.jpg'),
                   _buildProductCard('Tomato', '₹80', '1kg','assets/vendtomato.webp'),
                                      _buildProductCard('AC Service', '₹550', '2 person','assets/vendoelectrition.jpg'),
                   _buildProductCard('Sunflower Oil', '₹229', '1 Liter ','assets/vendroil.jpg'),
                    _buildProductCard('Nike shoe', '3,999', '1 Pair ','assets/nike shoes2.jpg'),
                    _buildProductCard('Woodland', '4,199', '1 Pair ','assets/woodlandvndro.jpg'),
                     _buildProductCard('Plumber Service', '499', '1 person ','assets/vendoacmechanic.webp'),
                    _buildProductCard('Sports Combo', '5,320', '1 Pair ','assets/cat-sport.jpg'),
              _buildProductCard('Wireless Headphone', '599', '1', 'assets/vendoheadphones.webp')
              
                ],
              ),
            );
  }
  Widget _buildProductItems() {
    return SizedBox(
              height: 220,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
               padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  
                   _buildProductCard('Sunflower Oil', '₹229', '1 Liter ','assets/vendroil.jpg'),
                    _buildProductCard('Nike shoe', '3,999', '1 Pair ','assets/nike shoes2.jpg'),
                    _buildProductCard('Woodland', '4,199', '1 Pair ','assets/woodlandvndro.jpg'),
                    _buildProductCard('Sports Combo', '5,320', '1 Pair ','assets/cat-sport.jpg'),
              _buildProductCard('Wireless Headphone', '599', '1', 'assets/vendoheadphones.webp')
                ],
              ),
            );
  }
  Widget _buildServiceItems() {
    return SizedBox(
              height: 220,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
               padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                   
                                      _buildProductCard('AC Service', '₹550', '2 person','assets/vendoelectrition.jpg'),
                     _buildProductCard('Plumber Service', '499', '1 person ','assets/vendoacmechanic.webp'),
                     _buildProductCard('Cleaning Service', '₹299', '1 person','assets/cleaning servies.jpg'),
                ],
              ),
            );
  }
Widget _buildProductCard(String name, String price, String unit, String imagePath) {
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Product Image Section
      ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        child: Image.asset(
          imagePath,
          height: 120, 
          width: 130,  
          fit: BoxFit.cover, 
        ),
      ),
  
      // 🧾 Product Info Section
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              unit,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Price: $price',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
Widget buildShopCard(String imagepath, String lable,String distance,
  String type,String location) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image on the left
          Stack(
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.brown[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                   imagepath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.favorite, color: Colors.white, size: 18),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Shop',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          // Description on the right
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Text(
                  lable,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 6),
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    Icon(Icons.navigation, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(distance, style: TextStyle(fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    Icon(Icons.restaurant_menu, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(type, style: TextStyle(fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                       location,
                        style: TextStyle(fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xFF1976D2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.phone, color: Colors.white, size: 18),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xFF64B5F6),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.send, color: Colors.white, size: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
