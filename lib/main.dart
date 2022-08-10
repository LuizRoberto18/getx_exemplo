import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}
/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //routes nomeadas
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => Tela1(),
        ),
        GetPage(
          name: '/Tela2',
          page: () => Tela2(),
        ),
      ],
      home: Tela1(),
    );
  }
}

//GetX navegação de telas com routes não nomeadas
class Tela1 extends StatelessWidget {
  const Tela1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tela 1"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed('Tela2', arguments: ["args1", "args2"]);
              //Get.to(Tela2, arguments: ["args1", "args2"]);
              /* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Tela2();
                }),
              );*/
            },
            child: Text("Ir para tela 2"),
          ),
        ),
      ),
    );
  }
}

class Tela2 extends StatelessWidget {
  const Tela2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //mostrando resultados de argumentos
        title: Text('Tela 2 ' + Get.arguments[0]),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
            // Navigator.pop(context);
          },
          child: Text("Voltar para tela 1"),
        ),
      ),
    );
  }
}
*/

//GetxController vem do import Get
class Controller extends GetxController {
  //instanciando um controller via egt.find()
  static Controller get to => Get.find();

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
  //torna possivel pegar as variaveis da classe Controller direto do StateLess
  //final controller = Get.put(Controller());

//variaveis obs e Obx
  var numero = 0.obs;

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //semelhante a Bloc, cria um GetBuilder passando a classe de dados como parametro
      home: Scaffold(
        appBar: AppBar(
          title: Text('Texto'),
          //title: Text('${Get.find<Controller>().titlo}'),
          //title: Text('${controller.titlo}'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () => print("tap"),
            child: Obx(
              () => Text(
                "Valor: ${numero}",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  /*@override
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
                //title: Text('${Get.find<Controller>().titlo}'),
                //title: Text('${controller.titlo}'),
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
  }*/
}
