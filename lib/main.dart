import 'package:flutter/material.dart';
import 'routes/login.dart';
import 'routes/register.dart';
import 'package:provider/provider.dart';
import 'providers/user_changes_provider.dart';
import './providers/user_service.dart';
import './routes/dashboard.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserChangesProvider(UserService()))
  ],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StagePlug',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes : {
        "/" : (context) => const Login(),
        "/register" : (context) => const Register(),
        '/dashboard' : (context) => const Dashboard()
      },
      theme: ThemeData(
        colorScheme: const ColorScheme.dark()
      ),
      
    );
  }
}

