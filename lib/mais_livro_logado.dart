import 'package:flutter/material.dart';
import 'avaliarlivro2.dart';

class MaisLivroScreenLogged extends StatelessWidget {
  final String titulo;
  final String autor;

  const MaisLivroScreenLogged({
    super.key,
    required this.titulo,
    this.autor = 'Autor Desconhecido',
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
                // Três sub-cards de comentários
                _buildCommentCard('raissa_tmartinelli', 'Livro incrível!'),
                const SizedBox(height: 8),
                _buildCommentCard('Usuário2', 'Adorei a narrativa.'),
                const SizedBox(height: 8),
                _buildCommentCard('Usuário3', 'Recomendo muito!'),
                const SizedBox(height: 24),
                // Botão vermelho "Avaliar este livro" - sempre visível para usuários logados
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _redColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextButton(
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
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
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

  Widget _buildCommentCard(String usuario, String comentario) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _headerColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            usuario,
            style: const TextStyle(
              color: _darkGrayColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            comentario,
            style: const TextStyle(
              color: _darkGrayColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}