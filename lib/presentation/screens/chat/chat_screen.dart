import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_chat_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_buble.dart';

class ChatScreen extends StatelessWidget{
const ChatScreen ({super.key});

@override
Widget build(BuildContext context){
  return  Scaffold(
        appBar: AppBar(
          leading : const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://media.vogue.mx/photos/5cfe891727998c247198c76d/2:3/w_2240,c_limit/GettyImages-1153799667.jpg'),
            ),
          ),
          title: const Text('Mi amor'),
          centerTitle: false,
        ),
        body: const _ChatView()
       
      );
}

}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children:[
            Expanded(
              child:ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {

                return (index%2==0) ? const HerMessageBubble(): const MyMessageBubble();
              },
            ),),
            Text('Hola'),
         
          ]
        ),
      ),
    );
  }
}