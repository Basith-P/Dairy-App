import 'package:flutter/cupertino.dart';

class DiaryModel {
  final String id = DateTime.now().toString().trim();
  final DateTime date;
  final String content;
  final String userEmail;

  DiaryModel({required this.userEmail, required this.date, required this.content});
}

class DiaryProvider with ChangeNotifier {
  final List<DiaryModel> _diaries = [];

  List<DiaryModel> get allDiaries => [..._diaries];

  List<DiaryModel> diaryByUser(String userEmail) {
    return _diaries.where((diary) => diary.userEmail == userEmail).toList();
  }

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
