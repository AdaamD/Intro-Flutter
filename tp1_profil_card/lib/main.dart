import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adam x Mohammed - Profil ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ProfileHomePage(),
    );
  }
}

class ProfileHomePage extends StatefulWidget {
  const ProfileHomePage({super.key});

  @override
  _ProfileHomePageState createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {
  // Variable pour suivre l'index de l'élément sélectionné dans la barre de navigation
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Adam x Mohammed - Profil",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
        elevation: 4.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/white_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: _selectedIndex == 0
              ? _getCommonCard()
              : (_selectedIndex == 1 ? _getAdamCard() : _getMohammedCard()),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Profil Commun',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Adam',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mohammed',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }

  // Méthode pour changer l'index de l'élément sélectionné dans la barre de navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Méthode pour afficher la carte commune d'Adam et Mohammed
  Widget _getCommonCard() {
    return SingleChildScrollView(
      child: Container(
        width: 300,
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.transparent,
              backgroundImage:
                  AssetImage('assets/images/gokuXtrunks.jpg'), // Image commune
            ),
            const SizedBox(height: 15),
            _getCommonProfileInfo(),
          ],
        ),
      ),
    );
  }

  // Méthode pour afficher les informations communes d'Adam et Mohammed
  Widget _getCommonProfileInfo() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Adam x Mohammed',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Étudiants en M2 Génie Logiciel',
            style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.blue[700]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          const Divider(
              color: Colors.blue, thickness: 1, indent: 30, endIndent: 30),
          const SizedBox(height: 15),
          _buildInfoRow(
              icon: Icons.school,
              text: 'Université Montpellier',
              color: Colors.indigo),
          const SizedBox(height: 8),
          _buildInfoRow(
              icon: Icons.code,
              text: ' Développement Logiciel',
              color: Colors.teal),
          const SizedBox(height: 8),
          _buildInfoRow(
              icon: Icons.language,
              text: 'Projet : Application Mobile Flutter',
              color: Colors.deepPurple),
          const SizedBox(height: 8),
          _buildInfoRow(
              icon: Icons.group,
              text: 'Passionnés par la technologie',
              color: Colors.orange),
        ],
      ),
    );
  }

  // Méthode pour afficher la carte de profil d'Adam
  Widget _getAdamCard() {
    return SingleChildScrollView(
      child: Container(
        width: 300,
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/goku.jpg'),
            ),
            const SizedBox(height: 15),
            _getAdamProfileInfo(),
          ],
        ),
      ),
    );
  }

  // Méthode pour afficher les informations du profil d'Adam
  Widget _getAdamProfileInfo() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Adam',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Étudiant en M2 Génie Logiciel',
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Colors.blue[700],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: Colors.blue,
            thickness: 1,
            indent: 30,
            endIndent: 30,
          ),
          const SizedBox(
            height: 15,
          ),
          _buildInfoRow(
            icon: Icons.school,
            text: 'Université Montpellier',
            color: Colors.indigo,
          ),
          const SizedBox(
            height: 8,
          ),
          _buildInfoRow(
            icon: Icons.code,
            text: 'Passionné par le développement logiciel',
            color: Colors.teal,
          ),
          const SizedBox(
            height: 8,
          ),
          _buildInfoRow(
            icon: Icons.language,
            text: 'Langages : Java, JavaScript, Dart',
            color: Colors.deepPurple,
          ),
        ],
      ),
    );
  }

  // Méthode pour afficher la carte de profil de Mohammed
  Widget _getMohammedCard() {
    return SingleChildScrollView(
      child: Container(
        width: 300,
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/trunks.jpg'),
            ),
            const SizedBox(height: 15),
            _getMohammedProfileInfo(),
          ],
        ),
      ),
    );
  }

  // Méthode pour afficher les informations du profil de Mohammed
  Widget _getMohammedProfileInfo() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Mohammed',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Étudiant en M2 Génie Logiciel',
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Colors.blue[700],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: Colors.blue,
            thickness: 1,
            indent: 30,
            endIndent: 30,
          ),
          const SizedBox(
            height: 15,
          ),
          _buildInfoRow(
            icon: Icons.school,
            text: 'Université Montpellier',
            color: Colors.indigo,
          ),
          const SizedBox(
            height: 8,
          ),
          _buildInfoRow(
            icon: Icons.code,
            text: 'Intéressé par le dev. web et mobile',
            color: Colors.teal,
          ),
          const SizedBox(
            height: 8,
          ),
          _buildInfoRow(
            icon: Icons.language,
            text: 'Langages: Java, Dart, Html',
            color: Colors.deepPurple,
          ),
        ],
      ),
    );
  }

  // Méthode pour construire une ligne d'information avec une icône et un texte
  Widget _buildInfoRow({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16, color: color, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
