import 'package:flutter/material.dart';
import 'package:netflixpro/services/firebase/auth.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final  usercurrent = Auth().currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      Auth().deconnexion();
                    });
                  },
                  child: Text("deconnexion")
              )
            ],
          ),
        )
      ),
    );
  }
}
