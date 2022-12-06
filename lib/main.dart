import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: demo(),

  ));
}

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  get() async {
    // https://reqres.in/api/users?page=2
    var url = Uri.https('reqres.in', 'api/users?page=2');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
     Map m=jsonDecode(response.body);
     print(m['page']);
     print(m['per_page']);
     print(m['total']);
     print(m['total_pages']);

     List list=m['data'];
     list.forEach((element) {
       print(element['id']);
       print(element['name']);
       print(element['year']);
       print(element['color']);
       print(element['pantone_value']);
     });

     Map m1=m['support'];
     print(m1['url']);
     print(m1['text']);


    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
