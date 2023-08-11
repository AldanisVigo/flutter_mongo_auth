import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  // Constructor
  UserService();

  /*
    Send a login request to the server
  */
  Future<http.Response> attemptLogin(String email, String password) async {
    // Get a string with the endpoint for the login route
    String endpoint = "http://localhost:3001/attemptLogin";

    // Generate a URI by parsing the endpoint string
    Uri uri = Uri.parse(endpoint);
    
    Map<String, String> data = {
      // Data here.
      "email" : email,
      "password" : password
    };

    // Generate the post request and return the http.Response
    return http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
  }
}