import 'package:http/http.dart' as http;

/*
*postRequest
*@param data
*@param url
*retuen response
*/
Future postRequest(data, url) async {
  String httpUrl = "$url";

  // Headers
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': 'Bearer $token'
  };

  //send request
  var response = await http.post(
    Uri.parse(httpUrl),
    headers: headers,
    body: data,
  );
  return response;
}
