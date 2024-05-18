import 'package:just_audio/just_audio.dart';

class AudioManager {
  final AudioPlayer _audioPlayer = new AudioPlayer();

  Future<void> init() async {
    await _audioPlayer.setLoopMode(LoopMode.one);  // Loop the single track
    await _audioPlayer.setAsset('images/BackgroundMusic.mp3');
  }

  void play() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void stop() {
    _audioPlayer.stop();
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}