import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:th_diary/config/themes/colors.dart';

class NewDiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Diary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(DateFormat('EEEE').format(dateTime)),
            Text(DateFormat('dd.MM.yyyy').format(dateTime)),
            const SizedBox(height: 16.0),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: primaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
