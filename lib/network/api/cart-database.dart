
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/product_model.dart';

final String tableCart = 'cart';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnPrice = 'price';
final String columnDescription = 'description';
final String columnCategory = 'category';
final String columnThumbnail = 'thumbnail';

class CartDataProvider {
  late Database db;
  static final CartDataProvider instance = CartDataProvider._internal();

  factory CartDataProvider() {
    return instance;
  }
  CartDataProvider._internal();

  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'cart.db'),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute('''
CREATE TABLE $tableCart (
            $columnId INTEGER PRIMARY KEY,
            $columnTitle TEXT,
            $columnPrice REAL,
            $columnDescription TEXT,
            $columnCategory TEXT,
            $columnThumbnail TEXT
          )
''');
        });
  }

  Future<List<Product>> getData() async {
    List<Map<String, dynamic>> maps = await db.query(tableCart);
    if (maps.isEmpty)
      return [];
    else {
      List<Product> products = [];
      maps.forEach((element) {
        products.add(Product.fromJson(element as Map<String, dynamic>));
      });
      print(maps);
      return products;
    }
  }

  Future<Product> insert(Product dataBaseModel) async {
    await db.insert(tableCart, dataBaseModel.toJson());
    return dataBaseModel;
  }

  Future<int> delete(int id) async {
    return await db
        .delete(tableCart, where: '$columnId = ?', whereArgs: [id]);
  }

  Future close() async => db.close();
}