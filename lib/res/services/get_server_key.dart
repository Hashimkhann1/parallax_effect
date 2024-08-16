import 'package:googleapis_auth/auth_io.dart';

class GetServerKey {

  Future<String> getServerKeyToken() async {

    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "flutter-notification-dfa93",
          "private_key_id": "0a0338a77976fc386f23f0dc851d5c57e4a7dd14",
          "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCfNX7P6XAjyEYa\nyqOPD87/J8k9jpRTeyLJ9bXGq0x/nAMupl3qw0gnaV/tUSoy2Yti/XyVw6KjBE60\nruLfdwFdKrA1gt+qsNYidqdxXWSDmmhGsce21EiuJRIhb9mkbjYVpOL4/KUaBmBD\nNgZttgFnwfGPvCGAEG/oPNQGpY7HpL4gWjyAY6A5nEqzSGGI835LkOh+PkWobJyp\n4gvDlwnzeiXjHQH8x2/rldhcqcw9FuocLXqS1b6ZkDkdSn+r3Xc1XEeUQyhzZxG2\nI/9Z2HiNy5DVBSNq9xtTsml+g3mM70BI9BB2EeRS2za2KVbzINJyAF3p6F07bLkl\n1hL6Gi9DAgMBAAECggEAKAnaiewBhSYtJzi12FkX7Agz7lSojbQGZDb0T3Gt69uu\n2zEApnUU9MBl3PdP/vjBupPYHIvWH1wKdRsUODGj+KuvI831dOZC++jOJE7h48zV\nk43LFXoeixkMjbcky1riJCBS6l4TIU/gLpbsF/QxN0hJeSXNYPkBQ6zkf4VsOl2Y\nsGDQo48DUSlMfxU/GlsDkcLPHVHqlcaXy54PqTssIK3pjElZhca98nnsh9gpPzH8\nHmYB8GjFlseTw8VdOgMmGv80LZLK/VfPbs+4ipM/gclupqDP3rDf7ukN9hZNLys1\nvHY2qwvYesxSQe5oWmEFVQqlg0E+UaRNwNhIuEEulQKBgQDWL52KI9TErHAG3B2N\nEOvo8gDsuD/lOGO4RA8IJWiIcHN7i4tCNasCz0sn1mpG/5RRjL/0Wwohatsq1tZy\nDqwKoKLkVeZ3V0+K7MlQNNSiybxOWcmlwRFS2tqXb3balNx262pQbVo6H9sC8kAQ\nQ/aegsorEv37qnbbGH1l7cG3VQKBgQC+SkpApE7xaymdP28D2XC3fHVO6NMwnCEB\nYNUxL5el5i9xT6g2UgPBzGbpgF+z2RSqxiWoWiB360UgnR+AbsSl0u9gS75r+N/6\nTuCno0RXKskBwZhyD4/sxmW4ZZPABdY9+zHFi0izJMyiGs48vStfTuKIFXIYhLQM\nvZ/6KrScNwKBgEeUViPqYZrwvees/Ds+oniRF/oEgWYLeFgGdreUOOEQI6fwNLQF\n14by2/0OTSo5E8pFLYluO257lY81iSlI+fn7QTTp+EF97llRVN33KfDVVpcgrqE0\naqOz/EWLvL7D7QHZHwiN4w91we20I/DLpcnHj+ThTfwjNeF2x8GeuZSZAoGAUwkr\n+aU5ZZOzpxClKvLZgtfmgLaMYavfozBUF5CDBju5/CIcbwe+5/R/++iu2lYh9Jte\nl2YswOeDVMX7lxm+6fVvy3+B6q/BXQLKeZx/F+JtsDyAf1VXIqU4ggyhOqvRX16b\ny24KHVIzkZFM6ahKot5Tb7qb/SL7RowAoTO9eGUCgYAO0rV0PJH6Gec2FAk4C6fE\n4pYYk1FvfWwsCSW/Qtmka+7NBtCyUjBKW16+vQlwRXkJcWSlnUvNp4m3LSplFVI4\nAWzbBPIJGgu87c1SqCqtyufQvkLqt9Y9a1xk2qs+JhVTHI/sejoG97v0w8ljg9Gv\ndKqErga9O1gJLZD1u1I6Cg==\n-----END PRIVATE KEY-----\n",
          "client_email": "firebase-adminsdk-ks49t@flutter-notification-dfa93.iam.gserviceaccount.com",
          "client_id": "104965487646279954704",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-ks49t%40flutter-notification-dfa93.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }
        ),
        scopes);

    final accesserverKey = client.credentials.accessToken.data;

    return accesserverKey;

  }

}