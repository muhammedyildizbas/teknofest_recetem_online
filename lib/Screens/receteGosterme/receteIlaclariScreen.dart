
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_register/Screens/ilacEkranlari/ilacDetayScreen.dart';
import 'package:login_register/Screens/ilacEkranlari/ilaciReceteyeEkle.dart';

class ReceteIlaclari extends StatefulWidget {
  @override
  _ReceteIlaclariState createState() => _ReceteIlaclariState();
}

class _ReceteIlaclariState extends State<ReceteIlaclari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reçetedeki İlaçlarım"),
      ),
      body: Container(child: receteilaclari()),
    );

  }


}

class receteilaclari extends StatelessWidget {
  var receteKod = "tc";

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    Query ilaclar = FirebaseFirestore.instance
        .collection('Receteler2')
        .doc('10')
        .collection('tc')
        .where("receteKodu", isEqualTo: receteKod);

    return Container(
      color:Colors.teal,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: StreamBuilder<QuerySnapshot>(
              stream: ilaclar.snapshots(),
              builder: (BuildContext context,

                  AsyncSnapshot<QuerySnapshot> snapshot) {
                ilacDetayEkrani(){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>IlacDetay()));
                }
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                return new ListView(
                  children:
                      snapshot.data?.docs.map((DocumentSnapshot document) {
                    var imageUrl = "imgUrl";
                    return Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 3, 270, 0),
                            child: Text(
                              "İlaç Kod: " + document['ilacKod'],
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                          new ListTile(
                            title: new Text(
                                "İlaç Adı: " + document['ilacAdi'] ),
                            leading: imageUrl == ""
                                ? SizedBox.shrink()
                                : Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(1, 2, 2, 2),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child:
                                            Image.network(document[imageUrl])),
                                  ),
                            trailing: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: new IconButton(

                                        icon: const Icon(Icons.assignment),
                                        tooltip: 'Increase volume by 10',
                                        color: Colors.blue,
                                        onPressed: () {
                                          ilacDetayEkrani();
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 12, 0, 0),
                                        child: Text("Kullanım\nŞekli",
                                            style: TextStyle(fontSize: 10,color:Colors.black87,),
                                            textAlign: TextAlign.center),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },

            ),
          ),
        ],
      ),
    );
  }

  tiklama(){
    print("tikla");
  }


}
