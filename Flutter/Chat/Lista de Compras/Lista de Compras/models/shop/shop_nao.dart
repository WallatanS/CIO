import 'package:listcom/models/shop/shop_item_nao.dart';

enum ShopStates {
  initialization,
  Preparing,
  Processing,
  Shipped,
  Delivered,
  refund
}

class Shop {
  late final String shopId;
  late List<ShopItem> shopItems;
  late String? shopTotal;
  ShopStates? shopStates = ShopStates.initialization;
  late DateTime? date = DateTime.now();

  Shop({
    required this.shopId,
    required this.shopItems,
    this.shopTotal,
    this.shopStates,
    this.date,
  });

  Shop.fromJson(
    Map<String, dynamic> json,
  ) {
    shopId = json['shopID'];
    shopTotal = json['shopTotal'];
    shopStates = ShopStates.values.firstWhere(
      (e) => (e.toString() == json['shopStates']),
    );

    date = json['date'];

    if (json['shopItems'] != null) {
      List<ShopItem> items = [];
      json['shopItems'].forEach(
        (item) {
          items.add(ShopItem.fromJson(item));
        },
      );
      shopItems = items;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "shopID": shopId,
      "shopItems": shopItems.map(
        (element) {
          return element.toJson();
        },
      ).toList(),
      "shopTotal": shopTotal ?? '0',
      'stateShop': ShopStates,
    };
  }
}
