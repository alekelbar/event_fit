import 'package:event_fit/presentation/pages/Auth/register_screen.dart';
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
            gradient: LinearGradient(
          colors: [Colors.blueGrey.shade500, Colors.green.shade300],
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Código de verificación",
                style: TextStyle(
                  fontSize: 27,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Enviaremos el código de verificación a ${optController.phoneNumber}",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              OptForm(),
              const OptLocalButtons(),
              const PhoneNumberForm(),
              const ReEnterNumber(),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(8),
                ],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  labelText: "Número de telefóno",
                  prefixIcon: const Icon(Icons.phone),
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
                enabled: otpProvider.isActivePhoneField,
                onFieldSubmitted: (value) {
                  otpProvider.phoneNumber = value;
                  otpProvider.sendMessage();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReEnterNumber extends StatefulWidget {
  const ReEnterNumber({
    super.key,
  });

  @override
  State<ReEnterNumber> createState() => _ReEnterNumberState();
}

class _ReEnterNumberState extends State<ReEnterNumber> {
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
                    MaterialPageRoute(builder: (_) => const RegisterScreen()));
              }
            },
            child: const Text(
              "Confirmar",
              style: TextStyle(
                color: Colors.white,
              ),
            )),
        ElevatedButton(
            onPressed: () {
              otpProvider.reSend();
            },
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
                decoration: InputDecoration(
                    filled: true, fillColor: Colors.white.withOpacity(0.2)),
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
                decoration: InputDecoration(
                    filled: true, fillColor: Colors.white.withOpacity(0.2)),
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
                decoration: InputDecoration(
                    filled: true, fillColor: Colors.white.withOpacity(0.2)),
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
                decoration: InputDecoration(
                    filled: true, fillColor: Colors.white.withOpacity(0.2)),
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
