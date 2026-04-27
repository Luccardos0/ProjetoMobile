import 'package:flutter/material.dart';
import 'avaliarlivro.dart';
import 'perfil.dart';
import 'mais_livro.dart';
import 'mais_livro_logado.dart';

class HomeScreenLogged extends StatelessWidget {
  const HomeScreenLogged({super.key});

  static const _backgroundColor = Color(0xFF050B1F);
  static const _appBarColor = Color(0xFFFAF0E6);
  static const _cardColor = Color(0xFFF7D19C);
  static const _starColor = Color(0xFFFF6A00);
  static const _buttonColor = Color(0xFFFF8A00);

  final List<String> _books = const [
    'Harry Potter',
    'A Vida Invisível de Addie LaRue',
    'Diário de um Banana',
    'Amor(es) Verdadeiro(s)',
    'Mentirosos',
    'Até o Verão Terminar',
  ];

  // Mapeamento de livros para autores
  static const _bookAuthors = {
    'Harry Potter': 'J.K. Rowling',
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
        titleSpacing: 0,
        title: Row(
          children: [
            Image.asset(
              'images/logo.png',
              width: 200,
              height: 48,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  width: 200,
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
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RatingSearchScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add, size: 20),
              label: const Text(
                'Avaliar livro',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ),
          );
        },
        backgroundColor: _appBarColor,
        child: const Icon(
          Icons.person,
          color: _buttonColor,
          size: 32,
        ),
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MaisLivroScreenLogged(
                                titulo: title,
                                autor: _getAutor(title),
                              ),
                            ),
                          );
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
