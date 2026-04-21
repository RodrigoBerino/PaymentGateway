import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paygateway/constants.dart';
import 'package:paygateway/screnns/details/components/image_and_icons.dart';
import 'package:paygateway/screnns/details/components/title_and_price.dart';
import 'package:paygateway/services/stripe_service.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<void> _onBuyNow() async {
    try {
      if (kIsWeb) {
        await _handleWebPayment();
      } else {
        await StripeService.instance.makePayment();
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  Future<void> _handleWebPayment() async {
    final clientSecret =
        await StripeService.instance.createPaymentIntent(10, "usd");
    if (clientSecret == null) return;

    if (!mounted) return;
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => _WebPaymentDialog(clientSecret: clientSecret),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImageAndIcons(size: size),
                TitleAndPrice(title: "RTX 4070", country: "NVIDIA", price: 599),
                SizedBox(height: kDefaultPadding),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                  ),
                  child: Text(
                    "A GeForce RTX 4070 oferece 12GB GDDR6X, arquitetura Ada Lovelace e suporte a "
                    "Ray Tracing e DLSS 3. Ideal para jogos em 1440p e criação de conteúdo, "
                    "com desempenho excepcional e eficiência energética.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.6,
                    ),
                  ),
                ),
                SizedBox(height: kDefaultPadding),
              ],
            ),
          ),
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: size.width / 2,
              height: 84,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                onPressed: _onBuyNow,
                child: Text(
                  "Buy Now",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            Expanded(
              child: TextButton(onPressed: () {}, child: Text("Description")),
            ),
          ],
        ),
      ],
    );
  }
}

class _WebPaymentDialog extends StatefulWidget {
  const _WebPaymentDialog({required this.clientSecret});
  final String clientSecret;

  @override
  State<_WebPaymentDialog> createState() => _WebPaymentDialogState();
}

class _WebPaymentDialogState extends State<_WebPaymentDialog> {
  final _controller = CardEditController();
  bool _loading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pay() async {
    setState(() => _loading = true);
    try {
      await StripeService.instance.confirmWebPayment(widget.clientSecret);
      if (!mounted) return;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Pagamento realizado com sucesso!")),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Dados do cartão"),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CardField(
              controller: _controller,
              onCardChanged: (_) => setState(() {}),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _loading ? null : () => Navigator.of(context).pop(),
          child: const Text("Cancelar"),
        ),
        ElevatedButton(
          onPressed:
              (_loading || !(_controller.details?.complete == true))
                  ? null
                  : _pay,
          style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
          child:
              _loading
                  ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                  : const Text(
                    "Pagar",
                    style: TextStyle(color: Colors.white),
                  ),
        ),
      ],
    );
  }
}
