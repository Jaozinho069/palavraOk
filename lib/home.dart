import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _wordHints = [
    {
      'word': 'cachorro',
      'hints': [
        'Animal de estimação que late',
        'Tem quatro patas e é amigo do homem',
        'É conhecido como o melhor amigo do homem',
      ],
    },
    {
      'word': 'banana',
      'hints': [
        'Fruta amarela e curva',
        'Pode ser comida crua ou frita',
        'Os macacos adoram comer',
      ],
    },
    {
      'word': 'elefante',
      'hints': [
        'Maior animal terrestre',
        'Possui tromba longa',
        'É símbolo de memória e força',
      ],
    },
    {
      'word': 'paris',
      'hints': [
        'Cidade conhecida como “Cidade Luz”',
        'Onde fica a Torre Eiffel',
        'Capital da França',
      ],
    },
    {
      'word': 'ouro',
      'hints': [
        'Metal precioso',
        'É de cor amarela brilhante',
        'Usado para fazer joias valiosas',
      ],
    },
    {
      'word': 'abelha',
      'hints': [
        'Inseto que faz mel',
        'Vive em colmeias',
        'Pode ferroar para se defender',
      ],
    },
    {
      'word': 'leão',
      'hints': [
        'É conhecido como o rei da selva',
        'Tem uma juba ao redor da cabeça',
        'Animal carnívoro que vive em savanas',
      ],
    },
    {
      'word': 'pizza',
      'hints': [
        'Prato típico italiano',
        'É redonda e coberta com queijo',
        'Pode ter vários sabores, como calabresa ou marguerita',
      ],
    },
    {
      'word': 'camaleão',
      'hints': [
        'Réptil conhecido por mudar de cor',
        'Possui olhos que se movem independentemente',
        'Vive em árvores e é muito furtivo',
      ],
    },
    {
      'word': 'água',
      'hints': [
        'Líquido essencial para a vida',
        'Não tem cor, cheiro ou sabor',
        'Cobre mais de 70% da superfície da Terra',
      ],
    },
  ];

  int _currentHintIndex = 0;
  int _currentWordIndex = 0;
  String _message = '';
  final TextEditingController _textController = TextEditingController();

  void _checkAnswer() {
    String userInput = _textController.text.trim().toLowerCase();
    String correctWord = _wordHints[_currentWordIndex]['word'].toLowerCase();

    setState(() {
      if (userInput == correctWord) {
        _message = 'Parabéns! Você acertou.';
        _textController.clear();
        _currentWordIndex = (_currentWordIndex + 1) % _wordHints.length;
        _currentHintIndex = 0; // Reinicia as dicas para a próxima palavra
      } else {
        _message = 'Resposta incorreta. Tente novamente!';
      }
    });
  }

  void _nextHint() {
    setState(() {
      if (_currentHintIndex < 2) {
        _currentHintIndex++;
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
              'Dica: ${_wordHints[_currentWordIndex]['hints'][_currentHintIndex]}',
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
            ElevatedButton(
              onPressed: _nextHint,
              child: Text(
                _currentHintIndex == 2 ? 'Última Dica' : 'Próxima Dica',
              ),
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
