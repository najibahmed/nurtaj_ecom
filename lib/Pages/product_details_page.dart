
import 'package:flutter/material.dart';
import 'package:nurtaj_ecom_home/models/product_model.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});
  static const String routeName = "/productDetails";
  @override
  State<ProductDetails> createState() => _MovieInfoState();
}

class _MovieInfoState extends State<ProductDetails> {
  late ProductModel product;
  @override
  void didChangeDependencies() {
    product=ModalRoute.of(context)!.settings.arguments as ProductModel;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text(product.title),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      extraImageShow(product.image),
                      const SizedBox(width: 10),
                      extraImageShow(product.image),
                    ],
                  ),
                )),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag:product.title,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  child: Image.asset(product.image,
                    fit: BoxFit.cover,
                  )
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        product.title,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    //
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  Container extraImageShow(String url) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(url,
        fit: BoxFit.fitHeight,
        )
      ),
    );
  }
}
