import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../UI/screens/news_details_screen.dart';

class NewsItem extends StatelessWidget {
  final String description, title, urlToImage, url;
  final DateTime publishedAt;
  NewsItem(
      {this.description,
      this.title,
      this.publishedAt,
      this.urlToImage,
      this.url});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.6;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: GridTile(
                child: GestureDetector(
                  onTap: () {
                    print(NewsDetailScreen.ROUTE_NAME);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NewsDetailScreen(url, title),
                    )
                        //.ROUTE_NAME,
                        );
                  },
                  child: Image.network(
                    (urlToImage != null && urlToImage != "null")
                        ? urlToImage
                        : 'https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.black87,
                  title: SizedBox(),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.share,
                        ),
                        color: Theme.of(context).accentColor,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.class__outlined,
                        ),
                        color: Theme.of(context).accentColor,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  leading: FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                      width: screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat.yMMMEd().format(publishedAt),
                            style: TextStyle(
                                color: Colors.deepOrange, fontSize: 13),
                          ),
                          FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              maxLines: 3,
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: Container(
              color: Colors.black45,
              width: double.infinity,
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(description)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            color: Colors.black38,
            height: 30,
          )
        ],
      ),
    );
  }
}
