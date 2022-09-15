import 'package:flutter/material.dart';

import '../../modals/character_info.dart';


Widget textArea(String text){
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      textAlign: TextAlign.justify,
    ),
  );
}

Widget imageArea(String image){
  return Card(
    color: Colors.transparent,
    elevation: 30,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    child: SizedBox(
        width: 300,
        height: 200,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
             image,
              fit: BoxFit.cover,
            ))),
  );
}