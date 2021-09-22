import 'package:flutter/material.dart';

class HastaProfil extends StatefulWidget {
  @override
  _HastaProfilState createState() => _HastaProfilState();
}

class _HastaProfilState extends State<HastaProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Profil Bilgilerim"),),

        body: SingleChildScrollView(
            child: Center(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Container(
                      width: 110,
                      height: 100,
                      child: CircleAvatar(
                        child: Image.asset(
                          "assets/doktor.png"
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Colors.lightBlueAccent,

                      ),
                      height: 900,
                      width: 500,

                      child: Column(
                        children: [
                          Text("\nAdı Soyadı\n",style: TextStyle(fontSize: 25,),),


                          Container(
                              width: 300,
                                height: 50,

                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: Colors.amber

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(20,12,0,0),
                                  child: Text("T.C. Kimlik No: 2222222222222",style: TextStyle(fontSize: 18,color: Colors.white),),
                                )
                          ),
                          SizedBox(height: 10,),
                          Container(
                              width: 300,
                              height: 50,

                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.deepOrangeAccent

                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20,12,0,0),
                                child: Text("Telefon:",style: TextStyle(fontSize: 18,color: Colors.white),),
                              )
                          ),
                          SizedBox(height: 10,),
                          Container(
                              width: 300,
                              height: 50,

                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.deepOrangeAccent

                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20,12,0,0),
                                child: Text("Yaş:",style: TextStyle(fontSize: 18,color: Colors.white),),
                              )
                          ),
                          SizedBox(height: 10,),
                          Container(
                              width: 300,
                              height: 50,

                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.deepOrangeAccent

                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20,12,0,0),
                                child: Text("E-posta:",style: TextStyle(fontSize: 18,color: Colors.white),),
                              )
                          ),
                          SizedBox(height: 10,),
                          Container(
                              width: 300,
                              height: 50,

                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.deepOrangeAccent

                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20,15,0,0),
                                child: Text("Şifre:",style: TextStyle(fontSize: 18,color: Colors.white),),
                              )

                          ),
                          SizedBox(height: 15,),
                          RaisedButton(onPressed: null,child:Text("Bilgilerimi Güncelle"),),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(75,20,0,0),
                            child: Row(
                              children: [
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(

                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: Colors.greenAccent,

                                    ),

                                    width:110,
                                    height: 60,
                                    child: Row(
                                      children: [
                                        SizedBox(width:10),
                                        Icon(

                                            Icons.alarm

                                        ),
                                        SizedBox(width:3),

                                        Text("Alarmlar"),
                                      ],
                                    ),
                                  ),
                                ),SizedBox(width:20),
                                Container(

                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.greenAccent,

                                  ),

                                  width:110,
                                  height: 60,
                                  child: Row(
                                    children: [
                                      SizedBox(width:2),
                                      Icon(

                                        Icons.assignment

                                      ),
                                      SizedBox(width:3),

                                      Text("Reçetelerim"),
                                    ],
                                  ),

                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),


                  ],
                ),


    ),
            )));
  }
}
