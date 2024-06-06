import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes_clean/features/quote/presentaion/screens/quote_scr.dart';
import 'package:quotes_clean/features/splash/presentation/screens/splash_scr.dart';

abstract class AppRoute{
  static const KHome='/homeView';
  static final GoRouter router=GoRouter(
    routes: <RouteBase>
      [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return  SplashScr();
          },

        ),
       GoRoute(
          path: AppRoute.KHome,
          builder: (BuildContext context, GoRouterState state) {
            return QuoteScreen();
  }
       )


    ]
  );
}
