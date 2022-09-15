import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../constants/colors.dart';
import '../modals/all_images.dart';
import '../modals/character_info.dart';

class CardUI extends StatefulWidget {
  const CardUI({Key? key, required this.index, required this.carosal});

  final int index;
  final int carosal;

  @override
  State<CardUI> createState() => _CardUIState();
}

class _CardUIState extends State<CardUI> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Card(
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(height: 20),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                )),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Hero(
                  tag: "titleOf${widget.index}&${widget.carosal}",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      imageCounter(widget.carosal, widget.index),
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
            SizedBox(height: 20),
            FadeIn(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(
                  nameCounter(widget.carosal, widget.index),
                  style: TextStyle(color: AppColors.gold, fontSize: 30),
                )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FadeIn(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    bioCounter(widget.carosal, widget.index),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  imageCounter(int house, int item) {
    AllImages images = AllImages();
    switch (house) {
      case 0:
        return images.houseTarg[item];
      case 1:
        return images.houseVale[item];
      case 2:
        return images.houseHight[item];
      case 3:
        return images.houseStrong[item];
      case 4:
        return images.kings[item];
      default:
        return 4;
    }
  }

  String nameCounter(int house, int index) {
    AllStrings strings = AllStrings();
    switch (house) {
      case 0:
        return strings.house_targaryen[index];
      case 1:
        return strings.house_velaryon[index];
      case 2:
        return strings.house_hightower[index];
      case 3:
        return strings.house_strong[index];
      case 4:
        return strings.kingsguard[index];
      default:
        return "";
    }
  }

  String bioCounter(int house, int index) {
    CharacterBio bio = CharacterBio();
    switch (house) {
      case 0:
        return bio.targ_bio[index];
      case 1:
        return bio.velaryon_bios[index];
      case 2:
        return bio.high_bios[index];
      case 3:
        return bio.strong_bios[index];
      case 4:
        return bio.guard_bios[index];
      default:
        return "";
    }
  }
}
