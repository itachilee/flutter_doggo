import 'package:f1/dog_list.dart';
import 'package:flutter/material.dart';

import 'dog_card.dart';
import 'dog_model.dart';
import 'new_dog_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// MaterialApp is the base Widget for your Flutter Application
    /// Gives us access to routing, context, and meta info functionality.
    return MaterialApp(
      title: 'We Rate Dogs',
      // Make all our text default to white
      // and backgrounds default to dark
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(title: 'We Rate Dogs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initialDoggos = [
    Dog('Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'),
    Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999'),
    Dog('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.'),
    Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'),
    Dog('Buddy', 'North Pole, Earth', 'Self proclaimed human lover.')
  ];

  Future _showNewDogForm() async {
    // push a new route like you did in the last section
    Dog? newDog = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const AddDogFormPage();
        },
      ),
    );

    if (null != newDog) {
      setState(() => initialDoggos.add(newDog));
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Scaffold is the base for a page.
    /// It gives an AppBar for the top,
    /// Space for the main body, bottom navigation, and more.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black87,
        // This is how you add new buttons to the top right of a material appBar.
        // You can add as many as you'd like.
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showNewDogForm,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Color(0xFF283593),
              Color(0xFF303F9F),
              Color(0xFF3949AB),
              Color(0xFF5C6BC0),
            ],
          ),
        ),
        child: DogList(initialDoggos), // New code
      ),
    );
  }
}
