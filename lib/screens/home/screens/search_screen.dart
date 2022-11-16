import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:shopify/screens/home/screens/product_detail.dart';
import 'package:shopify/screens/home/widget/product_list.dart';
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
                    : ProductList(product: controller.products),
              ],
            ),
          ),
        );
      }),
    );
  }
}
