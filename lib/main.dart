import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String inputText = '';
  String inputText2 = '';
  String inputText3 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        shape: const Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(10)),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '1つ目',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
                maxLength: 20,
                onChanged: (text) {
                  setState(() {
                    inputText = text;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '2つ目',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
                maxLength: 20,
                onChanged: (text) {
                  setState(() {
                    inputText2 = text;
                  });
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            TextButton(
              child: const Text(
                '決めていただく',
                style: TextStyle(color: Colors.blueAccent, fontSize: 18),
              ),
              onPressed: () async {
                var random = math.Random();
                var isOK = random.nextBool();
                var resultValue;
                if (isOK == true) {
                  resultValue = inputText;
                } else {
                  resultValue = inputText2;
                }
                // ダイアログを表示------------------------------------
                var result = await showDialog<int>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        '選んでいただいたものは',
                        style: TextStyle(fontSize: 16),
                      ),
                      content: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Container(
                          height: 170,
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  '$resultValue',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset(
                                    'images/black-cat.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        // TextButton(
                        //   child: const Text('閉じる', style: TextStyle(color: Colors.blueAccent),),
                        //   onPressed: () => Navigator.of(context).pop(0),
                        // ),
                        TextButton(
                          child: const Text(
                            'OK',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                          onPressed: () => Navigator.of(context).pop(1),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                width: 170,
                height: 170,
                child: Image.asset(
                  'images/black-cat.png',
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
