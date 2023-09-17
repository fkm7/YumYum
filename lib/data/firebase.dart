import 'package:firebase_database/firebase_database.dart';

class FireDatabase {
  FireDatabase._internal();

  final _database = FirebaseDatabase.instance;

  static FireDatabase? _instance;

  static FireDatabase getInstance() {
    return _instance ?? FireDatabase._internal();
  }

  Stream<DatabaseEvent> getProducts({int? id}) {
    if (id != null) {
      return _database.ref('products').equalTo(id, key: 'institution').onValue;
    }
    return _database.ref('products').onValue;
  }

  Stream<DatabaseEvent> getRestaurants() {
    _database.goOnline();
    return _database.ref('restaurants').onValue;
  }

  Stream<DatabaseEvent> getOrders() {
    return _database.ref('orders').onValue;
  }

  Stream<DatabaseEvent> getCategories() {
    return _database.ref('categories').onValue;
  }

  Stream<DatabaseEvent> getProductCategories() {
    return _database.ref('product_categories').onValue;
  }
}
