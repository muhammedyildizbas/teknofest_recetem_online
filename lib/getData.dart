import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'dart:math';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  TextEditingController ilacKodu = TextEditingController();
  TextEditingController receteKodu = TextEditingController();
  TextEditingController tcNo = TextEditingController();
  TextEditingController resimUrl = TextEditingController();
  TextEditingController receteNumber = TextEditingController();
  TextEditingController ilacNumber = TextEditingController();


  var gelenilacAdi = "";
  var imageUrl="";
  var gelenTcNo ="";
  var gelenilacDetay="";
  var gelenKullanimSekli ="";
  var ilacAdi="";
  var detay="";


  yaziGetir() {
    FirebaseFirestore.instance
        .collection("Receteler")
        .doc('tcNo').collection(tcNo.text).doc('receteKodu').collection(receteKodu.text).doc('ilacKodu').collection(ilacKodu.text).doc('ilacBilgi')
        .get().then((gelenVeri)  {setState(() {
      gelenilacAdi= gelenVeri.data()['ilacAdi'];
      gelenilacDetay= gelenVeri.data()['detay'];
      imageUrl= gelenVeri.data()['imgUrl'];
      gelenKullanimSekli= gelenVeri.data()['kullanimSekli'];
    });})
        .whenComplete(() => print("Veriler geldi"));

  }
  ilacGetir() {
    FirebaseFirestore.instance
        .collection("Ilaclar")
        .doc('ilacKodu')..collection(ilacKodu.text).doc('ilacBilgi')
        .get().then((gelenVeri)  {setState(() {
      gelenilacAdi= gelenVeri.data()['ilacAdi'];
      gelenilacDetay= gelenVeri.data()['detay'];
      imageUrl= gelenVeri.data()['imgUrl'];
      gelenKullanimSekli= gelenVeri.data()['kullanimSekli'];
    });})
        .whenComplete(() => print("İlaç geldi"));

  }



  ilacEkle() {
       FirebaseFirestore.instance
        .collection("Receteler")
        .doc('tcNo').collection(tcNo.text).doc('receteKodu').collection(receteKodu.text).doc('ilacKodu').collection(ilacKodu.text).doc('ilacBilgi')
        .set({'ilacAdi': gelenilacAdi, 'detay': gelenilacDetay,'imgUrl':imageUrl,'kullanimSekli':gelenKullanimSekli}).whenComplete(
            () => print("İlaç eklendi"));
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(children: [


              TextField(
                decoration:InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'T.C No'
                ),

                controller: tcNo,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration:InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Reçete Kodu'
                ),
                controller: receteKodu,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration:InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'İlaç Kodu'
                ),
                controller: ilacKodu,
              ),

              Row(
                children: [
                  RaisedButton(child: Text("İlacı Getir"), onPressed: ilacGetir),
                  SizedBox(width: 5,),
                  RaisedButton(child: Text("Reçeteye Ekle"), onPressed: ilacEkle),

                ],
              ),
              Text(gelenilacAdi),
              ListTile(
                title:Text(gelenKullanimSekli),
                subtitle: Text(gelenilacDetay),

                contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                leading: imageUrl == null
                    ? SizedBox.shrink()
                    : Image.network(imageUrl),
              ),

            ],
            ),

          ),
          ),
        );

  }
}