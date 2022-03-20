import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _suggestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Startup Name Generator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Startup Name Generator'),
        ),
        body: ListView.builder(
          itemBuilder: (context, i) {
            if (i >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }

            return ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (i == 0) SizedBox(height: 20),
                  Text(
                    _suggestions[i].asPascalCase,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 30,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
