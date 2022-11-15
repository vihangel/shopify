import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopify/screens/home/home_controller.dart';
import 'package:shopify/screens/home/screens/product_detail.dart';
import 'package:shopify/screens/home/screens/search_screen.dart';
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
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20,
                                    childAspectRatio: 0.8),
                            itemCount: controller.products.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () => Modular.to.push(MaterialPageRoute(
                                    builder: (context) => ProductDetail(
                                          productDetail:
                                              controller.products[index],
                                        ))),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: ShopfyColors.gray2,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(controller
                                                .products[index].image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: const Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Icon(
                                                false
                                                    ? Icons.favorite
                                                    : Icons
                                                        .favorite_border_outlined,
                                                color: ShopfyColors.red,
                                              ),
                                            )),
                                      ),
                                    ),
                                    Text(
                                      controller.products[index].title,
                                      style: TextStyles.titleCard,
                                      textAlign: TextAlign.left,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "\$${controller.products[index].price}",
                                            style: TextStyles.priceCard),
                                        Text(
                                          "${controller.products[index].quantity}",
                                          style: TextStyles.small.copyWith(
                                              color: controller.products[index]
                                                          .quantity <
                                                      4
                                                  ? ShopfyColors.red
                                                  : ShopfyColors.gray),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
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
