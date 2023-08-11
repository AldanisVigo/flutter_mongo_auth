import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HooksExample extends HookWidget {
  const HooksExample({super.key});


  @override
  Widget build(BuildContext context) {
    final counter = useState(0);

    return Scaffold(
      appBar: AppBar(
        title:  const Text("Hooks Example")
      ),
      body: Column(
        children: [
          Text("Count: ${counter.value}"),
          Row(
            children: [
              TextButton(
                child: const Text("-"),
                onPressed: ()=> counter.value--
                ,
              ),
              TextButton(
                child: const Text("+"),
                onPressed: ()=> counter.value++
              )
            ],
          )
        ],
      )
    );
  }
}