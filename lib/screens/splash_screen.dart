import 'package:flutter/material.dart';
import 'package:wallet/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(16),
     child: Column(
       children: [
      Spacer(),  
      Text('SaveYouMoney', style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight(500))),
      Text('Registra tus gastos', style: TextStyle(color: Colors.white)),
      Spacer(),  
      SizedBox(
        width: double.infinity,
        child:
         ElevatedButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.black),
          foregroundColor: WidgetStateProperty.all(Colors.white) ) 
          ,child: Text('Ingresar'))),
      SizedBox(height: 32),  
       ],
     ),
   );
  }
}