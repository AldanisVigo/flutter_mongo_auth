import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';
import '../providers/user_changes_provider.dart';

class Login extends HookWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    // Create two fields for the email and password
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    attemptLogingIn(UserChangesProvider userChangesProvider) async {
      if (formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please wait while we attempt to log you in.')),
        );

        try {
          // Send the login request.
          userChangesProvider.attemptLogin(emailController.text, passwordController.text).then((Map<String,dynamic> response){
            if(response.keys.contains("success")){
              if(response['success'] == true){
                Navigator.of(context).pushNamed("/dashboard");
              }
            }else{
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Found an error while attempting to log you in."),
                )
              );
            }
          });
        }catch(err){
          String msg = err.toString();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Found an error while attempting to log you in."),
            )
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: $msg')
            )
          );
        }
      }
    }

    checkPasswordIsValid(value) {
      /*
        r'^
          (?=.*[A-Z])       // should contain at least one upper case
          (?=.*[a-z])       // should contain at least one lower case
          (?=.*?[0-9])      // should contain at least one digit
          (?=.*?[!@#\$&*~]) // should contain at least one Special character
          .{8,}             // Must be at least 8 characters in length  
        $
      */
      RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
      if (value.isEmpty) {
        return false;
      } else {
        if (!regex.hasMatch(value)) {
          return false;
        } else {
          return true;
        }
      }
    }

    return Consumer<UserChangesProvider>(
      builder: (context,userChangesProvider,child)=> 
      // If there's a user present in the user changes provider display the dashboard

      // If there's no user present in the user changes provider display the login ui
      Scaffold(
        appBar: AppBar(
          title: const Text("StagePlug")
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key : formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Email Address"
                  ),
                  controller : emailController, 
                  validator : (value) {
                    // Check that the email address is not empty
                    if (value == null || value.isEmpty) {
                      return 'The email field is empty.';
                    }else if(!EmailValidator.validate(value)){
                      return "The email address provided is invalid.";
                    }

                    return null;
                  }
                ),
                TextFormField(
                  controller : passwordController,
                  obscureText: true,
                  validator : (value) {
                    // Check that the password is not empty
                    if(value == null || value.isEmpty) {
                      return "Please enter a valid password.";
                    }else if(!checkPasswordIsValid(value)){
                      // Show a snackbar with the password instructions
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Valid passwords include 1 uppercase letter, 1 lowercase letter, 1 digit, 1 special character and must be at least 8 characters long."),
                            duration: Duration(seconds: 10),
                          )
                      );
                      // And show a validation error message.
                      return "The password is invalid.";
                    }
                    return null;
                  }
                ),
                const SizedBox(height: 10),
                TextButton(
                  child: const Text("Login"),
                  onPressed: ()=> attemptLogingIn(userChangesProvider)
                ),
                TextButton(
                  child: const Text("Register"),
                  onPressed: ()=> Navigator.of(context).pushNamed("/register")
                )
              ],
            ),
          ),
        )
      )
    );
  }
}