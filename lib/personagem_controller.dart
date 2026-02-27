import 'dart:convert';

import 'package:get/get.dart';
import 'package:rick_morty_app/personagem_model.dart';
import 'package:http/http.dart' as http;

class PersonagemController extends GetxController {
  RxList<PersonagemModel> listaPersonagens = <PersonagemModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isDarkTheme = true.obs;

  int paginaAtual = 1;
  bool temProxPagina = true;

  @override
  void onInit() {
    super.onInit();

    buscarPersonagens();
  }

  buscarPersonagens() async {
    try {
      isLoading.value = true;

      String url = 'https://rickandmortyapi.com/api/character/?page=$paginaAtual';

      http.Response response;

      response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        temProxPagina = data['info']['next'] != null;

        List personagens = data['results'];

        for (var item in personagens) {
          listaPersonagens.add(PersonagemModel.fromJson(item));
        }
      }
    } catch (e) {
      print('>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
}
