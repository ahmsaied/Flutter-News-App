import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../UI/widget/app_drawer.dart';
import '../../UI/widget/news_item.dart';
import '../../bloc/news_list_bloc.dart';
import '../../model/article_model.dart';
import '../../network/API.dart';

class NewsList extends StatefulWidget {
  static const String ROUTE_NAME = 'news-list';
  final String newsAgencyName, source;
  NewsList(this.newsAgencyName, this.source);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
//  Future<Article> futureNewsList;
//
//  @override
//  void didChangeDependencies() {
//    super.didChangeDependencies();
//    //  API.urlSource = widget.source;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.newsAgencyName),
        ),
      ),
      drawer: AppDrawer(),
      body: BlocProvider(
          create: (context) => NewsListBloc(NewsInitialState(), API()),
          child: BuildNews()),
    );
  }
}

class BuildNews extends StatefulWidget {
  const BuildNews({
    Key key,
  }) : super(key: key);

  @override
  _BuildNewsState createState() => _BuildNewsState();
}

class _BuildNewsState extends State<BuildNews> {
  NewsListBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<NewsListBloc>(context);
    bloc.add(FetchNewsEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  Future<List<Article>> refresh() async {
    var response;
    setState(() {
      response = API.getAllNews();
    });
    print(response);
    return await response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: API.getAllNews(),
      builder: (context, snapshot) {
        // print(snapshot.data);
        if (snapshot.hasData) {
          // print(snapshot.data);
          return RefreshIndicator(
            onRefresh: refresh,
            child: BlocBuilder<NewsListBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsInitialState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is NewsLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is NewsFetchedSuccessState) {
                  return ListView.builder(
                    itemCount: state.news.length,
                    // itemCount: snapshot.data.length,
                    itemBuilder: (ctx, index) => NewsItem(
                      title: state.news[index].title,
                      description: state.news[index].description,
                      publishedAt: state.news[index].publishedAt,
                      urlToImage: state.news[index].urlToImage,
                      url: state.news[index].url,
//                      title: snapshot.data[index].title,
//                      description: snapshot.data[index].description,
//                      publishedAt: snapshot.data[index].publishedAt,
//                      urlToImage: snapshot.data[index].urlToImage,
                    ),
                  );
                } else if (state is NewsErrorState) {
                  return ErrorWidget(state.message.toString());
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
