import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/models/goodnees_model.dart';
import 'package:t_1app/screens/AccountType.dart';
import 'package:t_1app/screens/Donate_money_page.dart';
import 'package:t_1app/widgets/AddExchangeItem.dart';

class DonateButton extends StatefulWidget {
  final Function(DonateCardModel) onAddDonation;

  const DonateButton({super.key, required this.onAddDonation});

  @override
  State<DonateButton> createState() => _DonateButtonState();
}

class _DonateButtonState extends State<DonateButton> {
  OverlayEntry? overlayEntry;
  bool isOpen = false;

  void toggleDropdown() {
    final overlay = Overlay.of(context);

    if (overlay == null) return;

    if (isOpen) {
      overlayEntry?.remove();
      overlayEntry = null;
    } else {
      overlayEntry = createOverlay();
      overlay.insert(overlayEntry!);
    }

    setState(() {
      isOpen = !isOpen;
    });
  }

  OverlayEntry createOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder:
          (context) => Positioned(
            top: offset.dy + size.height + 8,
            right: 30.w,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 220.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade400),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 6),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        overlayEntry?.remove();

                        setState(() {
                          isOpen = false;
                        });

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => DonateMoneyPage()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: Text(
                            "التبرع بالمال",
                            style: GoogleFonts.cairo(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Divider(height: 1, color: Colors.grey),

                    InkWell(
                      onTap: () {
                        overlayEntry?.remove();
                        overlayEntry = null;

                        setState(() {
                          isOpen = false;
                        });

                        showDialog(
                          context: context,
                          builder:
                              (_) => AddProductDialog(
                                onAdd: (item) {
                                  widget.onAddDonation(
                                    DonateCardModel(
                                      title: item.title,
                                      subTitle: item.description,
                                      image: item.image,
                                      page: Accounttype(),
                                    ),
                                  );

                                  //   Navigator.pop(context);
                                },

                                title1: "قم بإضافة البيانات المطلوبة لتتم",
                                title2: "إضافة منتجك للتبرع",
                              ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: Text(
                            "التبرع بالمنتجات",
                            style: GoogleFonts.cairo(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  @override
  void dispose() {
    overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleDropdown,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xffF57C00),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "اضف تبرعك",
              style: GoogleFonts.cairo(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            SizedBox(width: 10.w),

            Text(
              "+",
              style: GoogleFonts.cairo(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            SizedBox(width: 20.w),

            Icon(
              isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.black,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
