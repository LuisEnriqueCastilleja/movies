import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:movies/api/api_exceptions.dart';

//Archivo donde manejo las peticiones que van a la API
class ApiBaseHelper {
  //Es la URL base, cuando implementas Flavors aqui se cambiaria para que cambie cuando sea
  //Production o Staging
  final String _baseUrl = 'https://api.themoviedb.org/3/';

//Metodo para mandar un GET a la API
  Future<dynamic> get(String url, [Map<String, String>? headers]) async {
    //Completamos la URL para hacer la peticion a la API
    var uri = Uri.parse(_baseUrl + url);
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    //Para guardar el response de la API

    try {
      //Hacemos la peticion GET a la API con los headers correspondientes
      final response = await http.get(uri, headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYjc4ZjMxODIyNWM4ZjQwZDY3NGUwNzExNzBmYThiZSIsIm5iZiI6MTcyMzU3NzQ3MS45MDYxOTMsInN1YiI6IjY2YmJiMjJjNThkNzcwNmVjNzJkNDA0YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AX3i8xKWWNx7chS2RrGwuvmQP1L8EhuS5zAxbfk4prU'
      });
      //Lo mandamos al metodo _returnResponse
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  Future<dynamic> update(String url, dynamic body) async {
    //Verificamos la conexion a internet
    var connectivityResult = await (Connectivity().checkConnectivity());
    //Completamos la URL
    var uri = Uri.parse(_baseUrl + url);
    //SI la conexion contiene none quiere decir que no tiene conexion a internet
    if (connectivityResult.contains(ConnectivityResult.none)) {
      try {
        //Hacemos el PUT a la API para actualizar algun dato
        final response = await http
            .put(uri, body: body != null ? json.encode(body) : null, headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json'
        });
        //Regresamos el response y aqui veremos si se realizo o no correctamete la edicion
        return response;
      } catch (error) {
        return error;
      }
    }
    //Regresamos que no hay conexion en el dado caso que no tenga conexion a internet
    return ConnectivityResult.none;
  }

  Future<dynamic> delete(String url) async {
    //Completamos la URL
    var uri = Uri.parse(_baseUrl + url);

    try {
      //Hacemos el Delete a la API con sus headers correspondientes
      final response = await http.delete(uri, headers: {
        HttpHeaders.acceptHeader: 'application/json',
      });
      //SI nos regresa un 200 quiere decir que se elimino correctamente el objeto o lo que queriamos que se eliminara
      if (response.statusCode == 200) {
        return true;
      }
      //Si regresa un 400 o algun otro status code quiere decir que no se elimino y regresamos el status code
      if (response.statusCode == 400) {
        return response.statusCode;
      }
    } catch (error) {
      return error;
    }
    return false;
  }

  Future<dynamic> post(String url, dynamic body) async {
    //Para verificar la conexion del dispositivo
    var connectivityResult = await (Connectivity().checkConnectivity());

    //Completamos la URL
    var uri = Uri.parse(_baseUrl + url);
    //SI la conexion contiene none quiere decir que no tiene conexion a internet
    if (connectivityResult.contains(ConnectivityResult.none)) {
      try {
        //Hacemos el post a la API, mandamos el body que recibimos y lo codificamos
        final response =
            await http.post(uri, body: json.encode(body), headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json'
        });
        //Regresamos la respuesta que nos manda la API
        return response;
      } catch (error) {
        return error;
      }
    }
    //Regresamos que no hay conexion en el dado caso que no tenga conexion a internet
    return ConnectivityResult.none;
  }

  dynamic _returnResponse(http.Response response) {
    //Verificamos el statusCode que tiene el response que nos devolvio la API
    switch (response.statusCode) {
      case 200:
        //Si es 200 el status code lo decodificamos el json para traernos el body
        var responseJson = json.decode(response.body.toString());
        //Devolvemos el body del Json
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorizeException(response.body.toString());
      case 403:
      default:
        throw FetchDataException(
            'Error Ocurred While Communication With Server With Status Code ${response.statusCode}');
    }
  }
}
