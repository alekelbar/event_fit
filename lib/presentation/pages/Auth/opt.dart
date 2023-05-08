import 'package:event_fit/presentation/pages/Auth/sign_up.dart';
import 'package:event_fit/presentation/providers/otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OptProviderController())
      ],
      child: const OtpWidget(),
    );
  }
}

class OtpWidget extends StatelessWidget {
  const OtpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final optController = context.watch<OptProviderController>();
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2),
            gradient: LinearGradient(
                colors: [
              Colors.blueGrey.shade500,Colors.green.shade300
             
            ],)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Código de verificación",
                style: TextStyle(
                  fontSize: 27,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Enviaremos el código de verificación a ${optController.phoneNumber}",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              OptForm(),
              const SizedBox(
                height: 15,
              ),
              const OptLocalButtons(),
              const OptReSendButton(),
              const PhoneNumberForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneNumberForm extends StatelessWidget {
  const PhoneNumberForm({super.key});

  @override
  Widget build(BuildContext context) {
    final otpProvider = context.watch<OptProviderController>();
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.phone,
              inputFormatters: [
                LengthLimitingTextInputFormatter(8),
              ],
              decoration: const InputDecoration(
                
                  labelText: "Número de telefóno",
                  prefixIcon: Icon(Icons.phone)),
              textAlign: TextAlign.start,
              enabled: otpProvider.isActivePhoneField,
              onFieldSubmitted: (value) {
                otpProvider.phoneNumber = value;
                otpProvider.sendMessage();
              },
            )
          ],
        ),
      ),
    );
  }
}

class OptReSendButton extends StatefulWidget {
  const OptReSendButton({
    super.key,
  });

  @override
  State<OptReSendButton> createState() => _OptReSendButtonState();
}

class _OptReSendButtonState extends State<OptReSendButton> {
  @override
  Widget build(BuildContext context) {
    final otpProvider = context.watch<OptProviderController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            otpProvider.reTry();
          },
          child: const Text(
            "¿No es su número de telefono?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class OptLocalButtons extends StatelessWidget {
  const OptLocalButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final otpProvider = context.watch<OptProviderController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        TextButton(
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colors.lightBlueAccent),
                minimumSize: MaterialStatePropertyAll(Size(100, 50))),
            onPressed: () {
              final res = otpProvider.validateDigits();
              otpProvider.resetState();
              if (res) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SingUpScreen()));
              }
            },
            child: const Text(
              "Confirmar",
              style: TextStyle(
                color: Colors.white,
              ),
            )),
        ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Re-enviar",
              style: TextStyle(
                color: Colors.blueGrey,
              ),
            )),
      ],
    );
  }
}

class OptForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  OptForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final otpProvider = context.watch<OptProviderController>();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 64,
              width: 64,
              child: TextFormField(
                style: Theme.of(context).textTheme.headlineMedium,
                onChanged: (value) {
                  if (value.length == 1) {
                    otpProvider.addDigit(value);
                    FocusScope.of(context).nextFocus();
                  }
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            SizedBox(
              height: 64,
              width: 64,
              child: TextFormField(
                style: Theme.of(context).textTheme.headlineMedium,
                onChanged: (value) {
                  if (value.length == 1) {
                    otpProvider.addDigit(value);
                    FocusScope.of(context).nextFocus();
                  }
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            SizedBox(
              height: 64,
              width: 64,
              child: TextFormField(
                style: Theme.of(context).textTheme.headlineMedium,
                onChanged: (value) {
                  if (value.length == 1) {
                    otpProvider.addDigit(value);
                    FocusScope.of(context).nextFocus();
                  }
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            SizedBox(
              height: 64,
              width: 64,
              child: TextFormField(
                style: Theme.of(context).textTheme.headlineMedium,
                onChanged: (value) {
                  if (value.length == 1) {
                    otpProvider.addDigit(value);
                    FocusScope.of(context).nextFocus();
                  }
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
