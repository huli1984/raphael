import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vec;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Raphael - La Musica Mi Ha Salvato'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  bool selector =  false;

  Future<void> _startAnimation() async {
    Future.delayed(Duration(milliseconds: 50), () {
      setState(() {
        selector = true;
      });
    });
  }

  @override
  void initState() {
    _startAnimation();
    selector = false;
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1500),
          width: selector ? width*6/7 : width*9/14,
          height: selector ? height*6/7 : height*9/14,
          transform: selector ? Matrix4.translation(vec.Vector3(0.0, 0.0, 0.0)) : Matrix4.translation(vec.Vector3(0.0,30.0, 0.0)),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/cover_libro.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [AnimatedContainer(
              duration: Duration(milliseconds: 1500),
              width: selector ? width*6/7 : width,
              height: selector ? height*6/7 : height,
              transform: selector ? Matrix4.translation(vec.Vector3(0.0, 0.0, 0.0)) : Matrix4.translation(vec.Vector3(0.0,-70.0, 0.0)),
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Raffaele_cover.png"),
                    fit: BoxFit.cover,
                  )
              ),
            ),],
          ),
        ),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
