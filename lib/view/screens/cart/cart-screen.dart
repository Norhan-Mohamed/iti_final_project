import 'package:flutter/material.dart';
import 'package:iti_final_project/view/global/colors.dart';
import '../../../network/api/cart-database.dart';
import '../../../network/models/product_model.dart';
import '../../global/fonts.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  Future<List<Product>>? _cartProducts;
  Map<int, int> _quantities = {};

  @override
  void initState() {
    super.initState();
    _cartProducts = CartDataProvider.instance.getData().then((products) {
      _quantities = {for (var product in products) product.id!: 1};
      return products;
    });
  }

  void _updateQuantity(int productId, int quantity) async {
    if (quantity <= 0) {
      await CartDataProvider.instance.delete(productId);
      setState(() {
        _quantities.remove(productId);
      });
    } else {
      _quantities[productId] = quantity;

    }
    setState(() {
      _cartProducts = CartDataProvider.instance.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.PrimaryColorGold,
        elevation: 0,
        centerTitle: true,
        title: Text("Your Cart", style: sansHeadTitle),
      ),
      body: FutureBuilder<List<Product>>(
        future: _cartProducts,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            final products = snapshot.data!;
            double totalPrice = 0;

            for (var product in products) {
              int quantity = _quantities[product.id!] ?? 1;
              double price = product.price ?? 0;
              totalPrice += quantity * price;
            }

            return Column(
              children: [
                Container(
                  height: 418,
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 80.0),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      int quantity = _quantities[product.id!] ?? 1;
                      double price = product.price ?? 0;
                      double itemTotal = quantity * price;

                      return Card(
                        shadowColor: ColorResources.PrimaryColorblack,
                        elevation: 2,
                        child: ListTile(
                          leading: Image.network(product.thumbnail ?? ''),
                          title: Text(product.title.toString(), style: sansTitle),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Price: \$${price.toStringAsFixed(2)}", style: sansSubTitle),
                              Text("Total: \$${itemTotal.toStringAsFixed(2)}", style: sansSubTitle),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  if (quantity > 1) {
                                    _updateQuantity(product.id!, quantity - 1);
                                  }
                                },
                              ),
                              Text('$quantity', style: sansTitle),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  _updateQuantity(product.id!, quantity + 1);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () async {
                                  await CartDataProvider.instance.delete(product.id!.toInt());
                                  setState(() {
                                    _quantities.remove(product.id!);
                                    _cartProducts = CartDataProvider.instance.getData();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),),
                      border: Border.all(color: ColorResources.PrimaryColorGold, width: 1.5),
                      color: ColorResources.PrimaryColor
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                border: Border.all(color: Colors.grey, width: 1.5),
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "Add your Visa number",
                                    style: TextStyle(fontSize: 20, color: Colors.black54),
                                  ),
                                ),
                              ),
                            ),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorResources.PrimaryColorGold,
                                padding: EdgeInsets.symmetric(horizontal: 24.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                              onPressed: () {
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Purchase",
                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Price:",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$${totalPrice.toStringAsFixed(2)}",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shipping fee:",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$15",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Divider(thickness:2,height: 25,color: ColorResources.PrimaryColorGold,),
          Container(
            width: double.infinity,
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(
            backgroundColor: ColorResources.PrimaryColorGold,
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            ),
            ),
            onPressed: () {
            },
            child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
            "Purchase",
            style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            ),
            ),
          ),

                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: ColorResources.PrimaryColorGold,
            ),
          );
        },
      ),
    );
  }
}
