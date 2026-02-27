import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_morty_app/personagem_controller.dart';
import 'package:rick_morty_app/personagem_model.dart';
import 'package:rick_morty_app/widgets/info_dialog.dart';

class PersonagemCard extends StatelessWidget {
  final PersonagemModel personagem;

  const PersonagemCard(this.personagem, {super.key});

  @override
  Widget build(BuildContext context) {
    final personagemController = Get.put(PersonagemController());
    return GestureDetector(
      onTap: () {
        // print(personagem.nome);
        showDialog(
          context: context,
          builder: (context) => InfoDialog(personagem),
        );
      },
      child: Obx(() => Container(
        color: personagemController.isDarkTheme.value ? Color(0xFF002626) : Color(0xFFEFE7DA),
        width: 300,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: personagemController.isDarkTheme.value ? Color(0xFFEFE7DA) : Color(0xFF006277),
                width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                personagem.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,

                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                },

                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.broken_image,
                      size: 40,
                      color: Colors.grey[600],
                    ),
                  );
                },
              ),

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
      ),
    );
  }
}
