import 'package:flutter/material.dart';
import 'package:flutter_application_2/map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String toList() {
    final questionAnswers = MyMapp();
    // String answers = questionAnswers.myMap[0]["question"].toString();
    List<String> list1 = questionAnswers.myMap[0]["answers"] as List<String>;

    String list3 = "";
    for (var i in list1) {
      list3 += i + ", ";
    }
    return list3;
  }

  @override
  Widget build(BuildContext context) {
    final questionAnswers = MyMapp();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${questionAnswers.myMap[0]["question"]}"),
            Text(
              "${toList()}",
              style: Theme.of(context).textTheme.headline4,
            ),
            ...(questionAnswers.myMap[0]['answers'] as List<String>)
                .map((ans) {
              return Text( ans);
            }).toList()
          ],
        ),
      ),
    );
  }
}
