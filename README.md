![ClientHub](./assets/Payment.png)

**App Flutter de gateway de pagamento com integração Stripe**

App Flutter para processamento de pagamentos via Stripe, construído com gerenciamento de estado reativo inteiramente nativo do Flutter sem utilização de pacotes para gerenciamento de estado como Provider, Riverpod ou Bloc.

O contexto do App é o de uma interface mobile para um sistema de pagamentos, conectada diretamente à API da Stripe. O App foi desenvolvido com **separação de responsabilidades entre Services, Screens e Components**, isolando a lógica de negócio das camadas visuais.

---

### 1. Sobre o projeto

O App oferece uma interface mobile para realizar pagamentos de forma simples, integrando com a Stripe via Payment Sheet nativa. As funcionalidades cobrem o fluxo completo de pagamento:

- Criação de Payment Intent via API Stripe
- Apresentação da Payment Sheet nativa
- Confirmação de pagamento web
- Navegação por bottom navigation bar

<p align="center">
  <img src="./assets/Ex.png" width="75%"/>
</p>

---

### 2. Rode esse projeto

Siga estes passos para iniciar o projeto localmente:

**a) Clone o repositório**

```bash
git clone git@github.com:RodrigoBerino/paygateway.git
```

**b) Configure as chaves Stripe**

Adicione sua `publishableKey` e `secretKey` da Stripe no arquivo `lib/consts.dart`.

**c) Comandos**

```bash
cd paygateway

flutter pub get

flutter run
```

---

### 3. Tecnologias utilizadas

- Flutter
- Dart
- Material Design
- Stripe SDK (`flutter_stripe: ^12.6.0`)
- HTTP client (`dio: ^5.8.0+1`)
- SVG support (`flutter_svg: ^2.2.4`)
- Singleton pattern para serviços
