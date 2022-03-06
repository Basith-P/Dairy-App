import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your entries'),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        itemCount: 20,
        itemBuilder: (context, i) => ListTile(
          title: Text('Entry ${i + 1}'),
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
