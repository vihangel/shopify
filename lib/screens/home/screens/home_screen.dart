import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopify/screens/home/home_controller.dart';
import 'package:shopify/screens/home/screens/product_detail.dart';
import 'package:shopify/screens/home/screens/search_screen.dart';
import 'package:shopify/screens/home/widget/product_list.dart';
import 'package:shopify/shared/utils/colors.dart';

final controller = Modular.get<HomeController>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    controller.generateTagList();
    controller.getProductList();
  }

  updateList() async {
    await controller.getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      controller.update;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("Shopify Test",
              style: TextStyle(color: ShopfyColors.gray)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.search,
              color: ShopfyColors.gray,
            ),
            onPressed: () => Modular.to.push(
                MaterialPageRoute(builder: (context) => const SearchScreen())),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: ShopfyColors.gray,
              ),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: ShopfyColors.background,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              return await updateList();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.allTags.length,
                        itemBuilder: (context, index) {
                          bool isSelected = controller.selectedTags
                              .contains(controller.allTags[index]);
                          return InkWell(
                            onTap: () {
                              controller.selectTag(controller.allTags[index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? ShopfyColors.green
                                          : ShopfyColors.gray2,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      controller.allTags[index],
                                      style: TextStyles.small.copyWith(
                                          color: isSelected
                                              ? ShopfyColors.white
                                              : ShopfyColors.gray),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    controller.products.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : ProductList(product: controller.products),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
