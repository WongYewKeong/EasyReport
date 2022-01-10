import 'package:flutter/material.dart';
import 'package:flutter_prototype/Component/button.dart';
import 'package:flutter_prototype/Ui/home.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';

class ReportSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Status'),
        leading: Icon(null),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          _Header(),
          Expanded(child: _Timeline()),
          Container(
            margin: EdgeInsets.all(16.0),
            child: LoginSignupButton(
                title: 'Back To Home',
                ontapp: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeScreen()));
                }),
          ),
        ],
      ),
    );
  }
}

class _Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      shrinkWrap: true,
      children: <Widget>[
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          isFirst: true,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xFF64DD17),
            padding: EdgeInsets.all(6),
          ),
          endChild: const _RightChild(
              asset: 'assets/images/received.png',
              title: 'Report Submitted',
              message: 'We have received your report.',
              date: '31 December 2021'),
          beforeLineStyle: const LineStyle(
            color: Color(0xFFDADADA),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xFFDADADA),
            padding: EdgeInsets.all(6),
          ),
          endChild: const _RightChild(
            disabled: true,
            asset: 'assets/images/inspection.png',
            title: 'Report Reviewed',
            message: 'Your report has been reviewed.',
            date: '1 January 2022',
          ),
          beforeLineStyle: const LineStyle(
            color: Color(0xFFDADADA),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xFFDADADA),
            padding: EdgeInsets.all(6),
          ),
          endChild: const _RightChild(
            disabled: true,
            asset: 'assets/images/progress-indicator.png',
            title: 'In Progress',
            message: 'We are arranging contructors to resolve the issue.',
            date: '1 January 2022',
          ),
          beforeLineStyle: const LineStyle(
            color: Color(0xFFDADADA),
          ),
          afterLineStyle: const LineStyle(
            color: Color(0xFFDADADA),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          isLast: true,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Color(0xFFDADADA),
            padding: EdgeInsets.all(6),
          ),
          endChild: const _RightChild(
            disabled: true,
            asset: 'assets/images/maintenance.png',
            title: 'Maintenance Completed',
            message: 'Your report is closed and resolved.',
            date: '',
          ),
          beforeLineStyle: const LineStyle(
            color: Color(0xFFDADADA),
          ),
        ),
      ],
    );
  }
}

class _RightChild extends StatelessWidget {
  const _RightChild({
    required this.asset,
    required this.title,
    required this.message,
    required this.date,
    this.disabled = false,
  });

  final String asset;
  final String title;
  final String message;
  final String date;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Opacity(
            child: Image.asset(asset, height: 50),
            opacity: disabled ? 0.5 : 1,
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  style: GoogleFonts.lato(
                    color: disabled
                        ? const Color(0xFFBABABA)
                        : const Color(0xFF636564),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  message,
                  style: GoogleFonts.lato(
                    color: disabled
                        ? const Color(0xFFD5D5D5)
                        : const Color(0xFF636564),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  date,
                  style: GoogleFonts.lato(
                    color: disabled
                        ? const Color(0xFFD5D5D5)
                        : const Color(0xFF636564),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GFCard(
        boxFit: BoxFit.cover,
        titlePosition: GFPosition.start,
        color: Colors.lightBlue[50],
        title: GFListTile(
          margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
          avatar: GFAvatar(
            backgroundImage: AssetImage('assets/images/pothole.jpg'),
            shape: GFAvatarShape.standard,
          ),
          titleText: '#12345',
          subTitleText: 'Pothole',
        ),
        content:
            Text("455, Taman Senawang Jaya, 70450, Seremban, Negeri Sembilan."),
      ),
    );
  }
}
