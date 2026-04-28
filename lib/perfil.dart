import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _backgroundColor = Color(0xFF050B1F);
  static const _cardColor = Color(0xFFF7D19C);
  static const _creamColor = Color(0xFFFAF0E6);
  static const _buttonColor = Color(0xFFFF8A00);
  static const _labelColor = Color(0xFF0B1F3A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).maybePop();
        },
        backgroundColor: _buttonColor,
        child: const Icon(Icons.reply, color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
                    'images/logo.png',
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
                    const Center(
                      child: Icon(
                        Icons.account_circle,
                        size: 96,
                        color: _labelColor,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildLabel('Nome:'),
                    const SizedBox(height: 8),
                    _buildReadOnlyField('Lucas Cardoso'),
                    const SizedBox(height: 16),
                    _buildLabel('Usuário:'),
                    const SizedBox(height: 8),
                    _buildReadOnlyField('lucas.cardoso'),
                    const SizedBox(height: 16),
                    _buildLabel('Email:'),
                    const SizedBox(height: 8),
                    _buildReadOnlyField('lucas.cardoso@email.com'),
                    const SizedBox(height: 16),
                    _buildLabel('Quantidade:'),
                    const SizedBox(height: 8),
                    _buildReadOnlyField('23'),
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
                        'Meus livros',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: _labelColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _buildReadOnlyField(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: _creamColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        value,
        style: const TextStyle(
          color: _labelColor,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildReviewCard(String title, int stars) {
    return Container(
      decoration: BoxDecoration(
        color: _creamColor,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 72,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFD8A65B),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                'Capa',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
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
                  title,
                  style: const TextStyle(
                    color: _labelColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Icon(
                        Icons.star,
                        size: 18,
                        color: index < stars ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
