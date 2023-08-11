import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:stageplug/providers/user_changes_provider.dart';

class Dashboard extends HookWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserChangesProvider>(
      builder: (context, userChangesProvider, child){
        return userChangesProvider.loggedIn == false ? Scaffold(
          appBar: AppBar(title: const Text("Unauthorized")),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Text("You are not authorized to view this content."),
                TextButton(
                  child: const Text("Login"),
                  onPressed: ()=> Navigator.of(context).pop(),
                )
              ],
            )
          )
        ) :
        Scaffold(
          appBar: AppBar(
            title: const Text("Dashboard")
          ),
          body : const SingleChildScrollView(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                Text("Dashboard body")
              ],
            )
          )
        );
      }
    );
  }
}