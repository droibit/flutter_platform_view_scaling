import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Platform view scaling',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _scale = 1;

  @override
  Widget build(BuildContext context) {
    final webviewHeight = MediaQuery.of(context).size.height * 0.75;
    return Scaffold(
      appBar: AppBar(
        title: Text('Platform view scaling'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: webviewHeight,
            child: Transform.scale(
              scale: _scale,
              child: WebView(
                initialUrl: 'https://flutter.dev',
              ),
            ),
          ),
          Slider(
            min: 0.1,
            max: 1,
            value: _scale,
            onChanged: (value) {
              setState(() {
                debugPrint('progress: $value');
                _scale = value;
              });
            },
          )
        ],
      ),
    );
  }
}
