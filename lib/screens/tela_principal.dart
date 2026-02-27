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
      appBar: AppBar(
        title: Text("Rick and Morty World"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Obx(
              () => IconButton(
                icon: Icon(
                  personagemController.isDarkTheme.value
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded,
                ),
                onPressed: () {
                  personagemController.isDarkTheme.value =
                      !personagemController.isDarkTheme.value;
                },
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          // Logo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
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

          Obx(
            () => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: DividerTheme(
                  data: Theme.of(context).dividerTheme,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(1),
                    itemCount: personagemController.listaPersonagens.length + 1,
                    itemBuilder: (context, index) {
                      if (index <
                          personagemController.listaPersonagens.length) {
                        return PersonagemCard(
                          personagemController.listaPersonagens[index],
                        );
                      } else {
                        return Obx(
                          () =>
                              personagemController.isLoading.value
                                  ? Center(child: CircularProgressIndicator())
                                  : ElevatedButton(
                                    onPressed:
                                        personagemController.temProxPagina
                                            ? () {
                                              personagemController.paginaAtual++;
                                              personagemController
                                                  .buscarPersonagens();
                                            }
                                            : null,
                                    child: Text(
                                      personagemController.temProxPagina
                                          ? "Carregar mais"
                                          : "Sem mais Personagens",
                                    ),
                                  ),
                        );
                      }
                    },
                    separatorBuilder:
                        (context, int index) => Divider(thickness: 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
