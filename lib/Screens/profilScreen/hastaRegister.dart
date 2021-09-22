import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_register/Screens/profilScreen/components/rounded_button.dart';
import 'package:login_register/Screens/profilScreen/components/rounded_input_field.dart';
import 'package:login_register/Screens/profilScreen/components/rounded_password_field.dart';
import 'package:login_register/Screens/profilScreen/hastaLogin.dart';

class HastaRegister extends StatefulWidget {

  @override
  _HastaRegisterState createState() => _HastaRegisterState();
}

class _HastaRegisterState extends State<HastaRegister> {
  TextEditingController eMail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController adi = TextEditingController();
  TextEditingController soyadi = TextEditingController();
  TextEditingController telefon = TextEditingController();
  TextEditingController yas = TextEditingController();
  TextEditingController sifre = TextEditingController();
  TextEditingController tcNo = TextEditingController();


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
                    padding: const EdgeInsets.fromLTRB(0,20,0,0),
                    child: Container(
                        width: 150,
                        height:150,
                        child: Image.asset("assets/logo.png")),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 30),
                    child: Container(
                      width:395,
                      height:900,

                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Colors.white,

                      ),
                      child: Column(
                        children: [
                          SizedBox(height:10),
                          Text("Kayıt Ekranı", style: TextStyle(color:Colors.lightBlue,fontSize: 25),),
                          SizedBox(height:5),
                          Container(
                            width:120,
                            height: 120,
                            child: CircleAvatar(

                             child:Image.asset("assets/profilResmi2.png"),
                             ),
                          ),
SizedBox(height: 10,),
RaisedButton(onPressed: aMethod,color: Colors.blue, child:Text("Resim Yükle")),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(60,2,60,5),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

                                labelText: 'TC.No', ),
                              controller: tcNo,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(60,2,60,5),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

                                labelText: 'Adınız:', ),
                              controller: adi,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(60,2,60,5),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

                                labelText: 'Soyadınız:', ),
                              controller: soyadi,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(60,2,60,5),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

                                labelText: 'Telefon:', ),
                              controller: telefon,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(60,2,60,5),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

                                labelText: 'Yaş:', ),
                              controller: yas,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(60,2,60,5),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

                                labelText: 'E Posta:', ),
                              controller: eMail,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(60,2,60,5),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

                                labelText: 'Şifre:', ),
                              controller: password,
                            ),
                          ),



                          RoundedButton(

                            text: "Kayıt Ol:",
                            color: Colors.blue,
                            press: () {kayitOlma();},
                          ),

                          GestureDetector(
                              onTap: girisYap,
                              child: Container(child: Text("Hesabın varmı, Giriş Yap", style: TextStyle(fontStyle: FontStyle.italic,color: Colors.blue),)))
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
  aMethod(){

  }
  Future<void>kayitOlma() async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: eMail.text, password: password.text).then((kullanici){
      FirebaseFirestore.instance.collection("kisiler").doc(tcNo.text).set(
        {
          "ePosta":eMail.text,
          "sifre":password.text,
          "kisiAdi":adi.text,
          "kisiSoyadi":soyadi.text,
          "kisiTelefon":telefon.text,
          "kisiYas":yas.text,

        }
      ).whenComplete(() => print("kayıt yapıldı"));
    }).whenComplete(() => print("Kullanıcı Firebase Kaydedildi"));
  }

  girisYap(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>HastaLogin()));
  }
}
