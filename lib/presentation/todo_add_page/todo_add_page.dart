import 'package:assessment/base/database/database.dart';
import 'package:assessment/global/app_color.dart';
import 'package:assessment/l10n/app_localizations.dart';
import 'package:assessment/main.dart';
import 'package:assessment/presentation/common/common.dart';
import 'package:assessment/presentation/common/sizebox_extension.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class TodoAddPage extends ConsumerStatefulWidget {
  const TodoAddPage({super.key});

  @override
  TodoAddPageState createState() => TodoAddPageState();
}

class TodoAddPageState extends ConsumerState<TodoAddPage> {
  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController conContent = TextEditingController();
  TextEditingController conTitle = TextEditingController();
  TextEditingController conDate = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.bgColor,
        title: Text(
          AppLocalizations.of(context).addTodo,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColor.neutral900,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      body: Container(
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
              BeautifiedAppTextField(
                hintText: AppLocalizations.of(context).yourTodoTitle,
                controller: conTitle,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context).validationTodoTitle;
                  }
                  return null;
                },
              ),
              BeautifiedAppTextField(
                hintText: AppLocalizations.of(context).yourTodoContent,
                controller: conContent,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context).validationTodoContent;
                  }
                  return null;
                },
              ),
              BeautifiedAppTextField(
                hintText: AppLocalizations.of(context).yourTodoTime,
                controller: conDate,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context).validationTodoTitle;
                  }
                  return null;
                },
              ),
              20.sBHh,
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: AppColor.primary400,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: AppColor.primary400,
                      width: 1.r,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                  ),
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState?.save();
                    addToDatabase();
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        AppLocalizations.of(context).addTodo,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppColor.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addToDatabase() async {
    await database.into(database.todoItems).insert(
          TodoItemsCompanion.insert(
            title: conTitle.text,
            content: conContent.text,
            createdAt: DateTime.now(),
          ),
        );
    ref.context.router.popUntilRoot();
  }
}
