
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Register extends HookWidget {
  const Register({super.key});

  Form _registrationForm(
    BuildContext context,
    TextEditingController nameController, 
    TextEditingController emailController, 
    TextEditingController passwordController,
    TextEditingController passwordConfirmationController,
    GlobalKey formKey,
    Function formSubmissionCallback,
  ) => Form(
    key: formKey,
    child: Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            hintText: "Full Name",
          ),
          controller: nameController,
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: "Email"
          ),
          controller: emailController,
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: "Password"
          ),
          controller : passwordController,
          obscureText: true,
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: "Password Confirmation",
          ),
          controller: passwordConfirmationController,
          obscureText: true,
        ),
        TextButton(
          child: const Text("Register"),
          onPressed: () => formSubmissionCallback,
        ),
        TextButton(
          child: const Text("Cancel"),
          onPressed: () => Navigator.of(context).pop()
        )
      ],
    )
  );

  @override
  Widget build(BuildContext context) {
    // Create field controllers for the registration form
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordConfirmationController = useTextEditingController();

    // Geneate a key for the form
    final formKey = useMemoized(() =>  GlobalKey());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration")
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            _registrationForm(context,nameController, emailController, passwordController, passwordConfirmationController, formKey, ()=>{
              // Form submission callback
            })
          ],
        )
      )
    );
  }
}