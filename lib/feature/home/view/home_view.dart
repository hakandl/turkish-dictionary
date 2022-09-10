import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turkce_sozluk/product/widgets/card/home_info_card.dart';

import '../../../product/widgets/bg.dart';
import '../../../product/widgets/input/textfield.dart';
import '../../../product/widgets/svg.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: context.isKeyBoardOpen ? Colors.white : Colors.red,
          systemOverlayStyle: context.isKeyBoardOpen ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
        ),
      ),
      // backgroundColor: Colors.red,
      // backgroundColor: AppColor.alizarinCrimson,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              color: Colors.grey.shade50,
              duration: context.durationLow,
              // padding: const EdgeInsets.only(bottom: AppPadding.medium),
              // color: AppColor.alabaster,
              height: context.isKeyBoardOpen ? context.dynamicHeight(0.13) : context.dynamicHeight(0.35),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    bottom: 26,
                    child: AnimatedOpacity(
                      duration: context.durationLow,
                      opacity: context.isKeyBoardOpen ? 0 : 1,
                      child: Background(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              right: 0,
                              top: 0,
                              child: IconButton(
                                  onPressed: () {},
                                  /* onPressed: () {
                                    showCustomSheet(
                                      context,
                                      isHomePage: true,
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: AppPadding.xLarge),
                                              child: ElevatedButtonWidget(
                                                text: AppTexts.info,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .85,
                                                onPressed: () {
                                                  showCustomSheet(
                                                      context, const InfoView(),
                                                      title: AppTexts.info);
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            ElevatedButtonWidget(
                                              text: AppTexts.contact,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .85,
                                              onPressed: () {
                                                showCustomSheet(
                                                  context,
                                                  const ContactView(),
                                                  title: AppTexts.contactHeader,
                                                  isScrollControlled: true,
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }, */
                                  icon: const SvgWidget(icon: 'ic_more')),
                            ),
                            const SvgWidget(
                              icon: 'ic_logo',
                              height: 40,
                              width: 85,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      width: context.dynamicWidth(1),
                      padding: context.horizontalPaddingNormal,
                      child: NormalTextField(
                        icon: Padding(
                          padding: context.paddingNormal,
                          child: const SvgWidget(
                            icon: 'ic_search',
                            color: Colors.red,
                          ),
                        ),
                        radius: context.lowRadius.x,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: context.onlyTopPaddingNormal.top,
                ),
                padding: EdgeInsets.only(
                    left: context.onlyLeftPaddingNormal.left, right: context.onlyRightPaddingNormal.right),
                color: Colors.grey.shade50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    homeInfoCardTitle(context, 'data'),
                    const Center(child: HomeInfoCard()),
                    homeInfoCardTitle(context, 'data'),
                    const Center(child: HomeInfoCard()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container homeInfoCardTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.only(
        top: context.onlyTopPaddingMedium.top,
        bottom: context.onlyBottomPaddingLow.bottom,
        left: context.onlyLeftPaddingLow.left,
      ),
      child: Text(
        title,
        style: context.textTheme.bodySmall,
      ),
    );
  }
}
