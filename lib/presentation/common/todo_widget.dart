import 'dart:convert';

import 'package:assessment/base/database/database.dart';
import 'package:assessment/global/app_color.dart';
import 'package:assessment/model/item_model/item.dart';
import 'package:assessment/utils/encryptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoWidget extends StatelessWidget {
  final TodoItem result;
  const TodoWidget(
    this.result, {
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    String s = aesDecrypt(result.data);
    Item dump = Item.fromJson(jsonDecode(s));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          child: Column(
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
                "${DateTime.fromMillisecondsSinceEpoch(dump.dateTime)}",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColor.neutral900,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
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
