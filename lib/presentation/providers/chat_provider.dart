import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entites/message.dart';

//manejador de estados usando la libreira provider
class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
//ChangeNotifier me notifica cambios
  List<Message> messageList = [
    Message(text: "Hola amor", fromWho: FromWho.me),
    Message(text: "¿Cómo estás?", fromWho: FromWho.me),
    Message(text: "Hola amor bien y tu?", fromWho: FromWho.her),
    Message(text: "Bien gracias", fromWho: FromWho.me),
    Message(text: "¿Qué te gustaría hacer hoy?", fromWho: FromWho.me),
    Message(text: "Pizza", fromWho: FromWho.her),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return; //valido que no puedas enviar emnsajes vacios
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    notifyListeners(); // notifica los cambios para que se redbuje la lista
    momveScrollToBottom();
  }

/**
 * Muevo el scroll hacia abajo
 */
  Future<void> momveScrollToBottom() async {
    await Future.delayed(const Duration(
        microseconds: 100)); //retraso el scroll para dar una mejor sensacion
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
