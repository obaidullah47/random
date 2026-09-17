import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random/common/error/app_exceptions.dart';
import 'package:random/data/Network/base_api_service.dart';

class NetworkApiService extends BaseApiService {
  Future<dynamic> getApi(String url) async {
    dynamic jsonresponse;
    try {
      final res = await http.get(Uri.parse(url)).timeout(Duration(seconds: 8));
      jsonresponse = returnResponse(res);
    } catch (e) {}
  }

  @override
  Future<dynamic> postApi(String url, data) {
    // TODO: implement postApi
    throw UnimplementedError();
  }
}

dynamic returnResponse(http.Response res) {
  switch (res.statusCode) {
    case 200:
    case 201:
    case 202:
      dynamic jsonresponse = jsonDecode(res.body);
      return jsonresponse;
    case 400:
    case 401:
      return InvalidRequestException();
    case 500:
    case 501:
      return DatabaseException();
    default:
      return FetchDataException(
        message: "Error Occured while communicating with  the server",
      );
  }
}
