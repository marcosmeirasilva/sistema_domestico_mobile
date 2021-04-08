import 'package:sistema_domestico_mobile/login/usuario.dart';
import 'package:sistema_domestico_mobile/utils/api_response.dart';
import 'package:sistema_domestico_mobile/login/login_api.dart';
import 'package:sistema_domestico_mobile/utils/simple_bloc.dart';

class LoginBloc extends BooleanBloc {
  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    add(true);

    ApiResponse response = await LoginApi.login(login, senha);

    add(false);

    return response;
  }
}
