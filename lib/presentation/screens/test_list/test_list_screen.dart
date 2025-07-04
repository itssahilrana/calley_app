import 'dart:convert';

import 'package:calley_app/config/themes/extensions/theme_extension.dart';
import 'package:calley_app/core/constants/app_colors.dart';
import 'package:calley_app/presentation/widgets/custom_button_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../widgets/status_box_widget.dart';
import 'custom_drawer.dart';

class TestListScreen extends StatefulWidget {
  const TestListScreen({super.key});

  @override
  State<TestListScreen> createState() => _TestListScreenState();
}

class _TestListScreenState extends State<TestListScreen> {
  int pending = 0;
  int done = 0;
  int schedule = 0;
  String listName = "Loading...";
  int totalCalls = 0;
  bool isLoading = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fetchListDetails();
  }

  Future<void> fetchListDetails() async {
    try {
      var headers = {'Content-Type': 'application/json'};

      var url = Uri.parse(
          'https://mock-api.calleyacd.com/api/list/68626fb697757cb741f449b9');
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        debugPrint("✅ API RESPONSE: $data");

        setState(() {
          listName = data["name"] ?? "No Name";
          totalCalls = (data["calls"] as List?)?.length ?? 0;
          pending = data["pending"] ?? 0;
          done = data["called"] ?? 0;
          schedule = data["rescheduled"] ?? 0;
          isLoading = false;
        });
      } else {
        debugPrint('❌ Error: ${response.statusCode} ${response.reasonPhrase}');
        setState(() => isLoading = false);
      }
    } catch (e) {
      debugPrint("❌ Exception: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu, color: context.colors.textPrimary)),
        title: Text(
          'Dashboard',
          style: context.typography.textSemiBoldLarge,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Icon(Icons.headset_mic_outlined, color: context.colors.textPrimary),
          SizedBox(width: 16),
          Icon(Icons.notifications_none, color: context.colors.textPrimary),
          SizedBox(width: 16),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: context.colors.primaryColor,
            ))
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  //  Top Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Test List",
                                style: context.typography.textSemiBoldLarge,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '$totalCalls CALLS',
                                style: context.typography.textSemiBoldXLarge
                                    .copyWith(
                                        color: context.colors.primaryColor),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: context.colors.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text('S',
                                style: context.typography.textHeaderHero
                                    .copyWith(
                                        color: context.colors.whiteColor)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  //  Pie Chart
                  SizedBox(
                    height: 200,
                    child: PieChart(
                      PieChartData(
                        centerSpaceRadius: 50,
                        sectionsSpace: 5,
                        sections: [
                          PieChartSectionData(
                            value: pending.toDouble(),
                            color: AppColors.orange,
                            radius: 30,
                            showTitle: false,
                          ),
                          PieChartSectionData(
                            value: schedule.toDouble(),
                            color: AppColors.purple,
                            radius: 40,
                            showTitle: false,
                          ),
                          PieChartSectionData(
                            value: done.toDouble(),
                            color: AppColors.successColor,
                            radius: 30,
                            showTitle: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  //  Status Boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatusBox(
                        title: "Pending",
                        count: pending,
                        color: AppColors.orange,
                      ),
                      StatusBox(
                        title: "Done",
                        count: done,
                        color: AppColors.successColor,
                      ),
                      StatusBox(
                        title: "Schedule",
                        count: schedule,
                        color: AppColors.purple,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  //  Start Button
                  CustomButtonWidget(
                    buttonText: 'Start Calling Now',
                    onPress: () {},
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}
