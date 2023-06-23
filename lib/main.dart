import 'package:flutter/material.dart';
import 'quote_card.dart';
import 'quote_list.dart';
import 'description.dart';

void main() => runApp(MaterialApp(
      // home:Home(),
      initialRoute: '/',
      routes: {
        '/': (context) => const QuoteList(),
        '/description': (context) => const Description(),
      },
    ));
