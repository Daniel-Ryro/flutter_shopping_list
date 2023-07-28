import 'dart:convert';

class ShoppingLists {
    List<ShoppingList> lists;

    ShoppingLists({
        required this.lists,
    });

    factory ShoppingLists.fromJson(String str) => ShoppingLists.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ShoppingLists.fromMap(Map<String, dynamic> json) => ShoppingLists(
        lists: List<ShoppingList>.from(json["lists"].map((x) => ShoppingList.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "lists": List<dynamic>.from(lists.map((x) => x.toMap())),
    };
}

class ShoppingList {
    String name;
    List<Item> items;

    ShoppingList({
        required this.name,
        required this.items,
    });

    factory ShoppingList.fromJson(String str) => ShoppingList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ShoppingList.fromMap(Map<String, dynamic> json) => ShoppingList(
        name: json["name"],
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
    };
}

class Item {
    String name;
    double unitValue;
    int quantity;

    Item({
        required this.name,
        required this.unitValue,
        required this.quantity,
    });

    factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        name: json["name"],
        unitValue: json["unitValue"]?.toDouble(),
        quantity: json["quantity"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "unitValue": unitValue,
        "quantity": quantity,
    };
}