import 'package:flutter/material.dart';
import 'package:union_shop/widgets/top_navbar.dart';
import 'package:union_shop/widgets/footer_widget.dart';


import 'package:union_shop/models/cart_model.dart';


import 'package:union_shop/models/cart_item.dart';

class CartPage extends StatefulWidget {
	// TEMPORARY NOTE: This is the CartPage
	final CartModel cartModel;
	const CartPage({Key? key, required this.cartModel}) : super(key: key);

	@override
	State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

	@override
	Widget build(BuildContext context) {
			// TEMPORARY NOTE: You are on the CartPage
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
								Padding(
									padding: const EdgeInsets.only(left: 8, top: 8),
									child: Align(
										alignment: Alignment.centerLeft,
										child: IconButton(
											icon: const Icon(Icons.arrow_back),
											onPressed: () => Navigator.pop(context),
										),
									),
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
																if (widget.cartModel.items.isEmpty)
																	const Padding(
																		padding: EdgeInsets.all(16.0),
																		child: Text('Your cart is empty.'),
																	)
																else ...[
																	for (final item in widget.cartModel.items) ...[
																		Row(
																			children: [
																				Container(
																					width: 64,
																					height: 64,
																					decoration: BoxDecoration(
																						borderRadius: BorderRadius.circular(8),
																						image: DecorationImage(
																							image: NetworkImage(item.imageUrl),
																							fit: BoxFit.cover,
																						),
																					),
																				),
																				const SizedBox(width: 24),
																				Expanded(
																					child: Column(
																						crossAxisAlignment: CrossAxisAlignment.start,
																						children: [
																							Text(
																								item.productName,
																								style: const TextStyle(
																									fontSize: 18,
																									fontWeight: FontWeight.w600,
																									color: Colors.black,
																								),
																							),
																							const SizedBox(height: 8),
																							Text(
																								'Size: ${item.size}',
																								style: const TextStyle(
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
																					children: [
																																									if (item.oldPrice != null)
																																										Row(
																																											children: [
																																												Text(
																																													'\u00a3${(item.oldPrice! * item.quantity).toStringAsFixed(2)}',
																																													style: const TextStyle(
																																														fontSize: 15,
																																														color: Colors.grey,
																																														decoration: TextDecoration.lineThrough,
																																													),
																																												),
																																												const SizedBox(width: 8),
																																												Text(
																																													'\u00a3${(item.price * item.quantity).toStringAsFixed(2)}',
																																													style: const TextStyle(
																																														fontSize: 16,
																																														fontWeight: FontWeight.bold,
																																														color: Color(0xFF4d2963),
																																													),
																																												),
																																											],
																																										)
																																									else
																																										Text(
																																											'\u00a3${(item.price * item.quantity).toStringAsFixed(2)}',
																																											style: const TextStyle(
																																												fontSize: 16,
																																												fontWeight: FontWeight.bold,
																																												color: Color(0xFF4d2963),
																																											),
																																										),
																						const SizedBox(height: 8),
																						Row(
																							children: [
																								IconButton(
																									icon: const Icon(Icons.remove_circle_outline),
																									onPressed: () {
																										setState(() {
																											widget.cartModel.decreaseQuantity(item);
																										});
																									},
																								),
																								Text(
																									'Qty: ${item.quantity}',
																									style: const TextStyle(
																										fontSize: 14,
																										color: Colors.grey,
																									),
																								),
																								IconButton(
																									icon: const Icon(Icons.add_circle_outline),
																									onPressed: () {
																										setState(() {
																											widget.cartModel.increaseQuantity(item);
																										});
																									},
																								),
																								IconButton(
																									icon: const Icon(Icons.delete_outline),
																									onPressed: () {
																										setState(() {
																											widget.cartModel.removeItem(item);
																										});
																									},
																								),
																							],
																						),
																					],
																				),
																			],
																		),
																		const Divider(height: 32),
																	],
																	Row(
																		mainAxisAlignment: MainAxisAlignment.spaceBetween,
																		children: [
																			const Text(
																				'Subtotal',
																				style: TextStyle(fontSize: 16, color: Colors.black),
																			),
																			Text(
																				'\u00a3${widget.cartModel.totalPrice.toStringAsFixed(2)}',
																				style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4d2963)),
																			),
																		],
																	),
																	const SizedBox(height: 24),
																	SizedBox(
																		width: double.infinity,
																		child: ElevatedButton(
																			onPressed: widget.cartModel.items.isEmpty
																					? null
																					: () {
																							Navigator.pushNamed(context, '/checkout');
																						},
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
