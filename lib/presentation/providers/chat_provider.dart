import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entites/message.dart';

//manejador de estados usando la libreira provider
class ChatProvider extends ChangeNotifier {
//ChangeNotifier me notifica cambios
  List<Message> message = [
    Message(text: "Hola amor", fromWho: FromWho.me),
    Message(text: "¿Cómo estás?", fromWho: FromWho.me),
    Message(text: "Hola amor bien y tu?", fromWho: FromWho.her),
    Message(text: "Bien gracias", fromWho: FromWho.me),
    Message(text: "¿Qué te gustaría hacer hoy?", fromWho: FromWho.me),
    Message(text: "Pizza", fromWho: FromWho.her),
  ];

  Future<void> sendMessage(String text) async {
    //todo implement
  }
}
