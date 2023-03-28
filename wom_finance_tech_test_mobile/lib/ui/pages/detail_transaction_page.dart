part of 'pages.dart';

class DetailTransactionPage extends StatelessWidget {
  final Transaction transaction;
  const DetailTransactionPage(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: ListView(
          children: [
            Text(
              'Detail Transaksi WOM-${transaction.id}',
              style: blackFontStyle2.copyWith(fontSize: 28),
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
            Text(
              NumberFormat.currency(
                      symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID')
                  .format(transaction.totalPrice),
              style: greyFontStyle.copyWith(fontSize: 13),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Detail Produk Dibeli',
              style: blackFontStyle2.copyWith(fontSize: 22),
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: transaction.products!
                  .map((e) => Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            margin:
                                const EdgeInsets.only(right: 12, bottom: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(e.product!.picturePath),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.product!.name,
                                  style: blackFontStyle2,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                                Text(
                                  NumberFormat.currency(
                                          symbol: 'IDR ',
                                          decimalDigits: 0,
                                          locale: 'id-ID')
                                      .format(e.totalPriceItem),
                                  style: greyFontStyle.copyWith(fontSize: 13),
                                )
                              ],
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
