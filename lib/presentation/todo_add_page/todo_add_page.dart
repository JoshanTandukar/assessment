import 'dart:convert';

import 'package:assessment/base/database/database.dart';
import 'package:assessment/global/app_color.dart';
import 'package:assessment/l10n/app_localizations.dart';
import 'package:assessment/main.dart';
import 'package:assessment/model/item_model/item.dart';
import 'package:assessment/presentation/common/common.dart';
import 'package:assessment/presentation/common/sizebox_extension.dart';
import 'package:assessment/utils/encryptor.dart';
import 'package:assessment/utils/show_toast_message.dart';
import 'package:auto_route/auto_route.dart';
import 'package:date_field/date_field.dart';
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
    conTitle.text = "Test";
    conContent.text = "Test needs fires";
    conDate.text = DateTime.now().toString();
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
              20.sBHh,
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
              20.sBHh,
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
              20.sBHh,
              DateTimeFormField(
                initialValue: DateTime.parse(conDate.text),
                padding: EdgeInsets.zero,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColor.neutral950,
                    ),
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).yourTodoTime,
                  labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColor.neutral600,
                      ),
                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColor.neutral500,
                      ),
                  errorStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColor.error400,
                      ),
                ),
                firstDate: DateTime.now().add(
                  const Duration(days: 10),
                ),
                lastDate: DateTime.now().add(
                  const Duration(days: 40),
                ),
                initialPickerDateTime: DateTime.now().add(
                  const Duration(days: 20),
                ),
                onChanged: (DateTime? value) {
                  conDate.text = value.toString();
                },
                validator: (value) {
                  if (value != null) {
                    return null;
                  }
                  return AppLocalizations.of(context).validationTodoTime;
                },
              ),
              30.sBHh,
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
    Item data = Item(
      id: getUuid(),
      title: conTitle.text,
      content: conContent.text,
      dateTime: DateTime.parse(conDate.text),
    );
    String encrypted = aesEncrypt(jsonEncode(data));
    try {
      await database.into(database.todoItems).insert(
            TodoItemsCompanion.insert(
              data: encrypted,
            ),
          );
      ref.context.router.popUntilRoot();
    } catch (e) {
      showToastMessage(e.toString());
    }
  }
}
