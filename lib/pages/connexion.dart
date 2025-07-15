import 'package:flutter/material.dart';
import 'package:netflixpro/services/firebase/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget{
  const SignInPage({super.key});
  
  @override
  State<SignInPage> createState() {
    return SignInPageState();
  }
}

class SignInPageState extends State<SignInPage>{
  final _formkey = GlobalKey<FormState>();
  final _email_Controller = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;
  bool ischeckbox = false;
  bool isobscure = true;
  bool circular = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Image.asset(
            "assets/images/logo.png",
          width: 100,
          height: 100,
        ),
        actions: [
          TextButton(
              onPressed: (){},
              child: Text(
                  "help",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              )
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(

          key: _formkey,
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.only(top: 40)),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(

                    "Connexion",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _email_Controller,
                  decoration: InputDecoration(

                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    )
                      ,
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.white
                    ),
                    hintText: "Entrez votre email",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Email is required";
                    }else if(!value.contains("@")){
                      return '@ it is required';
                    }
                    else if(!value.contains(".")){
                      return '. it is required';
                    }
                    else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _passwordController,
                  obscureText: isobscure,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    suffix: IconButton(
                        onPressed: (){
                          setState(() {
                            isobscure = !isobscure;
                          });
                        },
                        icon:isobscure? Icon(Icons.visibility_off, color: Colors.white,):
                        Icon(Icons.visibility, color: Colors.white,)
                    ),
                    labelText: "Mots de passe",
                    labelStyle: TextStyle(
                      color: Colors.white
                    ),
                    hintText: "Entrez votre emeil",
                    hintStyle: TextStyle(
                      color: Colors.white
                    ),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return "Password it is required";
                    }
                    else if (value.length <6){
                      return "Password required min size 6";
                    }
                    else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: circular? null :()async{
                        if(_formkey.currentState!.validate()){
                            setState(() {
                              circular = true;
                            });
                            try{
                              await Auth().loginWithEmailAndPassword(
                                  _email_Controller.text,
                                  _passwordController.text
                              );
                              setState(() {
                                circular = false;
                              });
                            } on FirebaseAuthException catch(e){
                              setState(() {
                                circular = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${e.message}"),
                                  backgroundColor: Colors.red,
                                  showCloseIcon: true,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );

                            }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[800],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.only(top: 15,bottom: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: circular? const CircularProgressIndicator():const Text("Se connecter")
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.grey[800],
                              value: ischeckbox,
                              onChanged: (bool? newvalue){
                                setState(() {
                                  ischeckbox = newvalue!;
                                });
                              }
                          ),
                          Text(
                              "Remenber me",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),
                          )
                        ],
                      )
                    ),
                    SizedBox(width: 105,),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                          "Need help",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 120,),
                Row(
                  children: [
                    Text(
                      "New to netflix?",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 20
                      ),
                    ),
                    SizedBox(width: 0,),
                    TextButton(
                        onPressed: (){}, 
                        child: Text(
                            "Sign Up now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        )
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  "This page is protected by Google reCAPTACHA to ensure you're not a bot",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}