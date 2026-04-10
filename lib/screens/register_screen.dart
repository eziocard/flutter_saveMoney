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
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.amber,
      body: Padding(
        padding: const EdgeInsets.only(left: 60, right: 60, top: 150),
        child: Column(
          children: [
            Text(
              'Crear Cuenta',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight(600)),
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextFieldComponent(
                text: 'Ingresa tu Nombre',
                password: false,
                controller: _nameController,
                icon: Icons.person,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextFieldComponent(
                text: 'Apellido',
                password: false,
                controller: _lastnameController,
                icon: Icons.person,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextFieldComponent(
                text: 'Nombre de usuario',
                password: false,
                controller: _userController,
                icon: Icons.verified_user,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextFieldComponent(
                text: 'Contraseña',
                password: true,
                controller: _passwordController,
                icon: Icons.key,
              ),
            ),
            Row(
              children: [
                RadioGroup<String>(
                  groupValue: _genero,
                  onChanged: (value) => setState(() => _genero = value),
                  child: Row(
                    children: [
                      Radio<String>(value: 'Hombre'),
                      Text(
                        'Hombre',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight(600),
                        ),
                      ),
                      SizedBox(width: 20),
                      Radio<String>(value: 'Mujer'),
                      Text(
                        'Mujer',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight(600),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  Text(
                    'Acepto los términos',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.orange),
                foregroundColor: WidgetStateProperty.all(Colors.white),
              ),
              onPressed: () {
                _handleRegister();
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}