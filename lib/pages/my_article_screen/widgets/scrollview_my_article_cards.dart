// import 'package:flutter/material.dart';
// import 'package:vouloir/config/color_pallete.dart';
// import 'package:vouloir/pages/my_article_screen/widgets/my_article_card.dart';

// class ScrollViewMyArticlesCards extends StatefulWidget {
//   const ScrollViewMyArticlesCards({Key? key}) : super(key: key);

//   @override
//   State<ScrollViewMyArticlesCards> createState() =>
//       _ScrollViewMyArticlesCardsState();
// }

// class _ScrollViewMyArticlesCardsState extends State<ScrollViewMyArticlesCards> {
//   final scrollController = ScrollController();
//   List<MyArticlesCardView> cards = List.generate(
//       12,
//       (index) => const MyArticlesCardView(
//             title: "Google Ads and PPC Marketing Expert",
//             category: "Marketing",
//             description:
//                 "We require a Google ads PPC marketing expert to create remarketing ads and PPC ads specifically for  Google.ca.  You must show that CTR and sales...",
//             tags: <String>[
//               "PPC",
//               "Google Ads",
//               "Marketing",
//               "PPC",
//               "Google Ads",
//               "Marketing"
//             ],
//           ));

//   @override
//   void initState() {
//     super.initState();
//     scrollController.addListener(() {
//       if (scrollController.position.maxScrollExtent ==
//           scrollController.offset) {
//         fetch();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     scrollController.dispose();
//     super.dispose();
//   }

//   Future fetch() async {
//     setState(() {
//       cards.add(const MyArticlesCardView(
//         title: "Google Ads and PPC Marketing Expert after loading",
//         category: "Marketing",
//         description:
//             "We require a Google ads PPC marketing expert to create remarketing ads and PPC ads specifically for  Google.ca.  You must show that CTR and sales...",
//         tags: <String>[
//           "PPC",
//           "Google Ads",
//           "Marketing",
//           "PPC",
//           "Google Ads",
//           "Marketing"
//         ],
//       ));
//     });
//   }

//   Future refreshScrollView() async {
//     setState(() {
//       fetch();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       color: secColor,
//       onRefresh: refreshScrollView,
//       child: ListView.builder(
//         controller: scrollController,
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: cards.length + 1,
//         itemBuilder: (context, index) {
//           if (index < cards.length) {
//             final card = cards[index];

//             return Padding(
//               padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
//               child: GestureDetector(
//                 onTap: () =>
//                     Navigator.pushNamed(context, "/MyArticleSingleViewScreen"),
//                 child: MyArticlesCardView(
//                     title: card.title,
//                     category: card.category,
//                     description: card.description,
//                     tags: card.tags),
//               ),
//             );
//           } else {
//             return Padding(
//               padding: const EdgeInsets.symmetric(vertical: 32.0),
//               child: Center(
//                 child: CircularProgressIndicator(
//                   color: secColor,
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
