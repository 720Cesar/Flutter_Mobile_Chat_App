import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class OtherMessageBubble extends StatelessWidget {

  final Message message;

  const OtherMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    //Permite usar la paleta de colores creada antes
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20) 
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: TextStyle(color: Colors.white),),
          ),
        ),

        const SizedBox(height: 5),

        //Ahora se recibe el "message.imageURL" para poder mostrar la imagen
        _ImageBubble(message.imageURL!),  //Se agrega "!" para indicar que puede ser nulo

        const SizedBox(height: 10,)

        //Todo: imagen
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  
  //Se declara una variable cualquiera para recibir en la clase como argumento
  final String imgURL; 
  const _ImageBubble(this.imgURL);

  @override
  Widget build(BuildContext context) {    

    //Permite obtener propiedades del dispositivo que está corriendo, en este caso el tamaño
    final size = MediaQuery.of(context).size;

    //Devuelve una imagen de una API
    return ClipRRect(
      
      borderRadius: BorderRadius.circular(20),
      child: Image.network(imgURL,
      width: size.width*0.7,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if(loadingProgress == null) return child; //Regresa la imagen si se cumple la condición

        //Regresa el contenedor de la imagen
        return Container(
          width: size.width * 0.7,
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Text("Loading image"),
        );
      },
    ));
  }
}