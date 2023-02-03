import 'package:atg_project_2/data/model.dart';
// import 'package:atg_project_2/data/model_new.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert';

import '../widget/listcard.dart';

class API2 extends StatefulWidget {
  API2({Key? key}) : super(key: key);
  static const routeName = "/api2";

  @override
  State<API2> createState() => _API2State();
}

class _API2State extends State<API2> {
  // List<String> nameList = ["prateek", "pradeep", "kaushalendra"];
  // late Future<API1Data> apiData;

  // Future<API1Data> fetchData() async {
  //   final response = await http.get(
  //       Uri.parse("https://632017e19f82827dcf24a655.mockapi.io/api/programs"));

  //   if (response.statusCode == 200) {
  //     return API1Data.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception("failed to load message");
  //   }
  // }
  bool loading = true;
  List<Item> items = [];
  final String url = "https://632017e19f82827dcf24a655.mockapi.io/api/lessons";
  var client = http.Client();
  Future<void> fetchData() async {
    http.Response response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      API1Datanew responseJson = modelFromJson(response.body);
      responseJson.items.map((e) => items.add(e)).toList();
      setState(() {
        loading = false;
      });
    } else {
      throw ("error");
    }
  }

  String parseString(String? str) {
    if (str == null) {
      return " ";
    } else {
      return str;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API App"),
        elevation: 0,
      ),
      body: Container(
          child: loading
              ? Container(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, position) {
                    return ListCard(
                        position, parseString(items[position].name));
                  })),
    );
  }
}
