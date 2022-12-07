import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listcom/models/product/product.dart';
import 'package:listcom/models/product/product_service.dart';
import 'package:path/path.dart' as path;

class ProductAddPage extends StatefulWidget {
  ProductAddPage({Key? key}) : super(key: key);

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Product _product = Product();
  late final String fileName;
  late File imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Produto"),
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
                    hintText: 'Nome do Produto',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Campo deve ser preenchido!!!';
                    } else if (name.trim().split('').length <= 1) {
                      return 'Preencha com seu nome correto';
                    }
                    return null;
                  },
                  onSaved: (name) => _product.name = name,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Descrição do Produto',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  validator: (description) {
                    if (description!.isEmpty) {
                      return 'Campo deve ser preenchido!!!';
                    }
                    return null;
                  },
                  onSaved: (description) => _product.description = description,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Tipo da Unidade',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  validator: (unit) {
                    if (unit!.isEmpty) {
                      return 'Campo deve ser preenchido!!!';
                    }
                    return null;
                  },
                  onSaved: (unit) => _product.unit = unit,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Preço do produto',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  validator: (price) {
                    if (price!.isEmpty) {
                      return 'Campo deve ser preenchido!!!';
                    }
                    return null;
                  },
                  onSaved: (price) => _product.price = num.tryParse(price!),
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
                          ProductService productService = ProductService();
                          bool ok = await productService.add(
                            product: _product,
                            plat: kIsWeb,
                          );
                          if (ok && mounted) {
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
                                content: Text("Problemas ao gravar dados!!!"),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text("Salvar"),
                    ),
                    ElevatedButton.icon(
                        onPressed: () => _upload('camera'),
                        icon: const Icon(Icons.camera),
                        label: const Text('camera')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      fileName = path.basename(pickedImage!.path);
      imageFile = File(pickedImage.path);

      // Refresh the UI
      setState(() {});
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }
}
