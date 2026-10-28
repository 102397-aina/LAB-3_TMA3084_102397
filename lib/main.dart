import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantMenuApp());
}

class RestaurantMenuApp extends StatelessWidget {
  const RestaurantMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Japanese Restaurant Menu',
      theme: ThemeData(
        primaryColor: const Color(0xFF1B263B), // Navy / Indigo Blue
        scaffoldBackgroundColor: const Color(0xFFF7F4EF), // Soft Off-White
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1B263B),
          secondary: const Color(0xFF8D5B4C), // Earthy Brown
        ),
      ),
      home: const MenuHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Japanese Food Item Model
class FoodItem {
  final String name;
  final String description;
  final String price;
  final String category;
  final IconData icon;

  const FoodItem({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.icon,
  });
}

class MenuHomeScreen extends StatelessWidget {
  const MenuHomeScreen({super.key});

  // 3 Japanese Food Cards
  final List<FoodItem> foodItems = const [
    FoodItem(
      name: 'Takoyaki',
      description: 'Classic Osaka-style batter balls filled with octopus pieces, brushed with savory sweet takoyaki sauce, Japanese mayo, and topped with bonito flakes.',
      price: 'RM 14.00',
      category: 'Street Food / Appetizer',
      icon: Icons.bakery_dining,
    ),
    FoodItem(
      name: 'Tonkotsu Ramen',
      description: 'Rich, creamy pork bone broth served with thin ramen noodles, tender chashu pork belly slices, soft-boiled ajitsuke egg, and green onions.',
      price: 'RM 24.50',
      category: 'Main Course',
      icon: Icons.ramen_dining,
    ),
    FoodItem(
      name: 'Matcha Parfait',
      description: 'Layered Japanese dessert featuring Uji matcha soft serve, sweet red bean paste (anko), chewy shiratama dango, and matcha jelly.',
      price: 'RM 12.00',
      category: 'Dessert & Beverage',
      icon: Icons.icecream,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const Color indigoBlue = Color(0xFF1B263B);
    const Color warmBrown = Color(0xFF8D5B4C);
    const Color softBrownBg = Color(0xFFF0EAE1);

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'JAPANESE CUISINE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 1.2,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: indigoBlue,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
        child: ListView.builder(
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            final food = foodItems[index];
            return Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 14.0),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
                side: const BorderSide(color: Color(0xFFE2D8CC), width: 1.0),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(14.0),
                onTap: () {
                  // Navigation to Food Detail Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetailScreen(food: food),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      // Icon Badge (Warm Brown Accent)
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: softBrownBg,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: warmBrown, width: 1.5),
                        ),
                        child: Icon(food.icon, size: 32, color: warmBrown),
                      ),
                      const SizedBox(width: 16),
                      // Food Details Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.category.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 10,
                                color: warmBrown,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                Text(
                                  food.name,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: indigoBlue,
                                  ),
                                ),
                                const SizedBox(width: 6),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              food.price,
                              style: const TextStyle(
                                fontSize: 15,
                                color: warmBrown,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        size: 22,
                        color: indigoBlue,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Japanese Food Detail View (Optional Navigation Screen)
class FoodDetailScreen extends StatelessWidget {
  final FoodItem food;

  const FoodDetailScreen({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    const Color indigoBlue = Color(0xFF1B263B);
    const Color warmBrown = Color(0xFF8D5B4C);

    return Scaffold(
      appBar: AppBar(
        title: Text(food.name, style: const TextStyle(color: Colors.white)),
        backgroundColor: indigoBlue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0EAE1),
                  shape: BoxShape.circle,
                  border: Border.all(color: warmBrown, width: 2),
                ),
                child: Icon(food.icon, size: 64, color: warmBrown),
              ),
            ),
            const SizedBox(height: 24),
            Chip(
              label: Text(
                food.category,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              backgroundColor: indigoBlue,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  food.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: indigoBlue,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              food.price,
              style: const TextStyle(
                fontSize: 22,
                color: warmBrown,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(height: 36, thickness: 1.2, color: Color(0xFFE2D8CC)),
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: indigoBlue,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              food.description,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF4A4A4A),
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
