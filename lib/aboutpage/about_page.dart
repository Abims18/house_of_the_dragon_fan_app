import 'package:dragonstone/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: FadeIn(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Designed and developed by", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
                Text("Abisheik M S", style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.bold, fontSize: 20),),
                const Icon(Icons.copyright, color: Colors.white, size: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
