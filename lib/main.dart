
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_register/Screens/doktorScreen/doktorProfil.dart';
import 'package:login_register/Screens/homeScreens.dart';
import 'package:login_register/Screens/ilacEkranlari/ilacDetayScreen.dart';
import 'package:login_register/Screens/ilacEkranlari/ilacVideo.dart';
import 'package:login_register/Screens/ilacEkranlari/ilaciReceteyeEkle.dart';
import 'package:login_register/Screens/other/liste.dart';
import 'package:login_register/Screens/profilScreen/hastaLogin.dart';
import 'package:login_register/Screens/profilScreen/hastaProfil.dart';
import 'package:login_register/Screens/profilScreen/hastaRegister.dart';
import 'package:login_register/Screens/receteGosterme/receteGostermeScreen.dart';
import 'package:login_register/Screens/receteGosterme/receteIlaclariScreen.dart';
import 'package:login_register/Screens/yeniReceteOlustur.dart';

import 'package:login_register/getData.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  TextFormField textFormField = TextFormField();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home:Scaffold(

        body: Home(),
      ),
    );
  }
}

