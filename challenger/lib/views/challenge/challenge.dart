import 'package:flutter/material.dart';
import 'package:game_challenger/core/models/challenge.dart';
import 'package:game_challenger/core/models/player.dart';
import 'package:game_challenger/views/challenge/challenge_view_model.dart';
import 'package:game_challenger/views/challenge/components/choice_builder.dart';
import 'package:game_challenger/widgets/build_body.dart';
import 'package:game_challenger/widgets/height_gap.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

class Challenge extends StatelessWidget {
  const Challenge({required this.player, required this.question, Key? key})
      : super(key: key);

  final Player player;
  final Question question;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChallengeViewModel>.reactive(
        viewModelBuilder: () =>
            ChallengeViewModel(currentQuestion: question, player: player),
        builder: (context, model, child) {
          return WillPopScope(
            onWillPop: () async {
              return Future.value(false);
            },
            child: SafeArea(
              bottom: true,
              child: WillPopScope(
                onWillPop: () async {
                  // Return false to prevent the dialog from being closed
                  return Future.value(false);
                },
                child: StreamBuilder<Player>(
                    stream: model.playerPoints(),
                    builder: (context, snapshot) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Id: ${player.id}"),
                              Text(model.player.score.toString() ?? "0")
                            ],
                          ),
                        ),
                        body: BuildBody(
                          child: Column(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        question.question!,
                                        overflow: TextOverflow.clip,
                                      ),
                                      const SizedBox(
                                        height: 38,
                                      ),
                                      for (var i in question.choices!)
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ChoiceBuilder(
                                              option: i,
                                            ),
                                            const HGap08(),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              model.isLocked
                                  ? Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SizedBox(
                                    width: 42,
                                    height: 42,
                                    child: Lottie.asset(
                                        'assets/lotties/bee-lounging.json'),
                                  ))
                                  : const SizedBox.shrink(),
                              model.isLocked
                                  ? Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "*Waiting for the game master to start the next round*",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          );
        });
    ;
  }
}
