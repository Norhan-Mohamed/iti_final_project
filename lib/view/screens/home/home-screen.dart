import 'package:flutter/material.dart';
import 'package:iti_final_project/view/screens/home/products-screen.dart';
import '../../../network/api/api_provider.dart';
import '../../../network/api/cart-database.dart';
import '../../../network/models/product_model.dart';
import '../../global/colors.dart';
import '../../global/dimension.dart';
import '../../global/fonts.dart';
import '../../widgets/home/smoothPageIndicator.dart';
import '../appInfo/about-screen.dart';
import '../cart/cart-screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category? _selectedCategory;
  final CartDataProvider _dbHelper = CartDataProvider();


  void _addToCart(Product product) async {
  final cartProduct = Product (
  id: product.id,
  title: product.title,
  price: product.price,
  description: product.description,
  thumbnail: product.thumbnail,
  );

  await _dbHelper.insert(cartProduct);

  ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text('${product.title} added to cart')),
  );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All your needs in one place!", style: sansHeadTitle),
        backgroundColor: ColorResources.PrimaryColorGold,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: Icon(
              Icons.shopping_cart,
              size: Dimensions.ICON_SIZE_DEFAULT,
              color: ColorResources.PrimaryColorblack,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.menu,
              size: Dimensions.ICON_SIZE_DEFAULT,
              color: ColorResources.PrimaryColorblack,
            ),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),);
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: FutureBuilder<ProductModel?>(
        future: ApiProvider().getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.amber),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data?.products == null) {
            return Center(
              child: Text('No data available'),
            );
          }

          var products = snapshot.data!.products!;
          var images = products
              .map((product) => product.thumbnail != null
              ? Image.network(product.thumbnail!)
              : Container())
              .take(8)
              .toList();

          var categories = products
              .map((p) => p.category)
              .where((c) => c != null)
              .toSet()
              .toList();

          var filteredProducts = _selectedCategory != null
              ? products.where((p) => p.category == _selectedCategory).toList()
              : products;

          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Container(
                  height: 240,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: SmoothPageIndicator(images: images),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: categories.map((category) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCategory = category;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _selectedCategory == category
                                ? Colors.amber
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            category!.name,
                            style: TextStyle(
                              color: _selectedCategory == category
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.products!.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return Card(
                        shadowColor: Colors.grey[300],
                        child: GestureDetector(
                          child: ListTile(
                            leading: product.thumbnail != null
                                ? Image.network(product.thumbnail!)
                                : Container(),
                            title: Text(product.title ?? 'No Title'),
                            subtitle: Text(product.price?.toString() ?? 'No Price'),
                            trailing: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () async {
                                print('Added ${product.title} to cart');
                                await CartDataProvider.instance.insert(
                                  Product(id: products[index].id,title: products[index].title,price: products[index].price,description: products[index].description,category: products[index].category ,thumbnail: products[index].thumbnail ),
                                );
                              },
                            ),
                          ),
                          onDoubleTap: ()async{
                           await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailsScreen(products[index].id, products[index].title, products[index].price, products[index].description, products[index].thumbnail, products[index].category.toString())),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
