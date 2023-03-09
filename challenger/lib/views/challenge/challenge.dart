import 'package:flutter/material.dart';
import 'package:game_challenger/core/models/player.dart';
import 'package:game_challenger/widgets/build_body.dart';
import 'package:lottie/lottie.dart';

class Challenge extends StatelessWidget {
  const Challenge({
    required this.player,
    Key? key}) : super(key: key);

  final Player player;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: WillPopScope(
        onWillPop: () async {
          // Return false to prevent the dialog from being closed
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Id: ${player.id}"),
                Text("0")
              ],
            ),
          ),
          body: BuildBody(
            child: Column(
              children: [
                // const Align(
                //   alignment: Alignment.topLeft,
                //   child: Text("Place: 1"),
                // ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "qq",
                          overflow: TextOverflow.clip,
                        ),
                        const SizedBox(
                          height: 38,
                        ),
                        // for (var i in model.challenge.choice!)
                        //   Column(
                        //     mainAxisAlignment:
                        //     MainAxisAlignment.spaceAround,
                        //     mainAxisSize: MainAxisSize.max,
                        //     children: [
                        //       OptionBuilder(
                        //         choice: i,
                        //       ),
                        //       const HGap08(),
                        //     ],
                        //   ),
                      ],
                    ),
                  ),
                ),
                // model.isLocked
                //     ? Align(
                //     alignment: Alignment.bottomCenter,
                //     child: SizedBox(
                //       width: 42,
                //       height: 42,
                //       child: Lottie.asset(
                //           'assets/lotties/bee-lounging.json'),
                //     ))
                //     : const SizedBox.shrink(),
                // model.isLocked
                //     ? Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Text(
                //     "*Waiting for the game master to start the next round*",
                //     style: Theme.of(context).textTheme.bodySmall,
                //   ),
                // )
                //     : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );;
  }
}
