import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'logado.dart';
import 'login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const _backgroundColor = Color(0xFF050B1F);
  static const _cardColor = Color(0xFFF7D19C);
  static const _creamColor = Color(0xFFFAF0E6);
  static const _buttonColor = Color(0xFFFF8A00);
  static const _fieldTextColor = Color(0xFF0B1F3A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 520),
            decoration: BoxDecoration(
              color: _cardColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: _creamColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Image.asset(
                      'assets/logo.png',
                      height: 48,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildLabel('Nome:'),
                        _buildTextField(hintText: 'Digite seu nome'),
                        const SizedBox(height: 16),
                        _buildLabel('Email:'),
                        _buildTextField(hintText: 'Digite seu email', keyboardType: TextInputType.emailAddress),
                        const SizedBox(height: 16),
                        _buildLabel('CPF:'),
                        _buildTextField(hintText: 'Digite seu CPF', keyboardType: TextInputType.number),
                        const SizedBox(height: 16),
                        _buildLabel('Usuário:'),
                        _buildTextField(hintText: 'Escolha um usuário'),
                        const SizedBox(height: 16),
                        _buildLabel('Senha:'),
                        _buildTextField(hintText: 'Crie uma senha', obscureText: true),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreenLogged(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _buttonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                color: _fieldTextColor,
                                fontSize: 14,
                              ),
                              children: [
                                const TextSpan(text: 'Já tem conta? '),
                                TextSpan(
                                  text: 'Login.',
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => const LoginScreen(),
                                        ),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: _fieldTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: _creamColor,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
