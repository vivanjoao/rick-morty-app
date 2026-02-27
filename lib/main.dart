import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_morty_app/personagem_controller.dart';
import 'package:rick_morty_app/screens/tela_principal.dart';
import 'package:rick_morty_app/themes/temas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final personagemController = Get.put(PersonagemController());
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty App',
      theme: personagemController.isDarkTheme.value ? darkTheme : lightTheme,
      home: TelaPrincipal(),
    ),
    );
  }
}

