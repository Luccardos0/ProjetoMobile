import 'package:flutter/material.dart';
import 'aviso.dart';

class BookEvaluationDetailScreen extends StatefulWidget {
  final String titulo;
  final String autor;

  const BookEvaluationDetailScreen({
    super.key,
    required this.titulo,
    this.autor = 'Autor Desconhecido',
  });

  @override
  State<BookEvaluationDetailScreen> createState() => _BookEvaluationDetailScreenState();
}

class _BookEvaluationDetailScreenState extends State<BookEvaluationDetailScreen> {
  int _notaSelecionada = 0;
  final TextEditingController _comentarioController = TextEditingController();

  @override
  void dispose() {
    _comentarioController.dispose();
    super.dispose();
  }

  static const _backgroundColor = Color(0xFF050B1F);
  static const _cardColor = Color(0xFFF7D19C);
  static const _creamColor = Color(0xFFFAF0E6);
  static const _creamDarkColor = Color(0xFFE6D1A9);
  static const _buttonColor = Color(0xFFFF8A00);
  static const _labelColor = Color(0xFF0B1F3A);
  static const _statusColor = Color(0xFFB00020);

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
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 14,
                        ),
                        decoration: BoxDecoration(
                          color: _statusColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Livro encontrado!',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'ISBN:',
                        style: TextStyle(
                          color: _labelColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: _creamColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          '978-65-5532-035-0',
                          style: TextStyle(
                            color: _labelColor,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Container(
                        decoration: BoxDecoration(
                          color: _creamDarkColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                width: 100,
                                height: 140,
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

                            const SizedBox(width: 16),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.titulo,
                                    style: const TextStyle(
                                      color: _labelColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  Text(
                                    widget.autor,
                                    style: const TextStyle(
                                      color: _labelColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Avaliação:',
                        style: TextStyle(
                          color: _labelColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: _creamColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(5, (index) {
                            final bool isFilled = index < _notaSelecionada;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _notaSelecionada = index + 1;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                child: Icon(
                                  isFilled ? Icons.star : Icons.star_border,
                                  color: isFilled ? Colors.red : Colors.grey,
                                  size: 28,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Comentário:',
                        style: TextStyle(
                          color: _labelColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 8),

                      TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: _creamColor,
                          hintText: 'Escreva sua avaliação aqui...',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                        ),
                        child: const Text(
                          'Publicar Avaliação',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
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

    floatingActionButton: FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => const ConfirmationDialog(),
        );
      },
      backgroundColor: _buttonColor,
      child: const Icon(Icons.arrow_back, color: Colors.white),
    ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}