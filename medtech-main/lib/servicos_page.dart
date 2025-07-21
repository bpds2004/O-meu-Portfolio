import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calendario.dart';
import 'exame_receitas.dart';
import 'info_page.dart';
import 'login.dart';
import 'main.dart';
import 'perfil_page.dart';
import 'calendariomedico.dart';

class ServicosPage extends StatelessWidget {
  const ServicosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF006D77),
        centerTitle: true,
        title: Text(
          'Serviços',
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
        automaticallyImplyLeading: true,
      ),
        
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF006D77)),
              child: Image.asset(
                'medtech.jpg', // Substitua pelo caminho da sua imagem
                height: 50,    // Ajuste o tamanho conforme necessário
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            
           const SizedBox(height: 20),

            Text(
              'Especialidades',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 6, 6, 6),
              ),
            ),
            const SizedBox(height: 20),
            

            // Primeira linha
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildEspecialidade('cardio.jpg', 'Cardiologia'),
                  _buildEspecialidade('dry-skin_7305189.png', 'Dermatologia'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Segunda linha
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildEspecialidade('ginecologia.jpg', 'Ginecologia\n e Obstetrícia'),
                  _buildEspecialidade('familiar.jpg', 'Medicina Geral\n e Familiar'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Terceira linha
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildEspecialidade('oftamologia.jpg', 'Oftalmologia'),
                  
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Quarta linha
            Text(
              'Exames',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 10, 10, 10),
              ),
            ),
            const SizedBox(height: 20),

            // Quinta linha
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildEspecialidade('analises.jpg', 'Análises Clínicas'),
                  _buildEspecialidade('tac.jpg', 'TAC'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Sexta linha
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildEspecialidade('raiox.jpg', 'Raio - X'),
                  _buildEspecialidade('ecografia.jpg', 'Ecografia'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Sétima linha
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildEspecialidade('reso.png', 'Ressonância\n Magnética'),
                   _buildEspecialidade('eletrocardio.jpg', 'Eletrocardiograma'),
                  
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Oitava linha
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildEspecialidade('mamo.jpg', 'Mamografia'),
                  
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context); // Volta para a página anterior
          },
          backgroundColor:Color(0xFF006D77),
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

  Widget _buildEspecialidade(String imagePath, String label) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          height: 80,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color.fromARGB(255, 13, 13, 13),
          ),
        ),
      ],
    );
  }
}
