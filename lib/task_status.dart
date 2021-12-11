import 'package:flutter/material.dart';
import 'pendingTask.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'ongoingTask.dart';
import 'completedTask.dart';

class taskStatus extends StatefulWidget {
  const taskStatus({Key? key}) : super(key: key);

  @override
  _taskStatusState createState() => _taskStatusState();
}

class _taskStatusState extends State<taskStatus> {
  final _auth = FirebaseAuth.instance;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task Status',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.blueGrey,
            child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => pendingTask()));
              },
              child: Text(
                'Pending Task',
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.blueGrey,
            child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ongoingTask()));
              },
              child: Text(
                'Ongoing Task',
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.blueGrey,
            child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => completedTask()));
              },
              child: Text(
                'Completed Task',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
