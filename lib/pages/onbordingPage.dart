import 'package:flutter/material.dart';
import 'package:netflixpro/pages/onbording.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({super.key, required this.title});
  final String title;

  @override
  State<OnbordingPage> createState() => OnbordingPageState();
}

class OnbordingPageState extends State<OnbordingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        leading: Image.asset(
            "assets/images/symbol.png",
          height: 150,
        ),
        actions: [
          TextButton(
              onPressed: (){}, 
              child: Text(
                  "PRIVACY",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
              )
          ),
          TextButton(
              onPressed: (){}, 
              child: Text(
                  "SIGNIN",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              )
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index){
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              Onbording(
                  title: "Bienvenue dans votre univers de divertissement",
                  subtitle: "Découvrez des films, séries et bien plus encore. Sans interruption, sans limites.",
                  image: "assets/images/1.jpg"
              ),
              Onbording(
                  title: "Prêt à découvrir ce que vous aimez ?",
                  subtitle: " Sélectionnez vos genres favoris pour une expérience unique, adaptée à vos goûts",
                  image: "assets/images/2.jpg"
              ),
              Onbording(
                  title: "Plus vous regardez, mieux on vous recommande",
                  subtitle: " Chaque clic nous aide à mieux vous servir. Vos préférences sont notre priorité",
                  image: "assets/images/3.jpg"
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: List.generate(
                      3,
                          (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 10,
                        width: _currentPage == index? 20:10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: _currentPage == index? Colors.red:Colors.grey
                        ),
                      )
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          Navigator.pushNamed(
                              context,
                              'signin'
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)
                        )
                      ),
                      child: Text("Get Started")
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}