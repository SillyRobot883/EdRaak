import 'package:just_audio/just_audio.dart';

class SoundManager {
  final AudioPlayer _correctAnswerPlayer = AudioPlayer();

  Future<void> init() async {
    await _correctAnswerPlayer.setAsset('images/CorrectSound.mp4');
  }

  void playCorrectAnswer() {
    _correctAnswerPlayer.seek(Duration.zero);
    _correctAnswerPlayer.play();
  }

  void dispose() {
    _correctAnswerPlayer.dispose();
  }
}