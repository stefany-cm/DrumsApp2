import 'package:audioplayers/audio_cache.dart';

final AudioCache audioCache = AudioCache();

final List sounds = [
  "r.mp3",
  "p.mp3",
  "b.mp3",
  "sounds/pr.mp3",
  "sounds/pb.mp3",
  "sounds/br.mp3",
  "sounds/pbr.mp3"
];

play(int i) async {
  audioCache.play(sounds[i]);
}
