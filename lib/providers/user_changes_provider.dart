import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stageplug/providers/user_service.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class UserChangesProvider extends ChangeNotifier {
  final UserService userService;
  late User user;

  UserChangesProvider(this.userService);

  Future<Map<String,dynamic>> attemptLogin(String email, String password) async{
    print("Sending request to login...");
    // Send the login request using the userService
    http.Response response = await userService.attemptLogin(email, password);
    
    
    // Decode the body of the response into a map
    Map<String, dynamic> responseJson = jsonDecode(response.body);
    
    // Look for a success flag in the response
    if(!responseJson.keys.contains("success")){
      // Create a user using the incoming data
      print(responseJson);

      // 
      notifyListeners();
    }else{
      print(responseJson);
    }

    // and return it
    return responseJson;
  }
}