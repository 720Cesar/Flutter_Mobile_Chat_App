import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

//Puede notificar cuando hay cambios con ChangeNotifier
class ChatProvider extends ChangeNotifier{

  
  //Se agrega una variable para controlar el Scroll
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    /*
    Message(text: "Hola", fromWho: FromWho.mine),
    Message(text: "Me das de ese chocolate?", fromWho: FromWho.mine)
    */
  ];


  //Función asíncrona que envia el mensaje
  Future<void> sendMessage( String text) async {

    //Se recibe el mensaje nuevo con el texto e indicando que siempre es mío
    if(text.isEmpty) return; //No envia el mensaje en caso de que no haya texto
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messageList.add(newMessage); //Se añade el mensaje nuevo a la lista de mensajes

    if( text.endsWith("?")){
      theirReply();
    }

    notifyListeners(); //Reemplaza a setState({}) para los cambios desde el provider
    moveScrollToBottom(); //Se añade la animación

  }

  Future<void> theirReply() async{
    final theirMessage = await getYesNoAnswer.getAnswer(); //Obtiene el mensaje del otro 
  
    messageList.add(theirMessage);
    notifyListeners();
    moveScrollToBottom();
  
  }

  //Clase que mueve el Scroll hasta el final del ListView
  Future<void> moveScrollToBottom() async{

    await Future.delayed(const Duration(milliseconds: 100)); //Espera a que se ejecute un poco la animación

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, //Indica que se quiere ir a lo máximo del Scroll posible 
      duration: const Duration(milliseconds: 300), //Duración de la animación 
      curve: Curves.easeOut //Establece el tipo de animación
    );
  }

}