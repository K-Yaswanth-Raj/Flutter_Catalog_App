import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: "Cart".text.black.make(),
      ),
      body: Column(
        children: [
          CartList().p12().expand(),
          Divider(
            thickness: 2.5,
            color: Colors.redAccent,
            height: 5,
          ),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 100,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        VxConsumer(
          notifications: {},
          builder: (context,store,status) {
          return '\$${_cart.totalPrice}'.text.xl5.make();
        }, mutations: {RemoveMutation}),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "Buying not yet Supported".text.make(),
            ));
          },
          child: "Buy".text.xl.white.make(),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
        ).wh(125, 65)
      ]),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Add Something..".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: ((context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    onPressed: () {
                      RemoveMutation(_cart.items[index]);
                    },
                    icon: Icon(Icons.remove_circle_outline),
                  ),
                  title: _cart.items[index].name.text.make(),
                )),
          );
  }
}
