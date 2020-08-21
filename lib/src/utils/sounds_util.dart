import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

AudioCache audioCacheInstrument = AudioCache();
AudioCache audioCacheMatrix = AudioCache();
AudioPlayer player;

String url = "sounds/";
String ext = ".mp3";
bool isSound = false;
bool isPaused = false;

List sounds = ["platillos", "redoblante", "bombo"];

playInstrument(int i) {
  audioCacheInstrument.play("$url${sounds[i]}$ext");
}

playMatrix(String r) async{
  if (!isSound) {
    player = await audioCacheMatrix.loop("$url$r$ext");
  }
  if (isPaused){
    player.resume();
    isPaused = false;
  }
  isSound = true;
}

pauseMatrix(){
  if(isSound && !isPaused){
    player.pause();
    isPaused = true;
  }
}

stopMatrix(){
  if(isSound){
    player.stop();
    isSound = false;
  }
}
