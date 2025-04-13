// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:assessment/presentation/main_page/main_page.dart' as _i2;
import 'package:assessment/presentation/todo_add_page/todo_add_page.dart'
    as _i3;
import 'package:assessment/route/app_router.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i4;

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouter extends _i4.PageRouteInfo<void> {
  const EmptyRouter({List<_i4.PageRouteInfo>? children})
      : super(
          EmptyRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.EmptyRouterPage();
    },
  );
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i4.PageRouteInfo<void> {
  const MainRoute({List<_i4.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.MainPage();
    },
  );
}

/// generated route for
/// [_i3.TodoAddPage]
class TodoAddRoute extends _i4.PageRouteInfo<void> {
  const TodoAddRoute({List<_i4.PageRouteInfo>? children})
      : super(
          TodoAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoAddRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.TodoAddPage();
    },
  );
}
