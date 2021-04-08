import 'package:sistema_domestico_mobile/login/usuario.dart';
import 'package:sistema_domestico_mobile/usuarios/usuarios_api.dart';
import 'package:sistema_domestico_mobile/utils/api_response.dart';
import 'package:sistema_domestico_mobile/utils/simple_bloc.dart';

class UsuariosBloc extends SimpleBloc<List<Usuario>> {
  Future<List<Usuario>> buscarUsuarios() async {
    try {
      ApiResponse response = await UsuariosApi.pegarUsuarios();

      if (response.confirma) {
        print("a1111 4");

        add(response.result);

        return response.result;
      } else {
        print("a1111 5");

        addError(response.msg);
      }
    } catch (e) {
      print("a1111 6");

      print("Gruta erro no catch:   $e");
      addError(e);
    }

    return null;
  }
}
