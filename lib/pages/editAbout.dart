import 'package:flutter/material.dart';
import 'package:projects/components/widgetTextField.dart';

import '../components/widgetDropdown.dart';

class EditAbout extends StatelessWidget {
  const EditAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.pop(context, false);
            }),
        title: const Text(
          "Editar sobre",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text(
              "Salvar",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 32, left: 23, right: 23),
        child: Column(
          children: [
            _buildOpeningHours(),
          ],
        ),
      ),
    );
  }

  Widget _buildOpeningHours() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Horário de atendimento",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Row(children: [
          Flexible(
            flex: 4,
            child: WidgetTextField(
              hint: "Segunda-Feira",
              enabled: false,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Flexible(
            flex: 2,
            child: DropdownButtonApp(),
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            "às",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Flexible(
            flex: 2,
            child: DropdownButtonApp(),
          ),
        ])
      ],
    );
  }
}
