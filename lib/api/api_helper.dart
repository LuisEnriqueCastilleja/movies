import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:movies/api/api_exceptions.dart';

class ApiBaseHelper {
  final String _baseUrl = 'https://api.themoviedb.org/3/';

  Future<dynamic> get(String url, [Map<String, String>? headers]) async {
    var uri = Uri.parse(_baseUrl + url);
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;

    try {
      final response = await http.get(uri, headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYjc4ZjMxODIyNWM4ZjQwZDY3NGUwNzExNzBmYThiZSIsIm5iZiI6MTcyMzU3NzQ3MS45MDYxOTMsInN1YiI6IjY2YmJiMjJjNThkNzcwNmVjNzJkNDA0YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AX3i8xKWWNx7chS2RrGwuvmQP1L8EhuS5zAxbfk4prU'
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  Future<dynamic> update(String url, dynamic body) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    var uri = Uri.parse(_baseUrl + url);
    if (connectivityResult.contains(ConnectivityResult.none)) {
      try {
        final response = await http
            .put(uri, body: body != null ? json.encode(body) : null, headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json'
        });
        return response;
      } catch (error) {
        return error;
      }
    }
    return ConnectivityResult.none;
  }

  Future<dynamic> delete(String url) async {
    var uri = Uri.parse(_baseUrl + url);

    try {
      final response = await http.delete(uri, headers: {
        HttpHeaders.acceptHeader: 'application/json',
      });
      if (response.statusCode == 200) {
        return true;
      }
      if (response.statusCode == 400) {
        return response.statusCode;
      }
    } catch (error) {
      return error;
    }
    return false;
  }

  Future<dynamic> post(String url, dynamic body) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    var uri = Uri.parse(_baseUrl + url);
    if (connectivityResult.contains(ConnectivityResult.none)) {
      try {
        final response =
            await http.post(uri, body: json.encode(body), headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json'
        });
        return response;
      } catch (error) {
        return error;
      }
    }
    return ConnectivityResult.none;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
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
