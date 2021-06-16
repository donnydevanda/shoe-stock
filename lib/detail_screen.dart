import 'package:flutter/material.dart';
import './Model/shoe.dart';

class DetailScreen extends StatelessWidget {
  final Shoe shoe;

  DetailScreen({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailMobile(shoe: shoe),
    );
  }
}

class DetailMobile extends StatelessWidget {
  final Shoe shoe;

  DetailMobile({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Header(),
          Hero(shoe: shoe),
          Info(shoe: shoe),
          ButtonAdd(),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
            Text(
              "Details",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
            )
          ],
        ),
      ),
    );
  }
}

class Hero extends StatelessWidget {
  final Shoe shoe;

  Hero({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Image.asset(shoe.imageUrl),
    );
  }
}

class Info extends StatelessWidget {
  final Shoe shoe;

  Info({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              shoe.name,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Rp. " + shoe.price.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              shoe.description,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.teal[900],
            minimumSize: Size(80, 50),
          ),
          onPressed: () {},
          child: Text(
            "Add to Cart",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
