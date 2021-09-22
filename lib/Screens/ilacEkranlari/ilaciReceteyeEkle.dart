import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class ilaciReceteyeEkle extends StatefulWidget {
  String receteKod;
  ilaciReceteyeEkle({this.receteKod});

  @override
  _ilaciReceteyeEkleState createState() => _ilaciReceteyeEkleState();
}

class _ilaciReceteyeEkleState extends State<ilaciReceteyeEkle> {
  List<String> ilacListesi = [];
  List<String> ilacAdiListesi = [];
  List <String> ilacResimListesi =[];

  TextEditingController ilacKodu = TextEditingController();
  TextEditingController tcNo = TextEditingController();
  //TextEditingController ilacAdiliste = TextEditingController();

  var gelenilacAdi = "";
  var gelenilacDetay = "";
  var imageUrl = "";
  var gelenKullanimSekli = "";

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => randomNumber());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          child: Row(
            children: [
              Text("Reçeteye İlaç Ekleme"),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Text(
                  "Reçete \nKodu: " + randomReceteKodu.toString(),
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20.0)),
                                    ),
                                    labelText: 'İlaç Kodunu Yazınız:'),
                                controller: ilacKodu,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                              child: RaisedButton(
                                  color: Colors.amberAccent,
                                  child: Text("Ara"),
                                  onPressed: ilacGetir),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0)),
                              ),
                              labelText:
                                  'İlaç eklemek için hasta T.C. Yazınız'),
                          controller: tcNo,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.tealAccent,
                          ),
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: ListTile(
                                          title:
                                              Text("İlaç Adı: " + gelenilacAdi),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 6.0, horizontal: 8.0),
                                          leading: imageUrl == ""
                                              ? SizedBox.shrink()
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  child:
                                                      Image.network(imageUrl)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 5, 10, 0),
                                        child: Column(
                                          children: [
                                            RaisedButton(
                                                color: Colors.amberAccent,
                                                child: Text("Ekle"),
                                                onPressed: ilacEkle),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Row(
                      children: [
                        SizedBox(width:5),
                        Expanded(
                          flex:1,
                          child: TextField(decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0)),
                              ),
                              labelText:
                              'İlaç Kodu'),
                            controller: tcNo,),
                        ),
                        SizedBox(width:10),
                        Expanded(
                          flex:3,
                          child: TextField(decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0)),
                              ),
                              labelText:
                              'İlaç Adı'),
                            controller: tcNo,),
                        ),
                        SizedBox(width:5),
                      ],
                    ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(230,2,2,2),
                        child: RaisedButton(

                            color: Colors.redAccent,
                            child: Text("İlacı Reçeteden Sil",),
                            onPressed: ilacListedenCikar),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(


                decoration: BoxDecoration(

                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue,

                ),

                child: Column(
                  children: [
                    Text("\nReçeteye Eklenen İlaçlar",style:TextStyle(fontSize:18,color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: Row(
                        children: [
                          Text(" İlaç Kod",style:TextStyle(fontSize:15)),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                            child: Text("     İlaç Adı",style:TextStyle(fontSize:15,fontStyle:FontStyle.normal)),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: ListView.builder(
                              itemCount: ilacListesi.length,
                              itemBuilder: (context, indexNumarasi) => Card(
                                child: ListTile(
                                  title: Row(
                                    children: [
                                      Expanded(
                                        flex:1,
                                        child: Text(
                                            ilacListesi[indexNumarasi] +
                                                "\t        "),
                                      ),
                                      Expanded(
                                        flex:3,
                                        child: Text(ilacAdiListesi[indexNumarasi],
                                            textAlign: TextAlign.start),
                                      )
                                    ],
                                  ),
                                  trailing:Expanded(
                                    flex:1,
                                    child: imageUrl == ""
                                        ? SizedBox.shrink()
                                        : ClipRRect(
                                        borderRadius:
                                        BorderRadius.all(
                                            Radius.circular(10)),
                                        child:
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Image.network(ilacResimListesi[indexNumarasi]),
                                        )),
                                  ),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int randomReceteKodu = 0;

  void randomNumber() {
    var random = new Random();
    int minValue = 700;
    int maxValue = 800;
    setState(() {
      randomReceteKodu = randomBetween(101, 1000);
    });
    print(randomReceteKodu);
  }

  ilacGetir() {
    FirebaseFirestore.instance
        .collection("Ilaclar")
        .doc('ilacKodu')
        .collection(ilacKodu.text)
        .doc('ilacBilgi')
        .get()
        .then((gelenVeri) {
      setState(() {
        gelenilacAdi = gelenVeri.data()['ilacAdi'];
        imageUrl = gelenVeri.data()['imgUrl'];
        gelenKullanimSekli = gelenVeri.data()['kullanimSekli'];
        gelenilacDetay = gelenVeri.data()['detay'];
      });
    }).whenComplete(() => print("İlaç geldi"));

  }

  ilacListeyeEkle() {
    setState(() {
      ilacListesi.add(ilacKodu.text);
      ilacAdiListesi.add(gelenilacAdi);
      ilacResimListesi.add(imageUrl);
      ilacKodu.clear();

    });
  }

  ilacListedenCikar() {
    setState(() {
      ilacListesi.remove(ilacKodu.text);
      ilacAdiListesi.remove(ilacKodu.text);
      ilacKodu.clear();
    });
  }

  ilacEkle() {
    FirebaseFirestore.instance
        .collection("Receteler")
        .doc('tcNo')
        .collection(tcNo.text)
        .doc('receteKodu')
        .collection(randomReceteKodu.toString())
        .doc('ilacKodu')
        .collection(ilacKodu.text)
        .doc('ilacBilgi')
        .set({
      'ilacAdi': gelenilacAdi,
      'detay': gelenilacDetay,
      'imgUrl': imageUrl,
      'kullanimSekli': gelenKullanimSekli,
      'receteKodu': randomReceteKodu
    }).whenComplete(() => print("İlaç eklendi"));
    ilacListeyeEkle();

  }
}


