import 'package:NewskeepyAlpha/pages/home/home_streams.dart';
import 'package:bsev/bsev.dart';

class HomeBloc extends BlocBase<HomeStreams> {
  HomeBloc() {
    streams = HomeStreams();
  }

  @override
  void eventReceiver(EventsBase event) {
    // TODO: implement eventReceiver
  }

  @override
  void initView() {
    // TODO: implement initView
  }
}
