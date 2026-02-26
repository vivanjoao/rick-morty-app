import 'package:flutter/material.dart';
import 'package:rick_morty_app/personagem_model.dart';
import 'package:rick_morty_app/widgets/info_dialog.dart';

class PersonagemCard extends StatelessWidget {
  final PersonagemModel personagem;

  const PersonagemCard(this.personagem, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print(personagem.nome);
        showDialog(
          context: context,
          builder: (context) => InfoDialog(personagem),
        );
      },
      child: Container(
        color: Color(0xFF306740),
        width: 300,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFF0E14A), width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(personagem.image, width: 100, height: 100),

              Expanded(
                child: ListTile(
                  title: Text(
                    personagem.nome,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    personagem.status,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
