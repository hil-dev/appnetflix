import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'package:netflixpro/pages/onbordingPage.dart';
import 'package:netflixpro/pages/redirectionPage.dart';
class MyloadingPage extends StatefulWidget {
  const MyloadingPage({super.key, required this.title});
  final String title;

  @override
  State<MyloadingPage> createState() => MyloadingPageState();
}

class MyloadingPageState extends State<MyloadingPage> {
  @override
  //gestion du widget MyloadingPage lors de sont arrivés dans l'abre des widget
  void initState(){
    super.initState();
    onloading();
  }
  
  Future<Timer> onloading()async{
    return Timer(const Duration(seconds: 5), onloaded);
  }
  
  onloaded(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const RedirectionPage()));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset("assets/lotties/netflix.json"),
      ),
    );
  }
}
