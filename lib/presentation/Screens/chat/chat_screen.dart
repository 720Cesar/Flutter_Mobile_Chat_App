import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/Screens/settings/settings_screen.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/other_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4.7), //Padding para la imagen del usuario
            child: CircleAvatar(
              //Se obtiene una imagen desde Internet 
              backgroundImage: NetworkImage("https://i.pinimg.com/474x/4d/a2/cf/4da2cfe9e0fbcc9b4d58d29113b77e3b.jpg"),
            ),
          ),
          title: const Text("Reales :0"),
          centerTitle: false,
          actions: [
            PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                  children: [
                      Icon(Icons.settings),
                      SizedBox(width: 8),
                      Text('Settings'),
                    ],
                  ),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                  children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8),
                      Text('Exit'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: _ChatView(),
        
    );
  }
}

void onSelected(BuildContext context, int item){
  switch (item) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SettingsScreen())
    );
    break;
  }
}

//CREACIÓN DEL WIDGET
class _ChatView extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {

    //Se llama al provider. Se hace la instancia al chatProvider
    final chatProvider = context.watch<ChatProvider>(); 


    return SafeArea( //Widget que permite un "área segura" según las dimensiones del télefono
      child: Padding(
        //Crea un padding simétrico horizontal que afecta únicamente los lados del contenedor
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [ //Aquí se crea un espacio debajo de la Appbar 
            Expanded(
              //builder indica que se construye un widget durante el tiempo de ejecución cuando se necesiten
              child: ListView.builder(
                //Se vincula con el Provider para el ListView
                controller: chatProvider.chatScrollController,
                //Recibe el número de mensajes a partir del chatProvider
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  //Retorna si el mensaje es mío o de la otra persona
                  return (message.fromWho == FromWho.theirs)
                    ? OtherMessageBubble( message: message )
                    : MyMessageBubble( message: message,); //message accede a los valores en la lista

              })),
            //CAJA DE TEXTO
            MessageFieldBox(
              //onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage, //Permite enviar el mensaje 
            ), 
          ],
        ),
      ),
    );
  }
}