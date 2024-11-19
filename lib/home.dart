import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> _wordHints = [
    {'hint': 'Animal que late', 'word': 'cachorro'},
    {'hint': 'Fruta amarela', 'word': 'banana'},
    {'hint': 'Planeta azul', 'word': 'terra'},
    {'hint': 'Maior animal terrestre', 'word': 'elefante'},
    {'hint': 'Cidade conhecida como “Cidade Luz”', 'word': 'paris'},
    {'hint': 'Metal precioso usado em joias', 'word': 'ouro'},
    {'hint': 'Casa portátil usada em acampamentos', 'word': 'barraca'},
    {'hint': 'Inseto que faz mel', 'word': 'abelha'},
    {'hint': 'Meio de transporte aquático', 'word': 'barco'},
    {'hint': 'Rei da selva', 'word': 'leão'},
  ];

  int _currentHintIndex = 0;
  String _message = '';
  final TextEditingController _textController = TextEditingController();

  void _checkAnswer() {
    String userInput = _textController.text.trim().toLowerCase();
    String correctWord = _wordHints[_currentHintIndex]['word']!.toLowerCase();

    setState(() {
      if (userInput == correctWord) {
        _message = 'Parabéns! Você acertou.';
        _textController.clear();
        _currentHintIndex = (_currentHintIndex + 1) % _wordHints.length;
      } else {
        _message = 'Resposta incorreta. Tente novamente!';
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose(); // Liberar recursos ao sair
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adivinhe a Palavra'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dica: ${_wordHints[_currentHintIndex]['hint']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite sua resposta',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: Text('Verificar'),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(
                fontSize: 18,
                color: _message.contains('Parabéns') ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
