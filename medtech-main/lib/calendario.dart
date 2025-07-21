import 'package:flutter/material.dart';
import 'calendariomedico.dart';
import 'exame_receitas.dart';
import 'info_page.dart';
import 'perfil_page.dart';
import 'servicos_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'main.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarioPage extends StatefulWidget {
  const CalendarioPage({Key? key}) : super(key: key);

  @override
  State<CalendarioPage> createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  String _tipoMarcacao = 'Consulta';

  final Map<String, List<String>> _medicosPorTipo = {
    'Consulta': [
      'Dr. Silva (Medicina Geral e Familiar)',
      'Dra. Costa (Ginecologia)',
      'Dr. Almeida (Oftalmologia)',
      'Dr. Ferreira (Cardiologia)',
      'Dr. Luiz (Dermatologia)',
    ],
    'Exame': [
      'Dr. Sousa (TAC/Raio-X)',
      'Dr. Ramiro (Análises Clínicas)',
      'Dr. Fernandes (Ecografia/Mamografia)',
      'Dr. Dias (Ressonância Magnética)',
      'Dr. Ferreira (Eletrocardiograma)',
    ],
  };

  final List<String> _horasDisponiveis = ['09:00', '10:00','11:00','12:00', '14:00', '15:00','16:00','17:00'];
  String? _horaSelecionada;
  String? _medicoSelecionado;

  final Map<DateTime, List<Map<String, String>>> _consultasMarcadas = {
    DateTime.utc(2025, 6, 22): [
      {
        'paciente': 'Você',
        'hora': '09:00',
        'medico': 'Dra. Costa (Ginecologia)',
        'tipo': 'Consulta'
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _horaSelecionada = _horasDisponiveis.first;
    _medicoSelecionado = _medicosPorTipo[_tipoMarcacao]!.first;
  }

  void _atualizarMedicos(String tipo) {
    setState(() {
      _tipoMarcacao = tipo;
      _medicoSelecionado = _medicosPorTipo[tipo]!.first;
    });
  }

  List<Map<String, String>> _getConsultasDoDia(DateTime day) {
    final diaNormalizado = DateTime.utc(day.year, day.month, day.day);
    return _consultasMarcadas[diaNormalizado] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final medicosDisponiveis = _medicosPorTipo[_tipoMarcacao]!;
    final consultasHoje = _getConsultasDoDia(_selectedDay);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Marcações',
          style: GoogleFonts.pacifico(
            fontSize: 28,
            color: Colors.white,
            shadows: [
              const Shadow(blurRadius: 4.0, color: Colors.black26, offset: Offset(2, 2)),
            ],
          ),
        ),
        backgroundColor: const Color(0xFF1A6B67),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF1A6B67)),
              child: Image.asset('medtech.jpg', height: 50, width: 50),
            ),
            _buildDrawerItem(context, Icons.home, 'Página Inicial', const HomePage()),
            _buildDrawerItem(context, Icons.calendar_today, 'Calendário do Médico', const CalendarioMedicoPage()),
            _buildDrawerItem(context, Icons.person, 'Perfil', const PerfilPage()),
            _buildDrawerItem(context, Icons.calendar_month, 'Calendario do Paciente', const CalendarioPage()),
            _buildDrawerItem(context, Icons.receipt_long, 'Exames e Receitas', ExamesReceitasPage()),
            _buildDrawerItem(context, Icons.medical_services, 'Serviços', const ServicosPage()),
            _buildDrawerItem(context, Icons.info, 'Info', const InfoPage()),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text('Logout', style: GoogleFonts.poppins()),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyApp()));
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TableCalendar(
                  firstDay: DateTime.now(),
                  lastDay: DateTime(DateTime.now().year + 1),
                  focusedDay: _focusedDay,
                  calendarFormat: CalendarFormat.month,
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Mês',
                  },
                  selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(color: Color(0xFF1A6B67), shape: BoxShape.circle),
                    selectedDecoration: BoxDecoration(color: Colors.purple, shape: BoxShape.circle),
                  ),
                  eventLoader: _getConsultasDoDia,
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, date, events) {
                      if (events.isNotEmpty) {
                        return Positioned(
                          bottom: 1,
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceChip(
                      label: const Text('Consulta'),
                      selected: _tipoMarcacao == 'Consulta',
                      onSelected: (selected) {
                        if (selected) _atualizarMedicos('Consulta');
                      },
                      selectedColor: Colors.purple,
                      labelStyle: TextStyle(
                        color: _tipoMarcacao == 'Consulta' ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(width: 10),
                    ChoiceChip(
                      label: const Text('Exame'),
                      selected: _tipoMarcacao == 'Exame',
                      onSelected: (selected) {
                        if (selected) _atualizarMedicos('Exame');
                      },
                      selectedColor: Colors.purple,
                      labelStyle: TextStyle(
                        color: _tipoMarcacao == 'Exame' ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _horaSelecionada,
                  items: _horasDisponiveis.map((hora) {
                    return DropdownMenuItem(value: hora, child: Text(hora));
                  }).toList(),
                  onChanged: (novaHora) => setState(() => _horaSelecionada = novaHora),
                  decoration: const InputDecoration(labelText: 'Escolha o horário'),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _medicoSelecionado,
                  items: medicosDisponiveis.map((medico) {
                    return DropdownMenuItem(value: medico, child: Text(medico));
                  }).toList(),
                  onChanged: (novoMedico) => setState(() => _medicoSelecionado = novoMedico),
                  decoration: const InputDecoration(labelText: 'Escolha o médico'),
                ),
                const SizedBox(height: 40),
                Text(
                  'Consultas marcadas:',
                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                consultasHoje.isEmpty
                    ? const Text('Nenhuma consulta neste dia.')
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: consultasHoje.length,
                        itemBuilder: (context, index) {
                          final consulta = consultasHoje[index];
                          return Card(
                            child: ListTile(
                              title: Text('${consulta['tipo']}: ${consulta['hora']}'),
                              subtitle: Text('${consulta['medico']}'),
                            ),
                          );
                        },
                      ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _confirmarMarcacao(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A6B67),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text('Confirmar Marcação'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: const Color(0xFF1A6B67),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  void _confirmarMarcacao(BuildContext context) {
    final data = DateTime.utc(_selectedDay.year, _selectedDay.month, _selectedDay.day);
    final dataFormatada = "${_selectedDay.day.toString().padLeft(2, '0')}/"
        "${_selectedDay.month.toString().padLeft(2, '0')}/"
        "${_selectedDay.year}";

    final novaConsulta = {
      'paciente': 'Você',
      'hora': _horaSelecionada!,
      'medico': _medicoSelecionado!,
      'tipo': _tipoMarcacao,
    };

    setState(() {
      _consultasMarcadas.putIfAbsent(data, () => []).add(novaConsulta);
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Marcação Confirmada'),
        content: Text(
          'Você marcou uma $_tipoMarcacao no dia $dataFormatada às $_horaSelecionada com $_medicoSelecionado.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}