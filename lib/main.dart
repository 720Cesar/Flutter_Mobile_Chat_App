//mateapp -> Pone el esqueleto base de la app

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/Screens/chat/chat_screen.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //MultiProvider permite compartir información a lo largo de la app
    return MultiProvider(
      providers: [
        //EL "_" permite que no importe el argumento
        //Básicamente permite que toda la app pueda tener acceso a la información del provider
        //Al ponerla en Main, se permite a toda la app porque es el nivel más alto
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false, //Evita mostrar la etiqueta debug
        theme: AppTheme(selectedColor: 6).theme(), //Instancia que permite obtener el tema desde otro archivo
        home: const ChatScreen()
      ),
    );
  }
}