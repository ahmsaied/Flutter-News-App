import 'package:flutter/material.dart';

class NewsAgentWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final Function viewAllNews;

  NewsAgentWidget(this.imageUrl, this.name, this.viewAllNews);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: ListTile(
          leading: Container(
            width: 100,
            height: 100,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(name),
          onTap: viewAllNews,
          trailing: Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
