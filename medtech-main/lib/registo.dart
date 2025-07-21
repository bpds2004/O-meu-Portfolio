import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';



class RegistoPage extends StatefulWidget {
  const RegistoPage({super.key});

  @override
  State<RegistoPage> createState() => _RegistoPageState();
}

class _RegistoPageState extends State<RegistoPage> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telemovelController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  String _tipoUtilizador = 'Doente';

  final _formKey = GlobalKey<FormState>();

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem), backgroundColor: Colors.red),
    );
  }

  bool _validarEmail(String email) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegex.hasMatch(email);
  }

  void _submeterFormulario() {
    final nome = _nomeController.text.trim();
    final email = _emailController.text.trim();
    final telemovel = _telemovelController.text.trim();
    final password = _passwordController.text;
    final confirmar = _confirmPasswordController.text;

    if (nome.isEmpty || email.isEmpty || telemovel.isEmpty || password.isEmpty || confirmar.isEmpty) {
      _mostrarErro('Por favor, preencha todos os campos.');
      return;
    }

    if (!_validarEmail(email)) {
      _mostrarErro('Email inválido.');
      return;
    }

    if (password != confirmar) {
      _mostrarErro('As passwords não coincidem.');
      return;
    }

    if (password.length < 6) {
      _mostrarErro('A password deve ter pelo menos 6 caracteres.');
      return;
    }
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Image.asset(
                'medtech.jpg',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 20),
              Text(
                'Cria a tua conta',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF006D77),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('👤 Nome Completo', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _nomeController,
                          decoration: const InputDecoration(
                            hintText: 'Digite o seu nome',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),

                        Text('📧 Email', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Digite o seu email',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),

                        Text('📞 Nº de telemóvel', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _telemovelController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: 'Digite o seu número',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),

                        Text('Tipo de utilizador', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                title: const Text('🧑‍🤝‍🧑 Utente'),
                                value: 'Doente',
                                groupValue: _tipoUtilizador,
                                onChanged: (v) => setState(() => _tipoUtilizador = v!),
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                title: const Text('🩺 Médico'),
                                value: 'Médico',
                                groupValue: _tipoUtilizador,
                                onChanged: (v) => setState(() => _tipoUtilizador = v!),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        Text('🔑 Password', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: 'Digite a password',
                            border: const OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                              onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('🔑 Confirmar Password', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        TextField(
                          controller: _confirmPasswordController,
                          obscureText: _obscureConfirm,
                          decoration: InputDecoration(
                            hintText: 'Repita a password',
                            border: const OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              icon: Icon(_obscureConfirm ? Icons.visibility_off : Icons.visibility),
                              onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        ElevatedButton.icon(
                          icon: const Text('✍️'),
                          label: Text('Registar', style: GoogleFonts.poppins()),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: _submeterFormulario,
                        ),
                      ],
                    ),
                  ),
                  
                ),
              ),
            ],
          ),
        ),
      ),
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
