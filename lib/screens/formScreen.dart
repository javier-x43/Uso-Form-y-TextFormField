import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormScreen extends StatefulWidget {
  //alt izq para cambiar todos los nombres en ek campo
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late TextEditingController _controller;
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Form(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            inputEmail(_controller),
            const SizedBox(height: 10),
            inputPassword(),
            const SizedBox(height: 10),
            inputCard(),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              child: CheckboxListTile(
                  title: const Text('Validar'),
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  }),
            ),
            const SizedBox(height: 50),
            ElevatedButton(onPressed: () => {}, child: const Text('Enviar')),
            SizedBox(width: 06.0),
            ElevatedButton(
              child: const Text('Regresar'),
              onPressed: () => Navigator.pop(context),
            )
          ])),
    ));
  }
}

Widget inputCard() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    margin: const EdgeInsets.symmetric(horizontal: 30.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 2.0)),
    child: TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[0-9 -]')),
        LengthLimitingTextInputFormatter(16)
      ],
      decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.credit_card),
          labelText: 'Tarjeta',
          hintText: '4152-1234-2542-1452'),
    ),
  );
}

Widget inputPassword() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    margin: const EdgeInsets.symmetric(horizontal: 30.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 2.0)),
    child: TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.lock),
          labelText: 'Contraseña'),
    ),
  );
}

Widget inputEmail(_controller) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    margin: const EdgeInsets.symmetric(horizontal: 30.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 2.0)),
    child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      controller: _controller,
      decoration: const InputDecoration(
          border: InputBorder.none,
//icon: Icon(Icons.contact_mail),
          prefixIcon: Icon(Icons.contact_mail),
          labelText: 'Correo',
          hintText: 'micorreoesjava@correo.com'),
    ),
  );
}
