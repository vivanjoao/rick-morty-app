import 'package:flutter/material.dart';
import 'package:rick_morty_app/personagem_model.dart';

class InfoDialog extends StatelessWidget {
  final PersonagemModel personagem;

  const InfoDialog(this.personagem, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      title: Image.network(personagem.image, width: 180, height: 180),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(personagem.nome, style: Theme.of(context).textTheme.headlineMedium),
            Divider(),
            Text(
              personagem.status,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Divider(),
            Text(
              personagem.especies,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Divider(),
            Text(
              personagem.gender,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Divider(),
            Text(personagem.type, style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}
