import 'package:flutter/material.dart';

import '../../UI/screens/news_list.dart';
import '../../UI/widget/news_agent_widget.dart';
import '../../model/news_agent.dart';
import '../../network/API.dart';
import '../../model/utils.dart';
import '../../UI/widget/app_drawer.dart';

class HomePage extends StatelessWidget {
  final List<NewsAgent> newsAgent = [
    NewsAgent(
        name: 'ABC News',
        source: 'abc-news',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/ABC_News_solid_black_logo.svg/1200px-ABC_News_solid_black_logo.svg.png'),
    NewsAgent(
        name: 'BBC News',
        source: 'bbc-news',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/BBC_News_2019.svg/1200px-BBC_News_2019.svg.png'),
    NewsAgent(
        name: 'CBS News',
        source: 'cbs-news',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/CBS_News.svg/1200px-CBS_News.svg.png'),
    NewsAgent(
        name: 'CNN News',
        source: 'cnn',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/CNN_International_logo.svg/150px-CNN_International_logo.svg.png'),
    NewsAgent(
        name: 'FOX news',
        source: 'fox-news',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Fox_News_Channel_logo.svg/768px-Fox_News_Channel_logo.svg.png'),
    NewsAgent(
        name: 'The Washington Post ',
        source: 'the-washington-post',
        imageUrl:
            'https://www.washingtonpost.com/resizer/ZT_dWcjiFs6hylsoICXFu5iRwEY=/480x0/arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/BA3LQ27PFVG5RCTQ7P2D2SMBJU.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(Utils.homePageAppBarText),
        ),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(6),
        child: Container(
          height: 900,
          child: ListView(
            children: newsAgent
                .map(
                  (agency) => NewsAgentWidget(agency.imageUrl, agency.name, () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => NewsList(
                            agency.name, API.urlSource = agency.source),
                      ),
                    );
                  }),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
