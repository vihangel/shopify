import 'package:mobx/mobx.dart';
import 'package:shopify/models/product_model.dart';
import 'package:shopify/shared/api/product_api.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int value = 0;

  @observable
  List<ProductModel> products = ObservableList();

  @action
  generateTagList() async {
    final response = await productcService.products(limit: 100);
    allTags.clear();
    for (var element in response["products"]) {
      for (var tag in element["tags"].split(",")) {
        final adder = tag
            .toLowerCase()
            .replaceAll(" ", "")
            .replaceAll(RegExp(r'[^\w\s]+'), '')
            .toString();

        if (!allTags.contains(adder)) {
          allTags.add(adder);
        }
      }
    }
    selectedTags.clear();
    update = !update;
  }

  ProductApi productcService = ProductApi();
  @action
  getProductList() async {
    final response = await productcService.products();
    products.clear();
    for (var element in response["products"]) {
      products.add(ProductModel(
        id: element["id"],
        image: element['image']['src'],
        productType: element["product_type"],
        status: element["status"],
        tags: element["tags"].toLowerCase().toString().split(" ,"),
        title: element["title"],
        options: element['options'][0]["values"],
        quantity: element["variants"][0]["inventory_quantity"],
        price: element["variants"][0]["price"],
      ));
    }
  }

  @observable
  List<String> allTags = ObservableList();

  @observable
  List<String> selectedTags = ObservableList();

  @action
  selectTag(String tag) {
    if (selectedTags.contains(tag)) {
      selectedTags.remove(tag);
    } else {
      selectedTags.add(tag);
    }

    orderTag();
    filterListGeneral();
    update = !update;
  }

  @action
  filterListGeneral() async {
    final response = await productcService.products(limit: 100);
    products.clear();
    if (selectedTags.isEmpty) {
      getProductList();
    } else {
      for (var element in response["products"]) {
        List tags = [];
        for (var tag in element["tags"].split(",")) {
          tags.add(tag
              .toLowerCase()
              .replaceAll(" ", "")
              .replaceAll(RegExp(r'[^\w\s]+'), '')
              .toString());
          tag = tag
              .toLowerCase()
              .replaceAll(" ", "")
              .replaceAll(RegExp(r'[^\w\s]+'), '')
              .toString();
        }

        for (var element2 in selectedTags) {
          if (tags.contains(element2.toLowerCase())) {
            products.add(ProductModel(
              id: element["id"],
              image: element['image']['src'],
              productType: element["product_type"],
              status: element["status"],
              tags: element["tags"].toLowerCase().toString().split(","),
              title: element["title"],
              options: element['options'][0]["values"],
              quantity: element["variants"][0]["inventory_quantity"],
              price: element["variants"][0]["price"],
            ));
          }
        }
      }
    }
    update = !update;
  }

  @action
  orderTag() {
    for (var element in allTags) {
      if (selectedTags.contains(element)) {
        allTags.remove(element);
        allTags.insert(0, element);
      }
    }
  }

  @observable
  bool update = false;
  @action
  filterProductList(String tag) async {
    final response = await productcService.products(limit: 100);
    products.clear();
    for (var element in response["products"]) {
      List tags = [];
      for (var tag in element["tags"].split(",")) {
        tags.add(tag
            .toLowerCase()
            .replaceAll(" ", "")
            .replaceAll(RegExp(r'[^\w\s]+'), '')
            .toString());
        tag = tag
            .toLowerCase()
            .replaceAll(" ", "")
            .replaceAll(RegExp(r'[^\w\s]+'), '')
            .toString();
      }
      if (tags.contains(tag.toLowerCase())) {
        products.add(ProductModel(
          id: element["id"],
          image: element['image']['src'],
          productType: element["product_type"],
          status: element["status"],
          tags: element["tags"].toLowerCase().toString().split(","),
          title: element["title"],
          options: element['options'][0]["values"],
          quantity: element["variants"][0]["inventory_quantity"],
          price: element["variants"][0]["price"],
        ));
      }
    }
    update = !update;
  }
}
