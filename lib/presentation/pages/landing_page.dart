import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/presentation/pages/product_item_page.dart';
import 'package:food_app/presentation/pages/product_page.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/widget_functions.dart';

const PRODUCT_DATA = [
  {"image": "pizza.png", "name": "Pizza", "rest": "Maritine Star Restaurant", "rating": "4.5 (164)", "price": 20, "currency": "\$"},
  {"image": "burger.png", "name": "Burger", "rest": "Maritine Star Restaurant", "rating": "4.7 (199)", "price": 10, "currency": "\$"},
  {"image": "fries.png", "name": "Fries", "rest": "Maritine Star Restaurant", "rating": "4.2 (101)", "price": 10, "currency": "\$"},
  {"image": "hotdog.png", "name": "HotDog", "rest": "Maritine Star Restaurant", "rating": "3.9 (150)", "price": 15, "currency": "\$"},
];

const CATEGORIES = [
  {"image": "salad.png", "name": "Salad"},
  {"image": "fastfood.png", "name": "Fast Food"},
  {"image": "desert.png", "name": "Desert"},
  {"image": "drinks.png", "name": "Drinks"},
  {"image": "drinks.png", "name": "Drinks"},
];

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.50,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            color: COLOR_GREEN,
                          ),
                          Image.asset('lib/assets/images/tree_v.png'),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadiusDirectional.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset('lib/assets/images/avatar.png'),
                                      ),
                                    ),
                                    addHorizontalSpace(10),
                                    Expanded(
                                      child: Text(
                                        "How Hungry are you Today?",
                                        style: textTheme.headline6!.apply(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                                TextField(
                                  style: TextStyle(color: Colors.white),
                                  cursorColor: Colors.white38,
                                  decoration: InputDecoration(
                                    hintText: "Search Food Items",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide.none),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                    suffixIcon: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white24,
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                                      ),
                                      child: Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white24,
                                  ),
                                ),
                                addVerticalSpace(10),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth,
                      color: Colors.grey.shade200,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 10.0,
                          bottom: 10.0,
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Column(
                              children: [
                                addVerticalSpace(constraints.maxWidth * 0.30),
                                Row(
                                  children: [
                                    Text(
                                      "Popular Foods",
                                      style: textTheme.headline6,
                                    ),
                                    Expanded(child: Center()),
                                    Text(
                                      "View All >",
                                      style: textTheme.subtitle2!.apply(color: COLOR_ORANGE),
                                    ),
                                    addHorizontalSpace(10)
                                  ],
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  child: Row(
                                    children: PRODUCT_DATA
                                        .map((data) => InkWell(
                                              onTap: () {
                                                _focusNode.unfocus();
                                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductPage(productData: data)));
                                                },
                                              child: ProductItemPage(
                                                productData: data,
                                                width: constraints.maxWidth * 0.50,
                                              ),
                                            ),)
                                        .toList(),
                                  ),
                                )
                              ],
                            ),
                            Positioned(
                              top: -55,
                              left: 0,
                              child: Container(
                                width: constraints.maxWidth,
                                height: constraints.maxWidth * 0.35,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  children: CATEGORIES
                                      .map(
                                        (category) => Container(
                                          margin: EdgeInsets.only(right: 10),
                                          width: constraints.maxWidth * 0.25,
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Column(
                                              children: [
                                                Image.asset("lib/assets/images/${category['image']}"),
                                                addVerticalSpace(10),
                                                Text(
                                                  "${category['name']}",
                                                  style: textTheme.bodyText2!.apply(color: COLOR_BLACK),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}
