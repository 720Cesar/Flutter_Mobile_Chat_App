import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

/**
 * ESTE ARCHIVO REALIZA PETICIONES HTTP A UNA API
 * SE INSTALÓ DIO PARA HACER PETICIONES HTTP
 */ 

class GetYesNoAnswer {

  final _dio = Dio(); 

  Future<Message> getAnswer() async{
    final response = await _dio.get("https://yesno.wtf/api");
    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    
    //Se retornan los valores que se obtienen de la API para el mensaje de la otra persona
    return yesNoModel.toMessageEntity(); 
  }

}