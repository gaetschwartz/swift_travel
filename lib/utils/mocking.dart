import 'package:flutter/foundation.dart';

const mockRoute = kDebugMode
    ? {
        'count': 4,
        'min_duration': 13440,
        'rawtime': 13440,
        'max_duration': 14220,
        'maxtime': 14220,
        'connections': [
          {
            'from': 'Université de Genève, Genève, Rue du Général-Dufour 24',
            'departure': '2021-01-23 19:09:00',
            'dep_delay': '+0',
            'to': 'Zürich, Badenerstr. 549',
            'arrival': '2021-01-23 22:53:00',
            'duration': 13440,
            'disruptions': {
              'http://fahrplan.sbb.ch/bin/help.exe/en?tpl=showmap_external&messageID=1166030&mti=1&hMap=false#hfsShm':
                  {
                'id': '1166030',
                'header': 'Construction work: Lausanne - Genève-Aéroport',
                'lead': 'Between Lausanne and Genève-Aéroport, construction work is in progress.',
                'text':
                    'Between Lausanne and Genève-Aéroport, construction work is in progress.<br /><br /> You must expect changed travel times and changed connections.<br /><br /> Duration from 23.01.2021 05:00 until 25.01.2021 04:00.',
                'timerange': '01/23/2021 05:00 - 01/25/2021 04:00',
                'exact': false,
                'priority': 60
              },
              'http://fahrplan.sbb.ch/bin/help.exe/en?tpl=showmap_external&messageID=1160985&mti=1&hMap=false#hfsShm':
                  {
                'id': '1160985',
                'header':
                    'Bern: Restricted access to platform 12 from 2 November 2020 until 7 March 2021',
                'lead':
                    'Bern: Restricted access to platform 12 from 2 November 2020 until 7 March 2021',
                'text':
                    'Passengers travelling via platform 12 at Bern railway station will not have access to all entry and exit points on the platform until March 2021.<br />You can find more information at <a href=\"http://www.sbb.ch/bern\">www.sbb.ch/bern</a> .<br /><p>Further information:<br /> <a href=\"http://www.sbb.ch/bern\">Info Bern</a><br /> </p> ',
                'timerange': '11/02/2020 00:00 - 01/24/2021 23:59',
                'exact': false,
                'priority': 60
              }
            },
            'legs': [
              {
                'departure': '2021-01-23 19:09:00',
                'isaddress': true,
                'name': 'Université de Genève, Genève, Rue du Général-Dufour 24',
                'type': 'walk',
                'terminal': 'Genève, Plainpalais',
                'runningtime': 300,
                'exit': {
                  'arrival': '2021-01-23 19:14:00',
                  'stopid': '8587907',
                  'x': 500002,
                  'y': 117126,
                  'name': 'Genève, Plainpalais',
                  'sbb_name': 'Genève, Plainpalais',
                  'waittime': 0,
                  'lon': 6.143149,
                  'lat': 46.198163
                },
                'type_name': 'Walk'
              },
              {
                'arrival': '2021-01-23 19:14:00',
                'departure': '2021-01-23 19:14:00',
                'tripid': 'T2021_064274_000881_001_0b36172_0',
                'number': 'T 64274',
                'stopid': '8587907',
                'x': 500002,
                'y': 117126,
                'name': 'Genève, Plainpalais',
                'sbb_name': 'Genève, Plainpalais',
                'type': 'tram',
                'line': '15',
                'terminal': 'Genève, Cornavin',
                'waittime': 0,
                'fgcolor': 'fff',
                'bgcolor': '996633',
                '*G': 'T',
                '*L': '15',
                'operator': 'TPG',
                'stops': [
                  {
                    'arrival': '2021-01-23 19:15:00',
                    'departure': '2021-01-23 19:15:00',
                    'dep_delay': '+0',
                    'name': 'Genève, Cirque',
                    'stopid': '8592804',
                    'x': 499800,
                    'y': 117408,
                    'lon': 6.140472,
                    'lat': 46.200669
                  },
                  {
                    'arrival': '2021-01-23 19:17:00',
                    'departure': '2021-01-23 19:17:00',
                    'dep_delay': '+0',
                    'name': 'Genève, Stand',
                    'stopid': '8592906',
                    'x': 499759,
                    'y': 117746,
                    'lon': 6.139869,
                    'lat': 46.203703
                  },
                  {
                    'arrival': '2021-01-23 19:19:00',
                    'departure': '2021-01-23 19:19:00',
                    'dep_delay': '+0',
                    'name': 'Genève, Goulart',
                    'stopid': '8592831',
                    'x': 499887,
                    'y': 118172,
                    'lon': 6.141436,
                    'lat': 46.207554
                  }
                ],
                'runningtime': 480,
                'exit': {
                  'arrival': '2021-01-23 19:22:00',
                  'stopid': '8587057',
                  'x': 499967,
                  'y': 118415,
                  'name': 'Genève, Cornavin',
                  'sbb_name': 'Genève, Cornavin',
                  'waittime': 0,
                  'arr_delay': '+0',
                  'lon': 6.14242,
                  'lat': 46.209751
                },
                'dep_delay': '+0',
                'type_name': 'Tram',
                'lon': 6.143149,
                'lat': 46.198163
              },
              {
                'arrival': '2021-01-23 19:22:00',
                'departure': '2021-01-23 19:22:00',
                'stopid': '8587057',
                'x': 499967,
                'y': 118415,
                'name': 'Genève, Cornavin',
                'sbb_name': 'Genève, Cornavin',
                'waittime': 0,
                'normal_time': 300,
                'stops': null,
                'runningtime': 300,
                'exit': {
                  'arrival': '2021-01-23 19:27:00',
                  'stopid': '8501008',
                  'x': 499969,
                  'y': 118468,
                  'name': 'Genève',
                  'sbb_name': 'Genève',
                  'waittime': 120,
                  'lon': 6.142435,
                  'lat': 46.210228
                },
                'type': 'walk',
                'type_name': 'Walk',
                'lon': 6.14242,
                'lat': 46.209751
              },
              {
                'arrival': '2021-01-23 19:27:00',
                'departure': '2021-01-23 19:29:00',
                'tripid': 'T2021_001735_000011_101_067915b_0',
                'number': 'IR 1735',
                'stopid': '8501008',
                'x': 499969,
                'y': 118468,
                'name': 'Genève',
                'sbb_name': 'Genève',
                'type': 'express_train',
                'line': 'IR 90',
                'terminal': 'Brig',
                'waittime': 120,
                'fgcolor': 'fff',
                'bgcolor': 'f00',
                '*G': 'IR',
                '*L': '90',
                'operator': 'SBB',
                'stops': [
                  {
                    'arrival': '2021-01-23 19:43:00',
                    'departure': '2021-01-23 19:44:00',
                    'dep_delay': '+1',
                    'name': 'Nyon',
                    'stopid': '8501030',
                    'x': 507483,
                    'y': 137716,
                    'lon': 6.235963,
                    'lat': 46.38443
                  },
                  {
                    'arrival': '2021-01-23 19:59:00',
                    'departure': '2021-01-23 20:00:00',
                    'dep_delay': '+1',
                    'name': 'Morges',
                    'stopid': '8501037',
                    'x': 527498,
                    'y': 151526,
                    'lon': 6.493958,
                    'lat': 46.511111
                  }
                ],
                'runningtime': 2580,
                'exit': {
                  'arrival': '2021-01-23 20:12:00',
                  'stopid': '8501120',
                  'x': 537875,
                  'y': 152042,
                  'name': 'Lausanne',
                  'sbb_name': 'Lausanne',
                  'waittime': 480,
                  'track': '4',
                  'arr_delay': '+0',
                  'lon': 6.629087,
                  'lat': 46.516795
                },
                'dep_delay': '+0',
                'track': '3',
                'attributes': {
                  '1_1.1_OM': 'Masks mandatory for travellers aged 12 and over',
                  '1_4.7_FS': 'Free Internet with the SBB FreeSurf app'
                },
                'disruptions': {
                  'http://fahrplan.sbb.ch/bin/help.exe/en?tpl=showmap_external&messageID=1166030&mti=1&hMap=false#hfsShm':
                      {
                    'id': '1166030',
                    'header': 'Construction work: Lausanne - Genève-Aéroport',
                    'lead':
                        'Between Lausanne and Genève-Aéroport, construction work is in progress.',
                    'text':
                        'Between Lausanne and Genève-Aéroport, construction work is in progress.<br /><br /> You must expect changed travel times and changed connections.<br /><br /> Duration from 23.01.2021 05:00 until 25.01.2021 04:00.',
                    'timerange': '01/23/2021 05:00 - 01/25/2021 04:00',
                    'exact': false,
                    'priority': 60
                  }
                },
                'type_name': 'Railway',
                'lon': 6.142435,
                'lat': 46.210228
              },
              {
                'arrival': '2021-01-23 20:12:00',
                'departure': '2021-01-23 20:20:00',
                'tripid': 'T2021_000735_000011_106_d82b198_0',
                'number': 'IC 735',
                'stopid': '8501120',
                'x': 537875,
                'y': 152042,
                'name': 'Lausanne',
                'sbb_name': 'Lausanne',
                'type': 'express_train',
                'line': 'IC 1',
                'terminal': 'St. Gallen',
                'waittime': 480,
                'normal_time': 300,
                'fgcolor': 'fff',
                'bgcolor': 'f00',
                '*G': 'IC',
                '*L': '1',
                'operator': 'SBB',
                'stops': [
                  {
                    'arrival': '2021-01-23 21:03:00',
                    'departure': '2021-01-23 21:04:00',
                    'name': 'Fribourg/Freiburg',
                    'stopid': '8504100',
                    'x': 578047,
                    'y': 183595,
                    'lon': 7.151052,
                    'lat': 46.803151
                  },
                  {
                    'arrival': '2021-01-23 21:26:00',
                    'departure': '2021-01-23 21:31:00',
                    'name': 'Bern',
                    'stopid': '8507000',
                    'x': 600038,
                    'y': 199750,
                    'lon': 7.439136,
                    'lat': 46.948832
                  },
                  {
                    'name': 'Bahn-2000-Strecke',
                    'stopid': '0000132',
                    'x': 619000,
                    'y': 227300,
                    'lon': 7.689367,
                    'lat': 47.196371
                  }
                ],
                'runningtime': 7680,
                'exit': {
                  'arrival': '2021-01-23 22:28:00',
                  'stopid': '8503000',
                  'x': 683212,
                  'y': 248030,
                  'name': 'Zürich HB',
                  'sbb_name': 'Zürich HB',
                  'waittime': 0,
                  'track': '33',
                  'lon': 8.540502,
                  'lat': 47.377847
                },
                'track': '1',
                'attributes': {
                  '0_1.4_WR': 'Restaurant',
                  '0_4.8_RZ': 'Quiet zone in 1st class',
                  '0_8.1_R': 'Reservation possible',
                  '1_1.1_OM': 'Masks mandatory for travellers aged 12 and over',
                  '1_4.6_FA': 'Family Coach with play area',
                  '1_4.7_BZ': 'Business zone in 1st class',
                  '1_4.7_FS': 'Free Internet with the SBB FreeSurf app'
                },
                'disruptions': {
                  'http://fahrplan.sbb.ch/bin/help.exe/en?tpl=showmap_external&messageID=1160985&mti=1&hMap=false#hfsShm':
                      {
                    'id': '1160985',
                    'header':
                        'Bern: Restricted access to platform 12 from 2 November 2020 until 7 March 2021',
                    'lead':
                        'Bern: Restricted access to platform 12 from 2 November 2020 until 7 March 2021',
                    'text':
                        'Passengers travelling via platform 12 at Bern railway station will not have access to all entry and exit points on the platform until March 2021.<br />You can find more information at <a href=\"http://www.sbb.ch/bern\">www.sbb.ch/bern</a> .<br /><p>Further information:<br /> <a href=\"http://www.sbb.ch/bern\">Info Bern</a><br /> </p> ',
                    'timerange': '11/02/2020 00:00 - 01/24/2021 23:59',
                    'exact': false,
                    'priority': 60
                  }
                },
                'type_name': 'Railway',
                'lon': 6.629087,
                'lat': 46.516795
              },
              {
                'arrival': '2021-01-23 22:28:00',
                'departure': '2021-01-23 22:28:00',
                'stopid': '8503000',
                'x': 683212,
                'y': 248030,
                'name': 'Zürich HB',
                'sbb_name': 'Zürich HB',
                'waittime': 0,
                'normal_time': 420,
                'stops': null,
                'runningtime': 420,
                'exit': {
                  'arrival': '2021-01-23 22:35:00',
                  'stopid': '8587348',
                  'x': 683125,
                  'y': 247961,
                  'name': 'Zürich, Bahnhofplatz/HB',
                  'sbb_name': 'Zürich, Bahnhofplatz/HB',
                  'waittime': 0,
                  'lon': 8.539337,
                  'lat': 47.377237
                },
                'type': 'walk',
                'type_name': 'Walk',
                'lon': 8.540502,
                'lat': 47.377847
              },
              {
                'arrival': '2021-01-23 22:35:00',
                'departure': '2021-01-23 22:35:00',
                'tripid': 'T2021_007169_003849_004_e82e9a9_0',
                'number': 'T 7169',
                'stopid': '8587348',
                'x': 683125,
                'y': 247961,
                'name': 'Zürich, Bahnhofplatz/HB',
                'sbb_name': 'Zürich, Bahnhofplatz/HB',
                'type': 'tram',
                'line': '14',
                'terminal': 'Zürich, Triemli',
                'waittime': 0,
                'fgcolor': 'fff',
                'bgcolor': '008dc5',
                '*G': 'T',
                '*L': '14',
                'operator': 'VBZ    F',
                'stops': [
                  {
                    'arrival': '2021-01-23 22:36:00',
                    'departure': '2021-01-23 22:36:00',
                    'name': 'Zürich, Löwenplatz',
                    'stopid': '8591262',
                    'x': 682982,
                    'y': 247809,
                    'lon': 8.537416,
                    'lat': 47.375888
                  },
                  {
                    'arrival': '2021-01-23 22:38:00',
                    'departure': '2021-01-23 22:38:00',
                    'name': 'Zürich, Sihlpost/HB',
                    'stopid': '8591367',
                    'x': 682739,
                    'y': 247828,
                    'lon': 8.534202,
                    'lat': 47.37609
                  }
                ],
                'runningtime': 300,
                'exit': {
                  'arrival': '2021-01-23 22:40:00',
                  'stopid': '8591381',
                  'x': 682369,
                  'y': 247526,
                  'name': 'Zürich, Stauffacher',
                  'sbb_name': 'Zürich, Stauffacher',
                  'waittime': 120,
                  'lon': 8.529248,
                  'lat': 47.37342
                },
                'attributes': {
                  '1_0_NF': 'Low-floor access',
                  '1_1.1_OM': 'Masks mandatory for travellers aged 12 and over'
                },
                'type_name': 'Tram',
                'lon': 8.539337,
                'lat': 47.377237
              },
              {
                'arrival': '2021-01-23 22:40:00',
                'departure': '2021-01-23 22:42:00',
                'tripid': 'T2021_009301_003849_003_72148b9_0',
                'number': 'T 9301',
                'stopid': '8591381',
                'x': 682369,
                'y': 247526,
                'name': 'Zürich, Stauffacher',
                'sbb_name': 'Zürich, Stauffacher',
                'type': 'tram',
                'line': '2',
                'terminal': 'Schlieren, Geissweid',
                'waittime': 120,
                'normal_time': 60,
                'fgcolor': 'fff',
                'bgcolor': 'e20a16',
                '*G': 'T',
                '*L': '2',
                'operator': 'VBZ    F',
                'stops': [
                  {
                    'arrival': '2021-01-23 22:43:00',
                    'departure': '2021-01-23 22:43:00',
                    'name': 'Zürich, Bezirksgebäude',
                    'stopid': '8591079',
                    'x': 682089,
                    'y': 247605,
                    'lon': 8.525555,
                    'lat': 47.374165
                  },
                  {
                    'arrival': '2021-01-23 22:44:00',
                    'departure': '2021-01-23 22:44:00',
                    'name': 'Zürich, Kalkbreite/Bahnhof.Wiedikon',
                    'stopid': '8591218',
                    'x': 681770,
                    'y': 247629,
                    'lon': 8.521337,
                    'lat': 47.374421
                  },
                  {
                    'arrival': '2021-01-23 22:46:00',
                    'departure': '2021-01-23 22:46:00',
                    'name': 'Zürich, Lochergut',
                    'stopid': '8591259',
                    'x': 681480,
                    'y': 247735,
                    'lon': 8.517517,
                    'lat': 47.37541
                  },
                  {
                    'arrival': '2021-01-23 22:47:00',
                    'departure': '2021-01-23 22:47:00',
                    'name': 'Zürich, Zypressenstrasse',
                    'stopid': '8591448',
                    'x': 681195,
                    'y': 247873,
                    'lon': 8.513768,
                    'lat': 47.376686
                  },
                  {
                    'arrival': '2021-01-23 22:48:00',
                    'departure': '2021-01-23 22:48:00',
                    'name': 'Zürich, Albisriederplatz',
                    'stopid': '8591038',
                    'x': 680938,
                    'y': 248039,
                    'lon': 8.510396,
                    'lat': 47.378211
                  },
                  {
                    'arrival': '2021-01-23 22:50:00',
                    'departure': '2021-01-23 22:50:00',
                    'name': 'Zürich, Letzigrund',
                    'stopid': '8591252',
                    'x': 680430,
                    'y': 248368,
                    'lon': 8.503729,
                    'lat': 47.381232
                  }
                ],
                'runningtime': 540,
                'exit': {
                  'arrival': '2021-01-23 22:51:00',
                  'stopid': '8591138',
                  'x': 680098,
                  'y': 248585,
                  'name': 'Zürich, Freihofstrasse',
                  'sbb_name': 'Zürich, Freihofstrasse',
                  'lon': 8.499372,
                  'lat': 47.383224
                },
                'attributes': {
                  '1_0_NF': 'Low-floor access',
                  '1_1.1_OM': 'Masks mandatory for travellers aged 12 and over'
                },
                'type_name': 'Tram',
                'lon': 8.529248,
                'lat': 47.37342
              },
              {
                'arrival': '2021-01-23 22:51:00',
                'stopid': '8591138',
                'x': 680098,
                'y': 248585,
                'name': 'Zürich, Freihofstrasse',
                'sbb_name': 'Zürich, Freihofstrasse',
                'normal_time': 0,
                'stops': null,
                'type': 'walk',
                'departure': '2021-01-23 22:51:00',
                'runningtime': 120,
                'exit': {
                  'arrival': '2021-01-23 22:53:00',
                  'isaddress': true,
                  'name': 'Zürich, Badenerstr. 549'
                },
                'type_name': 'Walk',
                'lon': 8.499372,
                'lat': 47.383224
              },
              {
                'arrival': '2021-01-23 22:53:00',
                'isaddress': true,
                'name': 'Zürich, Badenerstr. 549'
              }
            ]
          },
          {},
          {},
          {}
        ],
        'url':
            'https://timetable.search.ch/Universit%C3%A9-de-Gen%C3%A8ve,Gen%C3%A8ve,Rue-du-G%C3%A9n%C3%A9ral-Dufour-24..Z%C3%BCrich,Badenerstr.549?time=19.6&date=1%2F23%2F2021',
        'points': [
          {
            'text': 'Genève, Rue du Général-Dufour 24',
            'url': 'https://map.search.ch/Gen%C3%A8ve,Rue-du-G%C3%A9n%C3%A9ral-Dufour-24'
          },
          {
            'text': 'Zürich, Badenerstr. 549',
            'url': 'https://map.search.ch/Z%C3%BCrich,Badenerstr.549'
          }
        ],
        'description':
            'From Université de Genève, Genève, Rue du Général-Dufour 24 to Zürich, Badenerstr. 549 on Saturday 01/23/2021',
        'request': 'route',
        'eof': 1
      }
    : null;
