import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_register/Screens/ilacEkranlari/ilaciReceteyeEkle.dart';
import 'package:random_string/random_string.dart';
import 'dart:math';

class yeniReceteOlustur extends StatefulWidget {
  @override
  _yeniReceteOlusturState createState() => _yeniReceteOlusturState();
}

class _yeniReceteOlusturState extends State<yeniReceteOlustur> {
  TextEditingController ilacKodu = TextEditingController();
  TextEditingController tcNo = TextEditingController();
  var gelenilacAdi = "";
  var imageUrl = "";
  var gelenTcNo = "";
  var gelenilacDetay = "";
  var gelenKullanimSekli = "";
  var ilacAdi = "";
  var detay = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Reçete Oluştur"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Hasta T.C. No Giriniz:'),
                controller: tcNo,
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                  child: Text("Yeni Reçete Oluştur"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ilaciReceteyeEkle(),
                        ));
                  }),
              SizedBox(
                height: 10,
              ),
              Text("Reçete Kodu: " + result.toString()),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'İlaç Kodu'),
                controller: ilacKodu,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  RaisedButton(
                      child: Text("İlacı Getir"), onPressed: ilacGetir),
                  SizedBox(width: 10),
                  RaisedButton(child: Text("İlacı Ekle"), onPressed: ilacEkle),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(gelenKullanimSekli),
                subtitle: Text(gelenilacDetay),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                leading: imageUrl == ""
                    ? SizedBox.shrink()
                    : Image.network(imageUrl),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int result = 0;
  void randomNumber() {
    var random = new Random();
    int minValue = 700;
    int maxValue = 800;
    setState(() {
      result = randomBetween(101, 1000);
    });
    print(result);
  }

  ilacGetir() {
    FirebaseFirestore.instance.collection("Ilaclar").doc('ilacKodu')
      ..collection(ilacKodu.text).doc('ilacBilgi').get().then((gelenVeri) {
        setState(() {
          gelenilacAdi = gelenVeri.data()['ilacAdi'];
          gelenilacDetay = gelenVeri.data()['detay'];
          imageUrl = gelenVeri.data()['imgUrl'];
          gelenKullanimSekli = gelenVeri.data()['kullanimSekli'];
        });
      }).whenComplete(() => print("İlaç geldi"));
  }

  ilacEkle() {
    FirebaseFirestore.instance
        .collection("Receteler")
        .doc('tcNo')
        .collection(tcNo.text)
        .doc('receteKodu')
        .collection(result.toString())
        .doc('ilacKodu')
        .collection(ilacKodu.text)
        .doc('ilacBilgi')
        .set({
      'ilacAdi': gelenilacAdi,
      'detay': gelenilacDetay,
      'imgUrl': imageUrl,
      'kullanimSekli': gelenKullanimSekli
    }).whenComplete(() => print("İlaç eklendi"));
  }
}
