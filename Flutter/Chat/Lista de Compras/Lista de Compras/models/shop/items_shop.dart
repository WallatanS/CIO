import 'package:listcom/models/product/product.dart';

class ItemsShop {
  final Product? _product;
  final int? _quantity;
  final int? _id;

  ItemsShop(this._product, this._quantity, this._id);

  int? get id => _id;

  int? get quantity => _quantity;

  Product get product => _product!;

  double? get orderPrice => (_quantity! * _product!.price!).toDouble();
}
