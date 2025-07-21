import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calendario.dart';
import 'perfil_page.dart';
import 'main.dart';
import 'info_page.dart';
import 'servicos_page.dart';
import 'login.dart';
import 'calendariomedico.dart';

class ExamesReceitasPage extends StatelessWidget {
  const ExamesReceitasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF006D77),
        centerTitle: true,
        title: Text(
          'Receitas e Exames',
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          
               
          _buildExameCard(
            context,
            date: '11 Janeiro, 2025',
            title: 'Relatório Imagiologia',
            description: 'TAC coluna dorsal (Imagiologia)',
            code: 'ER.38.2.1',
          ),
          _buildExameCard(
            context,
            date: '20 Fevereiro, 2025',
            title: 'Relatório Imagiologia',
            description: 'Ecografia Tiroideia (Imagiologia)',
            code: 'ER.50.3.1',
          ),
          _buildReceitaCard(
            context,
            date: '05 março, 2025',
            numero: '1012156200150021',
            medico: 'Dr. Ricardo Martins',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context); // Volta para a página anterior
          },
          backgroundColor: Color(0xFF006D77),
          child: const Icon(Icons.arrow_back),
        ),
    );
  }

  Widget _buildExameCard(BuildContext context,
      {required String date,
      required String title,
      required String description,
      required String code}) {
    return Card(
      color: const Color(0xFFF3F3F3),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.teal,
                )),
            const SizedBox(height: 8),
            Text(title,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 16)),
            Text(description, style: GoogleFonts.poppins()),
            Text(code, style: GoogleFonts.poppins()),
          ],
        ),
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


  Widget _buildReceitaCard(BuildContext context,
      {required String date, required String numero, required String medico}) {
    return Card(
      color: const Color(0xFFF3F3F3),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.teal)),
            const SizedBox(height: 8),
            Text('Receita nº$numero',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 16)),
            Row(
              children: [
                const Icon(Icons.medical_services, size: 18),
                const SizedBox(width: 6),
                Text(medico, style: GoogleFonts.poppins()),
              ],
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'receita.jpg', 
                              fit: BoxFit.contain,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Fechar', style: GoogleFonts.poppins()),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Text('Ver Receita', style: GoogleFonts.poppins()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
