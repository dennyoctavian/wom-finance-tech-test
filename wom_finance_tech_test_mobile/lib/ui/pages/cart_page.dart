part of 'pages.dart';

class CartPage extends StatefulWidget {
  final List<Product> listCart;
  const CartPage(this.listCart, {super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Keranjang Saya',
              style: blackFontStyle2.copyWith(fontSize: 28),
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView(
                      children: listCart
                          .map((e) => Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    margin: const EdgeInsets.only(
                                        right: 12, bottom: 12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: NetworkImage(e.picturePath),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'quantity ${e.quantity}',
                                          style: blackFontStyle2,
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                        ),
                                        Text(
                                          NumberFormat.currency(
                                                  symbol: 'IDR ',
                                                  decimalDigits: 0,
                                                  locale: 'id-ID')
                                              .format(e.quantity * e.price),
                                          style: greyFontStyle.copyWith(
                                              fontSize: 13),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (e.quantity == 1) {
                                            e.quantity = 0;
                                            widget.listCart.remove(e);
                                            setState(() {});
                                          } else {
                                            e.quantity--;
                                            setState(() {});
                                          }
                                        },
                                        child: const Text(
                                          "--",
                                          style: TextStyle(fontSize: 40),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        e.quantity.toString(),
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (e.quantity == e.stock) {
                                          } else {
                                            e.quantity++;
                                            setState(() {});
                                          }
                                        },
                                        child: const Text(
                                          "+",
                                          style: TextStyle(fontSize: 40),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ))
                          .toList()),
                  listCart.isNotEmpty
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 24),
                            height: 45,
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultMargin),
                            child: ElevatedButton(
                                onPressed: () async {
                                  ApiReturnValue<Transaction> transaction =
                                      await TransactionServices.makeTransaction(
                                          widget.listCart);

                                  if (transaction.value != null) {
                                    widget.listCart.clear();
                                    if (!mounted) return;
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SuccessPage()),
                                        (route) => false);
                                  } else {
                                    // if (!mounted) return;
                                    // Flushbar(
                                    //   message: transaction.message,
                                    //   flushbarPosition: FlushbarPosition.TOP,
                                    //   backgroundColor: const Color(0xffFF2566),
                                    //   duration: const Duration(seconds: 2),
                                    // ).show(context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    backgroundColor: Colors.blue),
                                child: Text(
                                  "Check Out",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
