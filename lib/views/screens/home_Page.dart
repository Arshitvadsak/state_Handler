import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/controllers/providers/counter_provider.dart';
import 'package:state_management_provider/controllers/providers/theme_peovider.dart';
import 'package:state_management_provider/views/screens/allProduct.dart';

import '../../controllers/providers/product_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: Icon(Icons.light_mode_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                'CardPage',
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
        centerTitle: true,
        elevation: 20,
      ),
      body: ListView.builder(
        itemCount: allProducts.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 3,
            child: ListTile(
              leading: Text("${allProducts[i].id}"),
              title: Text("${allProducts[i].name}"),
              subtitle: Text(
                  "${allProducts[i].category}\nRs. ${allProducts[i].price}"),
              trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Provider.of<PrductProvider>(context, listen: false)
                      .addProduct(product: allProducts[i]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
