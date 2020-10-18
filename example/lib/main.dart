import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Size TextField Example',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Auto Size TextField Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingControllerOne;
  TextEditingController _textEditingControllerTwo;
  TextEditingController _textEditingControllerThree;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Fixed width (full width of parent\'s BoxConstraints)',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AutoSizeTextField(
                  controller: _textEditingControllerOne,
                  minFontSize: 24,
                  style: TextStyle(fontSize: 64),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              Text(
                'Auto adjusted width based on contents',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AutoSizeTextField(
                  textAlign: TextAlign.center,
                  fullwidth: false,
                  controller: _textEditingControllerTwo,
                  minFontSize: 24,
                  style: TextStyle(fontSize: 64),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              Text('Auto adjusted width with hintText and minWidth'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AutoSizeTextField(
                  controller: _textEditingControllerThree,
                  decoration: InputDecoration(
                    hintText: 'Hint Text'
                  ),
                  fullwidth: false,
                  minFontSize: 24,
                  minWidth: 280,
                  style: TextStyle(fontSize: 64),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formattig nicer for build methods.
    );
  }

  @override
  void initState() {
    super.initState();

    _textEditingControllerOne = TextEditingController();
    _textEditingControllerTwo = TextEditingController();
    _textEditingControllerThree = TextEditingController();
  }
}
