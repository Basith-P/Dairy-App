import 'package:flutter/cupertino.dart';

class DiaryModel {
  final String id = DateTime.now().toString().trim();
  final DateTime date;
  final String content;

  DiaryModel({required this.date, required this.content});
}

class DiaryProvider with ChangeNotifier {
  final List<DiaryModel> _diaries = [
    DiaryModel(
      date: DateTime.now(),
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    DiaryModel(
      date: DateTime.now(),
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
  ];

  List<DiaryModel> get allDiaries => [..._diaries];

  void addDiary(DiaryModel diary) {
    _diaries.add(diary);
    notifyListeners();
  }
}
