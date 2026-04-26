import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'avaliarlivronome.dart';
import 'avaliarlivro2.dart';
import 'logado.dart';

class RatingSearchScreen extends StatelessWidget {
  const RatingSearchScreen({super.key});

  static const _backgroundColor = Color(0xFF050B1F);
  static const _cardColor = Color(0xFFF7D19C);
  static const _creamColor = Color(0xFFFAF0E6);
  static const _buttonColor = Color(0xFFFF8A00);
  static const _labelColor = Color(0xFF0B1F3A);
  static const _actionColor = Color(0xFFB00020);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreenLogged(),
            ),
          );
        },
        backgroundColor: _buttonColor,
        child: const Icon(Icons.reply, color: Colors.white),
      ),
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
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Insira o ISBN:',
                        style: TextStyle(
                          color: _labelColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: _creamColor,
                          hintText: 'Digite o ISBN do livro',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: _actionColor,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const BookEvaluationDetailScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.check, color: Colors.white),
                            iconSize: 28,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            children: [
                              const TextSpan(text: 'Não sabe o ISBN? '),
                              TextSpan(
                                text: 'Busque por nome.',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const RatingSearchNameScreen(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
