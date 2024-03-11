import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrincipalView(),
    );
  }
}

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  //chave formulário
  var formKey = GlobalKey<FormState>();
  var status = false;

  //Controladores para os campos de texto
  var txtUsuario = TextEditingController();
  var txtSenha = TextEditingController();

  caixaDialogo(context, titulo, mensagem) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(titulo),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'cancelar'),
            child: const Text('cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'ok'),
            child: const Text('ok'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tela de Login',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(
          Icons.account_circle_outlined,
          color: Colors.white,
          size: 40,
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 100, 50, 50),
        child: Form(
            key: formKey,
            child: Column(children: [
              Image.asset('lib/imagens/login.png', width: 200, height: 200),
              const SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: txtUsuario,
                decoration: const InputDecoration(
                    labelText: 'Informe usuário/cpf',
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null) {
                    return 'Campo vazio';
                  } else if (value.isEmpty) {
                    return 'Campo vazio';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: txtSenha,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Informe sua senha',
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null) {
                    return 'Campo vazio';
                  } else if (value.isEmpty) {
                    return 'Campo vazio';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(200, 60),
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    //Validação com sucesso
                    setState(() {
                      var txt1 = txtUsuario.text;
                      var txt2 = txtSenha.text;

                      var msg = 'Usuario: $txt1\nSenha: $txt2';
                      caixaDialogo(context, "Usuário e senha", msg);
                    });
                  }
                },
                child: const Text('Logar'),
              ),
              const SizedBox(height: 30),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(200, 60),
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Redefinir senha',
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(height: 30),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(200, 60),
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text('Criar usuário'),
              )
            ])),
      ),
    );
  }
} teste
