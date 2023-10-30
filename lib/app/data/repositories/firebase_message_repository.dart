import 'package:gasto_certo/app/data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseMessageRepository {
  static Future<MessageModel> addMessage(MessageModel messageModel) async {
    DocumentReference documentReference = await FirebaseFirestore.instance
        .collection('notification')
        .add(messageModel.toJson());

    messageModel.id = documentReference.id;
    return messageModel;
  }

  static Future<List<MessageModel>> getMessage() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('notification').get();
    List<MessageModel> messages = [];

    // Checking if the document exists
    // ignore: avoid_function_literals_in_foreach_calls
    querySnapshot.docs.forEach((element) {
      messages.add(MessageModel.fromMap(
          element.data() as Map<String, dynamic>, element.id));
    });
    // Adding the message to the list

    return messages;
  }
}
