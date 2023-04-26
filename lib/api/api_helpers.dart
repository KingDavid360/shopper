import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Api {
  var client = http.Client();
  static var header = {'Content-Type': 'application/json'};

  Future post(String url, header, body, {FormData? multimediaRequest}) async {
    if (multimediaRequest == null) {
      try {
        http.Response res =
            await client.post(Uri.parse(url), headers: header, body: body);
        print(res.body);
        return res.body;
      } catch (e) {
        print(e);
      }
    } else {
      Dio dio = Dio();
      try {
        Response res = await dio.post(
          url,
          data: multimediaRequest,
          options: Options(
              method: "POST",
              contentType: "application/json",
              headers: header,
              responseType: ResponseType.plain),
        );
        print(res.data);
        print(res.statusCode);
        return res.data;
      } catch (e) {
        print(e);
      }
    }
  }

  Future get(String url, header) async {
    try {
      http.Response res;
      if (header != null) {
        res = await client.post(Uri.parse(url), headers: header);
      } else {
        res = await client.get(Uri.parse(url));
      }
      print(res.body);
      return res.body;
    } catch (e) {
      print(e);
    }
  }
}
