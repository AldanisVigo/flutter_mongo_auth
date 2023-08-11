import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stageplug/providers/user_service.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class UserChangesProvider extends ChangeNotifier {
  final UserService userService;
  late User user;
  bool loggedIn = false;
  UserChangesProvider(this.userService);

  Future<Map<String,dynamic>> attemptLogin(String email, String password) async{
    print("Sending request to login...");
    // Send the login request using the userService
    http.Response response = await userService.attemptLogin(email, password);
    
    
    // Decode the body of the response into a map
    Map<String, dynamic> responseJson = jsonDecode(response.body);
    
    // Look for a success flag in the response
    if(responseJson.keys.contains("success")){
      print("Successfully logged in:");
      print(responseJson);

      loggedIn = true;

      // Let views know we're logged in.
      notifyListeners();

      // Create a user using the incoming data
      return responseJson;
    }else{
      return { 
        "error" : "Failed logging in."
      };
    }

    // and return it
    return responseJson;
  }
}