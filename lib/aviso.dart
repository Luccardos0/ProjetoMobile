import 'package:flutter/material.dart';
import 'logado.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key});

  static const _dialogColor = Color(0xFFFAF0E6);
  static const _buttonColor = Color(0xFFFF8A00);
  static const _titleColor = Color(0xFFB00020);
  static const _textColor = Color(0xFF0B1F3A);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Container(
        decoration: BoxDecoration(
          color: _dialogColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: Colors.yellow.shade300,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.red.shade700, width: 3),
              ),
              child: const Center(
                child: Icon(
                  Icons.warning_rounded,
                  color: Color(0xFF0B1F3A),
                  size: 44,
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              '! ATENÇÃO !',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _titleColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Quer mesmo retornar à tela anterior? Seu progresso será perdido',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _textColor,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreenLogged(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Sim',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
