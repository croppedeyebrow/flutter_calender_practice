import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blueGrey,
      //   title: Text('Schedule App'),
      // ),
      body: SafeArea(
        child: Container(
          color: Color.fromARGB(255, 49, 28, 92),
          padding: EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width,
          height: 260,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Daily",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8.8),
                      Text(
                        "meetings",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffa79abf),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    "Jan",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
