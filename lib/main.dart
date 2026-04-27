import 'package:flutter/material.dart';
import 'cadastrar.dart';
import 'mais_livro.dart';
import 'mais_livro_logado.dart';
import 'auth_service.dart';

void main() {
  runApp(const BookRateApp());
}

class BookRateApp extends StatelessWidget {
  const BookRateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookRate',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _backgroundColor = Color(0xFF050B1F);
  static const _appBarColor = Color(0xFFFAF0E6);
  static const _cardColor = Color(0xFFF7D19C);
  static const _starColor = Color(0xFFFF6A00);
  static const _buttonColor = Color(0xFFFF8A00);

  final List<String> _books = const [
    'Harry Potter e a Pedra Filosofal',
    'A Vida Invisível de Addie LaRue',
    'Diário de um Banana',
    'Amor(es) Verdadeiro(s)',
    'Mentirosos',
    'Até o Verão Terminar',
  ];

  // Mapeamento de livros para autores
  static const _bookAuthors = {
    'Harry Potter e a Pedra Filosofal': 'J.K. Rowling',
    'A Vida Invisível de Addie LaRue': 'V.E. Schwab',
    'Diário de um Banana': 'Jeff Kinney',
    'Amor(es) Verdadeiro(s)': 'Colleen Hoover',
    'Mentirosos': 'E. Lockhart',
    'Até o Verão Terminar': 'Jenny Han',
  };

  String _getAutor(String titulo) {
    return _bookAuthors[titulo] ?? 'Autor Desconhecido';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: _appBarColor,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            const SizedBox(width: 12),
            // Substitua o texto abaixo pela imagem da logo criada.
            // A imagem está registrada em assets/logo.png.
            Image.asset(
              'images/logo.png',
              width: 140,
              height: 48,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  width: 140,
                  height: 48,
                  child: Center(
                    child: Text(
                      'Logo não encontrada',
                      style: TextStyle(color: Colors.black87, fontSize: 10),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                elevation: 0,
              ),
              child: const Text(
                'Cadastre-se',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Em alta na semana:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.40,
              children: _books
                  .map((title) => GestureDetector(
                        onTap: () {
                          // Verifica se o usuário está logado
                          if (AuthService().isLoggedIn) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MaisLivroScreenLogged(
                                  titulo: title,
                                  autor: _getAutor(title),
                                ),
                              ),
                            );
                          } else {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MaisLivroScreen(
                                  titulo: title,
                                  autor: _getAutor(title),
                                ),
                              ),
                            );
                          }
                        },
                        child: BookCard(
                          title: title,
                          cardColor: _cardColor,
                          starColor: _starColor,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.title,
    required this.cardColor,
    required this.starColor,
  });

  final String title;
  final Color cardColor;
  final Color starColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 180,
              width: double.infinity,
              child: Container(
                color: const Color(0xFFD8A65B),
                child: const Center(
                  child: Text(
                    'Capa do Livro',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color(0xFF2E1E0E),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(
                  Icons.star,
                  size: 18,
                  color: starColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Avaliação 4.8',
            style: TextStyle(
              color: Color(0xFF4A351F),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
