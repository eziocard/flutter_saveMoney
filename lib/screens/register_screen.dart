import 'package:flutter/material.dart';
import 'package:wallet/components/texfield.dart';
import 'package:wallet/screens/dashboard_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? genero;
  bool isChecked = false;

  void _handleRegister() {
      if (nameController.text.isEmpty ||
      lastnameController.text.isEmpty ||
      userController.text.isEmpty ||
      passwordController.text.isEmpty ||
      genero == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Por favor completa todos los campos'),
        backgroundColor: Colors.red,
      ),
    );
    return; 
  }
    print('Nombre: ${nameController.text}');
    print('Apellido: ${lastnameController.text}');
    print('Usuario: ${userController.text}');
    print('Contraseña: ${passwordController.text}');
    print('Genero: $genero');

    if (!isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Debes aceptar los términos')),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardScreen(
          username: userController.text,
          name: nameController.text,
          lastname: lastnameController.text,
          genero: genero,
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
                  controller: nameController,
                  icon: Icons.person,
                ),
                SizedBox(height: 10),

                TextFieldComponent(
                  text: 'Apellido',
                  password: false,
                  controller: lastnameController,
                  icon: Icons.person,
                ),
                SizedBox(height: 10),

                TextFieldComponent(
                  text: 'Nombre de usuario',
                  password: false,
                  controller: userController,
                  icon: Icons.verified_user,
                ),
                SizedBox(height: 10),

                TextFieldComponent(
                  text: 'Contraseña',
                  password: true,
                  controller: passwordController,
                  icon: Icons.key,
                ),
                SizedBox(height: 20),

               RadioGroup<String>(
  groupValue: genero,
  onChanged: (value) {
    setState(() {
      genero = value;
    });
  },
  child: Wrap(
    spacing: 20,
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio<String>(value: 'Hombre'),
          Text('Hombre'),
        ],
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio<String>(value: 'Mujer'),
          Text('Mujer'),
        ],
      ),
    ],
  ),
),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() => isChecked = value!);
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