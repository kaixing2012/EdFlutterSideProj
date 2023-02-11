import 'package:flutter/material.dart';
import 'package:flutter_proj/api/models/mbm081018/mbm081018.model.dart';

class RestfulDetailPage extends StatefulWidget {
  final MBM081018FxRate fxRate;

  const RestfulDetailPage({
    required Key key,
    required this.fxRate,
  }) : super(key: key);

  @override
  RestfulDetailPageState createState() => RestfulDetailPageState();
}

class RestfulDetailPageState extends State<RestfulDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String getFxRateKeyName(String key) {
    switch (key) {
      case 'CCY_NAME':
        return '英文幣別名';

      case 'CCY_CNAME':
        return '中文幣別名';

      case 'SPOT_BUY_RATE':
        return 'SPOT 買入匯率';

      case 'SPOT_SELL_RATE':
        return 'SPOT 賣出匯率';

      case 'SPOT_BUY_DIFFERENCE':
        return 'SPOT 買入匯差';

      case 'SPOT_SELL_DIFFERENCE':
        return 'SPOT 賣出匯差';

      case 'CSH_BUY_LCY':
        return '現金買入 LCY';

      case 'CSH_BUY_LCY_DIFFERENCE':
        return '現金買入 LCY 匯差';

      case 'CSH_SELL_LCY':
        return '現金賣出 LCY';

      case 'CSH_SELL_LCY_DIFFERENCE':
        return '現金買入 LCY 匯差';

      case 'IS_DAY30_BUY_HIGHEST':
        return '是否 30 天買入最高';

      case 'IS_DAY7_BUY_HIGHEST':
        return '是否 7 天買入最高';

      case 'IS_DAY30_SELL_LOWEST':
        return '是否 30 天賣出最高';

      case 'IS_DAY7_SELL_LOWEST':
        return '是否 7 天賣出最高';

      default:
        return 'Not Found';
    }
  }

  String getFxRateStrValue(dynamic val) {
    if (val is bool) {
      switch (val) {
        case true:
          return '是';

        default:
          return '否';
      }
    }

    return val.toString();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            title: const Text('匯率明細'),
            backgroundColor: Colors.black,
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                MediaQuery.of(context).size.height,
                200.0,
              )),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: ListView.builder(
              itemCount: widget.fxRate.toJson().length,
              itemBuilder: (context, index) {
                final fxRateMap = widget.fxRate.toJson();
                final key = fxRateMap.keys.toList()[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getFxRateKeyName(key),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        getFxRateStrValue(fxRateMap[key]),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );
}