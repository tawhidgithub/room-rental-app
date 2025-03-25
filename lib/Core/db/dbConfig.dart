import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class DBConfig {
  static final DBConfig _instance = DBConfig._internal();

  factory DBConfig() {
    return _instance;
  }

  DBConfig._internal();

  Box<dynamic>? box;

  Future<void> openDBBox() async {
    if (box != null && box!.isOpen) {
      // Box is already open
      return;
    }

    try {
      box = await Hive.openBox('product');
      if (kDebugMode) {
        print("Box opened successfully.");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Failed to open box: $e");
      }
    }
  }

  Future<void> addProduct({
    required String name,
    required String price,
    required String imageUrl,
    required String landlordName,
    required String address,
    required String landlordEmail,
    required String landlordNumber,
    required String badRoom,
    required String bathRoom,
    required String parking,
    required String wifi,
    required String city,
    required String state,
    required String rating,
  }) async {
    if (box == null) {
      await openDBBox();
    }

    if (box != null) {
      final product = {
        'name': name,
        'price': price,
        'imageUrl': imageUrl,
        'landlordName': landlordName,
        'address': address,
        'landlordEmail': landlordEmail,
        'landlordNumber': landlordNumber,
        'badRoom': badRoom,
        'bathRoom': bathRoom,
        'parking': parking,
        'wifi': wifi,
        'city': city,
        'state': state,
        'rating': rating,
      };

      if (kDebugMode) {
        print("Adding product: $product");
      }

      await box!.add(product);
    }
  }

  Future<void> getProduct() async {
    if (box == null) {
      await openDBBox();
    }

    if (box != null) {
      final products = box!.values.toList();
      if (kDebugMode) {
        print("Retrieved products: $products");
      }
    }
  }
}