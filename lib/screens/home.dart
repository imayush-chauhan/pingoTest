import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pingolearntest/util/myColor.dart';
import 'package:pingolearntest/util/util.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.background,
      appBar: AppBar(
        backgroundColor: MyColor.main,
        elevation: 0,
        leading: const SizedBox(),
        leadingWidth: 0,
        title: Text("Comments",
          style: GoogleFonts.poppins(
              color: MyColor.white,
              fontSize: 14,
              fontWeight: FontWeight.w700
          ),),
      ),
      body: FutureBuilder<List>(
        future: get(),
        builder: (context,snap){
          if(!snap.hasData){
            return Center(child: CircularProgressIndicator(color: MyColor.main,));
          }
          return ListView.builder(
            itemCount: snap.data!.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Container(
                  height: 151,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: MyColor.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: MyColor.grey,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(snap.data![index]["name"].toString().substring(0,1).toUpperCase(),
                            maxLines: 1,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: MyColor.black,
                            ),),
                        ),
                        SizedBox(width: 12.5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Name: ",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: MyColor.black.withOpacity(0.3),
                                ),),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 150,
                                  child: Text(snap.data![index]["name"],
                                    maxLines: 1,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: MyColor.black,
                                    ),),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Row(
                                children: [
                                  Text("Email: ",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: MyColor.black.withOpacity(0.3),
                                    ),),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width - 150,
                                    child: Text(snap.data![index]["email"],
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: MyColor.black,
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 115,
                                  child: Text(snap.data![index]["body"],
                                    maxLines: 4,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: MyColor.black,
                                    ),),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

}
