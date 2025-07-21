import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'exame_receitas.dart';
import 'main.dart';
import 'perfil_page.dart';
import 'servicos_page.dart';
import 'login.dart';
import 'calendario.dart';
import 'calendariomedico.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF006D77),
        centerTitle: true,
        title: Text(
          'Informações',
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
                  constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
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
              child: Image.asset('medtech.jpg', height: 50, width: 50),
            ),
            _buildDrawerItem(context, Icons.home, ' Página Inicial', const HomePage()),
            _buildDrawerItem(context, Icons.calendar_today, ' Calendário do Médico', const CalendarioMedicoPage()),
            _buildDrawerItem(context, Icons.person, ' Perfil', const PerfilPage()),
            _buildDrawerItem(context, Icons.calendar_month, ' Calendário do Paciente', const CalendarioPage()),
            _buildDrawerItem(context, Icons.receipt_long, ' Exames e Receitas', ExamesReceitasPage()),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.phone, color: Color(0xFF006D77)),
                title: Text('+351 258 ******', style: GoogleFonts.poppins(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.email, color: Color(0xFF006D77)),
                title: Text('MedTechClinica@****.pt', style: GoogleFonts.poppins(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Color(0xFF006D77)),
                title: Text('Avenida 1 Maio', style: GoogleFonts.poppins(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 20),
            Divider(thickness: 1, color: Colors.grey[400]),
            const SizedBox(height: 10),

            // Simulação do Mapa
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey[300],
                child: Center(
                  child: Text(
                    '🗺️ Mapa Aqui',
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.blue.shade900),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Horário de Funcionamento',
                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.access_time, color: Colors.black87),
              title: RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
                  children: [
                    TextSpan(
                      text: 'Segunda a Sexta: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: '08:00 - 20:00',
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.access_time, color: Colors.black87),
              title: RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
                  children: [
                    TextSpan(
                      text: 'Sábado: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: '09:00 - 14:00',
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.access_time, color: Colors.black87),
              title: RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
                  children: [
                    TextSpan(
                      text: 'Domingo: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: 'Fechado',
                    ),
                  ],
                ),
              ),
            ),
        ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: const Color(0xFF006D77),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

Widget _buildDrawerItem(BuildContext context, IconData icon, String title, Widget page) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title, style: GoogleFonts.poppins()),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
  );
}
