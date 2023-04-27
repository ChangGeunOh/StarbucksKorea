import 'package:go_router/go_router.dart';
import 'package:starbucks/common/const/database.dart';
import 'package:starbucks/domain/model/item_data.dart';
import 'package:starbucks/presentation/screen/alarm/alarm_screen.dart';
import 'package:starbucks/presentation/screen/food/food_screen.dart';
import 'package:starbucks/presentation/screen/main/main_screen.dart';
import 'package:starbucks/presentation/screen/splash/splash_screen.dart';
import 'package:starbucks/presentation/screen/webview/webview_screen.dart';

final routerConfig = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      name: MainScreen.routeName,
      builder: (_, __) => const MainScreen(),
    ),
    GoRoute(
      path: '/splash',
      name: SplashScreen.routeName,
      builder: (_, __) => const SplashScreen(),
    ),
    GoRoute(
      path: '/webView',
      name: WebViewScreen.routeName,
      builder: (context, state) {
        final url = state.extra as String;
        return WebViewScreen(url: url);
      },
    ),
    GoRoute(
      path: '/alarm',
      name: AlarmScreen.routeName,
      builder: (context, state) => const AlarmScreen(),
    ),
    GoRoute(
      path: '/food',
      name: FoodScreen.routeName,
      builder: (context, state) {
        final itemData = state.extra == null ? tempFoodItemData : state.extra as ItemData;
        return FoodScreen(itemData: itemData);
      }
    ),
  ],
);
