import 'package:NewskeepyAlpha/pages/featured/featured_view.dart';
import 'package:NewskeepyAlpha/pages/home/home_bloc.dart';
import 'package:NewskeepyAlpha/pages/home/home_streams.dart';
import 'package:NewskeepyAlpha/pages/info/info.dart';
import 'package:NewskeepyAlpha/pages/news/news_view.dart';
import 'package:NewskeepyAlpha/widgets/bottom_navigation.dart';
import 'package:NewskeepyAlpha/widgets/search.dart';
import 'package:bsev/bsev.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Bsev<HomeBloc, HomeStreams>(
      builder: (context, dispatcher, streams) {
        return Scaffold(
          body: Container(
            color: Colors.grey[200],
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: SearchWidget(),
                  ),
                  Expanded(child: _getContent(streams))
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigation((index) {
            streams.tabPosition.set(index);
          }), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }

  Widget _getContent(HomeStreams streams) {
    return StreamListener<int>(
        stream: streams.tabPosition.get,
        builder: (BuildContext context, snapshot) {
          switch (snapshot.data) {
            case 0:
              return FeaturedView();
              break;
            case 1:
              return NewsView();
              break;
            case 2:
              return Info();
            default:
              return Container();
          }
        });
  }
}
