import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paygateway/consts.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment() async {
    String? clientSecret = await createPaymentIntent(10, "usd");
    if (clientSecret == null) return;
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "PayGateway",
      ),
    );
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> confirmWebPayment(String clientSecret) async {
    await Stripe.instance.confirmPayment(
      paymentIntentClientSecret: clientSecret,
      data: PaymentMethodParams.card(
        paymentMethodData: PaymentMethodData(),
      ),
    );
  }

  Future<String?> createPaymentIntent(int amount, String currency) async {
    final Dio dio = Dio();
    final response = await dio.post(
      "https://api.stripe.com/v1/payment_intents",
      data: {
        "amount": (amount * 100).toString(),
        "currency": currency,
      },
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {"Authorization": "Bearer $stripeSecretKey"},
      ),
    );
    return response.data?["client_secret"];
  }
}
