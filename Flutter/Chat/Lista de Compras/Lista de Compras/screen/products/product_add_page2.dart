import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listcom/commons/loading.dart';
import 'package:listcom/models/categories/category_service.dart';
import 'package:listcom/models/product/product.dart';
import 'package:listcom/models/product/product_service.dart';
import 'package:listcom/screen/categories/category_add_page.dart';

class ProductAddPage2 extends StatefulWidget {
  ProductAddPage2({Key? key}) : super(key: key);

  @override
  State<ProductAddPage2> createState() => _ProductAddPageState2();
}

class _ProductAddPageState2 extends State<ProductAddPage2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  File? _pickedImage; //armazena imagens do celular
  Uint8List webImage = Uint8List(8); //armazena imagens para web
  final Product _product = Product();
  late final String fileName;
  late File imageFile;
  String categoryId = '';
  var selectedItemCategory;
  @override
  Widget build(BuildContext context) {
    // final theme = Utils(context).getTheme;
    // final color = Utils(context).color;
    CategoryService categoryService = CategoryService();

    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      body: Loading(
        isLoading: _isLoading,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Cadastro de Produtos",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width > 650
                    ? 650
                    : MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.onBackground,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                        onSaved: (description) =>
                            _product.description = description,
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
                      const Text('Categoria:'),
                      StreamBuilder<QuerySnapshot>(
                        stream: categoryService.getCategories(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            List<DropdownMenuItem<String>> categoryItems = [];
                            for (int i = 0;
                                i < snapshot.data!.docs.length;
                                i++) {
                              DocumentSnapshot snap = snapshot.data!.docs[i];
                              categoryItems.add(
                                DropdownMenuItem<String>(
                                  value: snap.id,
                                  child: Text(
                                    snap.get('title'),
                                    style: const TextStyle(
                                        color: Color(0xff1c313a)),
                                  ),
                                ),
                              );
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(width: 50.0),
                                DropdownButton(
                                  items: categoryItems,
                                  onChanged: (value) {
                                    _product.categoryId = value.toString();
                                    _onTapped(value.toString());
                                    final snackBar = SnackBar(
                                      content: Text(
                                        'Categoria atual é $value',
                                        style:
                                            const TextStyle(color: Colors.blue),
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    setState(
                                      () {
                                        selectedItemCategory = value;
                                        categoryId = value.toString();
                                      },
                                    );
                                  },
                                  value: selectedItemCategory,
                                  isExpanded: false,
                                  hint: const Text(
                                    "Escolha a categoria do produto",
                                    style: TextStyle(color: Color(0xff1c313a)),
                                  ),
                                ),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    side: const BorderSide(
                                      width: 2,
                                      color: Colors.red,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CategoryAddPage(),
                                      ),
                                    );
                                  },
                                  child: const Text('...'),
                                )
                              ],
                            );
                          }
                        },
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
                        onSaved: (price) =>
                            _product.price = num.tryParse(price!),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //código para obtenção da imagem e envio para o Firebase
                      Container(
                        width: MediaQuery.of(context).size.width > 650
                            ? 500
                            : MediaQuery.of(context).size.width * 0.90,
                        height: MediaQuery.of(context).size.width > 650
                            ? 350
                            : MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: _pickedImage == null || webImage.isEmpty
                            ? dottedBorder(color: Colors.blue)
                            : Card(
                                elevation: 1.5,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: kIsWeb
                                      ? Image.memory(webImage)
                                      : Image.file(_pickedImage!),
                                ),
                              ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _pickedImage = null;
                          });
                        },
                        child: const Text("Limpar imagem"),
                      ),
                      //Fim do código de upload de imagem
                      const SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
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
                                  ProductService productService =
                                      ProductService();
                                  bool ok = await productService.add(
                                      product: _product,
                                      imageFile:
                                          kIsWeb ? webImage : _pickedImage,
                                      plat: kIsWeb);
                                  if (ok && mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text(
                                                "Dados gravados com sucesso!!!")));
                                    _formKey.currentState!.reset();
                                    setState(() {
                                      _pickedImage = null;
                                      webImage = Uint8List(8);
                                    });
                                    // Navigator.of(context).pop();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                            "Problemas ao gravar dados!!!"),
                                      ),
                                    );
                                  }
                                }
                              },
                              child: const Text("Salvar"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onTapped(String id) {
    categoryId = id;
  }

//rotina para desenhar o pontilhado na tela
  Widget dottedBorder({required Color color}) {
    return DottedBorder(
      dashPattern: const [6],
      borderType: BorderType.RRect,
      radius: const Radius.circular(10),
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.image_outlined,
              color: color,
              size: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  _pickImage();
                },
                child: Text(
                  "Escolha uma Imagem para o produto",
                  style: TextStyle(color: color),
                ))
          ],
        ),
      ),
    );
  }

  //Rotina para obter a imagem para upload
  Future<void> _pickImage() async {
    if (!kIsWeb) {
      //testa se não é WEB
      ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var imageSelected = File(image.path);
        setState(() {
          _pickedImage = imageSelected;
        });
      }
    } else if (kIsWeb) {
      ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var imageSelected =
            await image.readAsBytes(); //converte a imagem para bytes
        setState(() {
          webImage = imageSelected;
          _pickedImage = File('a');
        });
      } else {
        (debugPrint('nenhuma imagem foi selecionada'));
      }
    } else {
      (debugPrint('Algo errado aconteceu'));
    }
  }
}
