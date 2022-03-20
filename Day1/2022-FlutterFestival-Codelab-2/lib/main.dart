import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), title: 'Navigator'));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

final _saved = <WordPair>{};

class _MyAppState extends State<MyApp> {
  final _suggestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Startup Name Generator',
      home: Scaffold(
        //상단바---------------------------------------
        appBar: AppBar(
          title: Text('Startup Name Generator'),
          actions: [
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => SavedSuggestion())));
              },
            )
          ],
        ),
        //표시될 리스트-------------------------------------
        body: ListView.builder(
          itemBuilder: (context, i) {
            if (i >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }

            final alreadySaved = _saved.contains(_suggestions[i]);

            return ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (i == 0) SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        _suggestions[i].asPascalCase,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 20,
                        child: IconButton(
                          splashRadius: 30,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              if (alreadySaved) {
                                _saved.remove(_suggestions[i]);
                              } else {
                                _saved.add(_suggestions[i]);
                              }
                            });
                          },
                          icon: alreadySaved
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border),
                          color: alreadySaved ? Colors.red : null,
                        ),
                      ),
                    ],
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

class SavedSuggestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Suggestions"),
      ),
      body: ListView(
        children: [
          for (int i = 0; i < _saved.length; i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (i == 0) SizedBox(height: 20),
                Text(
                  _saved.elementAt(i).asPascalCase,
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 10),
                Divider(height: 30),
              ],
            ),
        ],
      ),
    );
  }
}
