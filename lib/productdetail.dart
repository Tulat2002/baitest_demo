import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetail({required this.product});

  TextEditingController controller = TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Icon(Icons.share),
        SizedBox(width: 20,)
      ],),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Center(child: Image.asset(product['image']!)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23)),
              color: product["color"].withOpacity(0.1),
            ),
          ),

          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Naturel Red Apple",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    IconButton(onPressed: (){
                    }, icon: Icon(Icons.favorite_outline))
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "1kg, Price",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Container(

                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {},
                          ),
                          Container(child: TextField(
                            controller: controller,
                            textAlign: TextAlign.center,
                            style: TextStyle(decoration: TextDecoration.none),
                          ),
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$4.99",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ExpansionTile(
                  title: Text("Product Detail"),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Apples are nutritious. Apples may be good for weight loss. "
                            "Apples may be good for your heart. As part of a healthful and varied diet.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  title: Text("Nutritions"),
                  trailing: Text("100gr"),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Review"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  border:Border.all(color: Colors.green,width:0.5,style: BorderStyle.solid),
                  color: Colors.green[400],
                  // color: HexColor('#44564a'),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  "Check out",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}