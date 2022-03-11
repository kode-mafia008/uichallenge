import 'package:fluro/fluro.dart';
import 'package:uichallenge/src/screens/ui_challenge/hidden_menu_animation/hidden_menu_animation.dart';
import 'package:uichallenge/src/screens/widgets/custom_dropdown.dart';
import '../screens/pages/landing_page.dart';
import '../screens/splash_screen.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static final Handler _splashHandler = Handler(
      handlerFunc: ((context, Map<String, dynamic> params) =>
          const SplashScreen()));
  static final Handler _customDropDownHandler = Handler(
      handlerFunc: ((context, Map<String, dynamic> params) =>
          const CustomDropDownScreen(
            text: 'Call to Action',
          )));

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
  static final Handler _hiddenMenuAnimation = Handler(
      handlerFunc: ((context, Map<String, dynamic> params) =>
          const HiddenMenuAnimationScreen()));

  static void setupRouter() {
    router.define(
      '/',
      handler: _splashHandler,
    );
    router.define(
      '/dropdown',
      handler: _customDropDownHandler,
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
    router.define(
      '/main/2',
      handler: _mainHandler2,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/hidden-menu',
      handler: _hiddenMenuAnimation,
      transitionType: TransitionType.fadeIn,
    );
  }
}
