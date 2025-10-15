import 'package:flutter/material.dart';
import 'package:vendoor_app/widgets/bottomnav.dart';
import 'package:vendoor_app/widgets/widgets.dart';

class VendrooHomeScreen extends StatefulWidget {
  const VendrooHomeScreen({Key? key}) : super(key: key);

  @override
  State<VendrooHomeScreen> createState() => _VendrooHomeScreenState();
}

class _VendrooHomeScreenState extends State<VendrooHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Vendroo',
          style: TextStyle(
            color: Color(0xFF00B4D8),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red,size: 28,),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black,size: 28,),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 24),
                  const SizedBox(width: 4),
                  const Text(
                    'puthiyatheru, kannur',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const Icon(Icons.keyboard_arrow_down, size: 20),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText:
                      'Search products or services to find shops or freelancers...',
                  hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Banner Images
            Container(
              height: 230,
              // padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Color(0xFFFFCC33),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16,
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    buildBannerCard('assets/vendcoffee.webp', Colors.brown),
                    buildBannerCard('assets/vendocaptain.webp', Colors.grey),
                    buildBannerCard('assets/vendofrag.jpg', Colors.orange),
                    buildBannerCard('assets/vendocola.jpg', Colors.yellow),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Categories
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  buildCategory(
                    'Electronics &\nAppliances',
                    'assets/cat-electro2.jpeg',
                  ),
                  buildCategory(
                    'Juice, Tea &\nSnack',
                    'assets/vendojuicetea.webp',
                  ),
                  buildCategory('Baby, Kids &\nToys', 'assets/vendokids.jpg'),
                  buildCategory('Saloon &\nSpa', 'assets/cat-buety.jpg'),
                  buildCategory('Gym & Fitness', 'assets/flip gym.webp'),
                  buildCategory(
                    'Tours & travels\n& more',
                    'assets/vendotravels.jpg',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Service Categories
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  buildCategory('Plumber', 'assets/vendoplumber.jpeg'),
                  buildCategory('AC mechanic', 'assets/vendoacmechanic.webp'),
                  buildCategory('Painter', 'assets/vendopainter.jpg'),
                  buildCategory('Laptop &\nMonitors', 'assets/cat-laps.jpg'),
                  buildCategory('Mobile &\nTablet', 'assets/cat-phones.webp'),
                  buildCategory(
                    'Food &\n Beverages',
                    'assets/Kerala-Style-Biriyani.webp',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Tabs
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10),
                    right: Radius.circular(10),
                  ),
                  border: Border.all(color: Colors.black, width: 0.8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: buildTabButton(context, 'All', 0)),
                    const SizedBox(width: 8),
                    Expanded(child: buildTabButton(context, 'Products', 1)),
                    const SizedBox(width: 8),
                    Expanded(child: buildTabButton(context, 'Services', 2)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // View All
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'View all >',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Products Grid
            buildTabContent(context),

            const SizedBox(height: 20),

            // Shop Card
            buildShopCard(
              'assets/vendoshops.jpg',
              'British Beverages',
              '0.5 km',
              'Beverages & Snacks',
              'Melechovva, Kannur, Kerala 670001',
            ),
            const SizedBox(height: 10),

            buildShopCard(
              'assets/vendovegshop.jpg',
              'Fresh Veggies & Fruits',
              '1.2 km',
              'Vegetables & Fruits',
              'Puthiyatheru, Kannur, Kerala 670001',
            ),
            const SizedBox(height: 10),
            buildShopCard(
              'assets/vendodrshop.jpg',
              'Indian Fashions',
              '4.2 km',
              'readymades',
              'Thana, Kannur, Kerala 670001',
            ),
            const SizedBox(height: 10),
            buildShopCard(
              'assets/vendodonuts.webp',
              'Donut Cafe',
              '3.0 km',
              'Donuts & Bakes',
              'caltex, Kannur, Kerala 670001',
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: VendrooBottomNavBar(),
      floatingActionButton: Stack(
        children: [
          Container(
            height: 80,
            width: 100,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFDB515),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 28,),
                SizedBox(width: 8),
                Text(
                  'My cart',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }
}
