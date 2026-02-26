import 'package:flutter/material.dart';
import 'package:rick_morty_app/personagem_controller.dart';
import 'package:rick_morty_app/widgets/personagem_card.dart';

import '../personagem_model.dart';

import 'package:get/get.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final personagemController = Get.put(PersonagemController());

    return Scaffold(
      appBar: AppBar(title: Text("Rick and Morty World"), centerTitle: true),

      body: Column(
        children: [
          // Logo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Image.asset(
                    'assets/rickmorty.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),

          Obx(() => Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: personagemController.listaPersonagens.length > 0 ? ListView.separated(
                padding: const EdgeInsets.all(1),
                itemCount: personagemController.listaPersonagens.length ?? 0,
                itemBuilder:
                    (_, index) => PersonagemCard(personagemController.listaPersonagens[index]),
                separatorBuilder:
                    (context, int index) => Divider(color: Theme.of(context).dividerColor, thickness: 1,),
              ) : SizedBox(),
            ),
          ),

          ),

        ],
      ),
    );
  }
}
