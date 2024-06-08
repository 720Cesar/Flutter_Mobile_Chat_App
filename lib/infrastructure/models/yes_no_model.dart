import 'package:yes_no_app/domain/entities/message.dart';

// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

/**
 * ESTE ARCHIVO CUENTA CON UNA CLASE QUE HA SIDO COPIADA USANDO QUICKTYPE
 * PARA PODER OBTENER LA RESPUESTA DE LA API.
 * QUICKTYPE NOS AYUDA A OBTENER EL MAPEO PARA LA RESPUESTA
 */


class YesNoModel{

  String answer;
  bool forced;
  String image;

  YesNoModel({
      required this.answer,
      required this.forced,
      required this.image,
  });

    //Se ha cambiado el nombre de "fromJsonMap"
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
      answer: json["answer"],
      forced: json["forced"],
      image: json["image"],
  );

  Map<String, dynamic> toJson() => {
      "answer": answer,
      "forced": forced,
      "image": image,
  };

  //Creación de un Mappet para regresar la info
  Message toMessageEntity() =>Message(
    text: answer == 'yes' ? 'Si' : 'No', //Evalua la respuesta que se obtiene  
    fromWho: FromWho.theirs,
    imageURL: image,
  );

}