import 'package:flutter/material.dart';
import 'package:iti_final_project/view/screens/profile/profile-screen.dart';

class CustomProductListTile extends StatelessWidget {
final String imageUrl;
final String title;
final String subtitle;
final VoidCallback onAddToCart;


CustomProductListTile({
required this.imageUrl,
required this.title,
required this.subtitle,
required this.onAddToCart,

});

@override
Widget build(BuildContext context) {
return ListTile(
leading: Image.network(imageUrl),
title: Text(title),
subtitle: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(subtitle),
SizedBox(height: 8),
ElevatedButton(
onPressed: onAddToCart,
child: Text('Add to Cart'),
),
],
),
onTap: () {

},
);
}
}
