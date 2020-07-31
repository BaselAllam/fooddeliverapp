import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodybybasel/fav.dart';

class ItemDetails extends StatefulWidget {
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  List itemImage = [
    'assets/burger1.jpg',
    'assets/burger2.jpg',
    'assets/burger3.jpg',
    'assets/burger4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Stack(
                    children: <Widget>[
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: itemImage.length,
                        itemBuilder: (context, index) {
                          return Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              margin: EdgeInsets.only(right: 5.0),
                              child: Image.asset(
                                itemImage[index],
                                fit: BoxFit.cover,
                              ));
                        },
                      ),
                      Positioned(
                        top: 2.0,
                        left: 2.0,
                        child: SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: Card(
                            color: Colors.teal,
                            shape: CircleBorder(),
                            child: IconButton(
                                icon: Icon(Icons.navigate_before),
                                color: Colors.white,
                                iconSize: 25.0,
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 0.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ListTile(
                    title: Text(
                      'Burger',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RatingBar(
                          onRatingUpdate: null,
                          initialRating: 4.5,
                          itemCount: 5,
                          itemSize: 10,
                          itemBuilder: (context, index) {
                            return Icon(
                              Icons.star,
                              color: Colors.teal,
                            );
                          },
                        ),
                        Text('49 Reviews - 15 Min - 49USD',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.grey, fontSize: 10.0)),
                      ],
                    ),
                    trailing: Container(
                        alignment: Alignment.center,
                        height: 30.0,
                        width: 30.0,
                        decoration:
                            BoxDecoration(color: Colors.teal, shape: BoxShape.circle),
                        child: Fav()),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Card(
                    elevation: 0.0,
                      child: ListTile(
                      title: Text(
                        'About...',
                        style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      trailing: Card(
                        color: Colors.teal,
                        shape: CircleBorder(),
                        child: Icon(Icons.info_outline, color: Colors.white, size: 20.0)
                      ),
                      subtitle: Text(
                        'A delcious Burger Sandwish \n with fresh vegetables, made with love in this App Code, \n Juke!, ^_^ \n this UI Designed and Built by Bassel Allam in 8 Apr 2020, \n Enjoy!',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/3.5,
                  color: Colors.white,
                  child: Similar(),
                ),
              ],
            ),
          ),
          SafeArea(
            bottom: true,
            child: Container(
              height: 50.0,
              margin: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: RaisedButton(
                color: Colors.teal,
                child: ListTile(
                  title: Text(
                      'Add To Cart',
                      style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.normal)
                    ),
                  trailing: Icon(Icons.shopping_basket, color: Colors.white, size: 20.0)
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}



class Similar extends StatefulWidget {
  @override
  _SimilarState createState() => _SimilarState();
}

class _SimilarState extends State<Similar> {

List burgerImage = [
  'assets/burger1.jpg',
  'assets/burger2.jpg',
  'assets/burger3.jpg',
  'assets/burger4.jpg',
];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: burgerImage.length,
      itemBuilder: (context, index){
        return Container(
          margin: EdgeInsets.all(5.0),
          width: MediaQuery.of(context).size.width/3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(burgerImage[index]),
                )
              ),
            ),
              Card(
                elevation: 0.0,
                child: ListTile(
                  title: Text(
                        'Burger',
                        style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}