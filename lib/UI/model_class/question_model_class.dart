class Questions {
  String? id;
  String? teacherId;
  String? question;
  String? answer;
  String? option1;
  String? option2;
  String? option3;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<String>? myOptionsList = [];
  String? selectAnswer;

  Questions(
      {this.id,
        this.teacherId,
        this.question,
        this.answer,
        this.option1,
        this.option2,
        this.option3,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.myOptionsList});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherId = json['teacher_id'];
    question = json['question'];
    answer = json['answer'];
    option1 = json['option_1'];
    option2 = json['option_2'];
    option3 = json['option_3'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    myOptionsList!.addAll([json['option_1'],json['option_2'],json['option_3'],json['answer']]);
    myOptionsList!.shuffle();
    selectAnswer =json['select_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['teacher_id'] = this.teacherId;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['option_1'] = this.option1;
    data['option_2'] = this.option2;
    data['option_3'] = this.option3;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}