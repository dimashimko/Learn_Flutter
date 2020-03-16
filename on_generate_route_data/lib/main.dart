import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FirstHome(),
    onGenerateRoute: (settings) {
      switch(settings.name) {
        case '/':
        return MaterialPageRoute(builder: (context) => FirstHome());
        break;
        case '/second':
        User user = settings.arguments;
        return  MaterialPageRoute(builder: (context) => SecondHome(user: user));
        break;
      }
    },
  ));
}

class FirstHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Home'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {},
          child: Text('Second Home'),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          User user = User(name: 'Konstantin', age: 34);
          Route route = MaterialPageRoute(builder: (context) => SecondHome(user: user));
          Navigator.push(context, route);
        },
        child: Text('Move to Page 2'),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  final User user;
  SecondHome({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.user.name} - ${this.user.age}'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  User({this.name, this.age});
}
