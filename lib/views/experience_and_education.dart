import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ExperienceAndEducation extends StatefulWidget {
  const ExperienceAndEducation({
    Key key,
    @required this.screenHeight,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;

  @override
  _ExperienceAndEducationState createState() => _ExperienceAndEducationState();
}

class _ExperienceAndEducationState extends State<ExperienceAndEducation> {
  String currentPage = 'Question';

  @override
  Widget build(BuildContext context) {
    Widget page = currentPage == 'Question'
        ? Page(
            number: 1,
            key: Key('page1'),
            onOptionSelected: () => setState(() {
              currentPage = 'Education';
            }),
            title: 'Do you want to know more about me? Click the list below',
            list: <String>[
              'Experience',
              'Education',
              'Others',
            ],
            header: ['', '', ''],
          )
        : currentPage == 'Education'
            ? Page(
                number: 2,
                key: Key('page2'),
                onOptionSelected: () => setState(() {
                  currentPage = 'Experience';
                }),
                title: 'Education',
                list: <String>[
                  'SMK Telkom (2017 - 2020)',
                  'RPL(Rekayasa Perangkat Lunak)',
                  'Study IT included Web, mobile, desktop and basic programming'
                ],
                header: ['Study At', 'Major', 'Study'],
              )
            : currentPage == 'Experience'
                ? Page(
                    number: 3,
                    key: Key('page3'),
                    onOptionSelected: () => setState(() {
                      currentPage = 'Other';
                    }),
                    title: 'Experience',
                    list: <String>[
                      'Arxist (2019 - Present)',
                      'Flutter Mobile Developer',
                      'Create Arxist mobile app using flutter, it\'s a platform for creator to share their works (Release Next Month)'
                    ],
                    header: ['Company', 'Position', 'Works'],
                  )
                : Page(
                    number: 4,
                    key: Key('page4'),
                    onOptionSelected: () => setState(() {
                      currentPage = 'Question';
                    }),
                    title: 'Experience',
                    list: <String>[
                      'Play Basketball',
                      'Mobile Development',
                      'albertonly898@gmail.com'
                    ],
                    header: ['Hobby', 'Interest', 'Email'],
                  );
    return Container(
      height: widget.screenHeight > widget.screenWidth
          ? widget.screenHeight
          : widget.screenHeight * 0.8,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Color.fromRGBO(76, 61, 243, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 32.0 + 32 + 8,
            top: 60,
            bottom: 35,
            width: 1,
            child: Container(color: Colors.white.withOpacity(0.5)),
          ),
          Positioned(
            left: 32.0 + 8,
            top: 32,
            child: RotatedBox(
              quarterTurns: 2,
              child: Icon(
                Icons.airplanemode_active,
                size: 64,
              ),
            ),
          ),
          Positioned.fill(
            left: 32.0 + 8,
            child: AnimatedSwitcher(
              child: page,
              duration: Duration(milliseconds: 250),
            ),
          ),
        ],
      ),
    );
  }
}

class Page extends StatefulWidget {
  final int number;
  final String title;
  final List<String> list;
  final VoidCallback onOptionSelected;
  final List<String> header;

  const Page(
      {Key key,
      @required this.onOptionSelected,
      @required this.number,
      @required this.title,
      @required this.list,
      @required this.header})
      : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> with SingleTickerProviderStateMixin {
  List<GlobalKey<_ItemFaderState>> keys;
  int selectedOptionKeyIndex;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    keys = List.generate(
      2 + widget.list.length,
      (_) => GlobalKey<_ItemFaderState>(),
    );
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    onInit();
  }

  Future<void> animateDot(Offset startOffset) async {
    OverlayEntry entry = OverlayEntry(
      builder: (context) {
        double minTop = MediaQuery.of(context).padding.top + 52;
        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Positioned(
              left: 26.0 + 32 + 8,
              top: minTop +
                  (startOffset.dy - minTop) * (1 - _animationController.value),
              child: child,
            );
          },
          child: Dot(),
        );
      },
    );
    Overlay.of(context).insert(entry);
    await _animationController.forward(from: 0);
    entry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 32),
        ItemFader(key: keys[0], child: StepNumber(number: widget.number)),
        ItemFader(
          key: keys[1],
          child: StepQuestion(question: widget.title),
        ),
        Spacer(),
        ...widget.list.map((String answer) {
          int answerIndex = widget.list.indexOf(answer);
          int keyIndex = answerIndex + 2;
          return ItemFader(
            key: keys[keyIndex],
            child: OptionItem(
              header: widget.header[widget.list.indexOf(answer)],
              name: answer,
              onTap: (offset) => onTap(keyIndex, offset),
              showDot: selectedOptionKeyIndex != keyIndex,
            ),
          );
        }),
        SizedBox(height: 64),
      ],
    );
  }

  void onTap(int keyIndex, Offset offset) async {
    for (GlobalKey<_ItemFaderState> key in keys) {
      await Future.delayed(Duration(milliseconds: 40));
      key.currentState.hide();
      if (keys.indexOf(key) == keyIndex) {
        setState(() => selectedOptionKeyIndex = keyIndex);
        animateDot(offset).then((_) => widget.onOptionSelected());
      }
    }
  }

  void onInit() async {
    for (GlobalKey<_ItemFaderState> key in keys) {
      await Future.delayed(Duration(milliseconds: 40));
      key.currentState.show();
    }
  }
}

class ItemFader extends StatefulWidget {
  final Widget child;

  const ItemFader({Key key, @required this.child}) : super(key: key);

  @override
  _ItemFaderState createState() => _ItemFaderState();
}

class _ItemFaderState extends State<ItemFader>
    with SingleTickerProviderStateMixin {
  //1 means its below, -1 means its above
  int position = 1;
  AnimationController _animationController;
  Animation _animation;

  void show() {
    setState(() => position = 1);
    _animationController.forward();
  }

  void hide() {
    setState(() => position = -1);
    _animationController.reverse();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 64 * position * (1 - _animation.value)),
          child: Opacity(
            opacity: _animation.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class Dot extends StatelessWidget {
  final bool visible;

  const Dot({Key key, this.visible = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: visible ? Colors.white : Colors.transparent,
      ),
    );
  }
}

class StepNumber extends StatelessWidget {
  final int number;

  const StepNumber({Key key, @required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 64, right: 16),
      child: Text(
        '0$number',
        style: TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.bold,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}

class StepQuestion extends StatelessWidget {
  final String question;

  const StepQuestion({Key key, @required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 64, right: 16),
      child: Text(
        question,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class OptionItem extends StatefulWidget {
  final String name;
  final void Function(Offset dotOffset) onTap;
  final bool showDot;
  final String header;

  const OptionItem(
      {Key key,
      @required this.name,
      @required this.onTap,
      this.showDot = true,
      this.header})
      : super(key: key);

  @override
  _OptionItemState createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RenderBox object = context.findRenderObject();
        Offset globalPosition = object.localToGlobal(Offset.zero);
        widget.onTap(globalPosition);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: <Widget>[
            SizedBox(width: 26),
            Dot(visible: widget.showDot),
            SizedBox(width: 26),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.header,
                    style: TextStyle(fontSize: 15),
                  ),
                  AutoSizeText(
                    widget.name,
                    maxLines: 4,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
