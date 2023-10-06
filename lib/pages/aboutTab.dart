import 'package:flutter/material.dart';
import 'package:projects/pages/editAbout.dart';

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildEditAboutButton(context);
  }

  Widget _buildEditAboutButton(BuildContext context) {
    return Container(
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
    );
  }
}
