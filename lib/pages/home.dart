import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget body;
    if (currentIndex == 0) {
      body = const FirstPage();
    } else {
      body = const SecondPage();
    }
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (newIndex) {
              currentIndex = newIndex;
              setState(() {});
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", backgroundColor: Colors.green),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings", backgroundColor: Colors.yellow),
            ]),
        appBar: AppBar(title: const Text('Home Work 8')),
        body: SafeArea(child: body));
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(children: [
        Container(
          color: Colors.red,
          child: const Text("First Page"),
        )
      ]),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(children: [
        Container(
          color: Colors.red,
          child: const Text("Second Page"),
        )
      ]),
    );
  }
}
