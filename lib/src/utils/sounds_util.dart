import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

AudioCache audioCacheInstrument = AudioCache();
AudioCache audioCacheMetronome = AudioCache();
AudioCache audioCacheMatrix = AudioCache();
AudioPlayer player;
AudioPlayer metronome;

String url = "sounds/";
String ext = ".mp3";
bool isPaused = false;
bool isSound = false;

List sounds = ["platillos", "redoblante", "bombo", "metronomo"];

playInstrument(int i) {
  audioCacheInstrument.play("$url${sounds[i]}$ext");
}

playMetronome() async{
  metronome = await audioCacheInstrument.loop("$url${sounds[3]}44$ext");
}
stopMetronome() async{
  metronome.stop();
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
  if(isSound || isPaused){
    player.stop();
    isSound = false;
  }
}
