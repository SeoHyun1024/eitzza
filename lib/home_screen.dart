import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  String _counterText = "0";
  TextEditingController textController = TextEditingController();
  String textContent = "";
  String errorTextVal = "";

  bool isDraft = true; // Draft 누르면 토글

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _modeChange() {
    setState(() {
      isDraft != isDraft;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height / 852;
    final double width = MediaQuery.of(context).size.width / 393;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40 * height,
        title: SvgPicture.asset("assets/images/Eitzza_logo.svg"),
        //backgroundColor: const Color(0xFFF0F1F8),
      ),
      body: Stack(
        children: [
          HomeBackground(
            isDraft: isDraft,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 36 * height,
                      width: 69 * width,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE7E5FF),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: const Text(
                        "Draft",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF212121),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 36 * height,
                      width: 69 * width,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: const Text(
                        "Deveolp",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFB9B8C9),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 33.0),
                  child: Container(
                    height: 249 * height,
                    width: 345 * width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Stack(
                      children: [
                        nameField(),
                        Positioned(
                          bottom: 24,
                          right: 24,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 64 * width,
                                height: 64 * height,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE7E5FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Icon(
                                  Icons.mic_none_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recently Draft",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF212121),
                      ),
                    ),
                    Text(
                      "전체보기",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFB9B8C9),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 323 * height,
                        width: 168 * width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFE7E5FF),
                              Color(0xFFEBEDFD),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0, 1],
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "OpenAI를 활용해서 뭔가 해보고 싶다.",
                                style: TextStyle(
                                  color: Color(0xFF121212),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Container(
                                height: 191 * height,
                                width: 168 * width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xFFFFFFFF),
                                      const Color(0xFFFFFFFF).withOpacity(0.6),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    stops: const [0, 1],
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "16:03",
                                        style: TextStyle(
                                          color: Color(0xFFB9B8C9),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        "먼가가먼가다... 먼가가 먼가다..",
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Color(0xFF121212),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 122 * height,
                              width: 168 * width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFFFFFFFF),
                                    const Color(0xFFFFFFFF).withOpacity(0.6),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: const [0, 1],
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(24.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "10.30(Wed)",
                                      style: TextStyle(
                                        color: Color(0xFFB9B8C9),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "먼가가먼가다... 먼가가 먼가다..",
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Color(0xFF121212),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextField nameField() {
    //final textProvider = Provider.of<InfoProvider>(context);

    return TextField(
      controller: textController,
      focusNode: _focusNode,
      style: const TextStyle(
        color: Color(0xFF212121),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
        hintText: '직접 작성해보세요',
        hintStyle: const TextStyle(
          color: Color(0xFFE7E5FF),
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        counterText: "",
      ),
      cursorColor: const Color(0xFF67648D),
      cursorHeight: 16,
      cursorWidth: 1.5,
      autofocus: false,
      maxLines: 10,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      onChanged: (value) {
        setState(() {
          _counterText = (value.length).toString();
          textContent = textController.text;
          //textProvider.saveName(value);
          if (value.isEmpty) {
            errorTextVal = 'min';
          } else {
            errorTextVal = '';
          }
        });
      },
      cursorErrorColor: Colors.red,
    );
  }
}

// 배경 그라데이션 위젯
class HomeBackground extends StatelessWidget {
  HomeBackground({
    super.key,
    required this.isDraft,
  });

  bool isDraft;

  @override
  Widget build(BuildContext context) {
    return Container(
      // 배경 그라데이션
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: isDraft
          ? const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF0F1F8),
                  Color(0xFFFAF7FE),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
              //color: Color.fromRGBO(60, 65, 92, 1),
            )
          : const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF151618),
                  Color(0xFF413158),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
              //color: Color.fromRGBO(60, 65, 92, 1),
            ),
    );
  }
}
