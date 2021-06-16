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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(),
              Hero(shoe: shoe),
              Info(shoe: shoe),
              ButtonVote(),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
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
    );
  }
}

class Hero extends StatelessWidget {
  final Shoe shoe;

  Hero({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Image.asset(shoe.imageUrl),
    );
  }
}

class Info extends StatelessWidget {
  final Shoe shoe;

  Info({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
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
    );
  }
}

class ButtonVote extends StatefulWidget {
  @override
  _ButtonVoteState createState() => _ButtonVoteState();
}

class _ButtonVoteState extends State<ButtonVote> {
  bool isCart = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(16),
      child: !isCart
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.teal[900],
                minimumSize: Size(80, 50),
              ),
              onPressed: () {
                setState(() {
                  isCart = !isCart;
                });
              },
              child: Text(
                "Add to Cart",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red[400],
                minimumSize: Size(80, 50),
              ),
              onPressed: () {
                setState(() {
                  isCart = !isCart;
                });
              },
              child: Text(
                "Remove from cart",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
    );
  }
}
