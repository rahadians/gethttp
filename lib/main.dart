import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Store",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Uri Url = Uri.parse("http://127.0.0.1:53195/my_store/code/getdata.php");
  Uri Url = Uri.parse("http://192.168.0.42/my_store/code/getdata.php"
  );

  //10.0.2.2 hp ip pc

  Future<List> getData() async {
    final response = await http.get(Url,
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        }
    );

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Store"),
      ),
      body: Center(
        child: FutureBuilder<List>(
          future: getData(),
          builder:(context,snapshot){
            if(snapshot.hasError) print(snapshot.error);
            return snapshot.hasData? ItemList(list: [snapshot.data],) : Center(child: CircularProgressIndicator(),);
          } ,
        )
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});


  // const ItemList(Set set, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: list==null ? 0 : list.length,
        itemBuilder: (context,index){
        return Text(list[index]['item_name']);
        });
  }
}
