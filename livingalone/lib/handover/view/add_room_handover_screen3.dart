import 'package:flutter/material.dart';
import 'package:livingalone/common/component/custom_select_list.dart';
import 'package:livingalone/common/const/colors.dart';
import 'package:livingalone/common/const/text_styles.dart';
import 'package:livingalone/common/layout/default_layout.dart';
import 'package:livingalone/handover/view/add_room_handover_screen4.dart';
import 'package:livingalone/home/component/custom_double_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddRoomHandoverScreen3 extends StatefulWidget {
  const AddRoomHandoverScreen3 ({super.key});

  @override
  State<AddRoomHandoverScreen3> createState() => _AddRoomHandoverScreen3State();
}

class _AddRoomHandoverScreen3State extends State<AddRoomHandoverScreen3> {
  final List<String> buildingTypes = ['원룸(오픈형)', '원룸(분리형)', '투룸', '쓰리룸 이상'];
  String? selectedType;
  bool showError = false;

  void _handleTypeSelection(String type) {
    setState(() {
      if (selectedType == type) {
        selectedType = null;
      } else {
        selectedType = type;
      }
      showError = false;
    });
  }

  void _handleNextPress() {
    if (selectedType == null) {
      setState(() {
        showError = true;
      });
    } else {
      // TODO: 다음 화면으로 이동
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const AddRoomHandoverScreen4(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '자취방 양도하기',
      showCloseButton: true,
      currentStep: 3,
      totalSteps: 8,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                Text(
                  '매물의 종류를 선택해 주세요',
                  style: AppTextStyles.heading2.copyWith(color: GRAY800_COLOR),
                ),
                40.verticalSpace,
                CustomSelectList(
                  items: buildingTypes,
                  selected: selectedType,
                  onItemSelected: _handleTypeSelection,
                  showError: showError,
                  errorText: '매물의 종류를 선택해 주세요.',
                ),
              ],
            ),
          ),
          CustomDoubleButton(
            onTap: _handleNextPress,
          ),
        ],
      ),
    );
  }
}