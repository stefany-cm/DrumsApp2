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

play(int i) {
  audioCache.play(sounds[i]);
}

playAll(List<List<int>> matrix) async {
  int colums = matrix[0].length;
  int cont = 0;
  for (int i = 0; i < colums; i++) {
    for (int j = 0; j < matrix.length; j++) {
      if (matrix[i][j] == 1) {
        print("[$j - $i]--------------------------------------------------------------------------");
        cont++;
      }
    }
    playColum(cont);
    print("$cont*****************");
    cont = 0;
  }
}
playColum(int numInstruments) async{
  for (int i = 0; i < numInstruments; i++) {
    print("$i aaaaaaaaaaaaaaaaaaaaaaaaaaa");
    audioCache.play(sounds[i]);
  }
}
