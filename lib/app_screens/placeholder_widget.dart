import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/main course.png',
            image_caption: 'Main Courses',
          ),

          Category(
            image_location: 'images/starts.png',
            image_caption: 'Starters',
          ),

          Category(
            image_location: 'images/desserts.png',
            image_caption: 'Desserts',
          ),

          Category(
            image_location: 'images/drinks.png',
            image_caption: 'Drinks',
          ),

//          Category(
//            image_location: 'images/cats/informal.png',
//            image_caption: 'formal',
//          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
              title: Image.asset(
                image_location,
                width: 100.0,
                height: 80.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(image_caption, style: new TextStyle(fontSize: 12.0),),
              )
          ),
        ),
      ),
    );
  }
}