import 'package:atg_project_2/screens/api1.dart';
import 'package:atg_project_2/screens/api2.dart';
import 'package:atg_project_2/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'widget/listcard.dart';

void main(List<String> args) {
  runApp(ATGProjectAPI());
}

class ATGProjectAPI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
      routes: {
        API2.routeName: (context) => API2(),
      },
    );
  }
}

class home extends StatelessWidget {
  const home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          const SizedBox(
            height: 200,
          ),
          ListTile(
            leading: Text('1'),
            title: Text("API1"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(API1.routeName);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Text('2'),
            title: Text("API2"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(API2.routeName);
            },
          )
        ],
      )),
      appBar: AppBar(
        title: Text("API App"),
        elevation: 0,
      ),
      body: API1(),
    );
  }
}
