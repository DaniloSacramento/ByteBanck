import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/models/models.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('Request');
    print('url:  ${data.toHttpRequest().toString()}');
    print('headers: ${data.headers.toString()}');
    print('body: ${data.body.toString()}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('Response');
    print('status code: ${data.statusCode}');
    print('headers: ${data.headers.toString()}');
    print('body: ${data.body.toString()}');
    return data;
  }
}
