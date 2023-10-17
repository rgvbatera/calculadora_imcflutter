import 'package:flutter/material.dart';

class IMCCalculadora extends StatefulWidget {
  const IMCCalculadora({super.key});

  @override
  State<IMCCalculadora> createState() => _IMCCalculadoraState();

  double calcularIMC(double peso, double altura) {
    if (altura <= 0) {
      throw ArgumentError('A altura deve ser maior que zero.');
    }
    return peso / (altura * altura);
  }

  String getIMCResult(double imc) {
    if (imc < 16) {
      return ("Magreza GRAVE, cuidado!,");
    } else if (imc < 17) {
      return "Magreza MODERADA";
    } else if (imc < 18.5) {
      return "Magreza leve";
    } else if (imc < 25) {
      return "Saudável!, continue assim";
    } else if (imc < 30) {
      return "Você está com SOBREPESO.";
    } else if (imc < 35) {
      return "OBESIDADE GRAU I";
    } else if (imc < 40) {
      return "OBESIDADE GRAU II (Severa)";
    } else {
      return "OBESIDADE GRAU III (Mórbida)";
    }
  }
}

class _IMCCalculadoraState extends State<IMCCalculadora> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  final IMCCalculadora calculator = const IMCCalculadora();
  List<IMCResult> results = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Calculadora de IMC',
            style: TextStyle(
              color: Color.fromARGB(255, 136, 185, 214),
              fontSize: 30.0,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 53, 122, 241),
      ),
      body: Container(
        color: const Color.fromARGB(255, 241, 232, 241),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        hintText: 'Digite o seu nome',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        labelText: 'Nome'),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: pesoController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Digite o seu peso',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        labelText: 'Peso (kg)'),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: alturaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Digite a sua altura',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        labelText: 'Altura (m)'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String name = nameController.text;
                      double peso = double.parse(pesoController.text);
                      double altura = double.parse(alturaController.text);
                      double imc = calculator.calcularIMC(peso, altura);
                      String result = calculator.getIMCResult(imc);
                      setState(() {
                        results.add(IMCResult(name, peso, altura, imc, result));
                      });
                    },
                    child: const Text('Calcular IMC'),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: results.length,
              itemBuilder: (context, index) {
                IMCResult result = results[index];
                return ListTile(
                  title: Text(
                      'Nome: ${result.name}, Peso: ${result.peso} kg, Altura: ${result.altura} m'),
                  subtitle: Text(
                      'IMC: ${result.imc.toStringAsFixed(2)}, Resultado: ${result.result}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class IMCResult {
  final String name;
  final double peso;
  final double altura;
  final double imc;
  final String result;

  IMCResult(this.name, this.peso, this.altura, this.imc, this.result);
}
