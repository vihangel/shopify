import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopify/models/product_model.dart';
import 'package:shopify/shared/utils/colors.dart';
import 'package:shopify/shared/widgets/alert.dart';
import 'package:shopify/shared/widgets/base_state.dart';
import 'package:shopify/shared/widgets/buttons.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel productDetail;
  const ProductDetail({super.key, required this.productDetail});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends BaseState<ProductDetail> {
  int quantityCar = 1;
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ShopfyColors.gray,
          ),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      backgroundColor: ShopfyColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 300,
                decoration: BoxDecoration(
                  color: ShopfyColors.green,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(50),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(widget.productDetail.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.productDetail.title,
                    style: TextStyles.title,
                    textAlign: TextAlign.left,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$${widget.productDetail.price}",
                          style: TextStyles.title.copyWith(fontSize: 32)),
                      Text(
                          "${widget.productDetail.quantity} ${translate("product.rest")}",
                          style: TextStyles.small.copyWith(
                              color: widget.productDetail.quantity < 4
                                  ? ShopfyColors.red
                                  : ShopfyColors.gray))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(translate("product.colors"),
                        style: TextStyles.title),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.productDetail.options.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedColor = index;
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: selectedColor == index
                                        ? ShopfyColors.green
                                        : ShopfyColors.gray2,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    widget.productDetail.options[index],
                                    style: TextStyles.small.copyWith(
                                        color: selectedColor == index
                                            ? ShopfyColors.white
                                            : ShopfyColors.dark),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(translate("product.quantity"),
                        style: TextStyles.title),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          if (quantityCar > 1) {
                            return setState(() {
                              quantityCar -= 1;
                            });
                          }
                        },
                        child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: ShopfyColors.gray2,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: ShopfyColors.dark,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: ShopfyColors.gray2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text("$quantityCar",
                                style: TextStyles.priceCard),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (quantityCar < widget.productDetail.quantity) {
                            return setState(() {
                              quantityCar += 1;
                            });
                          }
                        },
                        child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: ShopfyColors.gray2,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: ShopfyColors.dark,
                            )),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Button(
                      onPress: () async {
                        Alert.open(
                          context,
                          title: translate("product.success"),
                          iconStatus: true,
                          functionMainButton: () => Modular.to.pop(),
                        ).then((value) {
                          Modular.to.pop();
                        });
                      },
                      text: translate("common.buy"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
