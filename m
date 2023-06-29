Return-Path: <virtio-comment-return-6590-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982B7EB64DA
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 02:23:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BC9CF33097
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 02:23:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B24B99865CA
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 02:23:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9F729986588; Thu, 29 Jun 2023 02:23:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8CF9798658B;
	Thu, 29 Jun 2023 02:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPIWS541f8SF4GVDNHM5ZKAAtYtvBgiFYUVjuLE2S+ig+s5UJeZObCYeg/ePc6v19LsYFuCjrQq825Vx/OtED6KhqLmpTmwlpAVFhdqNh5pNa33v0RyJ713o7OMO85TXhfIY4idN9TGnfb+JwUdogpBB2SDqYBSURvLeNSnN4wEt5HgjuT3Ox2e1ioCzNVntxx7rdNIeSqNAeYi6AXulV4+2yeqr0rK+pJaBghAL9h0wn0cRprfGLamFsE3YFwTYKZUEIwEivBj66JWPvDMcw9dM/3/bdwbNu2VrtLJVEsQDbBRjdWqajDQAxM5ImTJBBcjjMV07j83PXIKL4hc5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJqAN3qmqHEj8yCjSpIbel4He9Qp4t4IfixDMSJJxCw=;
 b=DydGryvkPU5KWK8Tn4Dwyg54/TgO6WtHnIB29Suy+Zf+Ay1VJEsd5PnBwiw4EZ1RNgZaPbLQEc1vbRe7AF/DXVs+fbbDMbv6Hygwx0Zg58FP9tXhwphkkMsI2mDPsMLFgZ0kCh96RntqUQ/SOXtCk88mvV6HqtC0UwUAy/SHPEOF4OUG34gpARHJGFp8xVRueVYPDQ4RUnC5ZO1lk/MbF3HjW/4ibqZxklehTtqeasxCwDmpboyqN9YqsPD0KcOd5Eh2T201I23AxAEO/UYoYKXxYvk0OcvtTKisi1M+hBu6ye3QIgLQ9gwp0TGfDW8Rjtpq4XbujG+UtDKq3OAJIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] Re: virtio member device provisioning get/set
 and virtio child device life cycle mixing not needed
Thread-Index: AdmpVpzpKKBUbqM4Qgq425cUop3WcQAO9SoAAAusrWAAG7XmgAAACPgg
Date: Thu, 29 Jun 2023 02:23:44 +0000
Message-ID:
 <PH0PR12MB5481F5D8B77067A8CDCB5A9FDC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481821452DA2A9572714BB9DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6b95e5ec-37e7-7150-9926-6bb02ee13cf3@intel.com>
 <PH0PR12MB54818AEB1A85069B42B97158DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1bdd18c7-c4bd-8049-ee63-227fe25fb7a5@intel.com>
In-Reply-To: <1bdd18c7-c4bd-8049-ee63-227fe25fb7a5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB6038:EE_
x-ms-office365-filtering-correlation-id: 1fa8a1cb-fde2-4568-8449-08db7847dd06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 AQWH2D0jZ2SSdH/IlGQIhkRdpwCWkoGKVG3S6pCvusW57IkOglp6yMX5fIa8YqPgZ3Q1uZpmPriwDTgX/RVVBhuAlmJv0JmpVd+Oix2RDh6lld8Aa/gAjT+ies5lLO6rV/iKKx6uh8D9xC4zXac2cl+bPm05LumYJ3aYIC3X2poUqCMxndR8ozdDTGXlSRApZEkvqAOzu4IoyxKF0FCmVCqD8S/ZH8BPvJtK7DVhuZsHqvogDbvaLXEYNp8TdNnV5r9OQS0REDtYQlvznyEjZA5OFFoehlT0ENxltvC1cBwyeFTCz2q9ozc8PtA14pMwqgGWTqNh4whXFxI1pYZatu7CaEMSdzQt5xafBxNmDhwczkrsjnl7z86dLRVWf973mni8mfqIq0nOcILon2uEfeB1mLMnO9ymaynmZUnJhwam7A6J9ZuQ656xAPzrZNhpGoCOT6i62mTiaY2jEmCPsRcWw2f6xnAaJxHDEbBXO6qQZAV8651RTVFWI5KGixftC6efGP9sjk9xGjHcip5wJokB89a/EfUpO9YG10/Wr+cqdtR5SCDxQckb0ipghgQXVLCfGg4WRu6Ivfz/updi0KlGcNqQJmZj25Ko9hyj8jFMZg2QCwXhVfSvZfUuuLg/
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199021)(2906002)(55016003)(38070700005)(83380400001)(6916009)(316002)(71200400001)(26005)(6506007)(9686003)(7696005)(76116006)(478600001)(186003)(54906003)(33656002)(86362001)(122000001)(66476007)(41300700001)(8936002)(66446008)(4326008)(66556008)(66946007)(64756008)(8676002)(38100700002)(52536014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SnB0N2RqT0k4c05lbmhDUjlXa2VhT1VtbEJEbytnMHU5dFI4eWo2Kyt2SjFI?=
 =?utf-8?B?VE1FRTA4L0s1ODcxdkJKTGNHVUMxaGYyR2E5T0UyNWRDZXZQOHJVbnk4VS9Y?=
 =?utf-8?B?dlpwQUFmU01nNHFIL1o2UzhkN294dU5oZFpjRkdNblhBVEJYdWF4VXAxMU5a?=
 =?utf-8?B?M3dhL1lzU09xb2pRNitlZTFlUWl2YkhWOUY1VVFISU1DNUdNQkt0eEhMRTda?=
 =?utf-8?B?OFRBYnRMWUJFUHBUak5wSmN2djRGbHFQT25Lai90S3ZkR1NDOXFCSDl5R2tW?=
 =?utf-8?B?a2lESjBTaktqTGV1bmVZazh1WGhtZTZ6akZvNEJJMjRabklyaW5CV05LQjYx?=
 =?utf-8?B?bHdUemZGeDR3U2E2Ni9Ic1lYNXY5WHlvUnhtMjNjSjE5V1FFaTZSMDdQM3or?=
 =?utf-8?B?Skg5bGhaTjBUUE1xV2pKbk5kS1VSZ2F0TFk0T2xPdFhwcmhUaDgvZkk5V0Vw?=
 =?utf-8?B?UU5wMHBOWmNKbGlTSDFjLy85QVJWOWd2cVBhOHBuL1h5d3EwZGRKZlZVRFRi?=
 =?utf-8?B?YzJGSEpoV2hDTkI2d05xdkVjTmhHOW5kTDcyMEp1STA5THNGUU13cWV5Q20y?=
 =?utf-8?B?aVlmcUxHUkZGd3pWRHc2RG5TbFNFeThzdWh2eGhRelBWVWh4QmVsSk4yMmlH?=
 =?utf-8?B?bTg4Y3kyVXhLOEwySXB4WS9qVldvbSt6UXpETmRjaW8xc1gzV1hPc1hDbzJt?=
 =?utf-8?B?SktqMjhFK2JRclZsQWxyaTBKT2dnaTVMRmtjOUZzM2RrR0R1ZmZPdmxSSEN5?=
 =?utf-8?B?UDRMWWVYYm1TbGR6NlVqczJxeGVDZXJmK2JqMFJ3RWxGaWM0ditRWnZpaWJj?=
 =?utf-8?B?K0tPZmVvaFJjeWxjbTBtSTF5MGZCSzlJU3Q1dnhPNmUyVWF6aDQ4SzFVWGVQ?=
 =?utf-8?B?VDBVamdESmZlVmdsTlY2TU15dFZnbFBtQVdjTXRCVFpFUkdnTWgzN1NvNlFj?=
 =?utf-8?B?cmNyRy9TK0g1QnR1aTVwZlFmYU50YlVlMW1ZQ1MweFlLNS9XMkVsM0ZuRTE4?=
 =?utf-8?B?YzZJRHhDL1NTVWhYaWFhVmpoNGtwYkZ3K2p4cHR4VFRIdkpJcThMWjBSTkdX?=
 =?utf-8?B?NTEzVGpsQjVJbVhnOTI2UXhHRW5VZG5NZWdTRkdXczJrQkpJOUszOVZaWVgz?=
 =?utf-8?B?U1hiYXlPZ09nVEN0UUYxM2E2UFpGMGNEWmw1S29CZVowbmVJZ3dBWFlQcWRq?=
 =?utf-8?B?blRnREdIZDRtbjF3dVZvNnJZc2hvc0I1Q3VFdjdNSHFLZnc1cEMxVlA1eCtm?=
 =?utf-8?B?MitjeEVRcHZHU3lKZk9yekNLZXB4cno4NCtEWG1KR2VOcXNQVG43S1BGNllX?=
 =?utf-8?B?Y3ZBQ0xselhVUFJrc010eVNobFVXSVFBNElQbjViRlF1Rnk0WXhPdC9vN0hP?=
 =?utf-8?B?RjlySlQvMG1tLyt4T1VjMDZmNTlJaGpRdkg3UW1nWkhtMFljaldDbVdhUzU5?=
 =?utf-8?B?U000MzNLVXNjSnFXcUcweEkwZmJuS3FKNkVvN3cwNlNmV01FaDhRR0VYeito?=
 =?utf-8?B?RTliWEtuZWp5OEUvdjI4L0p3b0FvazZrcTltTVBNUnNVYURFT20yaEFCTG8z?=
 =?utf-8?B?YWkrL0xLTUlyakdRSUhOZTlsUXVhay94TmlQV2o2SXNaQU9ldFlxRi9OMHBS?=
 =?utf-8?B?ejM5S3pZVWtWeDIvN2NkeTY4Q3U4TWZmWDUzZjNudGh4TVF0b2JYaGNSWVRX?=
 =?utf-8?B?V2hpL0E0dHlBcStPZ1dPUklaajdCZEFhY0xORE15OUZTRW9EeTBIempST3JD?=
 =?utf-8?B?aUR0bzdRYTd2M0ljUFFyVTdiWVFVWk0rYTVpTFZ1d3JickpxdFhnSmJmcnlD?=
 =?utf-8?B?N0NHUEtyMXdtMmsvcEEzYUV0WlBQb0ZYSlErSDBOU3hsbE43OVhselh5SlpT?=
 =?utf-8?B?blJGblpBdXNlTUREQVh0M2l5R05YT0llQmZFSDNpaGRIRm9HTEpuTGhNd0Rk?=
 =?utf-8?B?T0dZRnJCZ0NZNy9ERjM4U2MvRksybmlDTFkrYWRVVzE4T3Q2ZDI5MFF3bHBj?=
 =?utf-8?B?bnI5bHRwblZwNXRwR0hlOElIMzlmVWFmNzYxdHNrRXhKZ2FzamNQRC9yQ0Ux?=
 =?utf-8?B?ZFdkYXdwZFQvNzJkOEdONEZ1c2pFQVJxTys0eXNlaklWekU1MFIyOUhDZDBs?=
 =?utf-8?Q?GSV8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa8a1cb-fde2-4568-8449-08db7847dd06
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 02:23:44.9184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x9ZkyP6DGF0hJUKAx8KI6AeADHsKjS6s8Fgm0kvAbdYOx4hIynk+nrugRy3qC6ega+H6GIYtOrhGc6s6cHUe+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6038
Subject: RE: [virtio-comment] Re: virtio member device provisioning get/set
 and virtio child device life cycle mixing not needed

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgSnVuZSAyOCwgMjAyMyAxMDoxOCBQTQ0KDQoNCj4gPiBTbyBtc2l4IHByb3Zp
c2lvbmluZyB2aWEgQVEgaXMgZmluZS4gVkYgY2FuIGV4cG9zZSBuZXcgTVNJWCBjYXBhYmlsaXR5
IHBvc3QNCj4gcmVjb25maWd1cmF0aW9uIHZpYSBBUS4NCj4gSXQgaXMgdGhlIGd1ZXN0IHRvIGNv
bmZpZyBNU0lYIG9mIGFuIGFzc2lnbmVkIFZGIGJ5IHdyaXRpbmcgdG8gTVNJWCBjYXBhYmlsaXR5
Lg0KPiBIb3dldmVyIGhvc3Qgb3ducyB0aGUgQVEsIG1lYW5zIGhvc3QgY2FuIG1vZGlmeSB0aGUg
TVNJWCBjb25maWcgZXZlbiB3aGVuDQo+IGd1ZXN0IG9wZXJhdGlvbmFsIHJ1bm5pbmcuDQoNCkhv
c3QgY2FuIGRvIG1hbnkgdGhpbmdzIG5vdCBqdXN0IE1TSVggY29uZmlnLg0KSG9zdCBpcyBub3Qg
c3VwcG9zZWQgbW9kaWZ5IHRoZSBjb25maWcuDQoNCkluIHNvbWUgT1MgTVNJLVggYWN0dWFsIHZh
bHVlcyBhcmUgbm90IGV2ZW4gd3JpdHRlbiBieSB0aGUgZ3Vlc3QuLi4NCg0KPiBBIG5ldyBzeW5j
aHJvbml6YXRpb24gbWVjaGFuaXNtPyBUcmFwIGFjY2Vzc2VzIHRvIE1TSVggY2FwPyBCYW4gYWNj
ZXNzIG9mDQo+IE1TSVggdGhyb3VnaCBBUSBhZnRlciBEUklWRVJfT0s/DQo+IERvIHlvdSBoYXZl
IGFueSBkZXRhaWxlZCBpbmZvcm1hdGlvbiBhYm91dCBob3cgdG8gcHJldmVudCB0aGUgY29uZmxp
Y3RzIGxpa2UNCj4gdGhpcz8NCg0KQSBoeXBlcnZpc29yIGlzIGEgdHJ1c3RlZCBlbnRpdHkgdG8g
bm90IG1lc3Mgd2l0aCB0aGUgVkYuDQpBIGh5cGVydmlzb3IgY2FuIGdvIHRvIGFuIGV4dHJlbWUg
dG8gZXZlbiBkbyBQQ0kgRkxSIHdoaWxlIGd1ZXN0IGlzIHJ1bm5pbmcuLg0KDQpTbyBubyBuZWVk
IHRvIGdvIHRvIHRoZSBleHRyZW1lLg0KDQpXaGVuIGh5cGVydmlzb3IgaXMgdW50cnVzdGVkIGlu
IHJlbGF0aXZlbHkgZmFyIGZ1dHVyZSwgd2hlbiBhIFZGIGlzIHB1dCBpbiBzb21lIHNlY3VyZSBl
bmNsYXZlIGFuZCBsb2NrZWQgaHlwZXJ2aXNvciB3aWxsIG5vdCBzdWNoIGFjY2Vzcy4NCkF0IHRo
YXQgcG9pbnQgbGFyZ2UgcGFydCB3aWxsIGJlIGNvdmVyZWQuDQo=

