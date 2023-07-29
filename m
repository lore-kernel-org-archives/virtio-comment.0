Return-Path: <virtio-comment-return-6915-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40472C001DC
	for <virtio-comment@archiver.kernel.org>; Sat, 29 Jul 2023 23:29:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A190155C9
	for <virtio-comment@archiver.kernel.org>; Sat, 29 Jul 2023 23:29:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 99974986853
	for <virtio-comment@archiver.kernel.org>; Sat, 29 Jul 2023 23:29:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 915169840BC; Sat, 29 Jul 2023 23:29:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 818BE98680A
	for <virtio-comment@lists.oasis-open.org>; Sat, 29 Jul 2023 23:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+amSvdFS0oJ44cXigiztbUtCBfxKZast1uq2jRaVrnftqMN7GXbhvqCNWWw8OTDlebDvossshyre3cQ5B4Sle6YA2FcbbbHucT1iZ3bxBf6Qyzhyq04PtknMqjkScixBUNmgepLVLGvwOCiK9JA/nXDKq8/5xPL5rzDcFVHha8JVr8c53MOoiKEYrYO7pbyxyMgNloBVlf1xW/+mmbX2icrXhm72klDJ8/fqelFLv7MJApr6KIvuMbBz2G3k6KzSRXu9duUwT4Y01d0IfhelnPYwvCyI8AYFJx10ibRPoTWjvPFD6MagdfvsyHt55+S9kFcFYrT7ridqa8z/UG0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3k5PnyB0GVEq3o8nn65I1UXhQDgYX6IGkjytNRfxcqs=;
 b=GJLyu8A65+3JmdnzJQTrx9wOdn/QiqG/YT+IotlBTFkcWqS8lT3M6+vOJHxK+fnrDWIGPJ0n2TlV9aChG7QwXaQUULCwUob3Y+b+UP2sZqUNrumWT/mkU4z315fRu+uVpEssZwJuR4lcFPsJ5ng0I12efzdXsLewwY3umuIf1pelrcxS2FXr23kqlIYbwYaYfJEHC0THQyApgzo5KVX0MulBQi5m9jIAx0u1d/1fZx3Mi/35fomy4Eg8GtSO+QnyDswABk80IjNvVrYcCoEvOrJyuVYg7eXLXkV7LqFk+5b6cu3dAEq7ul6RzwyYAmPq3VtSfH2JxqpUI4H7t7KrnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: zhenwei pi <pizhenwei@bytedance.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>,
        "parav@nvidia.com"
	<parav@nvidia.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang
	<jasowang@redhat.com>,
        "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>,
        "houp@yusur.tech" <houp@yusur.tech>,
        "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
        "zhouhuaping.san@bytedance.com" <zhouhuaping.san@bytedance.com>,
        "xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
Thread-Topic: [virtio-comment] [PATCH v4 5/7] transport-fabrics: introduce
 transport binding
Thread-Index: AQHZwnRuKjHggLJ2rkiBulkcP8tKpg==
Date: Sat, 29 Jul 2023 23:28:51 +0000
Message-ID: <14BFE93D-0888-42E4-AF6C-389008E83E0A@nutanix.com>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <20230626072551.1709389-6-pizhenwei@bytedance.com>
In-Reply-To: <20230626072551.1709389-6-pizhenwei@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|SJ0PR02MB7280:EE_
x-ms-office365-filtering-correlation-id: d8466c86-ecfb-410e-a0f2-08db908b915b
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 K1fZrPFHzaqX5zoCmED+sAQxYvDn9453ux5yT4Ge7zeJwknfx2gE1pl5smTJ5QfOrNvu4ppzNDWHkNpABZ/T6/7XClpcvlSvFyT6URzvG+15caFaL+ClmSJAzA2MjJCWFZaAEzU0VkAbzhz9W37pAPnhi4H+M9szQumR/8aG8XairwQK58YThVZ3vBXbSH6nHXQEDdyo0O5gEbkaLE0j40OKDUi7ssSVoxRDIouZcQYeOi6itg62TgsNiEtIdjlUMdldBRN7Q8IsTMU47kUJ4uJcpRb6ZAVvAf0tyGexD8myGmiIyyvAIvXWJt4pxLZZowXI5xcQMkOsS8p8XV40lAVUlHNSIiBEz9fzeIhrkawPafT0Xxg+V9s7t/l5c1U+O+xUySP2dCaMLM02b6ZklrEsYEa3vNYIcIv8SK/o8jP4xoVf64JhID6X9ITPbtPU0Wfaul+ok5+gouBBnRAfVEfDA4MDp/vzOsMwvDBAaoz8GtuHt7WuDulZjaAIlK8S04ton5VfeuixlfJ5Kbdp5mGoFJE9ludUsvVLp4wu8vPiSXY+yfmBQJo7fn5G65SI/+2WMN0ZuYMmer7KILNIee/qsvgPhXJd/DS5wBZK5yEn/awJutXIF/KaBYXihld1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR02MB7938.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(66899021)(316002)(2906002)(8676002)(8936002)(7416002)(5660300002)(38070700005)(41300700001)(44832011)(33656002)(36756003)(86362001)(6486002)(71200400001)(122000001)(54906003)(966005)(6506007)(478600001)(26005)(53546011)(186003)(76116006)(66946007)(66556008)(83380400001)(38100700002)(6512007)(66476007)(64756008)(66446008)(4326008)(2616005)(6916009)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?clp1cmZueEJpcFhMZ1BzWFNLcVR2MzdOU0dmd2xuVnpSRzlCQjg0bmdtU3ZJ?=
 =?utf-8?B?VU82a05tbFZJZVRGYXVjR3ZpTmx1bGk4cG5DZ0NsaVp1TURGUFg1K0tKM3B3?=
 =?utf-8?B?K2xPNU05cFFLTUxWQm5UQzRTbjkrM2ZVWmlQMXF5UmRJS1cvSUU0TG5JMzU2?=
 =?utf-8?B?WDhUMEFPclI1Nm10Ky9FZjc1VmxsdFRDcUhVRElqV0hsM1ZaTFp5aUV3Z1h4?=
 =?utf-8?B?WEZibWxQU1RSS0tQSDNvM21GbXdQVGxGL2JnQytXUWNKdWQ5UVhUREthSXlu?=
 =?utf-8?B?WEhrSTcxQWlOUzRrOEx2c0QveVRrdE1FYjREN2NKbks0MUpYY3lWWDYvVnZC?=
 =?utf-8?B?KzB4cTE3bEZibm4zdkRXNGhCQ2dDMXk4clpWR0pBNjJIMGdDVjF1Yy91WTAw?=
 =?utf-8?B?ckdKcEljLzRUdlN6TmhXM0tLdFZ4UU1HZlNQRU5ta3hZZURFbVB6TFBKdklQ?=
 =?utf-8?B?TEdRSWExaE5QMUZiVHhnMVhRTWVTWmtrb2NaMnJrNWg3WU1Ea0pTVzdMY1dL?=
 =?utf-8?B?UktkK3c4U0cwU2hnMUd0cDZWUGJQTnMyS2d2RFFDYXZINUlYTlNWL3RDVXhT?=
 =?utf-8?B?QllKNFM4dm9UbHJ0S2pyOGFaRUJKVFFQNCtVUEdqTmpHdk5DZ0duSU94UVFP?=
 =?utf-8?B?YTE5cUZaY2J6WG9temdReE1JY3NERUxkVXArdk85M25pSkxBQnNKczc1bm1m?=
 =?utf-8?B?SHpuNlhRYVlVelVlY0o3SjR4ZGRETzVBOEpsSTdWTThpWUxWd0FRYTh5UVQ4?=
 =?utf-8?B?WDF5aTFFWStUSXdZTkd0U0FUei9xVk5BYzIvaFh3Q2o0WGhNTzJ6RjVQeUF0?=
 =?utf-8?B?N0xCOGV5bWpzM05wd0hacVY2NEpMalFwdWcwNkxDZTVDNXRvOEcrM242RXdF?=
 =?utf-8?B?RDBuSyt4TysxSWF6b1VJdkVxWVBobTRTUHpmR0FyYnhoZVFkc2hPRDE4Yzlk?=
 =?utf-8?B?Znp3M2pDRCsxM0JlZExKS2RRWjMxMUlTNjJMZHFhbFRjMTVOQm03eTlUalZB?=
 =?utf-8?B?MGlFMlNxTDFzNHNSWVF2YndJMFpkVmVSWGFyRXFwN3JZeG9leEFkOXlOTmZK?=
 =?utf-8?B?SnhEYktwVkNOK1Z2VmJmY2dzK01nMU9wTXJXanNwaHU2SXpsZmtUS1QvY0lV?=
 =?utf-8?B?akVkaVUzcXlBeThsdFhiaStHWE5UMTVxVzZDaDNaY2Q2WkovUjVXSCsra1dV?=
 =?utf-8?B?SEE3TWVxd0VlSjZxZE1PUXcwMFF6cnpDTDRtcHdJZlZZaFMydk5ERFJVRWZw?=
 =?utf-8?B?RTZCQmFvUWZIUDZUa2FJQVpDQ2RUaCtjdVNjbUNUN0Q0ZmpTdXF5cnVtK0FU?=
 =?utf-8?B?Lzc2Z2ppYzNwcWJXZktXYTVLZldDNTl2dUFMRGdBSmRDdTVkRlZkRDBnZm9K?=
 =?utf-8?B?N1NaWVFrUTIrOHlpT1VUNEtGQ2wwbWRONXpIek93MnVTand5N1c5NUhwdlV1?=
 =?utf-8?B?M01OeVl0cE5XYUdMdGdCSUlNSUNVR0NoSWNzTGozaXZQU29oenRWa0ZiMkdx?=
 =?utf-8?B?ZGhvMXJLUjBPUGVwUFAwY0ltZXZkaE5PS2RiME9YYytRcDNVeE8rdDR1c3BP?=
 =?utf-8?B?cWpMRzdPWjFVZWVRdG5GNllqbUxqakZjN3VVeUNVcnBHZVU2RVo4NlNmTS9h?=
 =?utf-8?B?REUvMWphZk03SU1Ja2NoUS9EenZUeE05UWQvMFhiQ2tkWkl4V0FueGV5b0xy?=
 =?utf-8?B?bEZvMkZkbWs1SHhRYzZnWVFhZTdncjVSdVRHaCt1TE5FVTJTdm1IanViZEQy?=
 =?utf-8?B?eFZtWk5rY1pFcmErc3pGZWRQbEtMa2JwYmJWMG94ZmZReUxTZERTN2VOQXRq?=
 =?utf-8?B?NmdWekFpZ2hZa1BIN3BSMlp1ZGNWeVhqWkdzenY1ejc4WnBWOUcwMDVyRWZp?=
 =?utf-8?B?Q2Y4NWhKenk0OTZXQTJSTFNmN0lsL1FqRUhQMEdKeDZndU9mUnV5VkczRzZM?=
 =?utf-8?B?dSs0SU9rUEM0bEtpdzZ6UVhnU3FaZG12WlRyKy9EbTA4dzdET0RzSW1KU3BN?=
 =?utf-8?B?bnVlZU1La1RuOFMxRnBMUGtjZkdYU3hiRmtRa3ZQVVB2K3B3d1JJRFEyQUJ4?=
 =?utf-8?B?Z1NvdkNSZXlXVDhYYUgxeW9oYkczT1pvenVQdnM4Q1BnZkRzMzBmLzlrNEp5?=
 =?utf-8?B?QTI0dWhRbjd4UTlyUjNqVC9EdHV5RGcxbWFNSEgzMm5hMTd0ZjlyWHhGakpt?=
 =?utf-8?B?aWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D269BA6F28CBAE4F9A445E12B03A5267@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8466c86-ecfb-410e-a0f2-08db908b915b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2023 23:28:51.6241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3RIUQXzVt8mBO/2LTmj3vNcrZ8K1U0w3HEk3hMCAKk8upiukn1vcpe6pYnK88DpIli2AkRP4ucmxxOuTJET2+23wsK5GIWAMDaR+B8amDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7280
X-Proofpoint-GUID: e3bVhscrS9D3JwWh1V1nvuuNTRCQKKgf
X-Proofpoint-ORIG-GUID: e3bVhscrS9D3JwWh1V1nvuuNTRCQKKgf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Reason: safe
Subject: Re: [virtio-comment] [PATCH v4 5/7] transport-fabrics: introduce
 transport binding

DQoNCj4gT24gSnVuIDI2LCAyMDIzLCBhdCAzOjI1IEFNLCB6aGVud2VpIHBpIDxwaXpoZW53ZWlA
Ynl0ZWRhbmNlLmNvbT4gd3JvdGU6DQo+IA0KPiBBZGQgVENQL0lQLCBUTFMgVENQL0lQLCBSRE1B
IHRyYW5zcG9ydHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiB6aGVud2VpIHBpIDxwaXpoZW53ZWlA
Ynl0ZWRhbmNlLmNvbT4NCj4gLS0tDQo+IHRyYW5zcG9ydC1mYWJyaWNzLnRleCB8IDI2ICsrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+IDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvdHJhbnNwb3J0LWZhYnJpY3MudGV4IGIvdHJhbnNwb3J0LWZh
YnJpY3MudGV4DQo+IGluZGV4IDNmZDllOGUuLjc1ZTQ4NTUgMTAwNjQ0DQo+IC0tLSBhL3RyYW5z
cG9ydC1mYWJyaWNzLnRleA0KPiArKysgYi90cmFuc3BvcnQtZmFicmljcy50ZXgNCj4gQEAgLTcy
OSwzICs3MjksMjkgQEAgXHN1YnN1YnNlY3Rpb257T3Bjb2Rlc31cbGFiZWx7c2VjOlZpcnRpbyBU
cmFuc3BvcnQgT3B0aW9ucyAvIFZpcnRpbyBPdmVyIEZhYnJpY3MNCj4gXHBhcmFncmFwaHtLZWVw
YWxpdmUgQ29tcGxldGlvbn1cbGFiZWx7c2VjOlZpcnRpbyBUcmFuc3BvcnQgT3B0aW9ucyAvIFZp
cnRpbyBPdmVyIEZhYnJpY3MgLyBDb21tYW5kcyBEZWZpbml0aW9uIC8gT3Bjb2RlcyAvIEtlZXBh
bGl2ZSBDb21wbGV0aW9ufQ0KPiBBIEtlZXBhbGl2ZSBDb21wbGV0aW9uIGlzIHVzZWQgYXMgYSBo
ZWFsdGggY2hlY2sgbWVjaGFuaXNtIHRvIGRldGVjdCB3aGVuIGEgVmlydGlvLW9GIGluaXRpYXRv
ciBiZWNvbWVzIHVuYXZhaWxhYmxlLCBpdCBpcyB1c2VkIGJ5IGEgVmlydGlvLW9GIGRldmljZSBp
bnN0YW5jZSBmb3IgdGhlIFZpcnRpby1vRiBjb250cm9sIHF1ZXVlIG9ubHkuDQo+IE9uY2UgdGhl
IFZpcnRpby1vRiBpbml0aWF0b3IgYmVjb21lcyB1bmF2YWlsYWJsZSwgdGhlIFZpcnRpby1vRiB0
YXJnZXQgc2hvdWxkIGRlc3Ryb3kgdGhlIFZpcnRpby1vRiBkZXZpY2UgaW5zdGFuY2UgYW5kIGFz
c29jaWF0ZWQgcmVzb3VyY2VzLg0KPiArDQo+ICsNCj4gK1xzdWJzZWN0aW9ue1RyYW5zcG9ydCBC
aW5kaW5nfVxsYWJlbHtzZWM6VmlydGlvIFRyYW5zcG9ydCBPcHRpb25zIC8gVmlydGlvIE92ZXIg
RmFicmljcyAvIFRyYW5zcG9ydCBCaW5kaW5nfQ0KPiArDQo+ICtcc3Vic3Vic2VjdGlvbntUQ1Av
SVB9XGxhYmVse3NlYzpWaXJ0aW8gVHJhbnNwb3J0IE9wdGlvbnMgLyBWaXJ0aW8gT3ZlciBGYWJy
aWNzIC8gVHJhbnNwb3J0IEJpbmRpbmcgLyBUQ1AgSVB9DQo+ICtWaXJ0aW8tb0Ygc3VwcG9ydHMg
Ym90aCBUQ1AvSVB2NCBhbmQgVENQL0lQdjYsIGl0IHVzZXMNCj4gK1xuYW1lcmVme3NlYzpWaXJ0
aW8gVHJhbnNwb3J0IE9wdGlvbnMgLyBWaXJ0aW8gT3ZlciBGYWJyaWNzIC8gUHJvdG9jb2wgRGF0
YSBVbml0LyBTdHJlYW0gRGF0YSBUcmFuc2ZlcnN9Lg0KPiArQSBUQ1AvSVAgYmFzZWQgVmlydGlv
LW9GIHRhcmdldCB1c2VzIHBvcnQgODU0OSAoQ1JDLTE2L0FSQyBvZiAiVmlydGlvIikgYnkgZGVm
YXVsdC4NCj4gKw0KPiArXHN1YnN1YnNlY3Rpb257VExTIFRDUC9JUH1cbGFiZWx7c2VjOlZpcnRp
byBUcmFuc3BvcnQgT3B0aW9ucyAvIFZpcnRpbyBPdmVyIEZhYnJpY3MgLyBUcmFuc3BvcnQgQmlu
ZGluZyAvIFRMUyBUQ1AgSVB9DQo+ICtWaXJ0aW8tb0Ygc3VwcG9ydHMgYm90aCBUTFMgdjEuMiBh
bmQgVExTIHYxLjMgb3ZlciB0aGUgdW5kZXJseWluZyBUQ1AvSVB2NCBhbmQgVENQL0lQdjYsIGl0
IHVzZXMNCj4gK1xuYW1lcmVme3NlYzpWaXJ0aW8gVHJhbnNwb3J0IE9wdGlvbnMgLyBWaXJ0aW8g
T3ZlciBGYWJyaWNzIC8gUHJvdG9jb2wgRGF0YSBVbml0LyBTdHJlYW0gRGF0YSBUcmFuc2ZlcnN9
Lg0KPiArQSBUTFMgVENQL0lQIGJhc2VkIFZpcnRpby1vRiB0YXJnZXQgdXNlcyBwb3J0IDg1NDkg
KENSQy0xNi9BUkMgb2YgIlZpcnRpbyIpIGJ5IGRlZmF1bHQuDQo+ICsNCj4gK1xzdWJzdWJzZWN0
aW9ue1JETUF9XGxhYmVse3NlYzpWaXJ0aW8gVHJhbnNwb3J0IE9wdGlvbnMgLyBWaXJ0aW8gT3Zl
ciBGYWJyaWNzIC8gVHJhbnNwb3J0IEJpbmRpbmcgLyBSRE1BfQ0KPiArVmlydGlvLW9GIHN1cHBv
cnRzIFJETUEsIGl0IHVzZXMNCj4gK1xuYW1lcmVme3NlYzpWaXJ0aW8gVHJhbnNwb3J0IE9wdGlv
bnMgLyBWaXJ0aW8gT3ZlciBGYWJyaWNzIC8gUHJvdG9jb2wgRGF0YSBVbml0LyBLZXllZCBEYXRh
IFRyYW5zZmVyc30uDQo+ICtBIFJvQ0V2MiBiYXNlZCBWaXJ0aW8tb0YgdGFyZ2V0IHVzZXMgVURQ
IHBvcnQgODU0OSAoQ1JDLTE2L0FSQyBvZiAiVmlydGlvIikgYnkgZGVmYXVsdCwgYW5kIGEgaVdB
UlAgYmFzZWQgVmlydGlvLW9GIHRhcmdldCB1c2VzIFRDUCBwb3J0IDg1NDkgYnkgZGVmYXVsdC4N
Cj4gKw0KPiArUkRNQSB1c2VzIHRoZSBmb2xsb3dpbmcgb3BlcmF0aW9uczoNCj4gK1xiZWdpbntp
dGVtaXplfQ0KPiArXGl0ZW0gVGhlIFZpcnRpby1vRiBpbml0aWF0b3Igc2VuZHMgYSBQRFUgYnkg
UkRNQSBTRU5ELg0KDQpXaGF0IGFib3V0IHdpdGgg4oCcZWFnZXIgYnVmZmVyc+KAnT8gSXQgcHJv
YmFibHkgdXNlcyBSRE1BIHdyaXRlIGZvciB0aG9zZT8NCg0KPiArXGl0ZW0gVGhlIFZpcnRpby1v
RiB0YXJnZXQgcmVhZHMgdGhlIHJlbW90ZSBkYXRhIGJ5IFJETUEgU0VORC4NCg0KSSBhc3N1bWUg
eW91IG1lYW50IHRoZSB0YXJnZXQgcmVhZHMgd2l0aCBSRE1BIHJlYWQ/DQoNCj4gK1xpdGVtIFRo
ZSBWaXJ0aW8tb0YgdGFyZ2V0IHdyaXRlcyB0aGUgcmVtb3RlIGRhdGEgYnkgUkRNQSBXUklURS4N
Cj4gK1xpdGVtIFRoZSBWaXJ0aW8tb0YgdGFyZ2V0IHNlbmRzIGEgUERVIGJ5IFJETUEgU0VORC4N
Cj4gK1xlbmR7aXRlbWl6ZX0NCj4gLS0gDQo+IDIuMjUuMQ0KPiANCj4gDQo+IFRoaXMgcHVibGlj
bHkgYXJjaGl2ZWQgbGlzdCBvZmZlcnMgYSBtZWFucyB0byBwcm92aWRlIGlucHV0IHRvIHRoZQ0K
PiBPQVNJUyBWaXJ0dWFsIEkvTyBEZXZpY2UgKFZJUlRJTykgVEMuDQo+IA0KPiBJbiBvcmRlciB0
byB2ZXJpZnkgdXNlciBjb25zZW50IHRvIHRoZSBGZWVkYmFjayBMaWNlbnNlIHRlcm1zIGFuZA0K
PiB0byBtaW5pbWl6ZSBzcGFtIGluIHRoZSBsaXN0IGFyY2hpdmUsIHN1YnNjcmlwdGlvbiBpcyBy
ZXF1aXJlZA0KPiBiZWZvcmUgcG9zdGluZy4NCj4gDQo+IFN1YnNjcmliZTogdmlydGlvLWNvbW1l
bnQtc3Vic2NyaWJlQGxpc3RzLm9hc2lzLW9wZW4ub3JnDQo+IFVuc3Vic2NyaWJlOiB2aXJ0aW8t
Y29tbWVudC11bnN1YnNjcmliZUBsaXN0cy5vYXNpcy1vcGVuLm9yZw0KPiBMaXN0IGhlbHA6IHZp
cnRpby1jb21tZW50LWhlbHBAbGlzdHMub2FzaXMtb3Blbi5vcmcNCj4gTGlzdCBhcmNoaXZlOiBo
dHRwczovL2xpc3RzLm9hc2lzLW9wZW4ub3JnL2FyY2hpdmVzL3ZpcnRpby1jb21tZW50Lw0KPiBG
ZWVkYmFjayBMaWNlbnNlOiBodHRwczovL3d3dy5vYXNpcy1vcGVuLm9yZy93aG8vaXByL2ZlZWRi
YWNrX2xpY2Vuc2UucGRmDQo+IExpc3QgR3VpZGVsaW5lczogaHR0cHM6Ly93d3cub2FzaXMtb3Bl
bi5vcmcvcG9saWNpZXMtZ3VpZGVsaW5lcy9tYWlsaW5nLWxpc3RzDQo+IENvbW1pdHRlZTogaHR0
cHM6Ly93d3cub2FzaXMtb3Blbi5vcmcvY29tbWl0dGVlcy92aXJ0aW8vDQo+IEpvaW4gT0FTSVM6
IGh0dHBzOi8vd3d3Lm9hc2lzLW9wZW4ub3JnL2pvaW4vDQo+IA0KPiANCg0K

