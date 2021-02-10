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
  TextEditingController _textEditingControllerFour;
  TextEditingController _textEditingControllerFive;

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
              SizedBox(height: 48),
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
              SizedBox(height: 48),
              Text('Auto adjusted width with hintText and minWidth'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AutoSizeTextField(
                  controller: _textEditingControllerThree,
                  decoration: InputDecoration(hintText: 'Hint Text'),
                  fullwidth: false,
                  minFontSize: 24,
                  minWidth: 280,
                  style: TextStyle(fontSize: 64),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 48),

              Text('Auto adjusted width with prefix and suffix text'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AutoSizeTextField(
                  minWidth: 100,
                  controller: _textEditingControllerFour,
                  decoration: InputDecoration(
                    prefixText: '\$',
                    suffixText: '😁',
                  ),
                  fullwidth: false,
                  minFontSize: 24,
                  style: TextStyle(fontSize: 64),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 48),
              Text(
                'multi line text with given constraints',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 200,
                    maxWidth: 300,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.amber),
                  ),
                  child: AutoSizeTextField(
                    controller: _textEditingControllerFive,
                    fullwidth: false,
                    minFontSize: 0,
                    maxLines: null,
                    style: TextStyle(fontSize: 50),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.all(10)
                    ),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    _textEditingControllerFive.clear();
                  },
                  child: Text('clear'))
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
    _textEditingControllerFour = TextEditingController();
    _textEditingControllerFive = TextEditingController();
  }
}




/*
class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingControllerOne;
  TextEditingController _textEditingControllerTwo;
  TextEditingController _textEditingControllerThree;
  TextEditingController _textEditingControllerFour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 48),
            Text(
              'Fixed width (full width of parent\'s BoxConstraints)',
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: 300,
                maxWidth: 300,
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.amber),
              ),
              child: AutoSizeTextField(
                controller: _textEditingControllerOne,
                fullwidth: false,
                autofocus: true,
                minFontSize: 0,
                maxLines: null,
                style: TextStyle(fontSize: 60),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.all(10)
                ),
                keyboardType: TextInputType.multiline,
              ),
            ),
            SizedBox(height: 48),
            TextButton(onPressed: (){_textEditingControllerOne.clear();}, child: Text('clear'))
          ],
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
    _textEditingControllerFour = TextEditingController();
  }
}


 */