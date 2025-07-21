import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calendariomedico.dart';
import 'servicos_page.dart';
import 'info_page.dart';
import 'exame_receitas.dart';
import 'login.dart';
import 'perfil_page.dart';
import 'calendario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedTech',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF006D77)),
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginPage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF006D77),
        title: Row(
          children: [
            Image.asset(
              'medtech.jpg',
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 10),
            Text(
              'MedTech',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white,),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, size: 32),
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
              decoration: const BoxDecoration(color:Color(0xFF006D77)),
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
      body: SingleChildScrollView(
        //padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Retângulo azul preenchendo toda a largura
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 60),
              decoration: const BoxDecoration(
                color: Color(0xFF006D77),
              ),
              child: Column(
                children: [
                  Text(
                    'Bem-vindo à clínica MedTech',
                    style: GoogleFonts.pacifico(
                      fontSize: 28,
                      color: Colors.white,                      shadows: [
                        Shadow(
                          blurRadius: 4.0,
                          color: Colors.black26,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            Column(
              children: [
              Text(
                '🌟 O Segredo para uma Vida Saudável: Pequenos Hábitos, Grandes Benefícios! 🌟',
                style: GoogleFonts.poppins(
                fontSize: 18,
                color: Color(0xFF006D77),
                fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Descubra como pequenas mudanças podem transformar sua saúde e bem-estar. Dicas simples para toda a família viver melhor!',
                style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.article_outlined),
              label: const Text('Ler mais'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Row(
                      children: [
                        const Icon(Icons.favorite, color: Color(0xFF006D77)),
                        const SizedBox(width: 8),
                        Text(
                          'Artigo Completo',
                          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '🌱 O Segredo para uma Vida Saudável: Pequenos Hábitos, Grandes Benefícios!',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Color(0xFF006D77),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Na correria do dia a dia, muitas vezes esquecemos que a nossa saúde é o nosso bem mais precioso. Mas a boa notícia é que não são precisas mudanças radicais para sentir a diferença! Pequenos hábitos, incorporados na sua rotina, podem ter um impacto gigantesco no seu bem-estar físico e mental, independentemente da sua idade.',
                            style: GoogleFonts.poppins(fontSize: 15),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '💧 1. Hidrate-se como Prioridade!',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          Text(
                            'Beber água suficiente é fundamental para o bom funcionamento do corpo. Mantenha uma garrafa de água por perto e tente beber, pelo menos, 8 copos por dia. Para as crianças, copos coloridos ou com personagens favoritos podem incentivar o consumo.',
                            style: GoogleFonts.poppins(fontSize: 15),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '🏃‍♂️ 2. Mexa-se Todos os Dias!',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          Text(
                            'Não é preciso ser atleta! O importante é evitar o sedentarismo. Caminhadas, brincadeiras ao ar livre ou exercícios leves já fazem diferença. A atividade física melhora o humor, a energia e a qualidade do sono.',
                            style: GoogleFonts.poppins(fontSize: 15),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '🥗 3. Alimente-se de Forma Inteligente',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          Text(
                            'Prefira alimentos frescos e integrais: frutas, vegetais, grãos inteiros e proteínas magras. Reduza açúcares e processados. Envolver as crianças na cozinha pode ser divertido e educativo!',
                            style: GoogleFonts.poppins(fontSize: 15),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '😴 4. Durma o Suficiente',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          Text(
                            'O sono de qualidade é essencial para a saúde. Crie rotinas, evite telas antes de dormir e garanta um ambiente tranquilo. O descanso adequado melhora o humor, a concentração e a imunidade.',
                            style: GoogleFonts.poppins(fontSize: 15),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '🧠 5. Cuide da Sua Mente',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          Text(
                            'A saúde mental é tão importante quanto a física. Pratique hobbies, medite, converse com quem você gosta e não hesite em buscar apoio profissional se precisar.',
                            style: GoogleFonts.poppins(fontSize: 15),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '🩺 6. Faça Check-ups Regulares',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          Text(
                            'Mesmo se estiver bem, consultas de rotina ajudam na prevenção e detecção precoce de problemas. Siga o calendário de vacinação e realize exames preventivos.',
                            style: GoogleFonts.poppins(fontSize: 15),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            '✨ Cuide-se com carinho. Pequenas atitudes hoje garantem uma vida mais saudável e feliz amanhã!',
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.italic,
                              color: Color(0xFF006D77),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Fechar'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006D77),
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            // Linha 1
            Row(
              children: [
                _buildImageButton(context, 'calendar-time_17938988.png', 'Calendário', const CalendarioPage()),
                _buildImageButton(context, 'patient_2355692.png', 'Serviços', const ServicosPage()),
              ],
            ),
            const SizedBox(height: 20),
            // Linha 2
            Row(
              children: [
                _buildImageButton(context, 'price-list_2847127.png', 'Receitas', const ExamesReceitasPage()),
                _buildImageButton(context, 'info_10024208.png', 'Informações', const InfoPage()),
              ],
            ),
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
}

Widget _buildImageButton(BuildContext context, String imagePath, String label, Widget page) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 100,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🔔'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.info, color: Colors.blue),
            title: Text('Consulta confirmada'),
            subtitle: Text('Sua consulta está agendada para amanhã às 14h.'),
          ),
          ListTile(
            leading: Icon(Icons.medical_services, color: Colors.green),
            title: Text('Exame disponível'),
            subtitle: Text('O resultado do seu exame já está disponível no app.'),
          ),
          ListTile(
            leading: Icon(Icons.warning, color: Colors.orange),
            title: Text('Lembrete de medicação'),
            subtitle: Text('Não se esqueça de tomar seu remédio às 21h.'),
          ),
        ],
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
}

//Animações
void navegarComTransicao(BuildContext context, Widget page) {
  Navigator.of(context).push(
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween<Offset>(
          begin: const Offset(1.0, 0.0), // da direita para o centro
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut));

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    ),
  );
}
