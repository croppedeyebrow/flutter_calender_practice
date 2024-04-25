import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 선택된 날짜

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 30.0, color: Color.fromARGB(255, 49, 28, 92)),
            Container(
              color: Color.fromARGB(255, 49, 28, 92),
              padding: EdgeInsets.all(14.0),
              width: MediaQuery.of(context).size.width,
              // height: 260,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  topRow(),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        7,
                        (index) => dateWidget(
                          index: index,
                        ),
                      ),
                    ),
                  ),
                  // 여기서 dateWidget을 7번 호출하여 요일을 표시합니다.
                  // dateWidget 호출
                ],
              ),
            ),
            cardWidget(),
            cardWidget(),
            cardWidget(),
            cardWidget(),
            cardWidget(),
            cardWidget(),
          ],
        ),
      ),
    );
  }
}

class cardWidget extends StatelessWidget {
  const cardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: <Widget>[
              Text(
                "13 : 00",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              lineGen(
                lines: [20.0, 30.0, 40.0, 10.0],
              ),
            ],
          ),
        ),
        SizedBox(width: 20.0),
        Expanded(
          child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Color(0xff654f91),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0)),
              ),
              child: Container(
                  color: Color(0xfffcf9f9),
                  margin: EdgeInsets.only(left: 4.0),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Text("13:00~14:40"),
                          VerticalDivider(),
                          Text("Blue str,21"),
                        ]),
                        Row(
                          children: <Widget>[
                            Text(
                              "Project Planning",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff654f91)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ))),
        )
      ],
    );
  }
}

class lineGen extends StatelessWidget {
  final List lines;

  const lineGen({Key? key, required this.lines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          4,
          (index) => Container(
                height: 2.0,
                width: lines[index], // null 검사 후 접근
                color: Color(0xffd0d2d8),
                margin: EdgeInsets.symmetric(vertical: 14.0),
              )
          // null 일 경우 빈 컨테이너 표시
          ),
    );
  }
}

// -------------------------------------------------
///이 부분에서 겪었던 오류, StafulWidget으로 받아야 하는데 StatelessWidget으로 받아서 발생한 오류!!
///
// 문제는 StatelessWidget인 dateWidget을 StatefulWidget으로 변경하면서 발생합니다.
//StatefulWidget은 상태를 가지며, 상태를 변경할 수 있는 위젯입니다. 그러나 StatelessWidget은 한 번 생성되면 상태가 고정되어 있고 변경할 수 없습니다.

// 따라서 StatefulWidget으로 변경하면 해당 위젯이 상태를 가지게 되는데,
//이 상태를 관리하기 위해서는 StatefulWidget의 State 클래스를 구현해야 합니다.
// State 클래스를 구현하여 상태를 관리하려면 StatefulWidget과 State 클래스 간의 연결이 필요하며, 이를 위해 StatefulWidget에서는 createState 메소드를 구현해야 합니다.

// 즉, StatefulWidget으로 변경하면서 발생하는 주된 문제는 State 클래스를 구현해야 한다는 것이며,
// 이를 위해 StatefulWidget과 State 클래스 간의 관계를 설정해주어야 한다는 점입니다. 이 부분을 올바르게 처리하지 않으면 코드가 제대로 동작하지 않을 수 있습니다.
// -------------------------------------------------

class dateWidget extends StatefulWidget {
  final index;

  const dateWidget({Key? key, this.index}) : super(key: key);
  @override
  _dateWidgetState createState() => _dateWidgetState();
}

class _dateWidgetState extends State<dateWidget> {
  bool selectDate = false;
  var list = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          // 현재 선택 날짜가 있으면 현재 값을 취소하고, 새로운 날짜를 선택
          if (selectDate) {
            selectDate = false;
            return;
          }

          // 현재 날짜 선택
          selectDate = !selectDate;
        });
      },
      child: Container(
        decoration: selectDate
            // 선택된 날짜가 있을 경우는 색을 채우고
            // 없을 경우는 null
            ? null
            : BoxDecoration(
                color: Color.fromARGB(255, 209, 101, 58),
                borderRadius: BorderRadius.circular(12.0),
              ),
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              list[widget.index] ?? "",
              style: TextStyle(
                fontWeight: selectDate ? FontWeight.normal : FontWeight.bold,
                color: selectDate ? Color(0xff8e7daf) : Colors.white,
                fontSize: 18,
              ),
            ),
            Text(
              "${10 + widget.index}",
              style: TextStyle(
                fontWeight: selectDate ? FontWeight.normal : FontWeight.bold,
                color: selectDate ? Color(0xff8e7daf) : Colors.white,
                fontSize: 18,
              ),
            ),
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: selectDate ? Color(0xff8e7daf) : Colors.white,
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class topRow extends StatelessWidget {
  const topRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Daily",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8.8),
            Text(
              "meetings",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xffa79abf),
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          "Jan",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ],
    );
  }
}
