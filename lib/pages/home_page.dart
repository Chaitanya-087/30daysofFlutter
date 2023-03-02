import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadDate();
  }

  loadDate() async {
    await Future.delayed(const Duration(seconds: 1));
    var data = await rootBundle.loadString('assets/files/catalog.json');
    var jsonData = json.decode(data);
    var productsData = jsonData['products'];
    // for (int i = 0; i < productsData.length; i++) {
    //   Map<String, dynamic> item = productsData[i];
    //   CatalogModel.items?.add(Item(
    //       id: item['id'],
    //       name: item['name'],
    //       desc: item['desc'],
    //       price: item['price'],
    //       color: item['color'],
    //       image: item['image']
    //       ));
    // }
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: CatalogModel.items!.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(item: CatalogModel.items![index]);
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: const MyDrawer(),
    );
  }
}
