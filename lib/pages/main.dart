import 'package:flutter/material.dart';
import 'package:projects/pages/aboutTab.dart';
import 'package:projects/pages/editProfile.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> with TickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  late TabController _tabController;
  late ScrollController _scrollController;
  String name = "Cidade ADM de MG";
  String bibliography = "Perfil Oficial da Cidade Administrativa de MG";
  String location = "Cidade Administrativa";

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_smoothScrollToTop);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(microseconds: 300),
      curve: Curves.ease,
    );
  }

  void getDataFromEditProfile(EditProfileData editProfileData) {
    setState(() {
      name = editProfileData.name;
      bibliography = editProfileData.bibliography;
      location = editProfileData.location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(child: _buildHeader(context)),
              SliverToBoxAdapter(
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabs: _listTabBar(),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              _buildAtividadeScreensTab(),
              _buildAboutScreensTab(),
              _buildNoticeScreensTab()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomLeft,
          children: [
            _buildCoverImage(),
            Positioned(
              left: 22,
              top: 159,
              child: _buildProfileImage(),
            ),
          ],
        ),
        _buildEditProfileButton(context),
        _buildTextInfo(),
      ],
    );
  }

  Widget _buildCoverImage() {
    return Container(
      color: Colors.grey,
      child: Image.asset(
        'assets/images/backgroud_image.png',
        width: double.infinity,
        height: 211,
        fit: BoxFit.cover,
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

  Widget _buildEditProfileButton(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(right: 7),
      child: OutlinedButton(
        onPressed: () async => {
          await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditProfile(
                      name: name,
                      bibliography: bibliography,
                      location: location,
                    )),
          ).then((value) => {getDataFromEditProfile(value)})
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        child: const Text(
          'Editar Perfil',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildTextInfo() {
    return Container(
      margin: const EdgeInsets.only(left: 24, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22.6,
                color: Colors.black),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            bibliography,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
                size: 14,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                location,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Icon(
                Icons.calendar_month_outlined,
                color: Colors.grey,
                size: 14,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "Entrou em jan/23",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _listTabBar() {
    return [
      const Tab(
        child: Text(
          "Atividades",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      const Tab(
        child: Text(
          "Sobre",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      const Tab(
        child: Text(
          "Avisos e Comunicados",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ];
  }

  Widget _buildAboutScreensTab() {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutTab(),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Horário de Atendimento",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
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
        ],
      ),
    );
  }

  Widget _buildAtividadeScreensTab() {
    return const Text("Guia de Atividades selecionada");
  }

  Widget _buildNoticeScreensTab() {
    return const Text("Guia de Avisos e Comunicados selecionada");
  }
}
