import 'package:flutter/material.dart';
import 'package:wallet/components/CardItem.dart';
import 'package:wallet/models/gasto.dart';

class DashboardScreen extends StatefulWidget {
  final String username;
  final String? name;
  final String? lastname;
  final String? genero;

  const DashboardScreen({
    super.key,
    required this.username,
    this.name,
    this.lastname,
    this.genero,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Gasto> gastos = [];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController mountController = TextEditingController();

  double total = 0.0;

  void _handleSubmit() {
    String title = titleController.text;
    double mount = double.tryParse(mountController.text) ?? 0;

    if (title.isNotEmpty && mount > 0) {
      setState(() {
        gastos.add(Gasto(title: title, mount: mount));

        total = gastos.fold(0, (sum, g) => sum + g.mount);

        titleController.clear();
        mountController.clear();
      });
    }
  }

  void _eliminarGasto(int index) {
    setState(() {
      gastos.removeAt(index);
      total = gastos.fold(0, (sum, g) => sum + g.mount);
    });
  }

  void _openModal(BuildContext context, Size size) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Agregar gasto",
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  TextField(
                    controller: titleController,
                    maxLength: 20,
                    decoration: InputDecoration(labelText: "Título"),
                  ),

                  TextField(
                    controller: mountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Monto"),
                  ),

                  SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _handleSubmit();
                            Navigator.pop(context);
                          },
                          child: Text("Guardar"),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.red),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cerrar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    String genero =
        widget.genero ?? (widget.username == 'ricardo' ? 'Hombre' : '');

    String welcome = switch (genero) {
      'Hombre' => 'Bienvenido',
      'Mujer' => 'Bienvenida',
      _ => 'Bienvenid@',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('$welcome ${widget.username}'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.person))
        ],
      ),
      backgroundColor: Colors.amber,

      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.02,
              ),
              child: Column(
                children: [
                  // 🔹 TARJETA TOTAL
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: size.height * 0.02,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Gasto',
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '\$${total.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontSize: size.width * 0.06,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: size.height * 0.03),

                  // 🔹 LISTA
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: gastos.isEmpty
                          ? Center(
                              child: Text(
                                'No hay registros,\nusa el botón +',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.width * 0.04,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: gastos.length,
                              itemBuilder: (context, index) {
                                final gasto = gastos[index];

                                return Column(
                                  children: [
                                    CardItem(
                                      titulo: gasto.title,
                                      monto: gasto.mount,
                                      onDelete: () =>
                                          _eliminarGasto(index),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                );
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // 🔹 BOTÓN +
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openModal(context, size);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}