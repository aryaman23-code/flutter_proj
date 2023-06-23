import 'package:flutter/material.dart';
import 'quotes.dart';
import 'description.dart';

class quoteCard extends StatelessWidget {
  final Quote quote;
  final Function() delete;

  quoteCard({required this.quote, required this.delete});
  @override
  Widget build(BuildContext context) {
    var col = Expanded(
      flex: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            quote.text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
            softWrap: true,
          ),
          SizedBox(height: 6.0),
          Text(
            quote.author,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
    var img = Padding(
      padding: EdgeInsets.fromLTRB(4, 5, 18, 5),
      child: Expanded(
          flex: 4,
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(quote.img),
                radius: 20,
              ),
            ],
          )),
    );

    var del = Expanded(
        flex: 1,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: delete,
              // ignore: prefer_const_constructors
              icon: Icon(
                Icons.delete,
                size: 20,
                color: Colors.redAccent,
              ),
              label: const Text(
                '',
              ),
            ),
          ],
        ));

// here what i will do is i will pass data to the next widget and see what happens next
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/description', arguments: {
          'text': quote.text,
          'author': quote.author,
          'img': quote.img,
          'desc': quote.desc,
        });
      },
      child: Card(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          child: Hero(
            tag: 'imp',
            child: Row(
              children: <Widget>[
                img,
                col,
                del,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
