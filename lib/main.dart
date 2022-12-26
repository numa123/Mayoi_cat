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
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(10)),
          Padding(
            padding: const EdgeInsets.all(10),
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
          const Padding(padding: EdgeInsets.only(top: 10)),
          TextButton(
            child: const Text(
              '決めていただく',
              style: TextStyle(color: Colors.blueAccent, fontSize: 18),
            ),
            onPressed: () async {
              var random = math.Random();
              var isOK = random.nextBool();
              String resultValue;
              if (isOK == true) {
                resultValue = inputText;
              } else {
                resultValue = inputText2;
              }
              // ダイアログを表示------------------------------------
              var result = await showDialog<int>(
                barrierColor: Colors.orange.shade100.withOpacity(0.2),
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  if (inputText == '' || inputText2 == '') {
                    return AlertDialog(
                      elevation: 2,
                      content: SizedBox(
                        height: 150,
                        child: Column(
                          children: [
                            const Text('迷っていることを入力してね'),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: SizedBox(
                                width: 85,
                                height: 85,
                                child: Image.asset(
                                  'images/cool.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text(
                            'OK',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                          onPressed: () => Navigator.of(context).pop(1),
                        ),
                      ],
                    );
                    ;
                  } else {
                    return AlertDialog(
                      elevation: 2,
                      title: const Text(
                        '選んでいただいたものは',
                        style: TextStyle(fontSize: 17),
                      ),
                      content: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: SizedBox(
                          height: 170,
                          child: Column(
                            children: [
                              Text(
                                resultValue,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.normal),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset(
                                    'images/cool.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text(
                            'OK',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                          onPressed: () => Navigator.of(context).pop(1),
                        ),
                      ],
                    );
                  }
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: 170,
              height: 170,
              child: Image.asset(
                'images/cool.png',
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}
