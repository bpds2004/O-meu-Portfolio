import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calendario.dart';
import 'editarperfil.dart';
import 'exame_receitas.dart';
import 'info_page.dart';
import 'main.dart';
import 'servicos_page.dart';
import 'calendariomedico.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: GoogleFonts.pacifico(
            fontSize: 28,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 4.0,
                color: Colors.black26,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFF006D77),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotificationPage()),
                  );
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF006D77)),
              child: Image.asset(
                'medtech.jpg',
                height: 50,
                width: 50,
              ),
            ),
            _buildDrawerItem(context, Icons.home, ' Página Inicial', const HomePage()),
            _buildDrawerItem(context, Icons.calendar_today, ' Calendário do Médico', const CalendarioMedicoPage()),
            _buildDrawerItem(context, Icons.person, ' Perfil', const PerfilPage()),
            _buildDrawerItem(context, Icons.calendar_month, ' Calendario do Paciente', const CalendarioPage()),
            _buildDrawerItem(context, Icons.receipt_long, ' Exames e Receitas', const ExamesReceitasPage()),
            _buildDrawerItem(context, Icons.medical_services, ' Serviços', const ServicosPage()),
            _buildDrawerItem(context, Icons.info, ' Info', const InfoPage()),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // lógica de logout
              },
            ),
          ],
        ),
      ),
      body: const ProfileContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: const Color(0xFF006D77),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

 Widget _buildDrawerItem(BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header com efeito e avatar circular
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF006D77), Color(0xFF83C5BE)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 56,
                    backgroundImage: AssetImage('perfil.png'),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  "Juliana Guerra",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 6,
                        color: Colors.black26,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Paciente",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 18),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditarPerfilPage()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.edit),
                  label: const Text('Editar Perfil'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          // Cartões de informações
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _infoCard(
                  context,
                  icon: Icons.person,
                  title: "Dados Pessoais",
                  children: [
                    _buildInfoRow('Primeiro Nome:', 'Juliana'),
                    _buildInfoRow('Último Nome:', 'Guerra'),
                    _buildInfoRow('Data de Nascimento:', '03-05-2004'),
                    _buildInfoRow('Nacionalidade:', 'Portuguesa'),
                    _buildInfoRow('Doc. Identificação:', '3028****'),
                    _buildInfoRow('NIF:', '2526****'),
                    _buildInfoRow('Nº SNS:', '16200****'),
                  ],
                ),
                const SizedBox(height: 18),
                _infoCard(
                  context,
                  icon: Icons.contact_mail,
                  title: "Contactos",
                  children: [
                    _buildInfoRow('Email:', '************@gmail.com'),
                    _buildInfoRow('Telemóvel:', '93********'),
                    _buildInfoRow('Morada:', 'Rua Sr. *******'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard(BuildContext context,
      {required IconData icon, required String title, required List<Widget> children}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF006D77)),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF006D77),
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 8, 8, 8), 
            ),
          ),
        ),
      ],
    ),
  );
}

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: GoogleFonts.poppins()),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}