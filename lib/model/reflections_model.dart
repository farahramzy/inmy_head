class ReflectionModel {
  String? question;

  ReflectionModel({this.question});

  ReflectionModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    return data;
  }
}
