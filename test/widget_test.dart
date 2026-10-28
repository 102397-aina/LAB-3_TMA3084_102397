import 'package:flutter_test/flutter_test.dart';

import 'package:restaurant_menu/main.dart';

void main() {
  testWidgets('Restaurant menu displays items and navigation smoke test', (
    WidgetTester tester,
  ) async {
    // Build our custom RestaurantMenuApp and trigger a frame.
    await tester.pumpWidget(const RestaurantMenuApp());

    // Verify that the menu header and food items are displayed correctly.
    expect(find.text('JAPANESE CUISINE'), findsOneWidget);
    expect(find.text('Takoyaki'), findsOneWidget);
    expect(find.text('Tonkotsu Ramen'), findsOneWidget);
    expect(find.text('Matcha Parfait'), findsOneWidget);

    // Tap on the Takoyaki card to test optional navigation.
    await tester.tap(find.text('Takoyaki'));
    await tester.pumpAndSettle(); // Wait for navigation animation to complete

    // Verify that the detail screen opened and shows the description header.
    expect(find.text('Description / 説明'), findsOneWidget);
  });
}
