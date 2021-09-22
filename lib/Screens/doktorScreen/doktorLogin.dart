import 'package:flutter/material.dart';
import 'package:login_register/Screens/ilacEkranlari/ilaciReceteyeEkle.dart';
import 'package:login_register/Screens/profilScreen/components/rounded_button.dart';
import 'package:login_register/Screens/profilScreen/components/rounded_input_field.dart';
import 'package:login_register/Screens/profilScreen/components/rounded_password_field.dart';
import 'package:login_register/Screens/profilScreen/hastaProfil.dart';
import 'package:login_register/Screens/profilScreen/hastaRegister.dart';

class DoktorLogin extends StatefulWidget {

  @override
  _DoktorLoginState createState() => _DoktorLoginState();
}

class _DoktorLoginState extends State<DoktorLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,

        body:Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,80,0,0),
                    child: Image.asset("assets/logo.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,10,10,0),
                    child: Container(
                        width:200,
                        height:200,
                        child: Image.asset("assets/logoKalp.png")),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 30),
                    child: Container(
                      width:395,
                      height:480,

                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Colors.white,

                      ),
                      child: Column(
                        children: [
                          SizedBox(height:10),
                          Text("Doktor Giriş Ekranı", style: TextStyle(color:Colors.lightBlue,fontSize: 25),),
                          SizedBox(height:5),
                          RoundedInputField(
                            icon: Icons.account_circle_sharp,

                            hintText: "Email:",
                            onChanged: (value) {},
                          ),
                          SizedBox(height:1),
                          RoundedPasswordField(



                            onChanged: (value) {},
                          ),
                          RoundedButton(

                            text: "Giriş Yap",
                            color: Colors.blue,
                            press: () {doktorgirisYap();},
                          ),
                          RoundedButton(

                            text: "e-devlet ile giriş yap",
                            color: Colors.redAccent,
                            press: () {girisYap();},
                          ),
                          GestureDetector(
                              onTap:kayitOl ,
                              child: Container(child: Text( "Hesabın yokmu Kayıt ol", style: TextStyle(fontStyle: FontStyle.italic,color: Colors.blue),)))
                        ],
                      ),




                    ),
                  )
                ],
              ),

            ),
          ),
        )

    );
  }
  girisYap(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>HastaProfil()),);
  }
  doktorgirisYap(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>ilaciReceteyeEkle()),);
  }
  kayitOl(){
    girisYap(){
      Navigator.push(context,MaterialPageRoute(builder: (context)=>HastaRegister()));
    }
  }
}
