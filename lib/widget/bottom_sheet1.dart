import 'package:cred_assignment/model/model.dart';
import 'package:cred_assignment/widget/bottom_sheet2.dart';
import 'package:cred_assignment/widget/emi_selectno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'collapsed_widget.dart';
import 'custom_button.dart';

// Create a provider for managing bottom sheet state
final bottomSheetStateProvider =
StateNotifierProvider<BottomSheetStateNotifier, bool>((ref) {
  return BottomSheetStateNotifier();
});

class BottomSheetStateNotifier extends StateNotifier<bool> {
  BottomSheetStateNotifier() : super(false);

  void openBottomSheet() {
    state = true;
  }

  void closeBottomSheet() {
    state = false;
  }
}

class BottomSheetWidget extends ConsumerStatefulWidget {
  final Item? data; // Data to be passed in
  final Function() onButtonPressed; // Callback for the custom button
  final Function()? onChangeAccount; // Callback for the "Change account" button
  final Function() onPressedEmi;

  const BottomSheetWidget({
    super.key,
    required this.onPressedEmi,
    required this.data,
    required this.onButtonPressed,
    this.onChangeAccount,
  });

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends ConsumerState<BottomSheetWidget> {
  ItemData? itemData;

  @override
  Widget build(BuildContext context) {
    final isBottomSheet2Open = ref.watch(bottomSheetStateProvider2);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title and Subtitle
        isBottomSheet2Open
            ? CreditInfoWidget(
            key1: widget.data?.closedState?.body?.key1,
            value1: itemData?.emi,
            key2: widget.data?.closedState?.body?.key2,
            value2: itemData?.duration)
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.data?.openState?.body?.title ?? 'Title',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.data?.openState?.body?.subtitle ?? 'Subtitle',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        // EMI Selection
        EmiSelection(
          items: widget.data?.openState?.body?.items ?? [],
          onItemClicked: (item) {
            setState(() {
              itemData = item;
            });
            print('click container$item');
          },
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(widget.data?.openState?.body?.footer ?? ''),
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: widget.onButtonPressed,
            text: widget.data?.ctaText ?? '',
          ),
        ),
      ],
    );
  }
}