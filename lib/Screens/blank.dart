import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isHovering = false; // Define the _isHovering variable here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Center(
        child: Text('Hello, world!'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            InkWell(
              onTap: () {},
              onHover: (hovering) {
                setState(() {
                  // Change the value of _isHovering when the user hovers over the list tile
                  _isHovering = hovering;
                });
              },
              child: ListTile(
                title: Text('List item 1'),
                // Change the color of the list tile based on the value of _isHovering
                tileColor: _isHovering ? Colors.blue : Colors.white,
              ),
            ),
            InkWell(
              onTap: () {},
              onHover: (hovering) {
                setState(() {
                  // Change the value of _isHovering when the user hovers over the list tile
                  _isHovering = hovering;
                });
              },
              child: ListTile(
                title: Text('List item 2'),
                // Change the color of the list tile based on the value of _isHovering
                tileColor: _isHovering ? Colors.blue : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
