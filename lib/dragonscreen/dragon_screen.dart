import 'package:dragonstone/constants/top_bar.dart';
import 'package:dragonstone/constants/colors.dart';
import 'package:dragonstone/modals/dragon_info.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:xen_popup_card/xen_card.dart';

class DragonScreen extends StatefulWidget {
  const DragonScreen({Key? key}) : super(key: key);

  @override
  State<DragonScreen> createState() => _DragonScreenState();
}

class _DragonScreenState extends State<DragonScreen> {
  DragonInfo info = DragonInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black87,
                    AppColors.gold,
                  ],
                )
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                topBar("Dragon Index", "The Targaryon's Pet", "assets/dragon.webp"),
                Expanded(
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                        ),
                        itemCount: info.dragonNames.length,
                        itemBuilder: (context, index){
                          return  FadeInUp(
                            child: Card(
                              clipBehavior: Clip.hardEdge,
                              color: Colors.transparent,
                              elevation: 30,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Colors.yellowAccent,
                                width: 1,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: InkWell(
                                onTap: (){
                                  popUpCard(index);
                                },
                                child: SizedBox(
                                    width: 300,
                                    height: 200,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.asset(
                                          info.dragonImages[index],
                                          fit: BoxFit.cover,
                                        ))),
                              ),
                            ),
                          );
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }



  Future popUpCard(int itemIndex){
    return showDialog(
      context: context,
      builder: (builder){
        return XenPopupCard(
          cardBgColor: Colors.transparent,
          body: FadeInDown(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.black87,
                        AppColors.gold,
                      ],
                    )
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(

                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                info.dragonImages[itemIndex],
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
                                      info.dragonNames[itemIndex],
                                      style: TextStyle(color: AppColors.glossyBlack, fontSize: 30, fontWeight: FontWeight.bold),
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
                                child: Column(
                                  children: [
                                    Text(
                                      "RIDERS:",
                                      style: TextStyle(color: AppColors.glossyBlack, fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      info.dragonRiders[itemIndex],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          FadeIn(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  info.dragonBio[itemIndex],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )

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
            ),
          ),
        );
      },

    );
  }
}


