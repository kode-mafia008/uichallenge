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
  double height = 28, width = 32, xPosition = 32, yPosition = 32;
  late OverlayEntry floatingDropDown;

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
        child: DropDown(itemHeight: height),
      );
    }));
  }

  void findDropDownData() {
    // RenderBox renderBox = actionKey.currentContext.findRenderObject();
    // height = renderBox.size.height;
    // width = renderBox.size.width;
    // Offset offset = renderBox.localToGlobal(Offset.zero);
    // xPosition = offset.dx;
    // yPosition = offset.dy;
    // print(height);
    // print(width);
    // print(xPosition);
    // print(yPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        key: actionKey,
        onTap: () {
          setState(() {
            if (isDropDownOpened) {
              floatingDropDown.remove();
            } else {
              findDropDownData();
              floatingDropDown = _createFloatingDropDown();
              Overlay.of(context)?.insert(floatingDropDown);
            }
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

class DropDown extends StatelessWidget {
  const DropDown({
    Key? key,
    required this.itemHeight,
  }) : super(key: key);
  final double itemHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: const Alignment(-0.85, 0),
          child: ClipPath(
            clipper: ArrowClipper(),
            child: Container(
              height: 20,
              width: 30,
              decoration: BoxDecoration(color: Colors.red.shade600),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 0.15),
          height: 4 * itemHeight,
          decoration: BoxDecoration(color: Colors.red.shade600),
          child: Column(
            children: const [
              DropDownItem(
                text: 'Add new',
                icon: Icons.arrow_drop_down,
                isSelected: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class DropDownItem extends StatelessWidget {
  const DropDownItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.red.shade600,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text(
            text.toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
          const Spacer(),
          Icon(
            icon,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
