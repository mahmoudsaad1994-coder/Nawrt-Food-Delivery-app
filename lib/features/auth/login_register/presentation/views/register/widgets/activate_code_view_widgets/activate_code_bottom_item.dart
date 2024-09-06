import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../constants.dart';
import '../../../../../../../../core/utils/styles.dart';
import '../../../../../../../../core/widgets/custom_button.dart';
import '../../../../manager/cubit.dart';
import '../../../../manager/states.dart';
import 'test_field_widget.dart';

class ActivateCodeBottomItem extends StatefulWidget {
  const ActivateCodeBottomItem({super.key});

  @override
  State<ActivateCodeBottomItem> createState() => _ActivateCodeBottomItemState();
}

class _ActivateCodeBottomItemState extends State<ActivateCodeBottomItem> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  String combinedCode = '';

  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constrain) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: constrain.maxWidth * .1),
          child: BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = AuthCubit.get(context);
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: constrain.maxHeight * .1),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(6, (index) {
                        return TestFieldWidget(
                          handlePaste: handlePaste,
                          width: constrain.maxWidth,
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          onTap: () {
                            _selectAllText(_controllers[index]);
                          },
                          onChanged: (value) {
                            if (value.length == 1 &&
                                index < _controllers.length - 1) {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[index + 1]);
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[index - 1]);
                            }
                          },
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: constrain.maxHeight * .1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'سوف تنتهي صلاحية الكود خلال',
                        style: Styles.textStyle14(context),
                      ),
                      SizedBox(width: constrain.maxWidth * .01),
                      Text(
                        formatTime(cubit.totalTimeInSeconds),
                        style: Styles.textStyle14(context, color: kFFC436Color),
                      ),
                      SizedBox(width: constrain.maxWidth * .01),
                      Text(
                        'دقيقة',
                        style: Styles.textStyle14(context),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'إعادة إرسال كود التفعيل',
                      style: Styles.textStyle14(context,
                          color: kFFC436Color, fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(height: constrain.maxHeight * .05),
                  SizedBox(
                    width: double.infinity,
                    height: constrain.maxHeight * .15,
                    child: CustomButton(
                      child: Text(
                        'متابعة',
                        style: Styles.textStyle16(context),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              );
            },
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  handlePaste(text) {
    //make text is only number
    String pastedText = text.replaceAll(RegExp(r'[^\d]'), '');
    //check
    if (pastedText.length != 6) {
      return;
    }
    //past in 6 fields
    for (int i = 0; i < pastedText.length; i++) {
      _controllers[i].text = pastedText[i];
    }
  }

  void _selectAllText(TextEditingController controller) {
    // Select all text in the given controller
    controller.selection = TextSelection(
      baseOffset: 0,
      extentOffset: controller.text.length,
    );
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (BlocProvider.of<AuthCubit>(context).totalTimeInSeconds > 0) {
        BlocProvider.of<AuthCubit>(context).changeTimeCounter();
      } else {
        timer?.cancel();
      }
    });
  }
}
