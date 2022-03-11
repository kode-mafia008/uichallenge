import 'package:flutter/material.dart';

class CustomDropDownScreen extends StatefulWidget {
  const CustomDropDownScreen({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  State<CustomDropDownScreen> createState() => _CustomDropDownScreenState();
}

class _CustomDropDownScreenState extends State<CustomDropDownScreen> {
  bool isDropDownOpened = false;
  late GlobalKey actionKey;
  late double height, width, xPosition, yPosition;

  @override
  void initState() {
    super.initState();
    actionKey = LabeledGlobalKey(widget.text);
  }

  OverlayEntry _createFloatingDropDown() {
    return OverlayEntry(builder: ((context) {
      return Positioned(
        left: xPosition,
        width: width,
        top: yPosition + height,
        height: 4 * height + 40,
        child: Container(
          height: 200,
          decoration: const BoxDecoration(color: Colors.greenAccent),
        ),
      );
    }));
  }

  void findDropDownData() {
    RenderBox renderBox = actionKey.currentContext.findRenderObject();
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
    print(height);
    print(width);
    print(xPosition);
    print(yPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        key: actionKey,
        onTap: () {
          findDropDownData();
          OverlayEntry floatingDropDown = _createFloatingDropDown();
          Overlay.of(context)?.insert(floatingDropDown);
          setState(() {
            isDropDownOpened = !isDropDownOpened;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.red.shade600,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Text(
                widget.text.toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_downward,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
