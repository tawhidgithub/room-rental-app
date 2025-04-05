import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class DBConfig {
  static final DBConfig _instance = DBConfig._internal();
  factory DBConfig() => _instance;
  DBConfig._internal();

  Box<dynamic>? productBox;
  Box<dynamic>? usersBox;

  Future<void> openDBBox() async {
    if (productBox != null && productBox!.isOpen && usersBox != null && usersBox!.isOpen) {
      return; // Boxes are already open
    }

    try {
      productBox = await Hive.openBox('product');
      usersBox = await Hive.openBox('user');
      if (kDebugMode) {
        print("Boxes opened successfully.");
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
    await openDBBox();

    if (productBox != null) {
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

      await productBox!.add(product);
    }
  }

  Future<List<dynamic>> getProducts() async {
    await openDBBox();

    return productBox != null ? productBox!.values.toList() : [];
  }

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
    await openDBBox();

    if (productBox != null && index < productBox!.length) {
      final product = productBox!.getAt(index) as Map<dynamic, dynamic>? ?? {};

      final updatedProduct = {
        'name': name ?? product['name'],
        'price': price ?? product['price'],
        'description': description ?? product['description'],
        'imageUrl': imageUrl?.path ?? product['imageUrl'],
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

      await productBox!.putAt(index, updatedProduct);
    } else if (kDebugMode) {
      print("Index $index is out of range.");
    }
  }

  Future<void> deleteProduct(int index) async {
    await openDBBox();

    if (productBox != null && index < productBox!.length) {
      if (kDebugMode) {
        print("Deleting product at index $index.");
      }
      await productBox!.deleteAt(index);
    } else if (kDebugMode) {
      print("Index $index is out of range.");
    }
  }

  Future<void> addUser({
    required String id,
    required String name,
    required String userName,
    required String email,
  }) async {
    await openDBBox();

    if (usersBox != null) {
      final user = {
        'id': id,
        'name': name,
        'userName': userName,
        'email': email,
      };

      if (kDebugMode) {
        print("Adding user: $user");
      }

      await usersBox!.add(user);
    }
  }

  Future<List<dynamic>> getUsers() async {
    await openDBBox();

    return usersBox != null ? usersBox!.values.toList() : [];
  }
}