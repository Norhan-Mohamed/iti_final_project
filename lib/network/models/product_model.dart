

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final List<Product>? products;
  final int? total;
  final int? skip;
  final int? limit;

  ProductModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(

    products: json["products"] == null ? [] :
    List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],

  );



  Map<String, dynamic> toJson() => {
    "products": products == null ? [] :
    List<dynamic>.from(products!.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };

}

class Product {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final Category? category;
  final String? thumbnail;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: categoryValues.map[json["category"]]!,
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": categoryValues.reverse[category],
    "thumbnail": thumbnail,
  };
}

enum Category {
  BEAUTY,
  FRAGRANCES,
  FURNITURE,
  GROCERIES
}

final categoryValues = EnumValues({
  "beauty": Category.BEAUTY,
  "fragrances": Category.FRAGRANCES,
  "furniture": Category.FURNITURE,
  "groceries": Category.GROCERIES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
