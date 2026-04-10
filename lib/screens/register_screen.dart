import 'package:flutter/material.dart';
import 'package:wallet/components/texfield.dart';
import 'package:wallet/screens/dashboard_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _genero;
  bool _isChecked = false;

  void _handleRegister() {
      if (_nameController.text.isEmpty ||
      _lastnameController.text.isEmpty ||
      _userController.text.isEmpty ||
      _passwordController.text.isEmpty ||
      _genero == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Por favor completa todos los campos'),
        backgroundColor: Colors.red,
      ),
    );
    return; 
  }
    print('Nombre: ${_nameController.text}');
    print('Apellido: ${_lastnameController.text}');
    print('Usuario: ${_userController.text}');
    print('Contraseña: ${_passwordController.text}');
    print('Genero: $_genero');

    if (!_isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Debes aceptar los términos')),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardScreen(
          username: _userController.text,
          name: _nameController.text,
          lastname: _lastnameController.text,
          genero: _genero,
        ),
      ),
    );
  }

  @override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return Scaffold(
    appBar: AppBar(
      title: Text('Registro'),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    backgroundColor: Colors.amber,
    body: SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.08,
              vertical: size.height * 0.05,
            ),
            child: Column(
              children: [
                Text(
                  'Crear Cuenta',
                  style: TextStyle(
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: size.height * 0.04),

                TextFieldComponent(
                  text: 'Ingresa tu Nombre',
                  password: false,
                  controller: _nameController,
                  icon: Icons.person,
                ),
                SizedBox(height: 10),

                TextFieldComponent(
                  text: 'Apellido',
                  password: false,
                  controller: _lastnameController,
                  icon: Icons.person,
                ),
                SizedBox(height: 10),

                TextFieldComponent(
                  text: 'Nombre de usuario',
                  password: false,
                  controller: _userController,
                  icon: Icons.verified_user,
                ),
                SizedBox(height: 10),

                TextFieldComponent(
                  text: 'Contraseña',
                  password: true,
                  controller: _passwordController,
                  icon: Icons.key,
                ),
                SizedBox(height: 20),

                Wrap(
                  spacing: 20,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<String>(
                          value: 'Hombre',
                          groupValue: _genero,
                          onChanged: (value) =>
                              setState(() => _genero = value),
                        ),
                        Text('Hombre'),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<String>(
                          value: 'Mujer',
                          groupValue: _genero,
                          onChanged: (value) =>
                              setState(() => _genero = value),
                        ),
                        Text('Mujer'),
                      ],
                    ),
                  ],
                ),

                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() => _isChecked = value!);
                      },
                    ),
                    Text('Acepto los términos'),
                  ],
                ),

                SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleRegister,
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