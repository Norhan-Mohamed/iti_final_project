import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iti_final_project/view/global/colors.dart';

import '../../global/fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.PrimaryColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 190,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorResources.PrimaryColorGold,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvnDyLGaS2rDeKoMVQJDtoefxzEG8DKt7MYLoqkYaGl3ZYfc6VOiNzFENZ5SeuoJxa2k4&usqp=CAU",
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45))),
                child: BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 9.0),
                  child: new Container(
                    decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.5)),
                  ),
                ),
              ),
              Align(
                heightFactor: 1.7,
                alignment: Alignment.bottomCenter,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                    "https://i.pinimg.com/474x/5d/05/96/5d0596ab050e94e1fe07687e107f61c9.jpg",
                  ),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(15)),
             Text(
                  "Norhan Mohmed",
                  style: sansTitle
                ),

              Text(
                "Norhan@gmail.com",
                style:sansTitle,
              ),
              SizedBox(
                height: 14,
              ),
              Card(
                shadowColor: ColorResources.PrimaryColorblack,
                elevation: 4,
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.notifications,
                              color: ColorResources.PrimaryColorGold
                            ),
                          ),
                          Text(
                            "Notification",
                            style: sansSubTitle
                          ),
                          SizedBox(
                            width: 200,
                          ),
                          Text(
                            "on",
                            textAlign: TextAlign.end,
                            style:sansSubTitle
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.language,
                              color: ColorResources.PrimaryColorGold
                            ),
                          ),
                          Text(
                            "Language",
                            style: sansSubTitle
                          ),
                          SizedBox(
                            width: 200,
                          ),
                          Text(
                            "English",
                            textAlign: TextAlign.end,
                            style:sansSubTitle
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 25,
                color: ColorResources.PrimaryColorGold,
              ),
              Card(
                shadowColor: ColorResources.PrimaryColorblack,
                elevation: 5,
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.security_rounded,
                              color:  ColorResources.PrimaryColorGold
                            ),
                          ),
                          Text(
                            "Security",
                            style: sansSubTitle
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.color_lens,
                              color: ColorResources.PrimaryColorGold
                            ),
                          ),
                          Text(
                            "Theme",
                            style: sansSubTitle
                          ),
                          SizedBox(
                            width: 200,
                          ),
                          Text(
                            "Light Mode",
                            style: sansSubTitle
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 25,
                color: ColorResources.PrimaryColorGold,
              ),
              Card(
                shadowColor: ColorResources.PrimaryColorblack,
                elevation: 2,
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.help,
                              color:  ColorResources.PrimaryColorGold
                            ),
                          ),
                          Text(
                            "Help & Support",
                            style: sansSubTitle
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.mail_sharp,
                              color:  ColorResources.PrimaryColorGold
                            ),
                          ),
                          Text(
                            "Contact Us",
                            style: sansSubTitle
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.lock,
                              color:  ColorResources.PrimaryColorGold
                            ),
                          ),
                          Text(
                            "Privacy Policy",
                            style: sansSubTitle
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}