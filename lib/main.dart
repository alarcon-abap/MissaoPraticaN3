import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterTts flutterTts;  // FlutterTts para falar em voz alta

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();  // Inicialização do FlutterTts
  }

  // Função para falar uma mensagem
  Future<void> speak(String message) async {
    await flutterTts.setLanguage("pt-BR");  // Configurar o idioma para Português (Brasil)
    await flutterTts.speak(message);  // Falar a mensagem
  }

  @override
  void dispose() {
    flutterTts.stop();  // Parar o TTS ao sair da página
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leitor de Mensagens"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pressione o botão para ouvir a mensagem:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Exemplo de uso: ler uma mensagem
          speak("Olá, isso é um exemplo de leitura em voz alta em Flutter.");
        },
        tooltip: 'Ouvir Mensagem',
        child: Icon(Icons.volume_up),
      ),
    );
  }
}