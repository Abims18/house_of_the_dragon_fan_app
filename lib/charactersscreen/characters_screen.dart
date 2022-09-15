import 'package:dragonstone/constants/hero_dialog_route.dart';
import 'package:dragonstone/constants/top_bar.dart';
import 'package:dragonstone/constants/colors.dart';
import 'package:dragonstone/modals/all_images.dart';
import 'package:dragonstone/modals/character_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'card_ui.dart';
import 'package:xen_popup_card/xen_card.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black,
              Colors.grey,
            ],
          )),
          child: Column(
            children: [
              topBar("Characters Guide", "Get to know them",
                  "assets/characters.webp"),
              Expanded(
                child: ListView.builder(
                  itemCount: AllImages().houses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildCarousel(context, index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    int index = 0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            child: colorText(
                Colors.white, AllStrings().houseNames[carouselIndex])),
        const SizedBox(height: 15),
        // Text('Carousel $carouselIndex', style: TextStyle(color: Colors.white),),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 200.0,
          child: PageView.builder(
            // reverse: false,
            controller: PageController(viewportFraction: 0.7),
            onPageChanged: (int index) {
              setState(() {
                index = index;
              });
            },
            itemCount: lengthCounter(carouselIndex),
            itemBuilder: (BuildContext context, int itemIndex) {
              return Transform.scale(
                  scale: itemIndex == index ? 1 : 0.9,
                  child: _buildCarouselItem(context, carouselIndex, itemIndex));
            },
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  int lengthCounter(int ind) {
    AllImages images = AllImages();
    switch (ind) {
      case 0:
        return images.houseTarg.length;
      case 1:
        return images.houseVale.length;
      case 2:
        return images.houseHight.length;
      case 3:
        return images.houseStrong.length;
      case 4:
        return images.kings.length;
      default:
        return 4;
    }
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: InkWell(
        onTap: () {
          popUpCard(carouselIndex, itemIndex);
        },
        child: Hero(
          tag: "titleOf$itemIndex&$carouselIndex",
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(image: imager(carouselIndex, itemIndex)),
          ),
        ),
      ),
    );
  }

  Widget colorText(Color color, String text) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 20),
      textAlign: TextAlign.center,
    );
  }

  imager(int carouselIndex, int itemIndex) {
    AllImages images = AllImages();
    switch (carouselIndex) {
      case 0:
        return DecorationImage(image: AssetImage(images.houseTarg[itemIndex]));
      case 1:
        return DecorationImage(image: AssetImage(images.houseVale[itemIndex]));
      case 2:
        return DecorationImage(image: AssetImage(images.houseHight[itemIndex]));
      case 3:
        return DecorationImage(
            image: AssetImage(images.houseStrong[itemIndex]));
      case 4:
        return DecorationImage(image: AssetImage(images.kings[itemIndex]));
      default:
        return null;
    }
  }


  Future popUpCard(int indexCarosal, int indexItem) {
    return showDialog(
      context: context,
      builder: (builder){
        return XenPopupCard(
          cardBgColor: Colors.transparent,
          body: Container(
            clipBehavior: Clip.none,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black,
                    Colors.grey,
                  ],
                )),

            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Hero(
                            tag: "titleOf$indexItem&$indexCarosal",
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                imageCounter(indexCarosal, indexItem),
                                fit: BoxFit.fill,
                              ),
                            )),
                      ),
                      const SizedBox(height: 20),
                      FadeIn(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Text(
                                nameCounter(indexCarosal, indexItem),
                                textAlign: TextAlign.center,
                                style: TextStyle(color: AppColors.gold, fontSize: 30),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeIn(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            child: Text(
                              bioCounter(indexCarosal, indexItem),
                              textAlign: TextAlign.justify,
                              style: const TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Positioned(
                  top: -12,
                  right: -12,
                  child:  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 20,
                          ))),)

              ],
            ),
          ),
        );
      },
    );
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
}
