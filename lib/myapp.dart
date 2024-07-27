import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    super.key
  });
  @override
  ProductListState createState() => ProductListState();
}

class ProductListState extends State<ProductList> {
  final List<Map<String, String>> products = [
    {"name": "Trái cây & Rau", "image": "assets/fruits.png"},
    {"name": "Thịt & Cá", "image": "assets/meat.png"},
    {"name": "Sản phẩm từ sữa", "image": "assets/dairy.png"},
    {"name": "Dầu ăn & Ghee", "image": "assets/oil.png"},
    {"name": "Bánh ngọt & Đồ ăn vặt", "image": "assets/snacks.png"},
    {"name": "Đồ uống", "image": "assets/beverages.png"},
  ];

  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((product) {
      return product['name']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Tìm Sản Phẩm')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[100],
                  child: const Text("He'd have you all unravel at the"),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[200],
                  child: const Text('Heed not the rabble'),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[300],
                  child: const Text('Sound of screams but the'),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[400],
                  child: const Text('Who scream'),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[500],
                  child: const Text('Revolution is coming...'),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[600],
                  child: const Text('Revolution, they...'),
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Map<String, String> product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['name']!)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(product['image']!),
            Text(product['name']!, style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text("\$4.99"),
            SizedBox(height: 20),
            Text("Tổng quan:"),
            Text("Táo là thực phẩm dinh dưỡng."),
          ],
        ),
      ),
    );
  }
}




// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Find Products'),
//           backgroundColor: Colors.white,
//         ),
//         body: Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.all(16.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search Store',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 padding: const EdgeInsets.all(8.0),
//                 children: [
//                   _buildCategoryCard('Fresh Fruits & Vegetables', Icons.local_grocery_store),
//                   _buildCategoryCard('Cooking Oil & Ghee', Icons.kitchen),
//                   _buildCategoryCard('Meat & Fish', Icons.fastfood),
//                   _buildCategoryCard('Bakery & Snacks', Icons.cake),
//                   _buildCategoryCard('Dairy & Eggs', Icons.egg),
//                   _buildCategoryCard('Beverages', Icons.local_drink),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCategoryCard(String title, IconData icon) {
//     return Card(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 40),
//           SizedBox(height: 10),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }