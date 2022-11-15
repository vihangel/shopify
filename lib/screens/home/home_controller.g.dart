// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$valueAtom =
      Atom(name: '_HomeControllerBase.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$productsAtom =
      Atom(name: '_HomeControllerBase.products', context: context);

  @override
  List<ProductModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$allTagsAtom =
      Atom(name: '_HomeControllerBase.allTags', context: context);

  @override
  List<String> get allTags {
    _$allTagsAtom.reportRead();
    return super.allTags;
  }

  @override
  set allTags(List<String> value) {
    _$allTagsAtom.reportWrite(value, super.allTags, () {
      super.allTags = value;
    });
  }

  late final _$selectedTagsAtom =
      Atom(name: '_HomeControllerBase.selectedTags', context: context);

  @override
  List<String> get selectedTags {
    _$selectedTagsAtom.reportRead();
    return super.selectedTags;
  }

  @override
  set selectedTags(List<String> value) {
    _$selectedTagsAtom.reportWrite(value, super.selectedTags, () {
      super.selectedTags = value;
    });
  }

  late final _$updateAtom =
      Atom(name: '_HomeControllerBase.update', context: context);

  @override
  bool get update {
    _$updateAtom.reportRead();
    return super.update;
  }

  @override
  set update(bool value) {
    _$updateAtom.reportWrite(value, super.update, () {
      super.update = value;
    });
  }

  late final _$generateTagListAsyncAction =
      AsyncAction('_HomeControllerBase.generateTagList', context: context);

  @override
  Future generateTagList() {
    return _$generateTagListAsyncAction.run(() => super.generateTagList());
  }

  late final _$getProductListAsyncAction =
      AsyncAction('_HomeControllerBase.getProductList', context: context);

  @override
  Future getProductList() {
    return _$getProductListAsyncAction.run(() => super.getProductList());
  }

  late final _$filterListGeneralAsyncAction =
      AsyncAction('_HomeControllerBase.filterListGeneral', context: context);

  @override
  Future filterListGeneral() {
    return _$filterListGeneralAsyncAction.run(() => super.filterListGeneral());
  }

  late final _$filterProductListAsyncAction =
      AsyncAction('_HomeControllerBase.filterProductList', context: context);

  @override
  Future filterProductList(String tag) {
    return _$filterProductListAsyncAction
        .run(() => super.filterProductList(tag));
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  dynamic selectTag(String tag) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.selectTag');
    try {
      return super.selectTag(tag);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic orderTag() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.orderTag');
    try {
      return super.orderTag();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
products: ${products},
allTags: ${allTags},
selectedTags: ${selectedTags},
update: ${update}
    ''';
  }
}
