import 'dart:convert' as convert;
import 'package:sistema_domestico_mobile/login/usuario.dart';
import 'package:sistema_domestico_mobile/utils/api_response.dart';
import 'package:sistema_domestico_mobile/utils/http_helper.dart' as http;

class UsuariosApi {
  static Future<ApiResponse<List<Usuario>>> pegarUsuarios() async {
    var url = Uri.parse(
        'https://www.osacerdote.com.br/sistemadomesticoweb/api/usuarios_api/mostrar_usuario_api');

    var response = await http.get(url);

    String json = response.body;

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    print("Gruta o sjon é do tipo? :  $json");
    String jsonTokenExpirado = '{"error":"Token expirado"}';
    String jsonTokenInvalido = '{"error":"Token invalido"}';
    String jsonTokenIncorreto = '{"error":"Token incorreto"}';

    if (json == jsonTokenExpirado) {
      print("a1111 1");
      Usuario.clear();
      return ApiResponse.error("Token expirado");
    }

    if (json == jsonTokenInvalido) {
      print("a1111 2");
      Usuario.clear();
      return ApiResponse.error("Token invalido");
    }
    if (json == jsonTokenIncorreto) {
      print("a1111 8");
      Usuario.clear();
      return ApiResponse.error("Token incorreto");
    }

/*
    Map tokenExpirado = convert.json.decode(response.body);
    print("Gruta token erro ${tokenExpirado["error"]}");

// Se houver um erro no token eu apgado o usuário para fazer um novo login.
    if (tokenExpirado["error"] != null) {
      print("Gruta token expirado");
      Usuario.clear();
    }
*/
    print("a1111 3");

    List lista = convert.json.decode(json);

    List<Usuario> usuarios =
        lista.map<Usuario>((json) => Usuario.fromJson(json)).toList();

    return ApiResponse.ok(usuarios);
  }
}
