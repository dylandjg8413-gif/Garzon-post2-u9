// test/widget/product_list_screen_test.dart

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:carreno_post2_u9/bloc/product_bloc.dart';
import 'package:carreno_post2_u9/model/product.dart';
import 'package:carreno_post2_u9/screen/product_list_screen.dart';

// ─── Mock del BLoC ──────────────────────────────────────────────────────────
class MockProductBloc extends MockBloc<ProductEvent, ProductState>
    implements ProductBloc {}

// ─── Fake para registrar fallback ───────────────────────────────────────────
class FakeProductEvent extends Fake implements ProductEvent {}

void main() {
  late MockProductBloc mockBloc;

  setUpAll(() {
    registerFallbackValue(FakeProductEvent());
  });

  setUp(() => mockBloc = MockProductBloc());
  tearDown(() => mockBloc.close());

  Widget buildSubject() => MaterialApp(
    home: BlocProvider<ProductBloc>.value(
      value: mockBloc,
      child: const ProductListScreen(),
    ),
  );

  // ── Test 1: Estado Loading ─────────────────────────────────────────────
  testWidgets('shows CircularProgressIndicator when Loading', (t) async {
    when(() => mockBloc.state).thenReturn(ProductLoading());

    await t.pumpWidget(buildSubject());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(ListView), findsNothing);
  });

  // ── Test 2: Estado Success ─────────────────────────────────────────────
  testWidgets('shows product list when Success', (t) async {
    final products = [
      const Product(id: '1', name: 'Libro Kotlin', price: 45.0),
    ];
    when(() => mockBloc.state).thenReturn(ProductSuccess(products));

    await t.pumpWidget(buildSubject());

    expect(find.text('Libro Kotlin'), findsOneWidget);
    expect(find.text('\$45.0'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });

  // ── Test 3: Estado Error ───────────────────────────────────────────────
  testWidgets('shows error message when Error', (t) async {
    when(() => mockBloc.state).thenReturn(ProductError('Sin conexión'));

    await t.pumpWidget(buildSubject());

    expect(find.text('Sin conexión'), findsOneWidget);
    expect(find.byKey(const Key('retry_button')), findsOneWidget);
  });

  // ── Test 4: Interacción — botón retry despacha LoadProducts ───────────
  testWidgets('retry button dispatches LoadProducts event', (t) async {
    when(() => mockBloc.state).thenReturn(ProductError('Error de red'));

    await t.pumpWidget(buildSubject());

    expect(find.byKey(const Key('retry_button')), findsOneWidget);

    await t.tap(find.byKey(const Key('retry_button')));
    await t.pump();

    verify(() => mockBloc.add(any(that: isA<LoadProducts>()))).called(1);
  });
}