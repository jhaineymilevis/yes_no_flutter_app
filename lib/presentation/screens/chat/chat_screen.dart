import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entites/message.dart';
import 'package:yes_no_app/main.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_chat_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_buble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://media.vogue.mx/photos/5cfe891727998c247198c76d/2:3/w_2240,c_limit/GettyImages-1153799667.jpg'),
            ),
          ),
          title: const Text('Mi amor'),
          centerTitle: false,
        ),
        body: const _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context
        .watch<ChatProvider>(); //escucho los cambios de estado del provider

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatProvider.messageList.length,
              itemBuilder: (BuildContext context, int index) {
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.her)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
            ),
          ),
          //la caja de texto de mensajes
          MessageFieldBox(
            /*onValue: (String value) {
              chatProvider.sendMessage(value);
            },*/
            onValue: chatProvider
                .sendMessage, //esto es lo mismo que arriba pero simplificado, se puede hacer cuando se manda la misma cantidad de parametros que se recibe
          ),
        ]),
      ),
    );
  }
}
