import 'package:flutter/material.dart';
import 'package:projects/pages/editAbout.dart';

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildEditAboutButton(context);
  }

  Widget _buildEditAboutButton(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(top: 13, left: 13),
          alignment: Alignment.centerLeft,
          child: OutlinedButton(
            onPressed: () async => {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditAbout()),
              )
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            child: const Text(
              'Editar seção sobre',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          margin: const EdgeInsets.all(13),
          child: const Text(
            "Horário de Atendimento",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Segunda-feira",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "_______________",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "09:00",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "às",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "17:00",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Terça-feira",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "__________________",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "09:00",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "às",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "17:00",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Quarta-feira",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "_________________",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "09:00",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "às",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "17:00",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Quinta-feira",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "_________________",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "09:00",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "às",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "17:00",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sexta-Feira",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "_________________",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "09:00",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "às",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "17:00",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sábado",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "____________________",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "09:00",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "às",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "17:00",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Domingo",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "___________________",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "09:00",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "às",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "17:00",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
