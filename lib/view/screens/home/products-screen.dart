
import 'package:flutter/material.dart';

import '../../global/colors.dart';
import '../../global/fonts.dart';

class DetailsScreen extends StatefulWidget {
 late int? id;
 late String? title;
 late double? price;
 late String? description;
 late String? category;
 late String? thumbnail;


  DetailsScreen(
      this.id,
      this.title,
      this.price,
      this.description,
      this.thumbnail,this.category
      );

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.PrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(icon:Icon(Icons.arrow_back,),onPressed: (){
          Navigator.of(context).pop();
        },),
        actions: [
          Icon(Icons.search),
        ],
      ),
      body: SingleChildScrollView(
                      child: Column(
                        children: [
                         Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                color: ColorResources.PrimaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50)
                                ),
                                  border: Border.all(
                                    color:  ColorResources.PrimaryColorGold,
                                    width: 3,
                                  )),
                              child: Image.network(
                                 widget!.thumbnail.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          SizedBox(height: 15,),
                          Container(
                            height: 800,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color:  ColorResources.PrimaryColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title.toString(),
                                  style: sansTitle
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  height: 25,
                                  thickness: 2,
                                  color: ColorResources.PrimaryColorGold,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Price",
                                      style: sansSubTitle
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${widget.price}\$",
                                      style: sansSubTitle.copyWith(fontWeight: FontWeight.w600)
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 24,
                                  thickness: 1,
                          color: ColorResources.PrimaryColorGold,
                                ),
                                const Text("Product Details",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20)),
                                const SizedBox(
                                  height: 10,
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Description",
                                      style: sansTitle
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      widget.description.toString(),
                                      style: sansSubTitle
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  height: 20,
                                  thickness: 1,
                                  color: ColorResources.PrimaryColorGold,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.rate_review_rounded,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    Text(
                                      "24 Product Question & Review",
                                      style:sansHeadTitle
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.black,
                                      size: 20,
                                    )
                                  ],
                                ),
                                Divider(
                                  height: 15,
                                  thickness: 1,
                                  color: ColorResources.PrimaryColorGold,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 150,
                                      child: Center(
                                          child: Text(
                                            "Buy Now",
                                            style: sansSmallTitle
                                          )),
                                      decoration: BoxDecoration(
                                       // color:  Colors.black,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: ColorResources.PrimaryColorblack, // Border color
                                          width: 2.0, // Border width
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 150,
                                      child: Center(
                                          child: Text(
                                            "Add To Cart",
                                            style: sansSmallTitle
                                          )),
                                      decoration: BoxDecoration(
                                        color: ColorResources.PrimaryColorGold,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )));

  }
}