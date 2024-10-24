import 'dart:convert';

class Server {

}

class Client{

}

class Message {
  final int id;
  final String message;

  Message({required this.id, required this.message});
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'message': message,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] as int,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source) as Map<String, dynamic>);
}
