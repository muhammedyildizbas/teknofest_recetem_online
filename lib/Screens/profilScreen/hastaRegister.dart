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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(content: Text('Yanlış birşey var'));
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                        width: 150,
                        height: 150,
                        child: Image.asset("assets/logo.png")),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 30),
                    child: Form(
                      key: _formKey,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: double.infinity,
                          minHeight: 900,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              "Kayıt Ekranı",
                              style: TextStyle(
                                  color: Colors.lightBlue, fontSize: 25),
                            ),
                            boxSpaser(),
                            Container(
                              width: 120,
                              height: 120,
                              child: CircleAvatar(
                                child: Image.asset("assets/profilResmi2.png"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RaisedButton(
                                onPressed: aMethod,
                                color: Colors.blue,
                                child: Text("Resim Yükle")),
                            boxSpaser(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(60, 2, 60, 5),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  labelText: 'TC.No',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'lütfen türk TC numaranızı giriniz';
                                  } else if (value.length < 11) {
                                    return 'Lütfen tam numaranızı girdiğinizden emin olun';
                                  }
                                  return null;
                                },
                                controller: tcNo,
                              ),
                            ),
                            boxSpaser(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(60, 2, 60, 5),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  labelText: 'Adınız:',
                                ),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Lütfen adınızı giriniz';
                                  }
                                  return null;
                                },
                                controller: adi,
                              ),
                            ),
                            boxSpaser(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(60, 2, 60, 5),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  labelText: 'Soyadınız:',
                                ),
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Lütfen soyadınızı giriniz';
                                  }else if(value.length <8){
                                    return 'Lütfen en az 8 karakter girin';
                                  }
                                  return null;
                                },
                                controller: soyadi,
                              ),
                            ),
                            boxSpaser(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(60, 2, 60, 5),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  labelText: 'Telefon:',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Lütfen telefon numaranızı girin';
                                  }
                                  return null;
                                },
                                controller: telefon,
                              ),
                            ),
                            boxSpaser(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(60, 2, 60, 5),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  labelText: 'Yaş:',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Lütfen yaşını gir';
                                  }
                                  return null;
                                },
                                controller: yas,
                              ),
                            ),
                            boxSpaser(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(60, 2, 60, 5),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  labelText: 'E Posta:',
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'lütfen e-mail adresinizi giriniz';
                                  }
                                  return null;
                                },
                                controller: eMail,
                              ),
                            ),
                            boxSpaser(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(60, 2, 60, 5),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  labelText: 'Şifre:',
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Lütfen şifrenizi giriniz';
                                  }
                                  return null;
                                },
                                controller: password,
                              ),
                            ),
                            boxSpaser(),
                            RoundedButton(
                              text: "Kayıt Ol:",
                              color: Colors.blue,
                              press: () {
                                if (_formKey.currentState.validate()) {
                                  kayitOlma();
                                } else
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                              },
                            ),
                            TextButton(
                              child: Text(
                                "Hesabın varmı, Giriş Yap",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.blue),
                              ),
                              onPressed: girisYap,
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  SizedBox boxSpaser() => const SizedBox(height: 5);

  aMethod() {}

  Future<void> kayitOlma() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: eMail.text, password: password.text)
        .then((kullanici) {
      FirebaseFirestore.instance.collection("kisiler").doc(tcNo.text).set({
        "ePosta": eMail.text,
        "sifre": password.text,
        "kisiAdi": adi.text,
        "kisiSoyadi": soyadi.text,
        "kisiTelefon": telefon.text,
        "kisiYas": yas.text,
      }).whenComplete(() => print("kayıt yapıldı"));
    }).whenComplete(() => print("Kullanıcı Firebase Kaydedildi"));
  }

  girisYap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HastaLogin()));
  }
}
