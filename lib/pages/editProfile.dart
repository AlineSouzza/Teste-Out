import 'package:flutter/material.dart';
import 'package:projects/components/widgetTextField.dart';

class EditProfileData {
  final String name;
  final String bibliography;
  final String location;

  EditProfileData({
    required this.name,
    required this.bibliography,
    required this.location,
  });
}

class EditProfile extends StatelessWidget {
  final String name;
  final String bibliography;
  final String location;
  TextEditingController? nameController = TextEditingController();
  TextEditingController? bibliographyController = TextEditingController();
  TextEditingController? locationController = TextEditingController();

  EditProfile({
    super.key,
    required this.name,
    required this.bibliography,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    nameController?.text = name;
    bibliographyController?.text = bibliography;
    locationController?.text = location;

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
          "Editar Perfil",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              EditProfileData editProfileData = EditProfileData(
                name: nameController!.text,
                bibliography: bibliographyController!.text,
                location: locationController!.text,
              );
              Navigator.pop(context, editProfileData);
            },
            child: const Text(
              "Salvar",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildLabelText(),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelText() {
    return Container(
      margin: const EdgeInsets.only(left: 23, right: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Nome",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          WidgetTextField(controller: nameController),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "Bio",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          WidgetTextField(controller: bibliographyController),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "Localização",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          WidgetTextField(controller: locationController),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "Administrador geral",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          WidgetTextField(
            controller: TextEditingController(text: "@paulo.olivera32"),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Moderadores",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              _buildAddModeratorsButton(),
            ],
          ),
          WidgetTextField(
            controller: TextEditingController(text: "@oliverpereira"),
          ),
          const SizedBox(
            height: 12,
          ),
          WidgetTextField(
            controller: TextEditingController(text: "@21joaobotelho"),
          ),
        ],
      ),
    );
  }

  Widget _buildAddModeratorsButton() {
    return OutlinedButton(
      onPressed: () => {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      child: const Text(
        'Adicionar',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.all(23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Imagem de perfil",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: _buildProfileImage(),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return CircleAvatar(
      radius: 100 / 2,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: const AssetImage(
        'assets/images/profile_image.png',
      ),
    );
  }
}
