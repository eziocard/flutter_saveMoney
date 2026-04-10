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
                // LOGO
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
                  controller: _userController,
                ),

                SizedBox(height: 20),

                TextFieldComponent(
                  text: passwordHint,
                  icon: Icons.key,
                  controller: _passwordController,
                  password: true,
                ),

                SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.black),
                      foregroundColor:
                          WidgetStateProperty.all(Colors.white),
                    ),
                    onPressed: _handleLogin,
                    child: Text('Ingresar'),
                  ),
                ),

                SizedBox(height: 10),

                
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.orange),
                      foregroundColor:
                          WidgetStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: Text('Registrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}