import 'package:flutter/material.dart';
import 'package:shopapp/global_variables.dart';
import 'package:shopapp/product_card.dart';
import 'package:shopapp/product_details_page.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> filters = const [
    'All',
    'Adidas',
    'Nike',
    'Puma'
  ];
  late String selectedFilter;
  @override
  void initState(){
    super.initState();
    selectedFilter = filters[0];
  }


  @override
  Widget build(BuildContext context) {
    const border =  OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(255,255, 255, 1),
        ), borderRadius:  BorderRadius.horizontal(
    left: Radius.circular(50)
    ),
    );
    return   Scaffold(
        body:  SafeArea(
            child: Column(
      children: [
        Row(
          children: [
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Shoes \n Collections',
                  style:  Theme.of(context).textTheme.titleLarge),
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
              ),
              )
            ),

        ],
        ),
        SizedBox(
          height: 120,
        child:
        ListView.builder(
          itemCount: filters.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
           final filter = filters[index];
            return Padding(
                   padding:
                   const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = filter;
                    });



                  },

                  child: Chip(
                    backgroundColor: selectedFilter == filter ?
                        Theme.of(context).colorScheme.primary :
                    const Color.fromRGBO(245,247, 249, 1),
                  side: const BorderSide(
                    color:  Color.fromRGBO(245,247, 249, 1),
                  ),
                  label: Text(filter),
                  labelStyle: const TextStyle(
                    fontSize:  16,
                    fontWeight: FontWeight.w700
                  ),
                    padding: const EdgeInsets.symmetric(horizontal: 20,
                        vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ));
          },
        ),
        ),
        Expanded(child:
        ListView.builder(
            itemCount: product.length,
            itemBuilder:(context, index){
              final products = product[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return ProductDetailsPage(product: product, products:products,);
                  })) ;
                },
                child: ProductCard(
                    title: products['title']as String,
                    price:  products['price'] as double,
                    image: products['imageUrl'] as String,
                  backgroundColor: index.isEven ? const Color.fromRGBO(216, 240, 253, 1)
                      : const Color.fromRGBO(245,247, 249, 1),
                ),
              );

        }) )
      ],
    )));
  }
}
