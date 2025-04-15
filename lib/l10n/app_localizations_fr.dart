// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Assessment';

  @override
  String get yourTodoTitle => 'Your todo title goes here';

  @override
  String get yourTodoContent => 'Your todo content goes here';

  @override
  String get yourTodoTime => 'Your todo time goes here';

  @override
  String get validationTodoContent => 'Todo content must not be empty.';

  @override
  String get validationTodoTitle => 'Todo title must not be empty.';

  @override
  String get validationTodoTime => 'Todo time must not be empty';

  @override
  String get validationTodoTimeFuture => 'Todo time must not be in future.';

  @override
  String get addTodo => 'Add Todo';
}
