import 'package:http/http.dart' as http;
import 'package:random/data/Network/base_api_service.dart';

class NetworkApiService extends BaseApiService {
  Future<dynamic> getApi(String url) async {
    dynamic jsonresponse;
    try {
      final res = await http.get(Uri.parse(url));
    } catch (e) {}
  }

  @override
  Future<dynamic> postApi(String url, data) {
    // TODO: implement postApi
    throw UnimplementedError();
  }
}
