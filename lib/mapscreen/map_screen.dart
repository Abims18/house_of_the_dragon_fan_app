import 'package:dragonstone/constants/top_bar.dart';
import 'package:dragonstone/modals/map_info.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/colors.dart';
import '../modals/all_images.dart';
import 'package:xen_popup_card/xen_card.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapInfo info = MapInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/map.png"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              topBar("Locations Guide", "The legendary Lands", "assets/maps/hotdmap.jpg"),
              Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 0,
                    mainAxisExtent: 70,
                    mainAxisSpacing: 10
                  ),
                  itemCount: info.locNames.length,
                  itemBuilder: (context, index){
                    return FadeInDown(
                      child: InkWell(
                        onTap: (){
                          popUpCard(index);
                        },
                        child: Card(
                          elevation: 60,
                          color: Colors.black45,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SizedBox(
                              width: 100,
                              height: 200,
                              child: Center(
                                child: Hero(
                                  tag: "map$index",
                                    child: Text(info.locNames[index], style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),))
                              ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ),
      ),
    );
  }



  Future popUpCard(int itemIndex) {
    AllImages images = AllImages();
    MapInfo info = MapInfo();
    return showDialog(
      context: context,
      builder: (builder){
        return XenPopupCard(
          cardBgColor: Colors.transparent,
          body: Center(
            child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                              image: AssetImage("assets/map.png"),
                              fit: BoxFit.cover)),

                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                images.locations[itemIndex],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          FadeIn(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                  child: Hero(
                                    tag: "map$itemIndex",
                                    child: Text(
                                      info.locNames[itemIndex],
                                      style: TextStyle(color: AppColors.gold, fontSize: 30, fontWeight: FontWeight.bold),
                                    ),
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
                                  info.locInfo[itemIndex],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )

                        ],
                      ),
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
}
