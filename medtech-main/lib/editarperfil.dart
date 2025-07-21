import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'main.dart';
import 'calendariomedico.dart';
import 'perfil_page.dart';
import 'calendario.dart';
import 'exame_receitas.dart';
import 'servicos_page.dart';
import 'info_page.dart';
import 'login.dart';

class EditarPerfilPage extends StatefulWidget {
  const EditarPerfilPage({Key? key}) : super(key: key);

  @override
  State<EditarPerfilPage> createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  // Controllers para os campos editáveis
  final TextEditingController primeiroNomeController = TextEditingController(text: 'Juliana');
  final TextEditingController ultimoNomeController = TextEditingController(text: 'Guerra');
  final TextEditingController dataNascimentoController = TextEditingController(text: '03-05-2004');
  final TextEditingController nacionalidadeController = TextEditingController(text: 'Portuguesa');
  final TextEditingController docIdController = TextEditingController(text: '3028****');
  final TextEditingController nifController = TextEditingController(text: '2526****');
  final TextEditingController snsController = TextEditingController(text: '16200****');

  final TextEditingController emailController = TextEditingController(text: '************@gmail.com');
  final TextEditingController telemovelController = TextEditingController(text: '93********');
  final TextEditingController moradaController = TextEditingController(text: 'Rua Sr. *******');

  File? _imagemPerfil;

  @override
  void dispose() {
    // Liberar os controllers ao destruir o widget
    primeiroNomeController.dispose();
    ultimoNomeController.dispose();
    dataNascimentoController.dispose();
    nacionalidadeController.dispose();
    docIdController.dispose();
    nifController.dispose();
    snsController.dispose();
    emailController.dispose();
    telemovelController.dispose();
    moradaController.dispose();
    super.dispose();
  }

  void _salvarPerfil() {
    // Aqui você pode adicionar lógica para salvar os dados editados, ex: chamar API ou salvar localmente
    // Por enquanto só mostra um SnackBar de confirmação
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Perfil salvo com sucesso!')),
    );
    // Pode também voltar para a página de perfil
    Navigator.pop(context);
  }

  Future<void> _selecionarImagem() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagemPerfil = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
    'Editar Perfil',
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
        backgroundColor: Color(0xFF006D77),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 155, 191, 221)),
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
        child: Column(
          children: [
            // Header com gradiente e avatar
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
                      backgroundImage: _imagemPerfil != null
                          ? FileImage(_imagemPerfil!)
                          : const AssetImage('perfil.png') as ImageProvider,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton.icon(
                    onPressed: _selecionarImagem,
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    icon: const Icon(Icons.edit),
                    label: const Text('Editar Imagem'),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _infoEditCard(
                    title: "Dados Pessoais",
                    icon: Icons.person,
                    children: [
                      _buildTextField('Primeiro Nome', primeiroNomeController),
                      _buildTextField('Último Nome', ultimoNomeController),
                      _buildTextField('Data de Nascimento', dataNascimentoController),
                      _buildTextField('Nacionalidade', nacionalidadeController),
                      _buildTextField('Doc. Identificação', docIdController),
                      _buildTextField('NIF', nifController),
                      _buildTextField('Nº SNS', snsController),
                    ],
                  ),
                  const SizedBox(height: 18),
                  _infoEditCard(
                    title: "Contactos",
                    icon: Icons.contact_mail,
                    children: [
                      _buildTextField('Email', emailController, keyboardType: TextInputType.emailAddress),
                      _buildTextField('Telemóvel', telemovelController, keyboardType: TextInputType.phone),
                      _buildTextField('Morada', moradaController),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _salvarPerfil,
                        icon: const Icon(Icons.save),
                        label: const Text('Salvar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF006D77),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.purple),
                        label: const Text('Cancelar', style: TextStyle(color: Colors.purple)),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.purple),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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

  Widget _buildTextField(String label, TextEditingController controller, {TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
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
  Widget _infoEditCard({
  required String title,
  required IconData icon,
  required List<Widget> children,
  }) {
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

}
