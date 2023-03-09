import 'package:flutter/material.dart';
import 'package:game_challenger/core/models/challenge.dart';
import 'package:game_challenger/utils/my_colors.dart';
import 'package:game_challenger/views/challenge/challenge_view_model.dart';
import 'package:stacked/stacked.dart';

class ChoiceBuilder extends ViewModelWidget<ChallengeViewModel> {
  const ChoiceBuilder({required this.option, super.key});

  final Option option;

  @override
  Widget build(BuildContext context, ChallengeViewModel viewModel) {
    return GestureDetector(
        onTap: viewModel.isLocked
            ? null
            : () async {
                viewModel.locked(
                    option, viewModel.currentQuestion.choices!.indexOf(option));
              },
        child: Container(
          // width: double.infinity,
          height: 56,
          width: 320,
          constraints: const BoxConstraints(
              minHeight: 56,
              minWidth: 320,
              maxHeight: double.infinity,
              maxWidth: double.infinity),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: viewModel.index ==
                      viewModel.currentQuestion.choices!.indexOf(option)
                  ? viewModel.correct
                      ? const Color(0xff31cb00).withOpacity(0.9)
                      : Colors.red
                  : Colors.white,
              border: Border.all(width: 1.5, color: MyColors.black),
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${option.id}. ${option.value}",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.black),
              ),
              const SizedBox(
                width: 16,
              ),
              viewModel.index ==
                      viewModel.currentQuestion.choices!.indexOf(option)
                  ? viewModel.correct
                      ? const Icon(
                          Icons.check_circle,
                          size: 24,
                          color: Colors.white,
                        )
                      : Container(
                          width: 24,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: const Icon(
                            Icons.close_rounded,
                            size: 16,
                            color: Colors.red,
                          ),
                        )
                  : const SizedBox.shrink()
            ],
          ),
        ));
  }
}
