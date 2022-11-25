import 'package:flutter/material.dart';

class ShowAll extends StatelessWidget {
   ShowAll({Key? key}) : super(key: key);

  String? title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title??""),
      ),
      // body: ListView.builder(
      //   itemCount: state.inviteList?.data?.contacts?.length,
      //   shrinkWrap: true,
      //   itemBuilder: (_, int index) {
      //     var contactDetails =
      //     state.inviteList?.data?.contacts?[index];
      //     return Padding(
      //       padding: const EdgeInsets.only(top: 10),
      //       child: Container(
      //         decoration: BoxDecoration(
      //             color: AppColor.appWhite,
      //             borderRadius: BorderRadius.circular(10),
      //             shape: BoxShape.rectangle),
      //         child: ListTile(
      //           leading: Card(
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //             color: AppColor.allPeopleColor,
      //             child: SizedBox(
      //               height: 60,
      //               width: 50,
      //               child: Center(
      //                 child: ((contactDetails!.firstname??"").length>2&&(contactDetails.lastname??"").length>2)?Text(
      //                   (contactDetails!.firstname ?? "")
      //                       .substring(0,1) +
      //                       (contactDetails.lastname ?? "")
      //                           .substring(0,1),
      //                 ):Text(
      //                   (contactDetails.firstname ?? "")
      //                       .substring(0,0)+
      //                       (contactDetails.lastname ?? "")
      //                           .substring(0,0),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           title: Text(
      //             (contactDetails!.firstname ?? "") +
      //                 (contactDetails.lastname ?? ""),
      //             style: Font.SubTitle(),
      //           ),
      //           subtitle: Text(
      //             contactDetails.isactive == true
      //                 ? "Active"
      //                 : "Inactive",
      //             style: Font.otherTitle(color: AppColor.appTextGrey),
      //           ),
      //           trailing: Text(
      //             contactDetails.roleName ?? "",
      //             style: Font.otherTitle(),
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),,
    );
  }
}
