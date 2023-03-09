import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:game_challenger/app/app.locator.dart';
import 'package:game_challenger/app/app.router.dart';
import 'package:game_challenger/app/app_view_model.dart';
import 'package:game_challenger/core/models/challenge.dart';
import 'package:game_challenger/widgets/snackbar.dart';
import 'package:lottie/lottie.dart';

class RegisterViewModel extends AppViewModel {
  final app = locator<AppViewModel>();
  var formKey = GlobalKey<FormState>();
  Question? challenge;
  TextEditingController name = TextEditingController();

  void init() async {
    setBusy(true);
    challenge = await api.getQuestion();
    app.currentPlayer = await app.shared.getUser();
    if (app.currentPlayer != null) {
      if (challenge != null) {
        await app.nav.pushReplacementNamed(Routes.challenge,
            arguments: ChallengeArguments(
                player: app.currentPlayer!, question: challenge!));
        //   if (status == 0 && status!=null) {
        //     _timer.cancel();
        //     nav.pushReplacementNamed(Routes.wait,
        //         arguments:
        //         WaitngArguments(player: app.currentPlayer!, q: challenge!));
        //   } else {
        //     _timer.cancel();
        //     nav.pop();
        //     await app.nav.pushReplacementNamed(Routes.challenge,
        //         arguments: ChallengeArguments(
        //             challenge: challenge!, player: app.currentPlayer!));
        //     notifyListeners();
        //   }
        // } else {
        //   print("finished");
        //   _timer.cancel();
        //   showDialog(
        //       context: Get.context!,
        //       barrierDismissible: false,
        //       builder: (context) => WillPopScope(
        //         onWillPop: () async {
        //           // Return false to prevent the dialog from being closed
        //           return Future.value(hasStarted);
        //         },
        //         child: AlertDialog(
        //           title: const Text(
        //               "Contest has conducted",
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                 fontSize: 12,
        //               )),
        //           content: Lottie.asset('assets/lotties/bee-lounging.json',
        //               width: 24),
        //         ),
        //       ));
      }
    }
    setBusy(false);
  }

  void submit() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
  }

  void register(String name) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    setBusy(true);
    try {
      currentPlayer = await api.register(name);
      if (currentPlayer != null) {
        //   if (status == 0 && status!=null) {
        //     _timer.cancel();
        //     nav.pushReplacementNamed(Routes.wait,
        //         arguments:
        //         WaitngArguments(player: currentPlayer!, q: challenge!));
        //   } else {
        //     _timer.cancel();
        //     nav.pop();
        //     notifyListeners();
        //     await nav.pushReplacementNamed(Routes.challenge,
        //         arguments: ChallengeArguments(
        //             challenge: challenge!, player: currentPlayer!));
        //   }
      }
    } on FirebaseException catch (e) {
      mySnackbar(title: 'Oops', message: e.message!);
      rethrow;
    }
    setBusy(false);
  }
}
