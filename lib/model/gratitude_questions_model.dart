class GratitudeQuestions {
  String? question;

  GratitudeQuestions({this.question});

  GratitudeQuestions.fromJson(Map<String, dynamic> json) {
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    return data;
  }
}
