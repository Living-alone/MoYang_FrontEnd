import 'package:flutter/material.dart';
import 'package:livingalone/common/component/colored_image.dart';
import 'package:livingalone/common/const/colors.dart';
import 'package:livingalone/common/const/text_styles.dart';
import 'package:livingalone/common/layout/default_layout.dart';
import 'package:livingalone/user/component/custom_button.dart';
import 'package:livingalone/user/view/signup_screen.dart';
import 'package:livingalone/user/view/terms_detail_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsScreen extends StatefulWidget {
  static String get routeName => 'terms';

  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  bool isAllAgreedSelected = false;
  bool firstAgreedSelected = false;

  void _toggleAllAgreed() {
    setState(() {
      isAllAgreedSelected = !isAllAgreedSelected;
      firstAgreedSelected = isAllAgreedSelected;
    });
  }

  void _toggleFirstAgreed() {
    setState(() {
      firstAgreedSelected = !firstAgreedSelected;
      isAllAgreedSelected = !isAllAgreedSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '이용동의',
      isFirstScreen: true,
      actionString: '1',
      child: Stack(
        children: [
          Container(
            // width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.fromLTRB(24, 60, 0, 0).r,
            child: Column(
              children: [
                GestureDetector(
                  onTap: _toggleAllAgreed,
                  child: Container(
                    width: 345.w,
                    height: 56.h,
                    padding: REdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isAllAgreedSelected ? BLUE100_COLOR : GRAY100_COLOR,
                      borderRadius: BorderRadius.all(Radius.circular(12)).w,
                      border: Border(
                        bottom: BorderSide(
                          color: isAllAgreedSelected ? BLUE200_COLOR : GRAY200_COLOR,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if(isAllAgreedSelected)
                          ColoredIcon(imagePath: 'assets/image/nothingCheck.svg', isActive: true)
                        else ColoredIcon(imagePath: 'assets/image/nothingCheck.svg', isActive: false),
                        12.horizontalSpace,
                        Text(
                          '전체 동의하기',
                          style: AppTextStyles.subtitle,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _toggleFirstAgreed,
                  child: Container(
                    width: 345.w,
                    height: 56.h,
                    padding: EdgeInsets.all(12),
                    // padding: REdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)).w
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          // 기본적으로 Row에도 길이가 존재하여 피그마대로 진행할경우 overflow 발생함. 최적은 265
                          width: 265.w,
                          height: 24.h,
                          child: Row(
                            children: [
                              if(isAllAgreedSelected || firstAgreedSelected)
                                const ColoredIcon(imagePath: 'assets/image/nothingCheck.svg', isActive: true)
                              else const ColoredIcon(imagePath: 'assets/image/nothingCheck.svg', isActive: false),
                              12.horizontalSpace,
                              Text(
                                '[필수]개인정보 수집 및 이용 동의',
                                style: AppTextStyles.subtitle,
                              ),
                            ],
                          ),
                        ),
                        8.horizontalSpace,
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => TermsDetailScreen()));
                          },
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(
                            minWidth: 24,
                            minHeight: 24,
                            maxWidth: 24,
                            maxHeight: 24,
                          ).w,
                          icon: Image.asset(
                            'assets/image/right_24.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomButton(
            backgroundColor: BLUE400_COLOR,
            foregroundColor: WHITE100_COLOR,
            disabledBackgroundColor: GRAY200_COLOR,
            disabledForegroundColor: GRAY800_COLOR,
            text: '다음',
            textStyle: AppTextStyles.title,
            isEnabled: isAllAgreedSelected,
            onTap: () {
              // TODO: 나중에 go router 적용할 것. 임시로 넣어둠.
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignupScreen()));
            },
          ),
        ],
      ),
    );
  }
}

