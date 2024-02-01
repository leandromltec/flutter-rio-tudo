import 'dart:async';
import 'dart:io';

import 'exception.dart';

class ValidateTypeException extends ValidateTypeExceptionInterface {
  @override
  typeException({response, error}) {
    if (response == null) {
      if (error.osError != null) {
        if (error.osError is OSError) {
          throw TimeoutException;
        }
      }
      //Timeout (serviço fora do ar)
    }

    if (response.statusCode == 404) {
      print('Error Occurred ${error.message}');
      //Erro de acesso a API
      throw FormatException;
    }
    if (response.statusCode == 200 && response.body == "[]" ||
        response.body == "") {
      print('Error Occurred ${error.message}');
      //Response retorna vazio (sem items no banco de dados)
      throw FormatException;
    }
  }
}
