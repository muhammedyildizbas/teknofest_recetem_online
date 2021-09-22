import "package:flutter/material.dart";
import 'package:login_register/Screens/doktorScreen/doktorLogin.dart';
import 'package:login_register/Screens/profilScreen/hastaLogin.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 90, 10, 0),
                  child: Container(

                    child: Image.asset("assets/logo.png",),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 10, 0),
                  child: GestureDetector(
                    onTap: (){DoktorGirisYap();},
                    child: Container(
                      child: Image.asset("assets/doktorGiris.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 10, 0),
                  child: GestureDetector(
                    onTap: (){girisYap();},
                    child: Container(
                      child: Image.asset("assets/hastaGiris.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 10, 0),
                  child: GestureDetector(
                    onTap: (){girisYap();},
                    child: Container(
                      child: Image.asset("assets/eczaneGiris.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  girisYap(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>HastaLogin()),);
  }
  DoktorGirisYap(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>DoktorLogin(),));
  }
}
