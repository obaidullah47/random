import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:random/common/error/app_exceptions.dart';
import 'package:random/data/Network/base_api_service.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    try {
      final res = await http
          .get(Uri.parse(url), headers: {'Content-Type': 'application/json'})
          .timeout(Duration(seconds: 8));
      return returnResponse(res);
    } on SocketException {
      throw FetchDataException(message: "No internet Connection");
    } on TimeoutException {
      throw FetchDataException(message: "Time out ");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    try {
      final res = await http
          .post(
            Uri.parse(url),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(data),
          )
          .timeout(Duration(seconds: 8));
      return returnResponse(res);
    } on SocketException {
      throw FetchDataException(message: "NO internet connection ");
    } on TimeoutException {
      throw FetchDataException(message: "Request timeout");
    } catch (e) {
      rethrow;
    }
  }
}

dynamic returnResponse(http.Response res) {
  switch (res.statusCode) {
    case 200:
    case 201:
    case 202:
      return jsonDecode(res.body);
    case 400:
    case 401:
      throw InvalidRequestException();
    case 500:
    case 501:
      throw DatabaseException();
    default:
      throw FetchDataException(
        message: "Error Occured while communicating with  the server",
      );
  }
}
