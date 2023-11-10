import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primaryColor: Colors.brown,
        hintColor: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  double imcResult = 0.0;
  String interpretacion = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Peso (kg)'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura (m)'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                calcularIMC();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.brown,
              ),
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 16.0),
            Text('Su IMC es: ${imcResult.toStringAsFixed(2)}'),
            SizedBox(height: 16.0),
            Text('Interpretación: $interpretacion'),
          ],
        ),
      ),
    );
  }

  void calcularIMC() {
    double peso = double.tryParse(pesoController.text) ?? 0.0;
    double altura = double.tryParse(alturaController.text) ?? 0.0;

    print('Peso: $peso, Altura: $altura');

    if (peso > 0 && altura > 0) {
      double imc = peso / (altura * altura);
      print('IMC calculado: ${imc.toStringAsFixed(2)}');
      setState(() {
        imcResult = imc;
        interpretacion = interpretarIMC(imc);
      });
    } else {
      print('Ingrese valores válidos para peso y altura.');
    }
  }

  String interpretarIMC(double imc) {
    if (imc < 18.5) {
      return 'Bajo peso';
    } else if (imc >= 18.5 && imc < 25) {
      return 'Peso normal';
    } else if (imc >= 25 && imc < 30) {
      return 'Sobrepeso';
    } else {
      return 'Obesidad';
    }
  }
}
