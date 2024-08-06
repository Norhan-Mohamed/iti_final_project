import 'package:flutter/material.dart';
import 'package:iti_final_project/view/global/colors.dart';
import 'package:iti_final_project/view/screens/cart/cart-screen.dart';
import 'package:iti_final_project/view/screens/home/home-screen.dart';
import 'package:iti_final_project/view/screens/profile/profile-screen.dart';
class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({
    super.key,
  });
  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}
class _NavigationBarPageState extends State<NavigationBarPage> {
  final List<Map<String, dynamic>> _pages = [
    {'page':  HomeScreen(), 'title': 'Home'},
    {'page':  CartScreen(), 'title': 'Cart'},
    {'page': ProfilePage(),'title':'Profile'},
  ];
  int _selectedPageIndex = 0;
  index(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 18,
        unselectedFontSize: 15,
        backgroundColor: ColorResources.PrimaryColorblack,
        selectedItemColor: ColorResources.PrimaryColorGold,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        onTap:index,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}