import 'package:gsheets/gsheets.dart';
import 'package:sahithyolsav_app/back_end/spreadsheet/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSheetsApi {
  static const _credentials = r'''{
  "type": "service_account",
  "project_id": "sahithyolsavapp",
  "private_key_id": "b34e3c519c543dc1f7fb95cd1610a7afe75d4136",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCfRcGsDSx8akPl\noy4YPdZikuUiJ4GaamiozsUfCoStWszvq6uOg84Azp71x6egO3aqZEd5RjEDR35c\nIW4FwoIwAZgEr0miuzXumWlmCiisVpEKwDZkFfMqzTSTggAYfKCIcEa0t5VihwDf\nWtFzQC+v2sEymuIhztvodLOABbnG5tiLusnHcENCDIXKegw9t7RobngbJr/eSc9Z\nSbEQ1ip7tgtcavvzQBA0CKbaQFnLI3Vqvg2sOHX0ZNXLKvlVku1jcU0stlXfaP55\nrr5DrIiolwvhnXaz769PfN3F07XDLiQCoJC3334JlbSzW6UKLer2+RMV9LT9/KPM\njuwNsRmpAgMBAAECggEAJVHezN4EXb23nZwEDb2VmaDibEOWCHTlA6L5iOm5x3X2\nfbU7vGfRchp4IE6RTkgIqOnY3oeOLf7HUraplVNrlmyVLonVJvqXa0pKqlR4jdM1\n5q89v2tuQEn3hxXHyHURV475XliC+iR4lZ1t5QO1+M55BQ7KLFJQcHJB6h5NVte7\nTcrfXop93Nbn1g4E6i4YYFHdIwQskhIsoedp3pYTE+oOPveuNr/B5RRfZHodWEp0\nWAuOIP/LGK/rGWIpJ/UV57ne3CmbtNdszxBy/BrJGhtJqT6rKwcoYJMS932/EOog\nRnnLvnU5a5MWOvw9x03IX0T7TEtoldYOcYXE7zaeFQKBgQDTND/n8l0rm+vVWbLm\nK0/6O/xCR2OTTHQ3geoN5jTjpXOzRl9t7j6Tzn/jLSEGjzSAi+hsq/gwY8i6wjnY\n7i/1GkewoTmzYUD+DaBJDGoPdJfj1OeNWk2nb+J7vruCfmPBQ6+8i1fcbt0Mc7UR\nds7PSAUvphUGCCbvJUBmeueTxQKBgQDBDcaW8MNIZ8MdCu9EcVHiKwqyvjbmocA1\nowj4UQT7TVG/1Pa78cbOg+VBCu7CBnYSEstwsDMRIa61pIRoX6W4xxBNy8HalAJo\nGPtdac8lYVntpbi8CBhYNLMb7isRAOVSjX6AW4q0cyhJqF093dJu8LvS2FMybQHh\n9HfFIpE4lQKBgQDJS101Nfuy2pK07x7g3JsHRjCxAtVWyGFjngBzatsxtLlHPmUp\now4lVYTyAksds1M4yR+mo2iSxifER+VWaf1vP7LgF2mlG6YT/OytcpWLUXaKgJqI\nUG7+jFZx1mFkiA2PX3GY473DrC4l9gm3MWL+kAfRWBtlelORThHJGo6oeQKBgA9R\nWICBef00vnZ/d5ymoSig4ahtD04dZ3LaDMwnIY4PBH2EGE+xT2Tzci1HAMrEWHn2\no829LVAerA4dj6P4ct3GbbS+hhMhy08XLFqtGpKMtuX0UEQbIFNfWxbMPv6KY6e5\nMmBc4xSOTpQJl9xgzWGgGEcSgwdtPsj+7MHnjD5BAoGASERUI1Xlc9dob5Ssa19h\n9NHKlgiEziBbui0+RYuZUi0Hrxz5GaMEdzP0Mv4IKKVbuKPSnvvngacslEUSS3Cs\n7SGcUmyR7njRtT7Og+GxJ/iXZnOduI/93rEGnV/ogQkFqIM0kFf59DuVxajmWeCP\nckM/LTQXfsRm3hUMSaXn08c=\n-----END PRIVATE KEY-----\n",
  "client_email": "sahithyolsav@sahithyolsavapp.iam.gserviceaccount.com",
  "client_id": "107817301519974661970",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/sahithyolsav%40sahithyolsavapp.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';
  static const _spreadsheetId = '1nGYZ5VojmxhFSPaLMkKb69Y30UUymlevXFzmETagqcI';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;
  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'sahithyolsav');
      final firstRow = UserFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('init Error:$e');
    }
  }

  static Future<User?> getById(String id) async {
    if (_userSheet == null) return null;
    final json = await _userSheet!.values.rowByKey(id, fromColumn: 1);
    return json == null ? null : User.fromJson(json as Map<String, dynamic>);
  }

  static Future<int> getRowCount() async {
    if (_userSheet == null) return 0;
    final lastRow = await _userSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(rowList);
  }
}
