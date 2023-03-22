import 'package:flutter/material.dart';
import 'package:landflight/controller/SearchController.dart';
import 'package:landflight/utils/theme.dart';
import 'package:provider/provider.dart';

class SearchPoppUP extends StatefulWidget {
  SearchPoppUP({Key? key}) : super(key: key);

  @override
  State<SearchPoppUP> createState() => _SearchPoppUPState();
}

class _SearchPoppUPState extends State<SearchPoppUP> {
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Container(
      height: 230,
      width: widht * .9,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: WHITE_COLOR,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                  onTap: () {
                    context.read<SearchController>().close();
                  },
                  child: Icon(Icons.close))),
          SizedBox(
            height: 16,
          ),
          Container(
            width: widht,
            height: 40,
            decoration: BoxDecoration(
                color: GRAY_COLOR, borderRadius: BorderRadius.circular(18)),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: TextField(
                      keyboardType: TextInputType.text,
                      onTap: () {},
                      onSubmitted: (_) {},
                      style: const TextStyle(
                          fontFamily: "Bold", color: FONT_COLOR, fontSize: 14),
                      textAlign: TextAlign.start,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          focusColor: PRIMARY_COLOR,
                          // ]),
                          //suffixIcon: widget.suffixIcon,
                          contentPadding: const EdgeInsets.only(
                              bottom: 10, top: 5, left: 10),
                          border: InputBorder.none,
                          // hintText: widget.hintText,
                          hintStyle: const TextStyle(
                              fontFamily: "Bold",
                              color: FONT_COLOR,
                              fontSize: 14))),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: WHITE_COLOR,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Icon(
                      Icons.search_outlined,
                      color: FONT_COLOR,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.center,
            child: Text("Aucun résultat trouvé!"),
          ),
        ],
      ),
    );
  }
}
