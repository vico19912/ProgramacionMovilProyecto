import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const Modal({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
    required this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Stack(
        children: [
          Container(
            height: 500,
            width: 300,
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 400,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      size: 80,
                      color: iconColor,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade800,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 40,
                            ),
                            elevation: 6,
                          ),
                          onPressed: onConfirm,
                          child:  Text("Sí",style:TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade700,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 40,
                            ),
                            elevation: 6,
                          ),
                          onPressed: onCancel,
                          child: const Text("No",style:TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
