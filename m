Return-Path: <virtio-comment-return-8780-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF77CC4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Dec 2023 06:23:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 412D6120D53
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Dec 2023 06:23:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 326D298669B
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Dec 2023 06:23:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 27333983FE6; Tue, 12 Dec 2023 06:23:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 19EC598657E
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 Dec 2023 06:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dH0nQd9pcpxfmAi3PeWl6/xJa6rYSOdIauUQwOu1IuGOYmZGQ9MxGASVrfy0/J2GfC1EOM8Q2nr6mBvMGXkjT3uYMg2suXh4eDU6QCQPhkgu5w7hSejb1iyEK+zxnEQwnGLNS8LzGFZG7AGjnQycmgag4yusx7JJdhGa2OmRKRZx+XIj+pYHzHoyr+OOOLvGsl2jRaYNwC+Pz0WS93VEleIwWqgHNznUJJcEIWjwI861V7n1KzRSyCBFNICaQeD6UVzNKcAK82ABBuuPEu9VwsEGIPGf72lxoROcRwGRCGeX+jz4i+QQLlwiey6FcS3P7upiLnyf3RpaDMYPv+idzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jo1D/ihJFbsBVhuQDof7F54z6sspyZ7o1PfsFSggfmA=;
 b=nNR69FQO3BttF1pln6LGxE4XAlodkVDWl5v083SVVZZrfggvpL31UQYikoSgivyJZgmKA5Jj7b7uSn27PoxuM0DIZEY6yo18D1HqX1ySuNXVmb5a7FYCbVTLH/Hd7mm7u/odUDM8Fr9/icRQWdvpWN2rmrz0h2oeGT0ldfQCgFL2ZB6+yjmPrLVv0m+oum1nln5xNwXTeCUdk7XXdXSDtoGAQTmMFG9KMiq1E8f/c0mbAPced0J/xWcmYWbNdk6faFWASpWCAQcMgZ7d/ZA9PoNYWNdgP8N/vb9ZX0fcDPq/HFdn2KnLjCENA3Ii/TznqmablM85oaWs2I9dPGQAjQ==
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
        "zhouhuaping.san@bytedance.com" <zhouhuaping.san@bytedance.com>,
        "xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
Thread-Topic: [PATCH v5 3/7] transport-fabrics: introduce Virtio-oF Protocol
 Data Unit
Thread-Index: AQHaBZ7onDPyi3nXJUC6MnVDeaqL0LClfAIA
Date: Tue, 12 Dec 2023 06:22:49 +0000
Message-ID: <EA77A282-0A38-4B97-B6BC-34449CDEAC9D@nutanix.com>
References: <20231023104647.290759-1-pizhenwei@bytedance.com>
 <20231023104647.290759-4-pizhenwei@bytedance.com>
In-Reply-To: <20231023104647.290759-4-pizhenwei@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|DM6PR02MB7065:EE_
x-ms-office365-filtering-correlation-id: fe6b191e-2bdb-4aae-22c2-08dbfadac375
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ORurmFTvbuBtwAGNnCihHlUajLHvSj6dfWfKoCnYg4qGBd7KHR9NH/VaqVkuzGtLOiB0Gx8Co5tmTQvUf6TW1MLhdqL4cjdLRhvGJmqmn8WWN2yy2fQf2BJ8ZsTE0FX7dbplhOy2tQesRhMeBl4hTI3WKWYFEmPdlOWuSR0jk40JYHRFMI9SuoseOiUju1WSKcz0Pp6egnq2AAOmDHf+G+CcMh0o0xmzYps64x49ZrRGKk3yxbGw8qI9eh3p84uXrAvOZv/JRYJS5n/oPXbqPlUe9N2qVCujt2N0/Vno/w6Y4fgyZ1NsdDoRC66I13F1s+heL4nBb+rtRwZ9HOjs98xdUKGiQ+IQk+PxWjHgOOiTEeHTGDN5md2demURdLhvGgcrgX19Xreo/keGlfrg66B+w5eJzRNo2gqOMy5EaQj7zLeVYSEhDVT1HCD/iBGK/e7Ncwi7dpadxkVdArej4GzDdPVSaYCjkEAmaw4Tx26soJTM7TBx9uMC0jV/RsZZYyzWYO/ymxtWQ9atJR1cfI3Jd3jE4sfuADMn3jPWoSD92FjTcWFznOHNaVJarXm+SBt2/TVlhToXhYcf8YsfFKu5KMUqKQoYP4Osl7JY/VIs2Tkq6Wgc8L2uaLaIYnUc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR02MB7938.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(376002)(136003)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6512007)(2906002)(4326008)(6506007)(26005)(53546011)(5660300002)(2616005)(44832011)(83380400001)(8676002)(38100700002)(122000001)(41300700001)(38070700009)(76116006)(91956017)(66476007)(33656002)(66946007)(6916009)(66556008)(66446008)(64756008)(36756003)(54906003)(966005)(478600001)(6486002)(86362001)(8936002)(71200400001)(316002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cTBMS1lPRjJUNWNUOFYvMVFwS1NzVi9xNkZZZExoOERqcCtidmVDenVmN0dh?=
 =?utf-8?B?azNzdGFPRWtVbUNUaXJ4UnFLcDcyT25lMWZheXIyM1dUejhad1dqZ2pHOFRB?=
 =?utf-8?B?S0pYcVlTcG5IaUhFZm5ya2tROTh1T3pUSlRTWVdCejA3dDNxNVZlenBjQ3k5?=
 =?utf-8?B?aFdzckkwRTVXQTIrNC9acUpGcTNYVklTdkZjWERVZWgwNGNkNkxURHFDVE9S?=
 =?utf-8?B?cGFvZ24vbEJqNWJsVHhkSUlUVjVtV1IrUnEzWTc4Si80T01zRUZEdW9DVmNT?=
 =?utf-8?B?aXhFanZjUXNGbjAwYldwK1NhazhpVDAxbGxrWjZCSDNSOXA1Y1E0b0theGc1?=
 =?utf-8?B?ek9MejF6M1dLQUNNMkkxL2lSVlNobU5DcExIUEg2S2hSQ0J5akRNTDNMMFBm?=
 =?utf-8?B?RkJ0cm13MVdaSFhDb2Q4MWg2bVUzSHhsTkZtSzhkaE15QSs2M0EyTU9KbXd5?=
 =?utf-8?B?N2Y4MkdwVUs5SGdZMG1BMG1JbEVwcmcra1FDeCs3cFFnMmRlcWJ5c0dENDht?=
 =?utf-8?B?NjNjTGx2U3ZvVDdXMmlLaC82dk9IN0pwSkwrY1pHQ3N1eXhjRkl5anNJZlJE?=
 =?utf-8?B?ZFdRRkVWVXMwK3NuSzVabjdGYlgrOXRmalBPbkdEUkF5NmJJd3RNVmxLNitr?=
 =?utf-8?B?UzFtSTJpeU5vVHU2eWM3b2ZBWFZtY0dIZWlBVCs3eVFDYzNlaU45Mmt3eTZD?=
 =?utf-8?B?eWViQW5FbDQrb25CUUdZVU5PRmIxVzNxMThRT3dZY3hnVkNyK3UrQmRZanA0?=
 =?utf-8?B?c0R5MytiZXlVLzZDWDh6NkthbURPNExZSFVqY2loNmhqVEU5bXVURTRFRHdG?=
 =?utf-8?B?T0w5c1J5d08wd2F3WGMxNFlrVFA2bTNuYXdWalBZZ3E4Vkp6eHBUTk54cnJu?=
 =?utf-8?B?TG9lWEpDNjlkNmRnbkoxOTVuT0wxSFcxRDdLYnBVUlN4aC9qZkpIZjJ2WDdJ?=
 =?utf-8?B?b1FlV1NKRG8zdnNuR0hHdXRUNUVJbkZUclJTc3FBeityNDFZbU9HUi9BQ0xN?=
 =?utf-8?B?TGkxdUxsaEZDM0k4MU93T3d3dmZ2bEtlTjlFajNPQzhkbFIvdFppRnJSQTJC?=
 =?utf-8?B?ay9VWmNSL1hVK2MrZUUrTHFCRDNwOFlGM1YvMFgzbDR5S01HK2xBcDB3Y3Bq?=
 =?utf-8?B?aWIxR1FTRmEvM0dJSGNCYUs4OW5zZ29yM1M5YWRsZXA4T0M1NXhMM2ZydjB6?=
 =?utf-8?B?NjdJcFFMNmdsSDlXd0pEeTZaRGpKRUJtT3VIdUhhaDF1eW5DbWZpMFYrM1pX?=
 =?utf-8?B?Q1FJNUxtVFM2OGlyamZ4VU9RQnhpZUNRT2g1RUJieE1FSFowOWpkdDVTV1Zt?=
 =?utf-8?B?L04xRmRNMzAxakhtTjg0VThtNjFOaWdIRm56ZnlCSVRtbW4vWlZDMHpqWGEr?=
 =?utf-8?B?bkcreW1ZSFRpOG16ZHhPbFgySzM2U2dIejlsYUtVNFppOHFuS212UnY5TFVq?=
 =?utf-8?B?RVlQWjdSMGRWMlVzelNJTUtSVzgxdVB3Y25oTVhXbVE1NnFUcGEveW5uUUl3?=
 =?utf-8?B?S0Nob0ZTYkRjVER2REsyR1JDQkN2MzFkUUt4VnhsTDJVUFhGT2I2V2FlY3pO?=
 =?utf-8?B?RnhZclZHVGFmSUZaSTlWWnF2bkt0RnpJWVhNVUh3RnAxZDR4d2dDeTF0a2tT?=
 =?utf-8?B?dmpmN1BTTWZzaTkvc2JZc0UwanRPOVVkNlBrUTFtNzVFck1iTE9uMnhXVWhy?=
 =?utf-8?B?QW0yZTVSNjdMQkI3N2cwKyt1MzljNE1ZNG1lRVVXMVpJM1JFeG5UMk05a0tR?=
 =?utf-8?B?ZjVIM0YvTGYrK1RCVGdOTGpnbGU4ZTdFeU9oYTlSY01aaXhKbnVoeXlrZ2VZ?=
 =?utf-8?B?TUdFSm9uVzl2N2IxVHQxQTBqMUN3UWtJQlBpTlFPYW1iZk5SUkFsZVB5Ujh6?=
 =?utf-8?B?blpIT1V5VTEyb0xuU3BoMlhkRzBhT3EwN0lML1FRYkx1dGRLYmpDMXBxOGw2?=
 =?utf-8?B?SjdTZ3Vrc0tjdzJYTWR1N2MvbEI0T1c4TmRKZFNGb2k4TkNFWElMWmJXQ1No?=
 =?utf-8?B?aWdha0tvOWFvdk5iaVBNT2lCNGx4ZzE3M0JnYmJKenovcGRpajJmc2swb2Ew?=
 =?utf-8?B?TlVIWkk0ZnlRRUpSOEYxU1FtR1BtRXE5bnNsSE9EWmtNMzF4T2FIYUJ6dkVx?=
 =?utf-8?B?eGtpNGw1UC9RMWpBUTZjV2pKM1FkTnBRUjNvODFhcHRZQ2ZHTWxOWkdZTnZQ?=
 =?utf-8?B?TXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE4FE744918E394C80EF40463C8CF3F7@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6b191e-2bdb-4aae-22c2-08dbfadac375
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 06:22:49.1694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ajvt5JuTjjwvv/6YVWDZYEsUEvfozGcQpn0ms5Dkfqyey4/Qzfe9NW5Cx8ZDUxrainUYGZb/BGNGFZu+EZvxIdM1bvAk4/sU7AdyyOLimzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB7065
X-Proofpoint-GUID: NJjOlwGnEp2Jy9I8F1dVOnvCi1YIh7Nf
X-Proofpoint-ORIG-GUID: NJjOlwGnEp2Jy9I8F1dVOnvCi1YIh7Nf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_27,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Reason: safe
Subject: [virtio-comment] Re: [PATCH v5 3/7] transport-fabrics: introduce Virtio-oF Protocol
 Data Unit

T25lIHN1Z2dlc3Rpb24gSSBkaWRu4oCZdCB0aGluayBvZiBpbiBteSBwcmlvciByZXZpZXcuDQoN
Cj4gT24gT2N0IDIzLCAyMDIzLCBhdCA2OjQ2IEFNLCB6aGVud2VpIHBpIDxwaXpoZW53ZWlAYnl0
ZWRhbmNlLmNvbT4gd3JvdGU6DQo+IA0KPiBJbnRyb2R1Y2UgVmlydGlvLW9GIFBEVSBmb3IgVmly
dGlvLW9GIHF1ZXVlLCBhZGQgU3RyZWFtIERhdGEgVHJhbnNmZXJzDQo+IGFuZCBLZXllZCBEYXRh
IFRyYW5zZmVycyBtZWNoYW5pc20uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiB6aGVud2VpIHBpIDxw
aXpoZW53ZWlAYnl0ZWRhbmNlLmNvbT4NCj4g4oCUDQo8c25pcD4NCj4gK1xiZWdpbntsc3RsaXN0
aW5nfQ0KPiArc3RydWN0IHZpcnRpb19vZl9rZXllZF9kZXNjIHsNCj4gKyAgICAgICAgLyogdGhl
IHJlbW90ZSBhZGRyZXNzIG9mIGRhdGEgKi8NCj4gKyAgICAgICAgbGU2NCBhZGRyOw0KPiArICAg
ICAgICAvKiB0aGUgbGVuZ3RoIG9mIGRhdGEgKi8NCj4gKyAgICAgICAgbGUzMiBsZW5ndGg7DQo+
ICsgICAgICAgIC8qIHRoZSBrZXkgdG8gYWNjZXNzIHRoZSByZW1vdGUgZGF0YSAqLw0KPiArICAg
ICAgICBsZTMyIGtleTsNCj4gK307DQo+ICtcZW5ke2xzdGxpc3Rpbmd9DQoNCkdvaW5nIG9mZiBt
eSBjb21tZW50IGhlcmU6IGh0dHBzOi8vbGlzdHMub2FzaXMtb3Blbi5vcmcvYXJjaGl2ZXMvdmly
dGlvLWNvbW1lbnQvMjAyMzA3L21zZzAwMjUzLmh0bWwNCg0KWW91IGNvdWxkIHByb2JhYmx5IHNh
dmUgc29tZSBzcGFjZSBzcGFjZSBpbiB2aXJ0aW9fb2Zfa2V5ZWRfZGVzYyB3aXRoIGEgcHJvdG9j
b2wgZXh0ZW5zaW9uIHdoZXJlIHlvdSBjYW4gcHJlLXJlZ2lzdGVyIHNvbWUgbnVtYmVyIG9mIE1S
cy9rZXlzIHdpdGggdGhlIHRhcmdldCBhbmQgcmVmZXJlbmNlIHRoZW0gYnkgaW5kZXguICBGb3Ig
ZXhhbXBsZSwgeW91IGNvdWxkIHNhdmUgMTYgYml0cyBwZXIgZGVzY3JpcHRvciwgbG93ZXJpbmcg
dGhlIHRvdGFsIG1lbW9yeSBmb290cHJpbnQgYnkgMS84IGJ5IGRvaW5nIHNvbWV0aGluZyBsaWtl
Og0KDQpzdHJ1Y3QgdmlydGlvX29mX3NtYWxsX2tleWVkX2Rlc2Mgew0KICAgICAgICAvKiB0aGUg
cmVtb3RlIGFkZHJlc3Mgb2YgZGF0YSAqLw0KICAgICAgICBsZTY0IGFkZHI7DQogICAgICAgIC8q
IHRoZSBsZW5ndGggb2YgZGF0YSAqLw0KICAgICAgICBsZTMyIGxlbmd0aDsNCiAgICAgICAgLyog
dGhlIG1yX2lkIHdoaWNoIG1hcHMgdG8gYSBrZXkgKGFuZCBwb3NzaWJseSBhIGJhc2UgYWRkcmVz
cykgb24gdGhlIHRhcmdldCBzaXplICovDQogICAgICAgIGxlMTYgbXJfaGludDsNCn07DQoNCklm
IHlvdSBjb3VsZCBib3VuZCB0aGUgc2l6ZSBvZiBlYWNoIE1SICh0bywgc2F5IDRHQikgaXQgY291
bGQgbWFrZSBzZW5zZSB0byBzZW5kIGEgMzIgYml0IG9mZnNldCBpbnRvIHRoZSBNUiBhbmQgdGhl
biByZS1jb21wdXRlIHRoZSBhZGRyZXNzIG9uIHRoZSB0YXJnZXQgc2lkZS4NCg0K

