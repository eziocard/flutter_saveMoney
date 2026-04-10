import 'package:flutter/material.dart';
import 'package:wallet/components/CardItem.dart';
import 'package:wallet/models/gasto.dart';

class DashboardScreen extends StatefulWidget {
  final String username;
  final String? name;
  final String? lastname;
  final String? genero;    
  const DashboardScreen({super.key, required this.username,this.name,this.lastname,this.genero});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Gasto> gastos = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _mountController = TextEditingController();
  double total = 0.0;
  
  void _handleSubmit(){
    print('Titulo ${_titleController.text}');
    print('Monto ${_mountController.text}');
    String title = _titleController.text;
    double mount = double.tryParse(_mountController.text) ?? 0;
    if(title.isNotEmpty && mount >0){
      total = 0;
      setState(() {
        gastos.add(Gasto(title: title, mount: mount));
        for (var gasto in gastos) {
        total += gasto.mount;
}
        _titleController.clear();
        _mountController.clear();
      });
    }
  }
  void _eliminarGasto(int index) {
  setState(() {
    gastos.removeAt(index);
    total = gastos.fold(0, (sum, g) => sum + g.mount); 
  });
}
  @override
  Widget build(BuildContext context) {
      String genero = widget.genero ?? (widget.username == 'ricardo' ? 'Hombre' : '');

String welcome = switch(genero) {
  'Hombre' => 'Bienvenido',
  'Mujer' => 'Bienvenida',
  _ => 'Bienvenid@',
};
    return Scaffold(
      appBar: AppBar(title: Text('$welcome ${widget.username}'),backgroundColor: Colors.black,foregroundColor: Colors.white, actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.person))
          ],) ,
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 50, bottom: 10, left: 40, right: 40),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            'Gasto',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Text('\$${total}',
                              style: TextStyle(fontSize: 25)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
  child: Padding(
    padding: const EdgeInsets.only(left: 40, top: 40, bottom: 40, right: 40),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: gastos.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'No hay registros,\nregistra tus gastos pulsando el botón +.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: gastos.asMap().entries.map((entry) {
                  int index = entry.key;
                  Gasto gasto = entry.value;
                  return Column(children: [
                    CardItem(titulo: gasto.title, monto: gasto.mount, onDelete: () => _eliminarGasto(index),),
                    SizedBox(height: 10),
                  ]);
                }).toList(),
              ),
            ),
    ),
  ),
),
        ],
      ),
      floatingActionButton: FloatingActionButton(
  onPressed: () {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // importante si el modal crece
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            height: 300,
            child: Column(
              children: [
                Text(
                  "Agregar gasto",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _titleController,
                  maxLength: 20,
                  decoration: InputDecoration(labelText: "Titulo"),
                ),
                TextField(
                  controller:_mountController,
                  decoration: InputDecoration(labelText: "Monto"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _handleSubmit(); // cerrar modal
                      },
                      child: Text("Guardar"),
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.red)),
                      onPressed: () {
                        Navigator.pop(context); // cerrar modal
                      },
                      child: Text("Cerrar",style: TextStyle(color: Colors.white)),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  },
  child: Icon(Icons.add),
),
      
    );
  }
}