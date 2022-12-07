import 'package:flutter/material.dart';
import 'package:listcom/commons/date_picker.dart';
import 'package:listcom/models/shoplist/shoplist.dart';
import 'package:listcom/models/shoplist/shoplist_service.dart';

class ShopListAddPage extends StatelessWidget {
  ShopListAddPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ShopList _shopList = ShopList();
  late DateTime areaDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Lista de Compras"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Nome da Lista',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Campo deve ser preenchido!!!';
                    }
                    return null;
                  },
                  onSaved: (name) => _shopList.name = name,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: DatePicker(
                    name: 'Dia da Compra',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe a data da compra';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (data) {
                      _shopList.date = data;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancelar"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ShopListService shopListService = ShopListService();
                          bool ok = await shopListService.add(_shopList);
                          if (ok) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.green,
                                    content:
                                        Text("Dados gravados com sucesso!!!")));
                            _formKey.currentState!.reset();
                            Navigator.of(context).pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.red,
                                    content:
                                        Text("Problemas ao gravar dados!!!")));
                          }
                        }
                      },
                      child: const Text("Salvar"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
