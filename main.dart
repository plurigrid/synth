import 'dart:convert';
import 'dart:math' as math;

// see https://github.com/Plurigrid/birbs

String? gmFunction() {
  // create components of the modular synthesizer
  List<double> oscillator = List.generate(44100, (i) => math.sin(i * 440 * math.pi * 2 / 44100));
  List<double> envelope = List.generate(44100, (i) => math.max(0, 1 - i / 44100 * 4));
  List<double> chirp = List.generate(44100, (i) => oscillator[i] * envelope[i]);

  // convert chirp to audio data
  List<int> audioData = [];
  for (double sample in chirp) {
    audioData.add((sample * 32767).toInt());
  }
  String audioBase64 = base64.encode(audioData);

  // play audio in the browser using an HTML audio element
  return '''
  function playChirp() {
    var audio = new Audio('data:audio/wav;base64,$audioBase64');
    audio.play();
  }
  ''';
}
