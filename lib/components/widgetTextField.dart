import 'package:flutter/material.dart';

class WidgetTextField extends StatelessWidget {
  final String? hint;
  final bool? enabled;
  final TextEditingController? controller;

  const WidgetTextField({
    this.hint,
    this.enabled,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _buildTextField();
  }

  Widget _buildTextField() {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
          border: const OutlineInputBorder(),
          hintText: hint ?? "Digite aqui",
          enabled: enabled ?? true,
        ),
      ),
    );
  }
}
