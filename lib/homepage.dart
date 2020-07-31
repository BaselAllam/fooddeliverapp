import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodybybasel/fav.dart';
import 'package:foodybybasel/itemetails.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List pastaImage = [
  'assets/pasta1.jpg',
  'assets/pasta2.jpg',
  'assets/pasta3.jpg',
  'assets/pasta4.jpg',
  'assets/pasta5.jpg',
];

List pizzaImage = [
  'assets/pizza1.jpg',
  'assets/pizza2.jpg',
  'assets/pizza3.jpg',
  'assets/pizza4.jpg',
];

List burgerImage = [
  'assets/burger1.jpg',
  'assets/burger2.jpg',
  'assets/burger3.jpg',
  'assets/burger4.jpg',
];

List pastaTitle = [
   'Pasta', 'Pasta', 'Pasta', 'Pasta', 'Pasta',
];

List pizzaTitle = [
  'Pizza', 'Pizza', 'Pizza', 'Pizza'
];

List burgerTitle = [
  'Burger', 'Burger', 'Burger', 'Burger',
];

bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: pressed == false ?
         Text(
          'Welcome! \n Bassel Allam',
          style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.normal),
        ) : 
        Container(
          height: 35.0,
            child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Colors.teal, width: 0.5)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Colors.teal, width: 0.5)
              ),
              enabled: true,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Colors.teal, width: 0.5)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Colors.teal, width: 0.5)
              ),
              labelText: 'Feel Hungry? Search for Deals',
              labelStyle: TextStyle(color: Colors.grey, fontSize: 10.0, fontWeight: FontWeight.normal)
            ),
            textInputAction: TextInputAction.search,
          ),
        ),
        actions: <Widget>[
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(5.0),
              height: 35.0,
              width: 35.0,
              decoration: BoxDecoration(
                color: Colors.teal,
                shape: BoxShape.circle
              ),
            child: IconButton(
              icon: Icon(pressed == false ? Icons.search : Icons.close),
              color: Colors.white,
              iconSize: 20.0,
              onPressed: () {
                setState(() {
                  pressed = !pressed;
                });
              }
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(2.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget> [
            ListTile(
                title: Text(
                  'Pizza',
                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '200 Orders, 25 Resturant',
                  style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.normal),
                ),
                trailing:Icon(Icons.navigate_next, color: Colors.teal, size: 25.0),
              ),
              Container(
              height: MediaQuery.of(context).size.height/3,
              margin: EdgeInsets.only(bottom: 10.0),
              child: Items(
                pizzaImage,
                pizzaTitle
              ),
            ),
            ListTile(
                title: Text(
                  'Burger',
                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '350 Orders, 45 Resturant',
                  style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.normal),
                ),
                trailing:Icon(Icons.navigate_next, color: Colors.teal, size: 25.0),
              ),
              Container(
              height: MediaQuery.of(context).size.height/3,
              margin: EdgeInsets.only(bottom: 10.0),
              child: Items(
                burgerImage,
                burgerTitle
              ),
            ),
            ListTile(
                title: Text(
                  'Pasta',
                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '550 Orders, 15 Resturant',
                  style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.normal),
                ),
                trailing:Icon(Icons.navigate_next, color: Colors.teal, size: 25.0),
              ),
              Container(
              height: MediaQuery.of(context).size.height/3,
              margin: EdgeInsets.only(bottom: 10.0),
              child: Items(
                pastaImage,
                pastaTitle
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class Items extends StatefulWidget {

List image;

List title;

Items(this.image, this.title);

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.image.length,
      itemBuilder: (context, index){
        return Container(
             width: MediaQuery.of(context).size.width/1.2,
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Stack(
              children:<Widget>[
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.image[index]),
                )
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 2.0,
              right: 2.0,
              child: Container(
                height: 70.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white
                ),
                margin: EdgeInsets.all(10.0),
                child: Item(
                  widget.image[index],
                  widget.title[index]
                )
              ),
            )
          ] 
          ),
        );
      },
    );
  }
}



class Item extends StatefulWidget {

String image;
String title;

Item(this.image, this.title);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {return ItemDetails();}));
      },
      leading: CircleAvatar(
        backgroundImage: AssetImage(widget.image),
        minRadius: 25.0,
        maxRadius: 25.0,
        ),
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RatingBar(
          onRatingUpdate: null,
          initialRating: 4.5,
          itemCount: 5,
          itemSize: 10,
          itemBuilder: (context, index){
            return Icon(Icons.star, color: Colors.teal,);
          },
        ),  
          Text(
            '49 Reviews - 15 Min - 49USD',
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.grey, fontSize: 10.0)
          ),
        ],
      ),
      trailing: Container(
        alignment: Alignment.center,
        height: 30.0,
        width: 30.0,
        decoration: BoxDecoration(
          color: Colors.teal,
          shape: BoxShape.circle
        ),
            child: Fav()
      ),
    );
  }
}