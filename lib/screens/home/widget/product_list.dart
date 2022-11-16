import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopify/models/product_model.dart';
import 'package:shopify/screens/home/screens/product_detail.dart';
import 'package:shopify/shared/utils/colors.dart';

class ProductList extends StatelessWidget {
  final List<ProductModel> product;
  const ProductList({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.8),
        itemCount: product.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => Modular.to.push(MaterialPageRoute(
                builder: (context) => ProductDetail(
                      productDetail: product[index],
                    ))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ShopfyColors.gray2,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(product[index].image),
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
                                : Icons.favorite_border_outlined,
                            color: ShopfyColors.red,
                          ),
                        )),
                  ),
                ),
                Text(
                  product[index].title,
                  style: TextStyles.titleCard,
                  textAlign: TextAlign.left,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${product[index].price}",
                        style: TextStyles.priceCard),
                    Text(
                      "${product[index].quantity}",
                      style: TextStyles.small.copyWith(
                          color: product[index].quantity < 4
                              ? ShopfyColors.red
                              : ShopfyColors.gray),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
