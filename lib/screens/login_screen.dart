import 'package:flutter/material.dart';
import 'package:wallet/components/texfield.dart';
import 'package:wallet/screens/dashboard_screen.dart';
import 'package:wallet/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String usernameHint = 'Usuario';
  String passwordHint = 'Contraseña';
  void _handleLogin() {
    print('Usuario: ${_userController.text}');
    print('Contraseña: ${_passwordController.text}');


     if (_userController.text == 'ricardo' && _passwordController.text == '1234') {
        Navigator.push(context,MaterialPageRoute(builder: (context) => DashboardScreen(username: _userController.text)));
  } else {
      setState(() {
      usernameHint = 'Usuario incorrecto';
      passwordHint = 'Contraseña incorrecta';
    });
  }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.amber,
     body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
      height: 200,
      width: 100,
      child: Column(
      children: [
        Image.asset('assets/images/logo.jpg',height: 150,),
      ],
    )
    ),
      Text('Iniciar Sesion',style: TextStyle(fontSize: 50,fontWeight: FontWeight(600)),),
      SizedBox(height: 32,),
        Padding(
          padding: EdgeInsets.only(left: 20,right: 20),
            child:TextFieldComponent(text: usernameHint,icon: Icons.account_box,controller: _userController,),
        ),
        SizedBox(height: 32,),
        Padding(
          padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
            child: TextFieldComponent(text: passwordHint,icon:Icons.key,controller: _passwordController,password: true,),
        ),
         ElevatedButton(
           style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.black),
          foregroundColor: WidgetStateProperty.all(Colors.white) ) ,
              onPressed: _handleLogin,
              child: Text('Ingresar'),
            ),
            ElevatedButton(
           style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.orange),
          foregroundColor: WidgetStateProperty.all(Colors.white) ) ,
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));},
              child: Text('Registrar'),
            ),
          
    ],
  ),
),
    );
  }
}