import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../../consts/my_icons.dart';
import '../../provider/cart_provider.dart';
import '../../provider/orders_provider.dart';
import '../../services/global_method.dart';
import '../../services/payment.dart';
import 'order_empty.dart';
import 'order_full.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/OrderScreen';

  OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StripeService.init();
  }

  void payWithCard({required int amount}) async {
    ProgressDialog dialog = ProgressDialog(context: context);
    await dialog.show(msg: 'Aguarde...', max: 100, msgMaxLines: 1);
    var response = await StripeService.payWithNewCard(
        currency: 'BRL', amount: amount.toString());
    dialog.close();
    print('response : ${response.message}');
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(response.message),
      duration: Duration(milliseconds: response.success == true ? 1200 : 3000),
    ));
  }

  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();
    final orderProvider = Provider.of<OrdersProvider>(context);
    // final cartProvider = Provider.of<CartProvider>(context);
    // print('orderProvider.getOrders length ${orderProvider.getOrders.length}');
    return FutureBuilder(
        future: orderProvider.fetchOrders(),
        builder: (context, snapshot) {
          return orderProvider.getOrders.isEmpty
              ? Scaffold(body: OrderEmpty())
              : Scaffold(
                  appBar: AppBar(
                    backgroundColor: Theme.of(context).backgroundColor,
                    title: Text('Pedidos (${orderProvider.getOrders.length})'),
                    actions: [
                      IconButton(
                        onPressed: () {
                          // globalMethods.showDialogg(
                          //     'Limpar carrinho!',
                          //     'Seu carrinho será esvaziado!',
                          //     () => cartProvider.clearCart(),
                          //     context);
                        },
                        icon: Icon(MyAppIcons.trash),
                      )
                    ],
                  ),
                  body: Container(
                    margin: EdgeInsets.only(bottom: 60),
                    child: ListView.builder(
                        itemCount: orderProvider.getOrders.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return ChangeNotifierProvider.value(
                            value: orderProvider.getOrders[index],
                            child: OrderFull(),
                          );
                        }),
                  ),
                );
        });
  }
}
