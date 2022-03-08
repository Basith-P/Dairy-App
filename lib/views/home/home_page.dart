import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:th_diary/config/themes/colors.dart';

import '../../providers/diary_provider.dart';
import '../../config/routes/routes.dart' as route;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DiaryModel> diaries = context.watch<DiaryProvider>().allDiaries;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your entries'),
        centerTitle: true,
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        itemCount: diaries.length,
        itemBuilder: (context, i) => ListTile(
          tileColor: Colors.white.withOpacity(.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(DateFormat('dd.MM.yyyy').format(diaries[i].date)),
          subtitle: Text(
            diaries[i].content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () {
            Navigator.pushNamed(context, route.singleDiaryPage, arguments: i);
          },
          trailing: IconButton(
            icon: Icon(
              Icons.delete_outline_rounded,
              color: primaryTextColor.withOpacity(.5),
            ),
            onPressed: () {
              context.read<DiaryProvider>().deleteDiary(i);
            },
          ),
        ),
        separatorBuilder: (context, i) => const SizedBox(height: 8),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, route.newDiaryPage),
        child: const Icon(Icons.add_rounded),
        backgroundColor: secondaryColor,
      ),
    );
  }
}
