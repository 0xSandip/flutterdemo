import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'next_page.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final myController = TextEditingController();
  String text = "";

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        children: [
          TextField(
            controller: myController,
            onChanged: (value) {
              setState(() {
                text = value;
              });
            },
          ),
          Container(
            child: Text(text),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  text = myController.text;
                });
              },
              child: const Text('Click me')),
          Center(
            child: ElevatedButton(
              child: const Text('Popup'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Title'),
                          content: TextField(
                            controller: myController,
                            autofocus: true,
                            decoration:
                                InputDecoration(hintText: 'Enter your text'),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    text = myController.text;
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Submit")),
                          ],
                        ));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NextPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
