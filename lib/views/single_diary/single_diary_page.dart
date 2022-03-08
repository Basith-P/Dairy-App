import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/diary_provider.dart';

class SingleDiaryPage extends StatelessWidget {
  const SingleDiaryPage(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    final currentDiary = context.read<DiaryProvider>().diaryById(int.parse(id));
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                DateFormat('EEEE').format(currentDiary.date),
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 8),
              Text(
                DateFormat('dd MMMM yyyy').format(currentDiary.date),
                style: const TextStyle(fontSize: 22),
              ),
              const Divider(height: 32),
              Text(
                currentDiary.content,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
