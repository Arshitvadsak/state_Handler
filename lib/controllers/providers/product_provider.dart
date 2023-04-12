import 'package:flutter/foundation.dart';
import 'package:state_management_provider/models/product_model.dart';

class PrductProvider extends ChangeNotifier {
  List<Product> added_product = [];

  get totalQuantity => added_product.length;

  get totalPrice {
    int price = 0;

    added_product.forEach((e) {
      price = price + e.price;
    });
    return price;
  }

  void addProduct({required Product product}) {
    added_product.add(product);
    notifyListeners();
  }

  void removeProduct({required Product product}) {
    added_product.remove(product);
    notifyListeners();
  }
}
