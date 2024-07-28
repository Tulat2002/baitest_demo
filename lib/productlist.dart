import 'package:baitest_demo/productdetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  ProductListState createState() => ProductListState();
}

class ProductListState extends State<ProductList> {

  final List<Map<String, dynamic>> products = [
    {"name": "Trái cây & Rau", "image": "assets/apple-usa.png", "color": Colors.orange},
    {"name": "Thịt & Cá", "image": "assets/apple-usa.png", "color": Colors.red},
    {"name": "Sản phẩm từ sữa", "image": "assets/apple-usa.png", "color": Colors.yellow},
    {"name": "Dầu ăn & Ghee", "image": "assets/apple-usa.png", "color": Colors.blue},
    {"name": "Bánh ngọt & Đồ ăn vặt", "image": "assets/apple-usa.png", "color": Colors.green},
    {"name": "Đồ uống", "image": "assets/beverages.png", "color": Colors.pink},
    {"name": "Dairy & age", "image": "assets/age.png", "color": Colors.purple},
    {"name": "Berevages", "image": "assets/vegeta.png", "color": Colors.brown},
  ];

  String query = '';

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((product) {
      return product['name']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Find Products')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(16.0), child: _buildSearchBox()),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              itemCount: filteredProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                //print(product["image"]);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(product: product),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: product["color"].withOpacity(0.9),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: product["color"].withOpacity(0.1),
                    ),
                    padding: const EdgeInsets.all(8),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          product['image']!,
                          height: 90,
                          width: 90,
                        ),
                        Text(
                            product['name']!,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,

                            ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: ListTile(
          leading: Icon(
            Icons.search,
            color: Colors.black,
          ),
          title: TextField(
            style: TextStyle(color: Colors.black),
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Search Store',
              hintStyle: TextStyle(color: Colors.black),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}





