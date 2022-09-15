import 'package:dragonstone/constants/top_bar.dart';
import 'package:dragonstone/homescreen/components/home_widgets.dart';
import 'package:dragonstone/modals/character_info.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  AllStrings strings = AllStrings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black87,
                    Colors.red,
                  ],
                )
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                topBar("Dragonstone", "A House of the Dragon Archive", "assets/bg.jpg"),
                FadeInLeft(
                  child: textArea(strings.homeText1),
                ),
                const SizedBox(height: 12),
                FadeInRight(
                  child: imageArea( "assets/home/home.webp",),
                ),
                const SizedBox(height: 5),
                FadeInLeft(
                  child: textArea(strings.homeText2,)
                ),
                const SizedBox(height: 5),
                FadeInRight(
                  child: imageArea("assets/poster.jpg",)
                ),
                const SizedBox(height: 5),
                FadeInLeft(
                  child: textArea(strings.homeText3)
                ),
                const SizedBox(height: 5),
                FadeInRight(
                  child: imageArea( "assets/home/dragon.jpeg",)
                ),
                const SizedBox(height: 5),
                FadeInLeft(
                  child: textArea(strings.homeText4)
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
