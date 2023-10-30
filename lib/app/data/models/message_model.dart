// ignore_for_file: public_member_api_docs, sort_constructors_first
class MessageModel {
  String id;
  String message;
  String date;
  MessageModel({
    required this.id,
    required this.message,
    required this.date,
  });

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'message': message,
  //     'date': date,
  //   };
  // }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'message': message,
      'date': date,
    };

    json['id'] = id;

    return json;
  }

  factory MessageModel.fromMap(Map<String, dynamic> map, String id) {
    return MessageModel(
      message: map['message'] as String,
      date: map['date'] as String,
      id: map['id'] ?? '',
    );
  }
}
