import 'package:flutter/material.dart';
import '../../../../coponents/Grid_card.dart';
import '../../../../coponents/loader.dart';
import '../../../../models/firestore.dart';
import '../../../../models/product.dart';
import '../../../../utils/custum_theme.dart';
import '../../../chart/chart_view.dart';
import '../../../product/productScreen.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({super.key});

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  Future<List<Product>>? products;

  @override
  void initState() {
    products = FirestoreUtil.getProducts([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    onCardPressed(Product product) {
      Navigator.push(context,
          MaterialPageRoute(builder: (builder) => const ProductScreen()));
    }

    return Scaffold(
      backgroundColor: CustumTheme.BgightTeal,
      appBar: AppBar(
        title: Image.asset(
            "assets/images/LogoSample_ByTailorBrands-removebg-preview (1).png"),
        centerTitle: true,
        backgroundColor: CustumTheme.BgightTeal,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => const ChartView()));
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ))
        ],
      ),
      body: Center(
        child: Expanded(
          child: FutureBuilder<List<Product>>(
            future: products,
            builder: (context, AsyncSnapshot<List<Product>> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return GridView.builder(
                  itemCount: snapshot.data?.length,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (BuildContext context, int index) {
                    return Gridcard(
                        index: index,
                        onpressed: (() {
                          onCardPressed(snapshot.data![index]);
                        }));
                  },
                );
              } else {
                return const Center(
                  child: Loader(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
