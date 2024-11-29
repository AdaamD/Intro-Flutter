import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adam x Mohammed - Profil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ProfileHomePage(),
    );
  }
}

class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Adam x Mohammed - Profil", // Titre de l'AppBar
          style: TextStyle(
            fontSize: 24, // Taille de la police
            fontWeight: FontWeight.bold, // Poids de la police
            color: Colors.white, // Couleur du texte
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800], // Couleur de fond de l'AppBar
        elevation: 4.0, // Élévation pour un effet d'ombre
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/white_background.jpg'), // Remplacez par le chemin de votre image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: _getCard(),
        ),
      ),
    );
  }

  Widget _getCard() {
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
            _getAvatar(),
            const SizedBox(height: 15),
            _getProfileInfo(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _getAvatar() {
    return CircleAvatar(
      radius: 60, // Ajustez le rayon pour correspondre à la taille souhaitée
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage('assets/images/gokuXtrunks.jpg'),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              Border.all(color: const Color.fromARGB(255, 5, 48, 83), width: 3),
        ),
      ),
    );
  }

  Widget _getProfileInfo() {
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
              color: Colors.blue[900],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Étudiants en M2 Génie Logiciel',
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Colors.blue[700],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          const Divider(
            color: Colors.blue,
            thickness: 1,
            indent: 30,
            endIndent: 30,
          ),
          const SizedBox(height: 15),
          _buildInfoRow(
            icon: Icons.school,
            text: 'Université Montpellier',
            color: Colors.indigo,
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            icon: Icons.code,
            text: 'Spécialisation en Développement Logiciel',
            color: Colors.teal,
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            icon: Icons.language,
            text: 'Projet: Application Mobile Flutter',
            color: Colors.deepPurple,
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            icon: Icons.group,
            text: 'Passionnés par la technologie',
            color: Colors.orange,
          ),
        ],
      ),
    );
  }

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
