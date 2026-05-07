// test/golden/product_card_golden_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:carreno_post2_u9/model/product.dart';
import 'package:carreno_post2_u9/screen/product_card.dart';

void main() {
  const testProduct = Product(id: '1', name: 'Libro Flutter', price: 39.99);

  // ── Golden 1: Tema claro ────────────────────────────────────────────────
  testWidgets('ProductCard light theme matches golden', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        home: Scaffold(
          body: Center(
            child: ProductCard(product: testProduct),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(ProductCard),
      matchesGoldenFile('../goldens/product_card_light.png'),
    );
  });

  // ── Golden 2: Tema oscuro ───────────────────────────────────────────────
  testWidgets('ProductCard dark theme matches golden', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.dark(useMaterial3: true),
        home: Scaffold(
          body: Center(
            child: ProductCard(product: testProduct),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(ProductCard),
      matchesGoldenFile('../goldens/product_card_dark.png'),
    );
  });
}