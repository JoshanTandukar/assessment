import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assessment/global/app_color.dart';
import 'package:assessment/l10n/app_localizations.dart';

@RoutePage()
class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.bgColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColor.neutral900,
            size: 20.r,
          ),
          onPressed: () {
            context.router.maybePop();
          },
        ),
        title: Text(
          AppLocalizations.of(context).appName,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColor.neutral900,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      body: Center(
        child: Text(
          AppLocalizations.of(context).appName,
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: AppColor.neutral900),
        ),
      ),
    );
  }
}
