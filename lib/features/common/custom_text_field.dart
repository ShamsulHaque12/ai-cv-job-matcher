import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String? controllerTag;
  final String? titleText;
  final String hintText;
  final bool isDropdown;
  final List<String>? dropdownItems;
  final void Function(String)? onChanged;
  final TextEditingController? textEditingController;
  final BorderSide? borderSide;
  final Widget? suffixIcon;
  final double? height;

  const CustomTextField({
    super.key,
    this.controllerTag,
    this.titleText,
    required this.hintText,
    this.isDropdown = false,
    this.dropdownItems,
    this.onChanged,
    this.textEditingController,
    this.borderSide,
    this.suffixIcon,
    this.height,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    final BorderSide border =
        widget.borderSide ?? const BorderSide(color: Colors.grey, width: 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleText != null)
          Text(widget.titleText!, style: TextStyle(fontSize: 14.sp)),
        if (widget.titleText != null) SizedBox(height: 8.h),

        // MAIN FIELD
        widget.isDropdown
            ? GestureDetector(
          onTap: () => setState(() => isOpen = !isOpen),
          child: Container(
            height: widget.height ?? 48.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              border: Border.all(color: border.color, width: border.width),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.textEditingController?.text.isNotEmpty == true
                        ? widget.textEditingController!.text
                        : widget.hintText,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                widget.suffixIcon ??
                    Icon(
                      isOpen
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 22,
                    ),
              ],
            ),
          ),
        )
            : TextField(
          controller: widget.textEditingController,
          onChanged: widget.onChanged,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: border,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: border,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: border,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 14.h,
            ),
            suffixIcon: widget.suffixIcon,
          ),
        ),

        // DROPDOWN LIST
        if (widget.isDropdown && isOpen)
          Container(
            margin: EdgeInsets.only(top: 5.h),
            constraints: const BoxConstraints(maxHeight: 250),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 2),
              ],
            ),
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: widget.dropdownItems?.length ?? 0,
              separatorBuilder: (_, __) => const Divider(height: 0),
              itemBuilder: (_, index) {
                final value = widget.dropdownItems![index];
                return InkWell(
                  onTap: () {
                    widget.textEditingController?.text = value;
                    widget.onChanged?.call(value);
                    setState(() => isOpen = false);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12.h),
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
