class MoodTrackers {
  String moodText;
  String firstName = '';

  MoodTrackers({required this.moodText, required this.firstName});

  String get getName {
    return firstName;
  }

  set setName(String name) {
    firstName = name;
  }

  String get getMoodText {
    return moodText;
  }

  set setMoodText(String mood) {
    moodText = mood;
  }

  save() {
    print('$firstName');
  }
}
