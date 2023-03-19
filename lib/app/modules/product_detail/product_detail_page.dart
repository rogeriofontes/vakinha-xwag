import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_button.dart';
import './product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(),
      body: LayoutBuilder(
        builder: ((context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: context.width,
                    height: context.heightTransformer(reducedBy: 60),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3g4Zas35m7kgQqx5-s8nAvX0uw53XP13sTw&usqp=CAU'),
                            fit: BoxFit.cover)),
                  ),
                  //'http://dartweek.academiadoflutter.com.br/images${controller.product.image}'
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      controller.product.name,
                      style: context.textTheme.headline4!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(controller.product.description),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    return PlusMinusBox(
                        minusCallback: controller.removeProduct,
                        plusCallback: controller.addProduct,
                        price: controller.product.price,
                        quantity: controller.quantity);
                  }),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Horario:',
                      style: VakinhaUI.textbold,
                    ),
                    trailing: Obx(() {
                      return Text(
                        FormatterHelper.formatCurrency(controller.totalPrice),
                        style: VakinhaUI.textbold,
                      );
                    }),
                  ),
                  Divider(),
                  //https://github.com/RipplesCode/DatePickerFlutterGetX/blob/master/lib/app/modules/home/views/home_view.dart
                  //https://github.com/RipplesCode/DatePickerFlutterGetX/blob/master/lib/app/modules/home/views/home_view.dart
                  //https://www.kindacode.com/article/flutter-date-picker/
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: VakinhaButton(
                      onPressed: controller.addProductInShoppingCart,
                      label: controller.alreadyAdded ? 'Agendar' : 'Agendar',
                      width: context.width,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
