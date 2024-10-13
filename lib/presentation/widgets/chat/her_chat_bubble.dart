import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:
                  Text('Hola jhainey', style: TextStyle(color: Colors.white)))),
      const SizedBox(
        height: 5,
      ),
      //todo : imagen
      _ImageBubble(),
      const SizedBox(height: 10)
    ]);
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //saber las dimensiones del dispositivo
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          "https://yesno.wtf/assets/yes/4-c53643ecec77153eefb461e053fb4947.gif",
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
        ));
  }
}
