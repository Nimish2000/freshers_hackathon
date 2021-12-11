import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'task_status.dart';
import 'registrationScreen.dart';
import 'loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'budgetTracker.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  _welcomeScreenState createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  var loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    loggedInUser = _auth.currentUser?.email;
  }

  @override
  final _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Freshers Admin'),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hi , ' + loggedInUser,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Lets,Get Started there is lot do!',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Image.asset('Assets/party.jpg'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 200.0,
              child: Image.asset('Assets/register.jpeg'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Lets make un-forgottable moment to turn back and say we have done it!!',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            FlatButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => taskStatus()));
              },
              child: Text(
                'Tap Here !! to get Started with task to make freshers awesome!',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Column(
                children: [
                  Text(
                    'Fresher 2k??',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 50.0,
                    child: Text(
                      'Start!!',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Task'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => taskStatus()));
              },
            ),
            ListTile(
              title: const Text('Budget Tracker'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => budgetTracker()));
              },
            ),
            ListTile(
              title: const Text('Event Management'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Participant Details'),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          _auth.signOut();
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.logout,
          color: Colors.black,
          semanticLabel: 'LogOut',
        ),
        tooltip: 'LogOut',
      ),
    );
  }
}
