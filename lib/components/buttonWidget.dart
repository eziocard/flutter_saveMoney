import 'package:flutter/material.dart';


enum ButtonType { primary, secondary }
class Buttonwidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  const Buttonwidget({super.key,required this.text, required this.onPressed,this.type = ButtonType.primary});

   WidgetStateProperty<Color> get backgroundColor {
    switch (type) {
      case ButtonType.primary:
        return WidgetStateProperty.all(Colors.black);
      case ButtonType.secondary:
        return WidgetStateProperty.all(Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isPrimary = type == ButtonType.primary;
    return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(isPrimary ? Colors.black : Colors.orange,),
                      foregroundColor:
                          WidgetStateProperty.all(Colors.white),
                    ),
                    onPressed: onPressed,
                    child: Text(text),
                  ),
                );
  }
}