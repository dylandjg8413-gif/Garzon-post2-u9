// lib/repository/product_repo.dart

import '../model/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}

// Implementación concreta (simula red)
class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      const Product(id: '1', name: 'Libro Flutter', price: 39.99),
      const Product(id: '2', name: 'Libro Kotlin', price: 45.0),
      const Product(id: '3', name: 'Curso Dart', price: 29.99),
    ];
  }
}