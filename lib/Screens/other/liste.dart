import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_register/Screens/ilacEkranlari/ilaciReceteyeEkle.dart';

class liste extends StatefulWidget {

  @override
  _listeState createState() => _listeState();


}

class _listeState extends State<liste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Liste"),
      ),
floatingActionButton:  FloatingActionButton(
  child:Icon(Icons.add),
  onPressed:(){
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_)=>ilaciReceteyeEkle()),
        (Route<dynamic>route)=>true);
  }
),
body:Container(
  child: receteilaclari()
),
    );
  }
}

class receteilaclari extends StatelessWidget {
  var  receteKod = "tc";

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    Query ilaclar=FirebaseFirestore.instance.collection('Receteler2').doc('10').collection('tc').where("receteKodu", isEqualTo:receteKod);

    return Container(
      child: Column(
        children: [
          Expanded(
            flex:1,
            child: Text("Text"),
          ),

          Expanded(
            flex:1,
            child: StreamBuilder<QuerySnapshot>(
              stream:ilaclar.snapshots(),
              builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                if(snapshot.hasError){
                  return Text('Something went wrong');
                }
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Text("Loading");
                }
                return new ListView(
                  children: snapshot.data?.docs.map((DocumentSnapshot document)
                {
                  return new ListTile(
                    title: new Text("ilac Adi"+document['ilacAdi']),
                    subtitle: new Text(document['detay']),

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
}
