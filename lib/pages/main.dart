import 'package:flutter/material.dart';
import 'package:projects/pages/editProfile.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  late TabController _tabController;
  late ScrollController _scrollController;

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
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );
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
                  labelColor: Colors.redAccent,
                  isScrollable: true,
                  tabs: _listTabBar(),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              _buildInfoScreensTab(),
              _buildInfoScreensTab(),
              _buildInfoScreensTab(),
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
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EditProfile()),
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
          'Editar Perfil',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildTextInfo() {
    return Container(
      margin: const EdgeInsets.only(left: 24, top: 10),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cidade ADM de MG",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22.6,
                color: Colors.black),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Perfil Oficial da Cidade Administrativa de MG",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
                size: 14,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Cidade administrativa",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Icon(
                Icons.calendar_month_outlined,
                color: Colors.grey,
                size: 14,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
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

  Widget _buildInfoScreensTab() {
    return const Text("Primeira guia selecionada");
  }
}
