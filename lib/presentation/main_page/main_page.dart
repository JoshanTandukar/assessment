import 'dart:async';
import 'dart:convert';

import 'package:assessment/base/database/database.dart';
import 'package:assessment/global/app_color.dart';
import 'package:assessment/l10n/app_localizations.dart';
import 'package:assessment/main.dart';
import 'package:assessment/model/item_model/item.dart';
import 'package:assessment/route/app_router.gr.dart';
import 'package:assessment/utils/encryptor.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

@RoutePage()
class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends ConsumerState<MainPage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final todoProvider = StateProvider<List<TodoItem>>((ref) => []);

  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;

  Future<void> _refresh() async {
    fetchData();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    List<TodoItem> result = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.bgColor,
        title: Text(
          AppLocalizations.of(context).appName,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColor.neutral900,
                fontWeight: FontWeight.w700,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.context.router.push(TodoAddRoute()).then((onValue) {
                fetchData();
              });
            },
            icon: Icon(
              Icons.add,
              size: 20.r,
              color: AppColor.neutral900,
            ),
          ),
        ],
      ),
      body: SwipeRefresh.cupertino(
        stateStream: _stream,
        onRefresh: _refresh,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  result.isNotEmpty
                      ? ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: result.length,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return _buildTodoList(
                              result[index],
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            AppLocalizations.of(context).appName,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: AppColor.neutral900,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void fetchData() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(todoProvider.notifier).state =
          await database.select(database.todoItems).get();
      _controller.sink.add(SwipeRefreshState.hidden);
      ref.read(todoProvider.notifier).state.forEach((action) {
        print(action);
      });
    });
  }

  Widget _buildTodoList(TodoItem result) {
    String s = aesDecrypt(result.data);
    Item dump = Item.fromJson(jsonDecode(s));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          dump.title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColor.neutral900,
                fontWeight: FontWeight.w700,
              ),
        ),
        Text(
          dump.content,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColor.neutral900,
                fontWeight: FontWeight.w700,
              ),
        ),
        Text(
          "${dump.dateTime}",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColor.neutral900,
                fontWeight: FontWeight.w700,
              ),
        ),
        Divider(
          color: AppColor.neutral200,
          height: 2.h,
        )
      ],
    );
  }
}
