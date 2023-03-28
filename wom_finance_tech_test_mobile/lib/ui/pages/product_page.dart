part of 'pages.dart';

class ProductPage extends StatefulWidget {
  final List<Product> listCart;
  const ProductPage(this.listCart, {super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          return ListView(
            children: [
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: state.products
                        .map((e) => GestureDetector(
                            onTap: () {},
                            child: Container(
                              width:
                                  (MediaQuery.of(context).size.width - 3 * 24) /
                                      2,
                              height: 300,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                      spreadRadius: 3,
                                      blurRadius: 15,
                                      color: Colors.black12,
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                    height: 140,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                        image: DecorationImage(
                                            image: NetworkImage(e.picturePath),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        12, 12, 12, 6),
                                    width: 200,
                                    child: Text(
                                      e.name,
                                      style: GoogleFonts.poppins().copyWith(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                    width: 200,
                                    child: Text(
                                      'Sisa Stok:  ${e.stock.toString()}',
                                      style: GoogleFonts.poppins().copyWith(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                    width: 200,
                                    child: Text(
                                      NumberFormat.currency(
                                              locale: 'id_ID',
                                              decimalDigits: 0,
                                              symbol: 'IDR ')
                                          .format(e.price),
                                      style: GoogleFonts.poppins().copyWith(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                  e.quantity == 0
                                      ? ElevatedButton(
                                          onPressed: () {
                                            if (widget.listCart.contains(e)) {
                                              e.quantity++;
                                              setState(() {});
                                            } else {
                                              e.quantity++;
                                              widget.listCart.add(e);
                                              setState(() {});
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              backgroundColor: Colors.blue),
                                          child: Text(
                                            "Tambah ke Cart",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ))
                                      : Row(
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
                                            Text(
                                              e.quantity.toString(),
                                              style:
                                                  const TextStyle(fontSize: 25),
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
                                        ),
                                ],
                              ),
                            )))
                        .toList(),
                  ),
                ),
              ),
            ],
          );
        }
        return const Center(
          child: SpinKitFadingCircle(
            size: 45,
            color: Colors.yellow,
          ),
        );
      },
    );
  }
}
