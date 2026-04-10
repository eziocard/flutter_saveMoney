import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String titulo;
  final double monto;
  final VoidCallback onDelete; 
  const CardItem({super.key, required this.titulo, required this.monto,required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 260,
        height: 100,
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(titulo, style: TextStyle(fontWeight: FontWeight(600), fontSize: 16)),
                Spacer(),
                IconButton(onPressed:onDelete, icon: Icon(Icons.delete, color: Colors.red)),
                
              ],
            ),
            Spacer(),
            Text('\$$monto', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}