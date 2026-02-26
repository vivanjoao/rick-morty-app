import 'package:get/get.dart';
import 'package:rick_morty_app/personagem_model.dart';
import 'package:http/http.dart' as http;

class PersonagemController extends GetxController {
  late RxList<PersonagemModel> listaPersonagens;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    buscarPersonagens();
  }

  buscarPersonagens() async {
    try {
      isLoading.value = true;

      String url = 'https://rickandmortyapi.com/api/character';

      http.Response response;

      response = await http.get(Uri.parse(url));

      if (response.statusCode == 200 ) {
        print('>>>>>>>${response.body.toString()}');
      }

    } catch (e) {
      print('>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
}
