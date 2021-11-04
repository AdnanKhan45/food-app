import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/widget_functions.dart';

class ProductItemPage extends StatelessWidget {
  final dynamic productData;
  final double width;

  const ProductItemPage({Key? key, this.productData, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final height = width * 4 / 3;
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: width,
      height: height + 40,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(flex: 2, child: Container()),
              Expanded(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "lib/assets/images/${productData['image']}",
                    width: width * 0.80,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "${productData['name']}",
                      style: textTheme.headline6,
                    ),
                  ),
                ),
                addVerticalSpace(5),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 15,
                        ),
                      ),
                      TextSpan(text: "${productData['rest']}", style: textTheme.caption)
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: RichText(
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            WidgetSpan(child: Icon(Icons.star, color: Colors.orange, size: 15)),
                            TextSpan(text: "${productData['rating']}", style: textTheme.subtitle2!.apply(fontWeightDelta: 4))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: RichText(
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(text: "\$", style: TextStyle(color: COLOR_ORANGE)),
                            TextSpan(text: "${productData['price']}", style: textTheme.headline5!.apply(color: COLOR_ORANGE))
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
