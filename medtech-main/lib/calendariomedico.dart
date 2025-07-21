import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'editarperfil.dart';
import 'perfil_page.dart';
import 'calendario.dart';
import 'exame_receitas.dart';
import 'servicos_page.dart';
import 'info_page.dart';
import 'login.dart';

class CalendarioMedicoPage extends StatefulWidget {
  const CalendarioMedicoPage({Key? key}) : super(key: key);

  @override
  State<CalendarioMedicoPage> createState() => _CalendarioMedicoPageState();
}

class _CalendarioMedicoPageState extends State<CalendarioMedicoPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Exemplo de consultas agendadas (substitua por dados reais)
  final Map<DateTime, List<Map<String, String>>> _consultas = {
    DateTime.utc(2025, 6, 21): [
      {'paciente': 'Juliana Guerra', 'hora': '09:00'},
      {'paciente': 'Carlos Silva', 'hora': '10:30'},
    ],
    DateTime.utc(2025, 7, 22): [
      {'paciente': 'Ana Sousa', 'hora': '10:00'},
    ],
  };

  List<Map<String, String>> _getConsultasDoDia(DateTime day) {
    return _consultas[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final consultasHoje = _selectedDay != null
        ? _getConsultasDoDia(_selectedDay!)
        : _getConsultasDoDia(_focusedDay);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A6B67),
        centerTitle: true,
        title: Text(
          'Calendário Médico',
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2025, 1, 1),
              lastDay: DateTime.utc(2025, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Color(0xFF1A6B67),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
              ),
              eventLoader: (day) => _getConsultasDoDia(day),
            ),
            const SizedBox(height: 24),
            Text(
              'Consultas do dia:',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: consultasHoje.isEmpty
                  ? const Text('Nenhuma consulta agendada.')
                  : ListView.builder(
                      itemCount: consultasHoje.length,
                      itemBuilder: (context, index) {
                        final consulta = consultasHoje[index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(consulta['paciente'] ?? ''),
                            subtitle: Text('Hora: ${consulta['hora']}'),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
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