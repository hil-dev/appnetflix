import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:netflixpro/firebase_options.dart';
import 'package:netflixpro/pages/homepage.dart';
import 'package:netflixpro/pages/loading.dart';
import 'package:netflixpro/pages/connexion.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=> const MyloadingPage(title: "Loaging page"),
        'signin':(context)=> SignInPage()
      },
    );
  }
}
