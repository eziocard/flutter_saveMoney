import 'package:flutter/material.dart';

class Totalwidget extends StatelessWidget {
  final String title;
  final double total;
  const Totalwidget({super.key,required this.title,required this.total});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
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
                          title,
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
                  );
  }
}