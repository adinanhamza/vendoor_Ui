import 'package:flutter/material.dart';

void main() {
  runApp(const VendrooApp());
}

class VendrooApp extends StatelessWidget {
  const VendrooApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const VendrooHomeScreen(),
    );
  }
}

class VendrooHomeScreen extends StatefulWidget {
  const VendrooHomeScreen({Key? key}) : super(key: key);

  @override
  State<VendrooHomeScreen> createState() => _VendrooHomeScreenState();
}

class _VendrooHomeScreenState extends State<VendrooHomeScreen> {
  int _selectedTab = 0;

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
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined, color: Colors.black),
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
                  const Icon(Icons.location_on, size: 20),
                  const SizedBox(width: 4),
                  const Text(
                    'puthiyatheru, kannur',
                    style: TextStyle(fontSize: 14),
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
                  hintText: 'Search products or services to find shops or freelancers...',
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
            Container(height: 200,
              // padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildBannerCard('assets/banner1.jpg', Colors.brown),
                    _buildBannerCard('assets/banner2.jpg', Colors.grey),
                    _buildBannerCard('assets/banner3.jpg', Colors.orange),
                    _buildBannerCard('assets/banner4.jpg', Colors.yellow),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Categories
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategory('Electronics &\nAppliances', Icons.tv),
                  _buildCategory('Farm, Tech &\nEquip', Icons.agriculture),
                  _buildCategory('Daily, Kids &\nMore', Icons.shopping_bag),
                  _buildCategory('Home, Beauty\n& Kitchen Use', Icons.home),
                  _buildCategory('Sports & Beauty\n& more', Icons.sports_basketball),
                  _buildCategory('Tours & travels\n& more', Icons.flight),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Service Categories
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildServiceCard('Plumber', Icons.plumbing),
                  _buildServiceCard('Electrician', Icons.electrical_services),
                  _buildServiceCard('Painter', Icons.format_paint),
                  _buildServiceCard('AC Mechanic', Icons.ac_unit),
                  _buildServiceCard('Bike', Icons.two_wheeler),
                  _buildServiceCard('My Salers', Icons.shopping_cart, isHighlighted: true),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _buildTabButton('All', 0),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTabButton('Products', 1),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTabButton('Services', 2),
                  ),
                ],
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
            
            const SizedBox(height: 8),
            
            // Products Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
                children: [
                  _buildProductCard('Beef Burger', '₹300', 'Hotel'),
                  _buildProductCard('Onion 1 kg', '₹45', '1kg'),
                  _buildProductCard('Kettle', '₹500', '750ml'),
                  _buildProductCard('Tomato', '₹80', '1kg'),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Shop Card
            Padding(
              padding: const EdgeInsets.all(16),
              child: _buildShopCard(),
            ),
            
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart_outlined),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }

  Widget _buildBannerCard(String asset, Color color) {
    return Container(
      width: 130,
      height: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
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

  Widget _buildCategory(String label, IconData icon) {
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
            child: Icon(icon, size: 30, color: Colors.grey[600]),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10),
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String label, IconData icon, {bool isHighlighted = false}) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: isHighlighted ? Colors.yellow[700] : Colors.grey[200],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              icon,
              size: 30,
              color: isHighlighted ? Colors.white : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    bool isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow[700] : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(String name, String price, String unit) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  unit,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(
                  'Price: $price',
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShopCard() {
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
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.brown[300],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Cafe Coffee',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: const [
                          Icon(Icons.star, size: 14, color: Colors.amber),
                          SizedBox(width: 4),
                          Text('4.5 Km', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: const [
                          Icon(Icons.restaurant, size: 14, color: Colors.grey),
                          SizedBox(width: 4),
                          Text('Cafe & Restaurant', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: const [
                          Icon(Icons.location_on, size: 14, color: Colors.grey),
                          SizedBox(width: 4),
                          Text('Pattuvally nagiri, Ernakulam', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.phone, color: Colors.white, size: 16),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}