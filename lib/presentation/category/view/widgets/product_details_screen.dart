import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/core/theme/colors.dart';
import 'package:e_commerce/core/theme/text_styles.dart';
import 'package:e_commerce/domain/entities/productResponseEntity.dart';
import 'package:e_commerce/presentation/category/view/widgets/addAndRemoveProductContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({required this.productEntity});

  ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: MyColors.primaryColor),
          actionsIconTheme: IconThemeData(color: MyColors.primaryColor),
          title: Text(
            productEntity.title ?? '',
            style: Styles.textStyle20,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: MyColors.primaryColor,
                size: 24,
              ),
            ),
          ]),
      body: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 11.h),
              child: ImageSlideshow(
                width: 398.w,
                height: 300.h,
                initialPage: 0,
                indicatorColor: MyColors.primaryColor,
                indicatorBottomPadding: 8.h,
                indicatorBackgroundColor: Colors.grey,
                children: productEntity.images!
                    .map((image) => Image.network(image, fit: BoxFit.fill))
                    .toList(),
                autoPlayInterval: 3000,
                isLoop: true,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productEntity.brand!.name ?? '',
                  maxLines: 1,
                  style: Styles.textStyle20,
                ),
                Text(
                  'EGP ${productEntity.price}',
                  style: Styles.textStyle20,
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(width: 1)),
                  child: Text(
                    '${productEntity.sold} sold',
                    style: Styles.textStyle20.copyWith(fontSize: 14),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  productEntity.ratingsAverage.toString() ?? '',
                  style: Styles.textStyle20.copyWith(fontSize: 14),
                ),
                Spacer(),
                AddAndRemoveProductContainer()
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              MyTexts.description,
              style: Styles.textStyle18.copyWith(color: MyColors.primaryColor),
            ),
            SizedBox(
              height: 8.h,
            ),
            ReadMoreText(
              productEntity.description ?? '',
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: Colors.black,
              trimCollapsedText: '...Read More',
              trimExpandedText: '...Show less',
              moreStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              lessStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Price',
                      style: Styles.textStyle18
                          .copyWith(color: MyColors.primaryColor),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      'EGP',
                      style: Styles.textStyle18
                          .copyWith(color: MyColors.primaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  width: 33.w,
                ),
                Container(padding: EdgeInsets.symmetric(horizontal: 32.w,vertical:12.h ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: MyColors.primaryColor),
                  child: Row(children: [
                    Icon(
                      Icons.shopping_cart,
                      color: MyColors.whiteColor,
                    ),
                    SizedBox(width: 24.w,),
                    Text('Add to Cart',style: Styles.textStyle20.copyWith(color: MyColors.whiteColor),)
                  ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
