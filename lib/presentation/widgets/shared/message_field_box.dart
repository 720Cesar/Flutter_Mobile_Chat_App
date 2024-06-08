import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {


  
  final ValueChanged<String> onValue; 

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode(); //Permite que un elemento tenga un foco
    

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
        hintText: "End your message with an '?'",
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: (){
            final textValue = textController.value.text; //Obtiene el texto de la caja
            onValue(textValue);
            textController.clear();
          }
        ),
      );

    return TextFormField(
      onTapOutside: (event){ //Permite quitar el focus si se da clic fuera del teclado
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value){
        onValue(value); //Regresa el valor del texto de la caja de texto
        textController.clear();
        focusNode.requestFocus(); //Permite que no se cierre el teclado al enviar el mensaje
      },
    );
  }
}