import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:url_launcher/url_launcher.dart';

var audiourl =
    "https://music.youtube.com/watch?v=q3HNo5a3ol4&list=PLl7FgM8EYUapCec8DynMTKAAbd3ctvdtk";

AudioPlayer newPlayer = new AudioPlayer();
AudioCache audio = new AudioCache(fixedPlayer: newPlayer);
bool play = false;
bool stop = true;
playAudio() {
  if (play == false || stop == true) {
    audio.play("/audios/Kalimba.mp3");
    play = true;
  }
}

pauseAudio() {
  if (play == true) {
    newPlayer.pause();
    play = false;
  }
}

stopAudio() {
  if (play == true || stop == false) {
    newPlayer.stop();
    play = false;
    stop = true;
  }
}

launchURL() async {
  const url =
      "https://music.youtube.com/watch?v=q3HNo5a3ol4&list=PLl7FgM8EYUapCec8DynMTKAAbd3ctvdtk";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

MyApp() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.grey);
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Task 1 Audio Player"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.library_music),
            onPressed: () => print("keshav"),
          ),
          IconButton(
            icon: Icon(Icons.music_note),
            onPressed: () => print("keshav"),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.shade400,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 300,
                    width: 300,
                    child: Image.asset("assets/picture/download.jpg"),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Text(
                      "THIS IS ASSETS AUDIO",
                      textScaleFactor: 2.0,
                    ),
                  ),
                  Container(
                    width: 305,
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          child: IconButton(
                              icon: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: playAudio),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          child: IconButton(
                            icon: Icon(
                              Icons.pause,
                              color: Colors.white,
                            ),
                            onPressed: pauseAudio,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          child: IconButton(
                            icon: Icon(
                              Icons.stop,
                              color: Colors.white,
                            ),
                            onPressed: stopAudio,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              color: Colors.red,
            ),
            Container(
              width: double.infinity,
              height: 307,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 50,
                    child: Text(
                      "THIS IS URL AUDIO",
                      textScaleFactor: 2.0,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50)),
                    //color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 25),
                            child: IconButton(
                              icon: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: launchURL,
                            )),
                      ],
                    ),
                  )
                ],
              ),
              // color: Colors.red,
              color: Colors.amber,
            ),
          ],
        ),
      ),
    ),
  );
}
