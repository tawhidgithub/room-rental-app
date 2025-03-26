import 'dart:io';

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
    required String description,
    required File imageUrl,
    required String landlordName,
    required String address,
    required String landlordEmail,
    required String landlordNumber,
    required String badRoom,
    required String bathRoom,
    required String parking,
    required String wifi,
    required String city,
    required String rating,
  }) async {
    if (box == null) {
      await openDBBox();
    }

    if (box != null) {
      final product = {
        'name': name,
        'price': price,
        'description': description,
        'imageUrl': imageUrl.path,
        'landlordName': landlordName,
        'address': address,
        'landlordEmail': landlordEmail,
        'landlordNumber': landlordNumber,
        'badRoom': badRoom,
        'bathRoom': bathRoom,
        'parking': parking,
        'wifi': wifi,
        'city': city,
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

  /// edit in data base


  Future<void> editProduct({
    required int index,
    String? name,
    String? price,
    String? description,
    File? imageUrl,
    String? landlordName,
    String? address,
    String? landlordEmail,
    String? landlordNumber,
    String? badRoom,
    String? bathRoom,
    String? parking,
    String? wifi,
    String? city,
    String? rating,
  }) async {
    if (box == null) {
      await openDBBox();
    }

    if (box != null && index < box!.length) {
      final product = box!.getAt(index) as Map<dynamic, dynamic>?;

      if (product != null) {
        final updatedProduct = {
          'name': name ?? product['name'],
          'price': price ?? product['price'],
          'description': description ?? product['description'],
          'imageUrl': imageUrl!.path ?? product['imageUrl'],
          'landlordName': landlordName ?? product['landlordName'],
          'address': address ?? product['address'],
          'landlordEmail': landlordEmail ?? product['landlordEmail'],
          'landlordNumber': landlordNumber ?? product['landlordNumber'],
          'badRoom': badRoom ?? product['badRoom'],
          'bathRoom': bathRoom ?? product['bathRoom'],
          'parking': parking ?? product['parking'],
          'wifi': wifi ?? product['wifi'],
          'city': city ?? product['city'],
          'rating': rating ?? product['rating'],
        };

        if (kDebugMode) {
          print("Editing product at index $index: $updatedProduct");
        }

        await box!.putAt(index, updatedProduct);
      } else {
        if (kDebugMode) {
          print("No product found at index $index.");
        }
      }
    } else {
      if (kDebugMode) {
        print("Index $index is out of range.");
      }
    }
  }

  /// delete from database

  Future<void> deleteProduct(int index) async {
    if (box == null) {
      await openDBBox();
    }

    if (box != null && index < box!.length) {
      if (kDebugMode) {
        print("Deleting product at index $index.");
      }

      await box!.deleteAt(index);
    } else {
      if (kDebugMode) {
        print("Index $index is out of range.");
      }
    }
  }



}