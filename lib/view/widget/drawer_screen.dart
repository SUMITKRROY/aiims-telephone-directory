import 'package:aiims_telephone_directory/component/myText.dart';
import 'package:aiims_telephone_directory/route/pageroute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../route/route_generater.dart';
import '../../../config/theamdata.dart';

import '../../../utils/image.dart';
import '../../../utils/utils.dart';
import '../../component/custom_listtile.dart';
import '../../provider/profile_cubit/profile_cubit.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // padding: EdgeInsets.zero,
        // shrinkWrap: true,
        children: <Widget>[
          Container(
            width: double.maxFinite,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: ColorsData.greenTheams,
              ),
              child: Column(
                children: [
                  Container(
                    width: 90.w,
                    height: 90,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: AssetImage(
                              ImagePath.profile,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundColor: ColorsData.topbarBackgroundColor,
                              radius: 15,
                              child: Transform.translate(
                                offset: Offset(-2, -2),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    size: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Add some space between avatar and text
                  const Text(
                    'UserName',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // BlocBuilder<ProfileCubit, ProfileState>(
          //   builder: (context, state) {
          //     if (state is ProfileLoaded) {
          //       return Container(
          //         width: double.maxFinite,
          //         child: DrawerHeader(
          //           decoration: BoxDecoration(
          //             color: ColorsData.tealColor,
          //           ),
          //           child: Column(
          //             children: [
          //               Container(
          //                 width: 90.w,
          //                 height: 90,
          //                 child: Stack(
          //                   children: [
          //                     Align(
          //                       alignment: Alignment.center,
          //                       child: CircleAvatar(
          //                         radius: 45,
          //                         backgroundImage: AssetImage(
          //                           ImagePath.profile,
          //                         ),
          //                       ),
          //                     ),
          //                     InkWell(
          //                       onTap: () {
          //                        // MyRoutes.navigateToProfileEditScreen(context);
          //                       },
          //                       child: Align(
          //                         alignment: Alignment.bottomRight,
          //                         child: CircleAvatar(
          //                           backgroundColor: ColorsData.topbarBackgroundColor,
          //                           radius: 15,
          //                           child: Transform.translate(
          //                             offset: Offset(-2, -2),
          //                             child: IconButton(
          //                               onPressed: () {
          //                                // MyRoutes.navigateToProfileEditScreen(context);
          //                               },
          //                               icon: Icon(
          //                                 Icons.edit,
          //                                 size: 20.sp,
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               const SizedBox(height: 8),
          //               // Add some space between avatar and text
          //               Text(
          //                 state.profileModal.fullname ?? '',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 20,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     }
          //     return Container(
          //       width: double.maxFinite,
          //       child: DrawerHeader(
          //         decoration: BoxDecoration(
          //           color: ColorsData.tealColor,
          //         ),
          //         child: Column(
          //           children: [
          //             Container(
          //               width: 90.w,
          //               height: 90,
          //               child: Stack(
          //                 children: [
          //                   Align(
          //                     alignment: Alignment.center,
          //                     child: CircleAvatar(
          //                       radius: 45,
          //                       backgroundImage: AssetImage(
          //                         ImagePath.profile,
          //                       ),
          //                     ),
          //                   ),
          //                   InkWell(
          //                     onTap: () {
          //
          //                     },
          //                     child: Align(
          //                       alignment: Alignment.bottomRight,
          //                       child: CircleAvatar(
          //                         backgroundColor: ColorsData.topbarBackgroundColor,
          //                         radius: 15,
          //                         child: Transform.translate(
          //                           offset: Offset(-2, -2),
          //                           child: IconButton(
          //                             onPressed: () {
          //
          //                             },
          //                             icon: Icon(
          //                               Icons.edit,
          //                               size: 20.sp,
          //                             ),
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             const SizedBox(height: 8),
          //             // Add some space between avatar and text
          //             const Text(
          //               'UserName',
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 20,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // ),
          // ListTile(
          //   title: const Text('Profile'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
          //   },
          // ),
          CustomListTile(
              leadingIcon: const Icon(Icons.home),
              label: 'Home',
              onTap: () => Navigator.pop(context)),

          CustomListTile(
            leadingIcon: const Icon(Icons.contact_emergency,),
            label: 'Emergency No.',
            onTap: () {
              Navigator.pop(context); 
            },
          ),

          // ListTile(
          //   title: const Text('Setting'),
          //   onTap: () {
          //     Navigator.pop(context);
          //
          //     // Add your onTap functionality here
          //   },
          // ),
          CustomListTile(
            leadingIcon: const Icon(Icons.info),
            label: 'About Us',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // ListTile(
          //   title: const Text('About Us'),
          //   onTap: () {
          //     Navigator.pop(context);
          //
          //     // Add your onTap functionality here
          //   },
          // ),
          Expanded(child: SizedBox()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 150.w,
              margin: EdgeInsets.only(bottom: 10.h),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    side: const BorderSide(width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                    MyText(
                      label: "Login",
                      fontColor: Colors.white,
                    )
                    /*  MultiBlocListener(
                      listeners: [
                        BlocListener<LogoutCubit, LogoutState>(
                          listener: (context, state) {
                            if (state is LogoutLoaded) {
                              Navigator.pop(context);
                              BlocProvider.of<LoginDbCubit>(context).deleteUserData();
                            }
                            if (state is LogoutLoading) {
                              Utils.showLoadingProgress(context);
                            }
                            if (state is LogoutError) {
                              Navigator.pop(context);
                              Utils.snackbarToast(state.error);
                            }
                          },
                        ),
                        BlocListener<LoginDbCubit, LoginDbState>(
                          listener: (context, state) {
                            if (state is LoginDbDeleted) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginPage()),
                                  (route) => false);
                            }
                          },
                        ),
                      ],
                      child: const Text(
                        'Logout',
                        // style: TextStyle(color: Colors.black),
                      ),
                    ),*/
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RoutePath.login);
                  // BlocProvider.of<LogoutCubit>(context).userLogOut();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
