import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

//GetxController vem do import Get
class Controller extends GetxController {
  //variaveis que serão modificadas
  String titlo = "Aolicativo Exemplo Getx TM";
  int valor = 0;

//metodo contador
  void IncrementaValor() {
    valor++;
    print(valor);
    //metodo update serve para mostrar o valor atualizado na tela
    update();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //semelhante a Bloc, cria um GetBuilder passando a classe de dados como parametro
      home: GetBuilder<Controller>(
          //chamando o contrutor da classe
          init: Controller(),
          //builder em GetX não precisa de context ou qualquer outro parametro, as variaves são acessadas através de
          builder: (_) {
            return Scaffold(
              appBar: AppBar(
                title: Text('${_.titlo}'),
              ),
              body: Center(
                child: GestureDetector(
                  onTap: () => _.IncrementaValor(),
                  child: Text(
                    "Valor: ${_.valor}",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
