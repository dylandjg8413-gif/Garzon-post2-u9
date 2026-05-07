// lib/bloc/product_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/product.dart';
import '../repository/product_repo.dart';

// ─── Eventos ────────────────────────────────────────────────────────────────
abstract class ProductEvent {}

class LoadProducts extends ProductEvent {}

// ─── Estados ────────────────────────────────────────────────────────────────
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<Product> products;
  ProductSuccess(this.products);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}

// ─── BLoC ───────────────────────────────────────────────────────────────────
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await repository.getProducts();
        emit(ProductSuccess(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}