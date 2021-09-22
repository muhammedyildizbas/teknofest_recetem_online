import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class IlacDetay extends StatefulWidget {
  @override
  _IlacDetayState createState() => _IlacDetayState();
}

class _IlacDetayState extends State<IlacDetay> {


  TextEditingController resimUrl = TextEditingController();
  TextEditingController ilacKodu = TextEditingController();
  var gelenilacAdi = "";
  var imageUrl =
      "https://firebasestorage.googleapis.com/v0/b/loginregister-56c8a.appspot.com/o/ilacResim2%2Fgoz%20Damlasi.jpg?alt=media&token=c3cb0f96-f37b-40a9-9988-5feb884db7a2";
  var gelenTcNo = "";
  var gelenilacDetay = "";
  var gelenKullanimSekli = "";
  var ilacAdi = "";
  var detay = "";
  var videoUrl="";

  @override
  void videoGetir() {
    _controller = VideoPlayerController.network(videoUrl);
    //_controller = VideoPlayerController.asset("videos/sample_video.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }
  @override
  void initState() {
    _controller = VideoPlayerController.network(videoUrl);
    //_controller = VideoPlayerController.asset("videos/sample_video.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(flex: 1, child: Text("İlaç Bilgileri")),
            Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 9, 0, 0),
              child: Text("Kodu yazınız:", style: TextStyle(fontSize: 15,color:Colors.black),),
            )),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex:3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2, 25, 1, 16),
                      child: Container(
                        width:30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white54,
                        ),

                        child: TextField(
                          decoration: InputDecoration(

                          ),
                     controller:ilacKodu,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(1, 6, 2, 1),
                      child: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed:(){ilacGetir();})
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Container(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.network(imageUrl)),
                ),
                Text(
                  "\nİlaç Adı:\n $gelenilacAdi",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 100, 5),
                  child: Container(
                    width: 190,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.tealAccent,
                    ),
                    child: Row(
                      children: [
                        Text("     Kullanım Videosu"),
                        SizedBox(
                          width: 15,
                        ),
                        IconButton(
                            icon: const Icon(Icons.play_circle_filled),
                          onPressed: () {
                            setState(() {
                              if (_controller.value.isPlaying) {
                                _controller.pause();
                              } else {
                                _controller.play();
                              }
                            });

                          },
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
child:Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(30)),

  ),
  child: Column(
    children: [
      FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },

      ),
    ],
  ),
),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 250, 1),
                  child: Text(
                    "Kullanım Şekli: ",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20,color:Colors.blue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    "$gelenKullanimSekli",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 190, 1),
                  child: Text(
                    "Diğer Önemli Bilgiler: ",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20,color:Colors.blue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    " $gelenilacDetay",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  ilacGetir() {
    FirebaseFirestore.instance.collection("Ilaclar").doc('ilacKodu')
      ..collection(ilacKodu.text).doc('ilacBilgi').get().then((gelenVeri) {
        setState(() {
          gelenilacAdi = gelenVeri.data()['ilacAdi'];
          gelenilacDetay = gelenVeri.data()['detay'];
          imageUrl = gelenVeri.data()['imgUrl'];
          gelenKullanimSekli = gelenVeri.data()['kullanimSekli'];
          videoUrl = gelenVeri.data()['videoUrl'];
        });
      }).whenComplete(() => print("İlaç geldi"));
 videoGetir();

  }

}
