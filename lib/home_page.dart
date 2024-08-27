import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_status/Log_in.dart/log_in.dart';
import 'package:meal_status/Parts/Info.dart';
import 'package:meal_status/Parts/meals.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<InformationModel> information = [];
  List<Meals> _meals = [];

  bool value = false;
  bool theme = false;

  // final _controller = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _getinitialinfo();  // Fetch information only once when the widget is initialized.
  }

  void _getinitialinfo() {
    information = InformationModel.getInfo();
    _meals = Meals.getMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          infoBox(),
          Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(height: 10,),
          mealInfo(),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.cyan[100],
      title: Center(
        child: Text('Meal Status'),
      ),
    );
  }

  Column infoBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Personal info',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          height: 80,
          child: ListView.separated(
            itemCount: information.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) => SizedBox(height: 15,),
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ' + information[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Room no: ' + information[index].room_no,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Manager name: ' + information[index].M_name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }

  Column mealInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Meals',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 20,),
        ListView.separated(
          itemCount: _meals.length,
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(height: 15,),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _meals[index].boxIsSelected = !_meals[index].boxIsSelected;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => Log_in()));
              },
            //   return GestureDetector(
            // onTap: () {
            //   // Handle the tap event here
            //   setState(() {
            //     // Toggle the selection state of the meal
            //     _meals[index].boxIsSelected = !_meals[index].boxIsSelected;
            //   });
            //   // You can also navigate to a new page or trigger any other action
            //   // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => SomeOtherPage()));
            // },
              child: Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SvgPicture.asset(
                        _meals[index].IconPath,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _meals[index].day,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          _meals[index].date,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: AdvancedSwitch(
                            controller: _meals[index].controller,
                            enabled: true,
                            height: 30,
                            width: 70,
                            borderRadius: const BorderRadius.all(Radius.circular(120)),
                            inactiveColor: Colors.red,
                            inactiveChild: Text('OFF'),
                            activeChild: Text('ON'),
                            thumb: ValueListenableBuilder<bool>(
                              valueListenable: _meals[index].controller,
                              builder: (context, value, child) {
                                return Icon(
                                 _meals[index].controller.value
                                    ? Icons.beenhere
                                    : Icons.cancel
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: _meals[index].boxIsSelected ? Colors.blue[50] : Colors.blueAccent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: _meals[index].boxIsSelected
                      ? [
                          BoxShadow(
                            color: Colors.cyan.withOpacity(0.1),
                            offset: Offset(0, 10),
                            blurRadius: 40,
                            spreadRadius: 0,
                          )
                        ]
                      : [],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
