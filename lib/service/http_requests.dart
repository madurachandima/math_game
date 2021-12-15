import 'package:http/http.dart' as http;

class HttpRequests {
  /*
*Get request 
*@param Url
*return response
*/
  Future getRequest(url) async {
    String httpUrl = "$url";
//Headers
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    //call get request
    var response = await http.get(Uri.parse(httpUrl), headers: headers);
    return response;
  }

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
    };

    //send request
    var response = await http.post(
      Uri.parse(httpUrl),
      headers: headers,
      body: data,
    );
    return response;
  }
}
