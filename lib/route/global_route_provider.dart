import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assessment/route/app_router.dart';

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});
