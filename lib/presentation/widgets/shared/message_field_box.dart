import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String>
      onValue; //recibo la funcion que se va a ejecutar en el submit
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();
    // Create a TextEditingController to handle text input.
    final textEditingController = TextEditingController();
    // Create a border to give the input field a border style.
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a ??',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textEditingController.value.text;

          textEditingController.clear(); //con esto limpio el campo de texto
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      focusNode: focusNode,
      controller: textEditingController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textEditingController.clear(); //con esto limpio el campo de texto
        focusNode
            .requestFocus(); //recupero el foco en el campo despues dle submit
        onValue(value);
      },
      onTapOutside: (event) {
        focusNode.unfocus(); //elimina el foco del campo cuando clico por fuera
      },
    );
  }
}
