part of 'pages.dart';

class MyTransaction extends StatelessWidget {
  const MyTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        if (state is ListTransactionLoaded) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Riwayat Transaksi',
                    style: blackFontStyle2.copyWith(fontSize: 28),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: ListView(
                      children: state.transactions
                          .map((e) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        DetailTransactionPage(e)));
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    margin: const EdgeInsets.only(
                                        right: 12, bottom: 12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: NetworkImage(e.products?[0]
                                                    .product?.picturePath ??
                                                ''),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Transaksi WOM-${e.id}',
                                          style: blackFontStyle2,
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                        ),
                                        Text(
                                          NumberFormat.currency(
                                                  symbol: 'IDR ',
                                                  decimalDigits: 0,
                                                  locale: 'id-ID')
                                              .format(e.totalPrice),
                                          style: greyFontStyle.copyWith(
                                              fontSize: 13),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )))
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
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
