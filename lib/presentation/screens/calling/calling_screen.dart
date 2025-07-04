import 'package:calley_app/config/themes/extensions/query_extension.dart';
import 'package:calley_app/config/themes/extensions/theme_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../config/routes/route_names.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/services/test_list_services.dart';
import '../../../data/models/test_list_model.dart';

class CallingScreen extends StatefulWidget {
  const CallingScreen({super.key});

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  List<TestListItem> _testList = [];
  bool _isLoading = false;

  Future<void> _loadTestList() async {
    setState(() => _isLoading = true);
    try {
      final list = await TestListService().fetchTestList();
      setState(() => _testList = list);
    } catch (e) {
      print("Error loading test list: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        titleSpacing: 5,
        backgroundColor: context.colors.whiteColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            size: 28,
            color: context.colors.textPrimary,
          ),
        ),
        title: Text(
          "Dashboard",
          style: context.typography.textHeaderLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              //todo:
            },
            icon: Icon(
              Icons.support_agent,
              color: context.colors.textPrimary,
            ),
          ),
          IconButton(
            onPressed: () {
              //todo:
            },
            icon: Icon(
              Icons.notifications_active_outlined,
              color: context.colors.textPrimary,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 6),
            // Header Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.pinkAccent,
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Swati",
                        style: context.typography.textSemiBoldMedium
                            .copyWith(color: context.colors.whiteColor),
                      ),
                      Text(
                        "Calley Personal",
                        style: context.typography.textSemiBoldLarge
                            .copyWith(color: context.colors.whiteColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Instruction Box
            Container(
              width: context.queryWidth * 0.98,
              decoration: BoxDecoration(
                color: context.colors.secondaryColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Load Number to Call",
                          style: context.typography.textHeaderXLarge
                              .copyWith(color: context.colors.whiteColor),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: context.queryWidth * 0.98,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: context.colors.whiteColor,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Visit',
                            style:
                                context.typography.textSemiBoldLarge.copyWith(
                              color: context.colors.textPrimary,
                            ),
                            children: [
                              TextSpan(
                                text: ' https://app.getcalley.com',
                                style: context.typography.textSemiBoldLarge
                                    .copyWith(
                                        color: context.colors.primaryColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    ///todo: Handle tap here
                                  },
                              ),
                              TextSpan(
                                text:
                                    ' to upload \nnumbers that you wish to call using Calley \n                     Mobile App.',
                                style: context.typography.textSemiBoldLarge
                                    .copyWith(
                                        color: context.colors.textPrimary),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 220,
                              child: Image.asset(AppImages.callingImg),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            const Spacer(),

            // Bottom Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.successColor,
                      ),
                      image: DecorationImage(
                        image: AssetImage(AppImages.whatsappLogo),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(
                        "Star Calling Now",
                        style: context.typography.textBodyMedium.copyWith(
                          color: context.colors.whiteColor,
                        ),
                      ),
                      onPressed: () => showCallingListBottomSheet(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // inside _CallingScreenState

  void showCallingListBottomSheet(BuildContext context) async {
    setState(() => _isLoading = true);
    try {
      _testList = await TestListService().fetchTestList();
    } catch (e) {
      debugPrint('API error: $e');
      _testList = [];
    } finally {
      setState(() => _isLoading = false);
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: context.colors.secondaryColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(15),
            Text(
              'CALLING LISTS',
              style: context.typography.textSemiBoldLarge
                  .copyWith(color: context.colors.whiteColor),
            ),
            const Gap(10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: context.colors.whiteColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  // Select + Refresh row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Calling List',
                        style: context.typography.textSemiBoldMedium,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          showCallingListBottomSheet(context);
                        },
                        icon: const Icon(Icons.refresh, size: 16),
                        label: const Text('Refresh'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.colors.primaryColor,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          minimumSize: const Size(40, 36),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: context.typography.textBodySmall
                              .copyWith(color: context.colors.whiteColor),
                        ),
                      ),
                    ],
                  ),

                  const Gap(20),

                  // The actual list
                  if (_isLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (_testList.isEmpty)
                    Text('No List Found',
                        style: context.typography.textBodyMedium)
                  else
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _testList.length,
                      separatorBuilder: (_, __) => const Gap(12),
                      itemBuilder: (context, i) {
                        final item = _testList[i];
                        return InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // TODO: navigate to the detailed screen for this list
                            Navigator.pushNamed(
                                context, RoutesName.testListScreen);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                              color: context.colors.secondaryColor
                                  .withOpacity(0.06),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    item.name,
                                    style:
                                        context.typography.textSemiBoldMedium,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    size: 18,
                                    color: context.colors.textPrimary),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
