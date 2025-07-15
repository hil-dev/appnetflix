

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixpro/pages/homepage.dart';
import 'package:netflixpro/pages/onbordingPage.dart';
import 'package:netflixpro/services/firebase/auth.dart';

class RedirectionPage extends StatefulWidget{
  const RedirectionPage({super.key});

  @override
  State<RedirectionPage> createState() {
    return RedirectionPageState();
  }
}

class RedirectionPageState extends State<RedirectionPage>{

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authChangesState,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          else if(snapshot.hasData){
            return const MyHomePage(title: "Home Page");
          }
          else{
            return const OnbordingPage(title: "Netflix");
          }
        }
    );
  }
}