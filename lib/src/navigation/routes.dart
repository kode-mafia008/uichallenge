import 'package:fluro/fluro.dart';
import '../screens/landing_page.dart';
import '../screens/splash_screen.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static final Handler _splashHandler = Handler(
      handlerFunc: ((context, Map<String, dynamic> params) =>
          const SplashScreen()));

  static final Handler _mainHandler = Handler(
      handlerFunc: ((context, Map<String, dynamic> params) => LandingPage(
            page: params['name'][0],
            extras: params['name'][0],
          )));
  static final Handler _mainHandler2 = Handler(
      handlerFunc: ((context, Map<String, dynamic> params) => LandingPage(
            page: params['name'][0],
            extras: params['name'][0],
          )));

  static void setupRouter() {
    router.define(
      '/',
      handler: _splashHandler,
    );
    router.define(
      '/main/:name',
      handler: _mainHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/main/:name/:extra',
      handler: _mainHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
