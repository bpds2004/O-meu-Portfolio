import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EsqueciPassPage extends StatelessWidget {
  const EsqueciPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[50],
        title: Text(
          'Recuperar Password',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Container(
        color: Colors.teal[50],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Spacer(), // Empurra o conteúdo para baixo
                Image.asset(
                  'medtech.jpg', // Caminho do logo
                  height: 150,   // Aumenta o tamanho da imagem
                  width: 150,
                ),
                const SizedBox(height: 20),
                Text(
                  'Digite o email para recuperar a password:',
                  style: GoogleFonts.poppins(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Escreve o teu email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (emailController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Por favor, escreva o seu email.')),
                      );
                    } else {
                      // Lógica para recuperação de senha
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: Text(
                    'Recuperar',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
                const Spacer(), // Adiciona espaço no final para centralizar
              ],
            ),
          ),
        ),
      ),
    );
  }
}