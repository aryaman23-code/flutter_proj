// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'quotes.dart';
import 'quote_card.dart';
import 'quote_list.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    try {
      data = ModalRoute.of(context)!.settings.arguments as Map;
    } catch (e) {
      data = data;
    }

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context, '/');
        },
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 64,
              ),
              Container(
                  margin: EdgeInsets.all(16),
                  child: Hero(
                    tag: 'imp',
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        data['img'],
                      ),
                      radius: 120,
                    ),
                  )),
              SizedBox(
                height: 14,
              ),
              Text(
                data['author'],
                style: TextStyle(color: Colors.black, fontSize: 32),
              ),
              SizedBox(
                height: 14,
              ),
              Card(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Text(
                    data['desc'],
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    softWrap: true,
                  ),
                ),
                color: Color.fromARGB(149, 243, 230, 230),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
