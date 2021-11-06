import 'package:http/http.dart' as http;

Future getRequest(url) async {
  String httpUrl = "$url";
  print("get_url $httpUrl");

  //print("token $token");
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    //'Authorization': 'Bearer $token'
  };
  var response = await http.get(Uri.parse(httpUrl), headers: headers);
  return response;
}
