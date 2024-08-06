import 'package:flutter/material.dart';
import 'package:iti_final_project/view/global/colors.dart'; // Adjust the import if necessary

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.PrimaryColorGold,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "About the App",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to squareN!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "We offer a wide range of products to meet all your needs. Whether you're looking for electronics, fashion, or home essentials, we've got you covered. Shop with confidence and enjoy a seamless shopping experience!",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            Text(
              "Developer Information:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Developed by: ",
              style: TextStyle(fontSize: 16),
            ),SizedBox(height: 8),
            Text(
              "Norhan Mohamed Abd Elmonem \nNouran Adel Elgamil",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16,),
            Text(
              "Email:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              " Norhan.moh99@gmail.com \n nouranelgamil@gmail.com ",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Version:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "1.0.0",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            Text(
              "Contact Us:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              " 01065011881 or 01024950655",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "For any support or inquiries, please reach out to us at support@gmail.com. We're here to help you with any questions or issues.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
