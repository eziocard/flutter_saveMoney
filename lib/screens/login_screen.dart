import 'package:flutter/material.dart';
import 'package:wallet/components/buttonWidget.dart';
import 'package:wallet/components/texfield.dart';
import 'package:wallet/screens/dashboard_screen.dart';
import 'package:wallet/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String usernameHint = 'Usuario';
  String passwordHint = 'Contraseña';
  void _handleLogin() {
    print('Usuario: ${userController.text}');
    print('Contraseña: ${passwordController.text}');


     if (userController.text == 'ricardo' && passwordController.text == '1234') {
        Navigator.push(context,MaterialPageRoute(builder: (context) => DashboardScreen(username: userController.text)));
  } else {
      setState(() {
      usernameHint = 'Usuario incorrecto';
      passwordHint = 'Contraseña incorrecta';
    });
  }
  }
  
 @override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return Scaffold(
    backgroundColor: Colors.amber,
    body: SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.08,
              vertical: size.height * 0.08,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                SizedBox(
                  height: size.height * 0.2,
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                Text(
                  'Iniciar Sesión',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: size.height * 0.04),

              
                TextFieldComponent(
                  text: usernameHint,
                  icon: Icons.account_box,
                  controller: userController,
                ),

                SizedBox(height: 20),

                TextFieldComponent(
                  text: passwordHint,
                  icon: Icons.key,
                  controller: passwordController,
                  password: true,
                ),

                SizedBox(height: 30),

                Buttonwidget(text: 'Ingresar', onPressed: _handleLogin),

                SizedBox(height: 10),
                
               Buttonwidget(text: 'Registrar',type: ButtonType.secondary, onPressed: (){Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );})
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}