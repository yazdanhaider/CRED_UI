import 'package:cred_assignment/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'custom_button.dart';


final bottomSheetStateProvider2 =
StateNotifierProvider<BottomSheetStateNotifier2, bool>((ref) {
  return BottomSheetStateNotifier2();
});

class BottomSheetStateNotifier2 extends StateNotifier<bool> {
  BottomSheetStateNotifier2() : super(false);

  void openBottomSheet() {
    state = true;
  }

  void closeBottomSheet() {
    state = false;
  }
}

class BottomSheetWidget2 extends ConsumerStatefulWidget {
  final Item? data; // Data to be passed in
  final Function() onButtonPressed; // Callback for the custom button
  final Function()? onChangeAccount; // Callback for the "Change account" button

  const BottomSheetWidget2({
    super.key,
    required this.data,
    required this.onButtonPressed,
    this.onChangeAccount,
  });

  @override
  _BottomSheetWidget2State createState() => _BottomSheetWidget2State();
}

class _BottomSheetWidget2State extends ConsumerState<BottomSheetWidget2> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Title and Subtitle
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data?.openState?.body?.title ?? 'Title',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                widget.data?.openState?.body?.subtitle ?? 'Subtitle',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.home, size: 40, color: Colors.blue),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data?.openState?.body?.items?.first.title ??
                                'Title',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.data?.openState?.body?.items?.first.subtitle
                                .toString() ??
                                'Subtitle',
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Trailing part (Circular checkbox for selection)
                  Checkbox(
                    shape: CircleBorder(), // To make it circular
                    value: isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        isSelected = value ?? false;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(widget.data?.openState?.body?.footer ?? ''),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 40,
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
