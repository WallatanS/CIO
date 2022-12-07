import 'package:flutter/material.dart';
import 'package:listcom/commons/dropdown_search.dart';
import 'package:listcom/screen/home/components/home_shop_list.dart';
import 'package:listcom/screen/products/product_list_page.dart';
import 'package:listcom/screen/shoplist/shoplist_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            //card para disponibilizar botões de acesso à lista de compras e fornecedores
            color: Colors.white,
            elevation: 2,
            child: SizedBox(
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Economizei R\$ 37,00",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.teal.shade100,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ShopListPage(),
                            ),
                          );
                        },
                        child: const Text("Lista de Compras"),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.teal.shade100,
                        ),
                        onPressed: () {},
                        child: const Text("Registrar Fornecedor"),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.teal.shade100,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ProductListPage(),
                            ),
                          );
                        },
                        child: const Text("Produtos"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 60,
                width: 205,
                child: Card(
                  elevation: 2,
                  child: TextButton.icon(
                    onPressed: () {},
                    label: const Text("Melhores Preços"),
                    icon: const Icon(Icons.add_chart_outlined),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: 205,
                child: Card(
                  elevation: 2,
                  child: TextButton.icon(
                    onPressed: () {},
                    label: const Text("Melhor Compra"),
                    icon: const Icon(Icons.add_shopping_cart_sharp),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.white,
            elevation: 2,
            child: SizedBox(
              height: 212,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox.fromSize(
                            // size: const Size(
                            //   80,
                            //   80,
                            // ),
                            child: ClipOval(
                              child: Material(
                                elevation: 2,
                                color: Colors.amberAccent,
                                child: InkWell(
                                  splashColor: Colors.green,
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/financial/wallet.png",
                                        height: 60,
                                        width: 60,
                                        color: Colors.white30,
                                        colorBlendMode: BlendMode.darken,
                                        fit: BoxFit.fitHeight,
                                      ), // <-- Icon
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Text("Finanças")
                        ],
                      ),

                      Column(
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.teal.shade200,
                              child: IconButton(
                                iconSize: 100,
                                color: Colors.white,
                                onPressed: () {},
                                splashColor: Colors.yellowAccent,
                                splashRadius: 50,
                                icon: Image.asset("assets/financial/chart.png"),
                              ),
                            ),
                          ),
                          const Text("Análise"),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.deepPurple.shade100,
                              child: IconButton(
                                iconSize: 100,
                                color: Colors.white30,
                                onPressed: () {},
                                splashColor: Colors.yellowAccent,
                                splashRadius: 50,
                                icon: Image.asset("assets/financial/pie.png"),
                              ),
                            ),
                          ),
                          const Text("Despesas"),
                        ],
                      ),

                      // TextButton(
                      //   onPressed: () {},
                      //   style: ButtonStyle(
                      //       side: MaterialStateProperty.all(
                      //           const BorderSide(width: 2, color: Colors.red)),
                      //       foregroundColor:
                      //           MaterialStateProperty.all(Colors.purple),
                      //       padding: MaterialStateProperty.all(
                      //           const EdgeInsets.symmetric(
                      //               vertical: 10, horizontal: 50)),
                      //       textStyle: MaterialStateProperty.all(
                      //           const TextStyle(fontSize: 10))),
                      //   child: const Text(
                      //     'Text Button',
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox.fromSize(
                            // size: const Size(
                            //   80,
                            //   80,
                            // ),
                            child: ClipOval(
                              child: Material(
                                elevation: 2,
                                color: Colors.deepOrange.shade200,
                                child: InkWell(
                                  splashColor: Colors.green,
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/financial/bag.png",
                                        height: 60,
                                        width: 60,
                                        color: Colors.white30,
                                        colorBlendMode: BlendMode.darken,
                                        fit: BoxFit.fitHeight,
                                      ), // <-- Icon
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Text("Poupança")
                        ],
                      ),

                      Column(
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              child: IconButton(
                                iconSize: 100,
                                color: Colors.white,
                                onPressed: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => {}));
                                },
                                splashColor: Colors.yellowAccent,
                                splashRadius: 50,
                                icon: Image.asset("assets/financial/Bank.png"),
                              ),
                            ),
                          ),
                          const Text("Banco"),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              child: IconButton(
                                iconSize: 100,
                                color: Colors.white30,
                                onPressed: () {},
                                splashColor: Colors.yellowAccent,
                                splashRadius: 50,
                                icon: Image.asset("assets/financial/pie.png"),
                              ),
                            ),
                          ),
                          const Text("Despesas"),
                        ],
                      ),

                      // TextButton(
                      //   onPressed: () {},
                      //   style: ButtonStyle(
                      //       side: MaterialStateProperty.all(
                      //           const BorderSide(width: 2, color: Colors.red)),
                      //       foregroundColor:
                      //           MaterialStateProperty.all(Colors.purple),
                      //       padding: MaterialStateProperty.all(
                      //           const EdgeInsets.symmetric(
                      //               vertical: 10, horizontal: 50)),
                      //       textStyle: MaterialStateProperty.all(
                      //           const TextStyle(fontSize: 10))),
                      //   child: const Text(
                      //     'Text Button',
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 15, left: 5, bottom: 18.0),
            child: Text(
              'Compras realizadas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            color: Colors.black12,
            height: 200,
            child: const HomeShopList(),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5, top: 18, bottom: 18.0),
            child: Text(
              'DashBoard',
              style: TextStyle(fontSize: 18),
            ),
          ),

          Container(
            color: Colors.black12,
            height: 100,
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Card(
                child: ListTile(
                  title: Text('Comparativo de preços'),
                  subtitle: Text('Este card é para apresentar dados'),
                ),
              ),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(left: 5, top: 18, bottom: 18.0),
          //   child: Text(
          //     'Listagem horizontal',
          //     style: TextStyle(fontSize: 18),
          //   ),
          // ),

          // Container(
          //   color: Colors.black12,
          //   height: 100.0,
          //   child: ListView.builder(
          //     physics: const ClampingScrollPhysics(),
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 5,
          //     itemBuilder: (BuildContext context, int index) => Card(
          //       child: Center(
          //         child: Text('Exemplo $index'),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
