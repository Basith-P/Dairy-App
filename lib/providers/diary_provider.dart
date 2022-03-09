import 'package:flutter/cupertino.dart';

class DiaryModel {
  final String id = DateTime.now().toString().trim();
  final DateTime date;
  final String content;

  DiaryModel({required this.date, required this.content});
}

class DiaryProvider with ChangeNotifier {
  final List<DiaryModel> _diaries = [];

  List<DiaryModel> get allDiaries => [..._diaries];

  DiaryModel diaryById(int i) => _diaries[i];

  void addDiary(DiaryModel diary) {
    _diaries.add(diary);
    notifyListeners();
  }

  void deleteDiary(int i) {
    _diaries.removeAt(i);
    notifyListeners();
  }
}
