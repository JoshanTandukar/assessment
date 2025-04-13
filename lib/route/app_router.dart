import 'package:assessment/route/app_router.gr.dart';
import 'package:assessment/route/app_router_path.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage(name: 'EmptyRouter')
class EmptyRouterPage extends AutoRouter {
  const EmptyRouterPage({super.key});
}

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: MainRoute.page,
          path: AppRouterPath.mainPage,
        ),
        AutoRoute(
          page: TodoAddRoute.page,
          path: AppRouterPath.todoAddPage,
        ),
      ];
}
