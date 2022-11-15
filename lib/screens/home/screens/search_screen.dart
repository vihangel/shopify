import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:shopify/screens/home/screens/product_detail.dart';
import 'package:shopify/shared/utils/colors.dart';
import 'package:shopify/shared/widgets/base_state.dart';

import 'package:shopify/shared/widgets/text_field.dart';

import '../home_controller.dart';

TextEditingController searchController = TextEditingController();
final controller = Modular.get<HomeController>();

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends BaseState<SearchScreen> {
  @override
  void initState() {
    super.initState();
    controller.getProductList();
    searchController.clear();
  }

  updateList(tag) {
    controller.filterProductList(tag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ShopfyColors.gray,
          ),
          onPressed: () {
            controller.getProductList();
            Modular.to.pop();
          },
        ),
      ),
      backgroundColor: ShopfyColors.background,
      body: Observer(builder: (context) {
        controller.update;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TextFieldWidget(
                    suffixIcon: const Icon(Icons.search),
                    hintText: translate("common.search"),
                    controller: searchController,
                    onChanged: updateList,
                  ),
                ),
                controller.products.isEmpty
                    ? Text(translate("common.errorToFind"))
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
                                      productDetail: controller.products[index],
                                    ))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ShopfyColors.background,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            controller.products[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: Icon(
                                          Random().nextBool()
                                              ? Icons.favorite
                                              : Icons.favorite_border_outlined,
                                          color: ShopfyColors.red,
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
        );
      }),
    );
  }
}
