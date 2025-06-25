import 'package:flutter/material.dart';

class CustomBooleanDropdown extends StatelessWidget {
  final bool? initialValue;
  final ValueChanged<bool?> onChanged;
  final String label;

  const CustomBooleanDropdown({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(0, 4),                
        //     blurRadius: 6,                       
        //     spreadRadius: 0,               
        //   )
        // ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.only(top: 5),
      child: DropdownMenu<bool>(
        width: 200,
        initialSelection: initialValue,
        onSelected: onChanged,
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: false, label: "No"),
          DropdownMenuEntry(value: true, label: "Sí"),
        ],
        label: Text(label),
        menuStyle: const MenuStyle(
          backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 238, 245, 238)),
        ),
      ),
    );
  }
}