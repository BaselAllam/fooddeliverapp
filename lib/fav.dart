import 'package:flutter/material.dart';



class Fav extends StatefulWidget {
  @override
  _FavState createState() => _FavState();
}

class _FavState extends State<Fav> {

bool pressed = false;
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(pressed == false ? Icons.favorite_border : Icons.favorite),
      color: Colors.white,
      iconSize: 15.0,
      onPressed: () {
        setState(() {
          pressed =!pressed;
        });
      }
    );
  }
}