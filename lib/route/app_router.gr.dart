// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

import 'package:assessment/presentation/main_page/main_page.dart' as _i2;
import 'package:assessment/route/app_router.dart' as _i1;
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouter extends _i3.PageRouteInfo<void> {
  const EmptyRouter({List<_i3.PageRouteInfo>? children})
      : super(EmptyRouter.name, initialChildren: children);

  static const String name = 'EmptyRouter';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.EmptyRouterPage();
    },
  );
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i3.PageRouteInfo<void> {
  const MainRoute({List<_i3.PageRouteInfo>? children})
      : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.MainPage();
    },
  );
}
