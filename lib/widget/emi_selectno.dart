import 'package:flutter/material.dart';
import 'package:cred_assignment/model/model.dart'; // Assuming this is where your ItemData model is

class EmiSelection extends StatefulWidget {
  final List<ItemData> items;
  final void Function(ItemData item) onItemClicked;

  const EmiSelection({
    super.key,
    required this.items,
    required this.onItemClicked,
  });

  @override
  _EmiSelectionState createState() => _EmiSelectionState();
}

class _EmiSelectionState extends State<EmiSelection> {
  int? selectedEmiIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isRecommended = item.tag?.toLowerCase() == 'recommended';
                final isSelected = selectedEmiIndex == index;

                return GestureDetector(
                  onTap: () {
                    widget.onItemClicked(item);
                    setState(() {
                      selectedEmiIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: item.color,
                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                            border: Border.all(
                              color: isSelected ? Colors.blue : Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  if (isSelected)
                                    Icon(Icons.check_circle, color: Colors.white),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.emi ?? 'N/A',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    item.duration ?? 'N/A',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[200],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  SizedBox(height: 8),
                                  Text(
                                    'See calculations',
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (isRecommended)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16.0),
                                  bottomLeft: Radius.circular(16.0),
                                ),
                              ),
                              child: Text(
                                'recommended',
                                style: TextStyle(color: Colors.black, fontSize: 12),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}