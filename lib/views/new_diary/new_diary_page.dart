import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../config/themes/colors.dart';
import '../../providers/diary_provider.dart';

class NewDiaryPage extends StatelessWidget {
  final String userEmail;

  const NewDiaryPage(this.userEmail, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String content = "";

    final dateTime = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Diary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              DateFormat('EEEE').format(dateTime),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              DateFormat('dd MMMM yyyy').format(dateTime),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 99999,
                scrollPadding: const EdgeInsets.all(20.0),
                decoration: InputDecoration(
                  hintText: 'What\'s on your mind...?',
                  filled: true,
                  fillColor: primaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  content = value;
                },
              ),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                if (content != "") {
                  final newDiary =
                      DiaryModel(content: content, date: dateTime, userEmail: userEmail);
                  context.read<DiaryProvider>().addDiary(newDiary);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Diary added'),
                    ),
                  );
                }
              },
              style: const ButtonStyle().copyWith(
                backgroundColor: MaterialStateProperty.all<Color>(secondaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
