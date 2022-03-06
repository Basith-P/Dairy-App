import 'package:flutter/cupertino.dart';

class DiaryModel {
  final String id;
  final DateTime date;
  final String text;

  DiaryModel({required this.id, required this.date, required this.text});
}

class Diary with ChangeNotifier {
  final List<DiaryModel> _diary = [
    DiaryModel(
      id: '1',
      date: DateTime.now(),
      text: '첫 번째 일기입니다.',
    ),
    DiaryModel(
      id: '2',
      date: DateTime.now(),
      text: '두 번째 일기입니다.',
    ),
  ];
}
