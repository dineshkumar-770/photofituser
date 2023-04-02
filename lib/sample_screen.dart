import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:photo_fit_user/constants/app_color.dart';
import 'package:photo_fit_user/constants/app_text_style.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final bool freeDelivery;
  final double rating;
  final double discount;

  final double deliveryCharges;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.freeDelivery,
    required this.rating,
    required this.discount,
    required this.deliveryCharges,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
                blurRadius: 5,
                color: AppColors.grey,
                blurStyle: BlurStyle.outer,
                spreadRadius: 2)
          ]
          // gradient: LinearGradient(
          //   colors: [Colors.blue[600]!, Colors.white],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   stops: [0.3, 0.8],
          // ),
          ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  imageUrl,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: AppTextStyle.regularBlack21w400,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        const Icon(Icons.favorite_border),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '₹${price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[600],
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          '₹${((price - discount) + (freeDelivery ? 0 : deliveryCharges)).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    freeDelivery
                        ? const SizedBox(width: 5.0)
                        : Text(
                            '(Including delivery charges)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                    freeDelivery
                        ? Row(
                            children: const [
                              Icon(
                                Icons.local_shipping,
                                color: Colors.green,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                'Free Delivery',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              const Icon(
                                Icons.local_shipping,
                                color: Colors.red,
                              ),
                              const SizedBox(width: 5.0),
                              Text(
                                'Delivery cost: ₹$deliveryCharges',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              rating.toString(),
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Get it by ${DateFormat('EEEE, dd MMMM').format(DateTime.now().add(const Duration(days: 2)))}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
