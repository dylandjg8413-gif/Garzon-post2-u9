Garzón Post2 U9 — Widget Tests y Golden Tests

Curso: Aplicaciones Móviles — Unidad 9: Testing y Aseguramiento de Calidad
Estudiante: Dylan Garzón
Universidad: Universidad de Santander (UDES)
Año: 2026

Descripción

Este proyecto implementa widget tests y golden tests para una aplicación Flutter utilizando arquitectura MVVM y manejo de estados con StateNotifier. Se emplea mocktail para simular dependencias externas y pruebas visuales para validar la interfaz gráfica sin necesidad de consumir APIs reales.

Estructura del proyecto
lib/

├── viewmodel/
│   └── inventory_viewmodel.dart
│
├── model/
│   └── inventory_item.dart
│
├── repository/
│   └── inventory_repository.dart
│
├── screen/
│   ├── inventory_screen.dart
│   └── inventory_card.dart
│
└── main.dart

test/

├── widget/
│   └── inventory_screen_test.dart
│
├── golden/
│   └── inventory_card_golden_test.dart
│
└── goldens/
    ├── inventory_card_light.png
    └── inventory_card_dark.png
Tests implementados
Widget Tests
Test	Propósito
shows CircularProgressIndicator when Loading	Verifica que el indicador de carga aparece en estado Loading
shows inventory list when Success	Verifica que los productos del inventario se muestran correctamente
shows error message when Error	Verifica que el mensaje de error aparece cuando ocurre una excepción
refresh button reloads inventory	Verifica que al tocar el botón de actualizar se recargan los datos
Golden Tests
Test	Propósito
InventoryCard light theme matches golden	Compara el renderizado del InventoryCard en tema claro
InventoryCard dark theme matches golden	Compara el renderizado del InventoryCard en tema oscuro
Cómo ejecutar los tests
Ejecutar toda la suite
flutter test
Ejecutar solo widget tests
flutter test test/widget/inventory_screen_test.dart
Ejecutar solo golden tests
flutter test test/golden/inventory_card_golden_test.dart
Regenerar golden files cuando el cambio visual es intencional
flutter test --update-goldens test/golden/inventory_card_golden_test.dart
Resultados de los tests

Los resultados obtenidos validan correctamente el funcionamiento de la interfaz y el comportamiento visual de la aplicación.

Se verificó que:

Los estados Loading, Success y Error funcionan correctamente.
La lista de productos se renderiza adecuadamente.
Los botones ejecutan las acciones esperadas.
Los golden tests detectan cambios visuales inesperados.
Las imágenes de referencia coinciden con la interfaz renderizada.

Resultado final observado:

All tests passed successfully.
6 tests completed, 0 failed.

## Resultados de los tests

### Widget Tests
![Widget tests](screenshots/widget_tests.png)

### Golden Tests
![Golden tests](screenshots/golden_tests.png)

### Todos los tests
![Todos los tests](screenshots/todos_los_tests.png)

---

## Golden Files de referencia

### Tema claro
![ProductCard tema claro](test/goldens/product_card_light.png)

### Tema oscuro
![ProductCard tema oscuro](test/goldens/product_card_dark.png)

---

## Dependencias

| Paquete | Versión | Uso |
|---------|---------|-----|
| `flutter_bloc` | ^8.1.4 | Gestión de estado BLoC |
| `mocktail` | ^1.0.3 | Mocking del BLoC en tests |
| `bloc_test` | ^9.1.7 | MockBloc y helpers de test |

---
