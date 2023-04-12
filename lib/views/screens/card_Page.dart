import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/models/product_model.dart';
import 'package:state_management_provider/views/screens/allProduct.dart';

import '../../controllers/providers/product_provider.dart';

class Card_Page extends StatefulWidget {
  const Card_Page({super.key});

  @override
  State<Card_Page> createState() => _Card_PageState();
}

class _Card_PageState extends State<Card_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Page"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                      "Total Quantity: ${Provider.of<PrductProvider>(context).totalQuantity} "),
                  Text(
                      "Total Quantity: ${Provider.of<PrductProvider>(context).totalPrice}"),
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: ListView.builder(
                itemCount:
                    Provider.of<PrductProvider>(context).added_product.length,
                itemBuilder: (context, i) {
                  List<Product> data =
                      Provider.of<PrductProvider>(context).added_product;
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      isThreeLine: true,
                      leading: Text("${i + 1}"),
                      title: Text("${data[i].name}"),
                      subtitle:
                          Text("${data[i].category}\n Rs. ${data[i].price}"),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_shopping_cart_outlined),
                        onPressed: () {
                          Provider.of<PrductProvider>(context, listen: false)
                              .removeProduct(
                            product: data[i],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
