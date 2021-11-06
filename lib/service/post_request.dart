import 'package:http/http.dart' as http;

Future postRequest(data, url) async {
  String httpUrl = "$url";

  // var length = jsonEncode(data).length;
  // print(jsonEncode(data));
//'Content-Length': length.toString(),

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': 'Bearer $token'
  };

  var response = await http.post(
    Uri.parse(httpUrl),
    headers: headers,
    body: data,
  );
  return response;
}
