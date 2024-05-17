class GameQuestions {
  const GameQuestions(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle(); // Data Structures Implementation.
    return shuffledList;
  }
}
