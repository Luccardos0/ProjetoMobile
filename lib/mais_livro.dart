import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'avaliarlivro2.dart';

void main() {
  runApp(const BookRateHome());
}

class BookRateHome extends StatelessWidget {
  const BookRateHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookRate',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MaisLivroScreen(titulo: 'Harry Potter e a Pedra Filosofal'),
    );
  }
}

class MaisLivroScreen extends StatelessWidget {
  final String titulo;
  final String autor;

  const MaisLivroScreen({
    super.key,
    required this.titulo,
    this.autor = 'Autor Desconhecido', // Autor padrão
  });

  // Cores do projeto
  static const _backgroundColor = Color(0xFF1a2744); // Azul-escuro
  static const _headerColor = Color(0xFFF5F0E0); // Bege claro
  static const _cardColor = Color(0xFFF5B731); // Amarelo-ouro
  static const _orangeColor = Color(0xFFFF8A00); // Laranja
  static const _darkGrayColor = Color(0xFF4A4A4A); // Cinza escuro
  static const _redColor = Color(0xFFB00020); // Vermelho para botão avaliar

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = AuthService().isLoggedIn;

    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: _headerColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: _darkGrayColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: _orangeColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.menu_book,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Book',
                    style: TextStyle(
                      color: _orangeColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'sans-serif',
                    ),
                  ),
                  TextSpan(
                    text: 'Rate',
                    style: TextStyle(
                      color: _darkGrayColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'sans-serif',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: _cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Capa do livro (placeholder)
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD8A65B),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      'Capa do Livro',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Título do livro
                Text(
                  titulo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Autor
                Text(
                  autor,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                // Avaliação em estrelas
                Row(
                  children: List.generate(
                    5,
                    (index) => const Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Comentários recentes
                const Text(
                  'Comentários Recentes:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _headerColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Nenhum comentário ainda. Seja o primeiro a avaliar!',
                    style: TextStyle(
                      color: _darkGrayColor,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Botão de ação (só aparece se usuário estiver logado)
                if (isLoggedIn)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BookEvaluationDetailScreen(
                              titulo: titulo,
                              autor: autor,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _redColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Avaliar este livro',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        backgroundColor: _orangeColor,
        child: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}