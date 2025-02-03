import 'package:flutter/material.dart';
import 'package:news/Ui/home/category/source_name_item.dart';
import 'package:news/Utils/app_colors.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/news/news_widget.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sourcesList ;

  SourceTabWidget({required this.sourcesList}) ;

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              dividerColor: AppColors.transParentColor,
              onTap: (index){
                selectedIndex = index ;
                setState(() {

                });
              },
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: Theme.of(context).indicatorColor,
                tabs: widget.sourcesList.map((source){
              return SourceNameItem(
                  source: source,
                  isSelected: selectedIndex == widget.sourcesList.indexOf(source)) ;
            }).toList()
            ),

            Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex] )) ,
          ],
        )
    );
  }
}
