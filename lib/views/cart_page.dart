import 'package:flutter/material.dart';
import 'package:union_shop/widgets/top_navbar.dart';
import 'package:union_shop/widgets/footer_widget.dart';


import 'package:union_shop/models/cart_model.dart';

class CartPage extends StatelessWidget {
	final CartModel cartModel;
	const CartPage({Key? key, required this.cartModel}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.white,
			body: LayoutBuilder(
				builder: (context, constraints) {
					return ConstrainedBox(
						constraints: BoxConstraints(minHeight: constraints.maxHeight),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.stretch,
							children: [
								TopNavBar(
									onLogoTap: (ctx) {
										Navigator.pushNamedAndRemoveUntil(ctx, '/', (route) => false);
									},
								),
								Expanded(
									child: SingleChildScrollView(
										child: Container(
											color: Colors.white,
											padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
											child: Column(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													const Text(
														'YOUR CART',
														style: TextStyle(
															fontSize: 28,
															fontWeight: FontWeight.bold,
															color: Color(0xFF4d2963),
															letterSpacing: 1,
														),
													),
													const SizedBox(height: 32),
													Container(
														padding: const EdgeInsets.all(24),
														decoration: BoxDecoration(
															color: Colors.grey[100],
															borderRadius: BorderRadius.circular(12),
															boxShadow: [
																BoxShadow(
																	color: Colors.grey.withOpacity(0.1),
																	blurRadius: 8,
																	offset: const Offset(0, 2),
																),
															],
														),
														child: Column(
															children: [
																// Dummy cart item
																Row(
																	children: [
																		Container(
																			width: 64,
																			height: 64,
																			decoration: BoxDecoration(
																				borderRadius: BorderRadius.circular(8),
																				image: const DecorationImage(
																					image: NetworkImage('https://shop.upsu.net/cdn/shop/files/Sage_T-shirt_1024x1024@2x.png?v=1759827236'),
																					fit: BoxFit.cover,
																				),
																			),
																		),
																		const SizedBox(width: 24),
																		Expanded(
																			child: Column(
																				crossAxisAlignment: CrossAxisAlignment.start,
																				children: const [
																					Text(
																						'Essential T-shirt',
																						style: TextStyle(
																							fontSize: 18,
																							fontWeight: FontWeight.w600,
																							color: Colors.black,
																						),
																					),
																					SizedBox(height: 8),
																					Text(
																						'Size: M',
																						style: TextStyle(
																							fontSize: 14,
																							color: Colors.grey,
																						),
																					),
																				],
																			),
																		),
																		const SizedBox(width: 24),
																		Column(
																			crossAxisAlignment: CrossAxisAlignment.end,
																			children: const [
																				Text(
																					'\u00a36.99',
																					style: TextStyle(
																						fontSize: 16,
																						fontWeight: FontWeight.bold,
																						color: Color(0xFF4d2963),
																					),
																				),
																				SizedBox(height: 8),
																				Text(
																					'Qty: 1',
																					style: TextStyle(
																						fontSize: 14,
																						color: Colors.grey,
																					),
																				),
																			],
																		),
																	],
																),
																const Divider(height: 32),
																// Cart summary
																Row(
																	mainAxisAlignment: MainAxisAlignment.spaceBetween,
																	children: const [
																		Text(
																			'Subtotal',
																			style: TextStyle(fontSize: 16, color: Colors.black),
																		),
																		Text(
																			'\u00a36.99',
																			style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4d2963)),
																		),
																	],
																),
																const SizedBox(height: 24),
																SizedBox(
																	width: double.infinity,
																	child: ElevatedButton(
																		onPressed: () {},
																		style: ElevatedButton.styleFrom(
																			backgroundColor: const Color(0xFF4d2963),
																			foregroundColor: Colors.white,
																			shape: const RoundedRectangleBorder(
																				borderRadius: BorderRadius.zero,
																			),
																			padding: const EdgeInsets.symmetric(vertical: 16),
																		),
																		child: const Text(
																			'CHECKOUT',
																			style: TextStyle(fontSize: 16, letterSpacing: 1),
																		),
																	),
																),
															],
														),
													),
													const SizedBox(height: 80),
												],
											),
										),
									),
								),
								const FooterWidget(),
							],
						),
					);
				},
			),
		);
	}
}
