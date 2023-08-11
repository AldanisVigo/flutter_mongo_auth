import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Dashboard extends HookWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
}