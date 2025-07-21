import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'editarperfil.dart';
import 'main.dart';
import 'calendariomedico.dart';
import 'perfil_page.dart';
import 'calendario.dart';
import 'exame_receitas.dart';
import 'servicos_page.dart';
import 'info_page.dart';
import 'login.dart';

class PerfilPacientePage extends StatelessWidget {
  const PerfilPacientePage({Key? key}) : super(key: key);

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
        backgroundColor: const Color(0xFF1A6B67),
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
              decoration: const BoxDecoration(color: Color(0xFF1A6B67)),
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
              title: Text(' Logout', style: GoogleFonts.poppins()),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
        
      ),
      body: const ProfileContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Volta para a página anterior
        },
        backgroundColor: const Color(0xFF1A6B67),
        child: const Icon(Icons.arrow_back),
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

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          width: double.infinity,
          color: const Color(0xFF1A6B67),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        'maui.jpg', // imagem de perfil
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
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
  child: const Text('Editar Perfil'),
),
                ),
              ],
            ),
          ),
        ),


        // Conteúdo
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle('Dados Pessoais'),
                  _buildInfoRow('Primeiro Nome:', 'Juliana'),
                  _buildInfoRow('Último Nome:', 'Guerra'),
                  const Divider(height: 30),
                  _buildInfoRow('Data de Nascimento:', '03-05-2004'),
                  _buildInfoRow('Nacionalidade:', 'Portuguesa'),
                  const Divider(height: 30),
                  _buildInfoRow('Doc. Identificação:', '3028****'),
                  const Divider(height: 30),
                  _buildInfoRow('NIF:', '2526****'),
                  _buildInfoRow('Nº SNS:', '16200****'),

                  const SizedBox(height: 30),
                  _sectionTitle('Contactos'),
                  _buildInfoRow('Email:', '************@gmail.com'),
                  _buildInfoRow('Telemóvel:', '93********'),
                  _buildInfoRow('Morada:', 'Rua Sr. *******'),

                  const SizedBox(height: 30),
                  
                ],
              ),
              
            ),
            
          ),
          
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
