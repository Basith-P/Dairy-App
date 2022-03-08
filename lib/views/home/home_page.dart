import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/diary_provider.dart';

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
          title: Text(diaries[i].date.toString()),
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
        onPressed: () {},
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
