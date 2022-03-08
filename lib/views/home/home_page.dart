import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../providers/diary_provider.dart';
import '../../config/routes/routes.dart' as route;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DiaryModel> diaries = context.read<DiaryProvider>().allDiaries;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your entries'),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        itemCount: diaries.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(DateFormat('dd.MM.yyyy').format(diaries[i].date)),
          subtitle: Text(
            diaries[i].content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () {
            Navigator.pushNamed(context, '/entry', arguments: i);
          },
        ),
        separatorBuilder: (BuildContext context, int index) => const Divider(height: 5),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, route.newDiaryPage),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
