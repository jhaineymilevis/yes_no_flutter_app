import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entites/message.dart';

//manejador de estados usando la libreira provider
class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
//ChangeNotifier me notifica cambios
  List<Message> messageList = [
    Message(text: "Hola amor", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return; //valido que no puedas enviar emnsajes vacios
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith("?")) {
      herReply();
    }
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

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    momveScrollToBottom();
  }
}
