import 'package:flutter/material.dart';
import 'package:hive_todo_app/screens/json.dart';
import 'package:hive_todo_app/screens/location.dart';
import 'package:hive_todo_app/screens/qr_scanner.dart';
import 'package:hive_todo_app/screens/todo.dart';
import 'camera.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            color: Colors.white30,
            child: ListTile(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => const Camera(),
                ));
              },
              leading: Text("1"),
              title: Text("Camera"),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          Card(
            color: Colors.white30,
            child: ListTile(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => const QRSCANNER(),
                ));
              },
              leading: Text("2"),
              title: Text("QR Scanner"),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          Card(
            color: Colors.white30,
            child: ListTile(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) =>  LocationScreen(),
                ));
              },
              leading: Text("3"),
              title: Text("Location"),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          Card(
            color: Colors.white30,
            child: ListTile(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => const ToDo(),
                ));
              },
              leading: Text("4"),
              title: Text("Todo"),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          Card(
            color: Colors.white30,
            child: ListTile(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => const JsonParser(),
                ));
              },
              leading: Text("5"),
              title: Text("JSON"),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
        ],
      )
    );
  }
}
