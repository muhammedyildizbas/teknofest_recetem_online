import 'package:flutter/material.dart';
import 'package:login_register/Screens/other/liste.dart';


class ReceteGosterme extends StatefulWidget {


  @override
  _ReceteGostermeState createState() => _ReceteGostermeState();
}

class _ReceteGostermeState extends State<ReceteGosterme> {

  TextEditingController receteKod = TextEditingController();

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Reçetelerimi Göster"),),
      body:Container(
        color:Colors.white,
        child: Center(
          child: Container(


            child:SingleChildScrollView(

              child: Column(
                children:<Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,10),
                    child: ClipRRect(

borderRadius: BorderRadius.circular(10.0),
                      child:Image.asset('assets/eski_recetelerim.png',

                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,30),
                    child: ElevatedButton(onPressed: receteIlaclariEkrani, child: Text("Reçetelerim"),),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,5,0,20),
                    child: ClipRRect(

                      borderRadius: BorderRadius.circular(20.0),
                      child:Image.asset('assets/recete_ekle2.png',

                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60,2,60,5),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

                          labelText: 'Reçete Kodunu Yazınız', ),
                      controller: receteKod,
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,10,50),
                    child: ElevatedButton(onPressed: receteIlaclariEkrani, child: Text("Yeni Reçeteyi Ekle"),),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),

      
    );
  }
  receteIlaclariEkrani(){

      Navigator.push(context,MaterialPageRoute(builder: (context)=>receteilaclari()));

  }
  bmethod(){

  }
}
