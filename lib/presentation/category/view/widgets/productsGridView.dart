import 'package:e_commerce/domain/entities/productResponseEntity.dart';
import 'package:e_commerce/presentation/category/view/widgets/productItem.dart';
import 'package:e_commerce/presentation/category/view/widgets/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  ProductsGridView({required this.products});

  List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 16),
          itemBuilder: (context, index) => InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ProductDetailsScreen(productEntity: products[index]),
          )),
      child: ProductItem(productEntity: products[index])),
        );
  }
}
