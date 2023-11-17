Return-Path: <virtio-comment-return-8460-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066CCC072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:15:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5B3923309E
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:15:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 40D09986E25
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:15:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2B7C9986E1E; Fri, 17 Nov 2023 12:15:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1C85E986E1F
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 12:15:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBSggkBzHHyV1q7XZwZ1+WQtiGG4eFGiMm/W0NnzvUzQmKdizUCAGsOWejGIgEvvm6TSn5OnAXjJ8q2AmicS43pZFt7j6NXi3j1jxyEuZnTOhbbel2ZmBX7Tp4r7R7SdbSB+0AiouXsciRULdKw18/VXthXlI8FwZuizn7PLeA6leBhjIRoBizbyusD/T9Hmiz80g/R5NMJWekSjfBEWDHyluJxXEnIE0jokT0ZSLFbj9dMYiSytsmcqyDPnFE6o3tzFQil0QYlrtGnsZSGeEDbUjO9aVq/nxHqjqxll17RzrVFyJtUcdSBrPOI7VVStBMN0hD2X4b7iYosNZFHISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRDX9lHXdExh+nft63sdWmNN5WYXQ8sLYW7t8vx4KNY=;
 b=Lu6qyYlj/ioH4g4XiBavSnAr16p+geqiYndSK5KRUS1IbpX+AtKbSMPffA3yVP0LraQiNePqdxWZsVrD32n2/Ohh7LLMpE4SCmUTNBdIC7Fae1S1/WXdMNfmXIZthZdbgx6+7slH55D46uRVFljzCmQKis6kija3sPjblWU48mzIMCPi8ZDkLBudP8Awi81efkmxNbuV7GeCOHQWNXECmjH4qU1UngvZyjQ14n+WbCCAE/RVA4vymNcdnz5cjEjpG/Hr/roZtb06r/Uu3kzkLMs3wowEJGLQfkqY1QGFYGSjIBUqIgTjYz8rzvPdB5Cj9xFk459SSALZVDoXHCTZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands
Thread-Index:
 AQHaEfwUGl0o9tnLPEOcv64rj4RwurBwFAEAgAFCeICAAEregIAF/oGAgAPhNHCAAtkIAIAAAl/AgAAPhQCAAACmgIAAB8mAgAAD0iA=
Date: Fri, 17 Nov 2023 12:15:54 +0000
Message-ID:
 <PH0PR12MB5481BEBAA57399B3A9CF2795DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org>
 <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org>
 <CACGkMEuSpZ0Y8kxXv26b38pvX--OCdvWm5KvMniqo=W10ruBTA@mail.gmail.com>
 <PH0PR12MB5481170EBDD5A8EBFF6C84C7DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117050838-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481101F980800BDAB4EB24CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117061122-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819ACE638B70505B131B28DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117064344-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117064344-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL0PR12MB5506:EE_
x-ms-office365-filtering-correlation-id: 98ced0a4-1312-4127-7674-08dbe766f28b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QrON2AxszcCZTDPLgrePJ1Zv8QPoa6v0OHEYVPbTprd/ugKRjqTcPI6olXU8eEfs5h542TBpTw5n3cuuDyRolpmzFk2sfxcMi7AhgzLIo4C4CsGVSisDGxPo5QiUVKoozceoUtYEMkK4AhzsSQOsP9q5tfQxA6nQSYyUBy0wiJO4V/5iP7uUh+uCXnHHITtGyPJ/U4FP49LG/8KD8zdzNc6J2lJ9KGFhxz3SOY99HWA3tYOv4pd6IqHPQ+P4nWltZINr7xnQj77UBBLeyQR2yIGbbr8B1EyIDgpVpYm1IHtH/GGQDCXkm8IpwrpTHbx4eVh2R3pT5RJJ9mnoLh1zxNYL4hMG42Y13P9Qb8A5dHa/a5Gzcm4gfFyGzfYQKUuAJVR80DT9LaxiHM3HilcsmuQQs1f4MDutc9bjh47lNLWCqyqLRbvQO+sDvp0XLHDlImr5cR4yEQjL9jJWFPJVtQT11/1RxeCPxz8qsf2XgizalWGM7xwtNFqyHOKiBHMQqw4BD5SZHUs/wYKkl19Re8TtqzkHEm3Ltu5GmJ4TvVsorCkt74EKwkLd9K98l0VgEuvt0IlZetvb3su1+ea+1W3IDt7JpVnvjpoRGuk781KsXB3JQMBsofMqnBNRy2ZQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(55016003)(26005)(7696005)(6506007)(4326008)(8676002)(5660300002)(71200400001)(8936002)(76116006)(2906002)(66476007)(66446008)(64756008)(54906003)(33656002)(53546011)(55236004)(86362001)(52536014)(66556008)(66946007)(38100700002)(478600001)(6916009)(316002)(9686003)(38070700009)(41300700001)(83380400001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1FUeVBYTnIwc0V4RTlaK090dCtwVGllQU5Tc2Vya2YwVzNwLzdoNUV3UWJx?=
 =?utf-8?B?RTc1WThVR04rZm0vVTZyazlJQUc3bjdNTWppcis4Wm1mbXJmRWg0UDZrNkN6?=
 =?utf-8?B?N2E3UGNqT3ZZeEl3UVJ6bElIRklxWStJS2p3eGF2cXpvQ3RTVkt1ZXIwWVZZ?=
 =?utf-8?B?dHJEbm5xUUR4RmpUN2ROZU5HZ2FBNFVVaEJlU2k0VVNOdHNLTU01bnVSMFNQ?=
 =?utf-8?B?RUJ0MmNZN2IvRFZpeTl1TFF1QlFRSjNPWTU3SUx6bExiQmZqY1hQNko2eWFn?=
 =?utf-8?B?YVpBMkxjWVdpZjd4ZTB0aXRISnVLN09oL3V0dkswNUx1SU1ueUViNEhtWWFO?=
 =?utf-8?B?UFNTSXZ4RUZjU3JlZnd3M1E5aGtIalVtZ0xQVEQ0OFhjTGxCVGpTOWxUOEZx?=
 =?utf-8?B?UkpvWSt5elNIQUZ3L1pxdXlKYXhTWFRjK2M2TUlBUUdPMFpoQU94UnBCU3Nw?=
 =?utf-8?B?ZDVIelU4dGd0dHd5aDhxaHZta2V1U1Y5bnNuanJCN2xETnRqUUd0SmdrSTlk?=
 =?utf-8?B?TkpGT1VheDdMQjdNcDMvaGc2Q0k0Ri9DM215UEdCMHBVOXdGMlZZTDAyTHJG?=
 =?utf-8?B?ZWNGek81dnEzaWJwUUNzUmtYU2dESG1kY2dHb2xFd1FOdHFWb2haUGw4L3Fu?=
 =?utf-8?B?Qk1XdnNTaFBTTGFqOFduNUFxbzhqU2ltai91d2dWc1hCRnpyZ3RTL3J4eHVv?=
 =?utf-8?B?NkRMTWJUT1pLalVYMVRPN2RlSS94bVVkTHN4QTRTNGdKMlliR1N0TnpFMzhJ?=
 =?utf-8?B?R3B3cU4xTEUzK1BqZG1wZFkzeFBMZ2pUaHhwMkxYemUreEZPOXB2SUdpL1VY?=
 =?utf-8?B?WVFZK1ZXcnR3TEtUNjYzdTFkd29BVnlkb0pGdzQ4UEhDbmY3eXJVZTJPcklq?=
 =?utf-8?B?aUx4RnFSNTJBTzZ5Q0RLd01ubkxDaTYweU5OWnozSXhuVWR6OXBqbWlDMjNm?=
 =?utf-8?B?NlRuUmpGY0JmaFgyL2FmNC9CSUtqTlgzeG02bGZySGtVeEN4dytIWGVvbFZZ?=
 =?utf-8?B?SFFiQUtHeHVEQXl4bnJlWEFlMHA0cTg1RTVZUktlMFBWdndWRy94ejAxWHFW?=
 =?utf-8?B?VXgySkdBcTQySWJDenMzdzJ6OFJsZmxJYlJXVEoxd0hoL0J1bEhMcXFVdHh5?=
 =?utf-8?B?bTdWb1FnMWtqc0dGQkZLNVhpTlBEZHVFMVBmUzVNQnkxU0J4Rk5xY2NFbGtR?=
 =?utf-8?B?T0tpTm9OMkgvUGxyZGhiTFJ3NGlEN2psYWZ3eWZCWHBsR2p2Y2NIaHVlYmoz?=
 =?utf-8?B?MCtOSlNwZGlndzd3UHQrS0lBUmFSWjVmUm9xa1AvT0RUd1RZVnRnM1k3SWR1?=
 =?utf-8?B?b0pZVDZhMmdpNHRCSC90MXVZYkVRMkNLM0h2SWExaGlnZVhsbGFUbmVEWkNk?=
 =?utf-8?B?NmJsWXBXcThHaW5rbzRwNDY0ZUd4ZWlnclBiWWYxT0ZYamRiWFZzd0xtVmxq?=
 =?utf-8?B?THJUL3E2Ymc4TEFENDU3Q012Uzkwam1WUFFoM0ZWSm9TaWM5MG90NThWVlFK?=
 =?utf-8?B?ZGhtOHFrclNrY2x3TmJUVFIvRFJPMkRwQ1liVGVmalIrbzJDcjZ4bnp4ay96?=
 =?utf-8?B?d0tCMld4cjZWZHB3Y083WjI4Z2VTUFlFMTV1Ni9JMEp0YTIyb01WZjFCVmda?=
 =?utf-8?B?VWlDaEFhVTR6RXQreFNXeGc2MVBrMW9IdkFSR1JjSHg5endFWXhOcjFsc3JW?=
 =?utf-8?B?SDBtUzk5YklvRVFzbkxEbkRpNGtBYzBRenpva1M5bEhFYVZlNnJpZkI0ek9R?=
 =?utf-8?B?YThNSTdRY21Majk4YnNkOWNoRmYvOGxuSkhFQmJ5UndTRWJMSDZybFpJQjRp?=
 =?utf-8?B?MElYR3lJRzkwUkVxOXp6eWd2Ty9kWXVpajBhTUptc3B1YUd0WHZnbVJUajJp?=
 =?utf-8?B?MHptcnFidE9KRGFMUXRxWk1KT1FyNWoxa3hOYkZydGtZMmMyUUN0Z3VOWXJG?=
 =?utf-8?B?NWFSWU5KdGp0K2paMFRqeTVXRndsTWlBd2lpWUVRM3grUDJzNHU1OVZSRlBL?=
 =?utf-8?B?Ylh4V3EvVnNKeitraW5HeXBVbGVvVGhvclJMWWkzU0wyd3lSaTB2RkhwU2Zk?=
 =?utf-8?B?d2gzMlMrd2ZhQ2dEVm9TT0JlL05WOGRmVVliYnVrcktRWWpiZ2VyNlczTCsx?=
 =?utf-8?Q?t+0U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ced0a4-1312-4127-7674-08dbe766f28b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 12:15:54.4835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 813z7P/g8IP8Shf1JYXCT8gO6ik0Ai63Fma7FONnIQTtQzM7yKzAqsOriRKSyWV360CRfKMsNJTpRiuhzk8C2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5506
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

SGkgQWxleCwgSmFzb24sDQoNCj4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0
LmNvbT4NCj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxNywgMjAyMyA1OjIwIFBNDQo+IFRvOiBQ
YXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+DQoNCj4gPiA+IEFsbG9jYXRpbmcgcmVzb3Vy
Y2VzIG9uIG91dGdvaW5nIG1pZ3JhdGlvbiBpcyBhIHZlcnkgYmFkIGlkZWEuDQo+ID4gPiBJdCBp
cyBjb21tb24gdG8gbWlncmF0ZSBwcmNpc2VseSBiZWNhdXNlIHlvdSBhcmUgb3V0IG9mIHJlc291
cmNlcy4NCj4gPiA+IEluY29taW5nIGlzIGEgZGlmZmVyZW50IHN0b3J5LCBsZXNzIG9mIGEgcHJv
YmxlbS4NCj4gPiA+DQo+ID4gVGhlIHJlc291cmNlIGFsbG9jYXRlZCBtYXkgbm90IGJlIG9uIHNh
bWUgc3lzdGVtLg0KPiA+IEFsc28gdGhlIHJlc291cmNlIGFsbG9jYXRlZCB3aGlsZSB0aGUgVk0g
aXMgcnVubmluZywgc28gSSBkb27igJl0IHNlZSBhIHByb2JsZW0uDQo+IA0KPiA+IEFkZGl0aW9u
YWxseSwgdGhpcyBpcyBub3Qgd2hhdCB0aGUgTGludXgga2VybmVsIG1haW50YWluZXJzIG9mIGlv
bW11IHN1YnN5c3RlbQ0KPiB0b2xkIHVzIGVpdGhlci4NCj4gPiBMZXQgbWUga25vdyBpZiB5b3Ug
Y2hlY2sgd2l0aCBBbGV4IFcgYW5kIEphc29uIHdobyBidWlsZCB0aGlzIGludGVyZmFjZS4NCj4g
DQo+IFZGSU8gZ3V5cyBoYXZlIHRoZWlyIG93biBpZGVhcywgaWYgdGhleSB3YW50IHRvIHRhbGsg
dG8gdmlydGlvIGd1eXMgdGhleSBjYW4gY29tZQ0KPiBoZXJlIGFuZCBkbyB0aGF0Lg0KDQpTaW5j
ZSBvbmUgb2YgdGhlIHVzZSBjYXNlcyB3b3VsZCBoYXZlIGFjY2VwdGVkIHRvIGxldCBkaXJ0eSB0
cmFja2luZyB0byBmYWlsLCBJIGRvbnQgc2VlIGEgcHJvYmxlbS4NClRoaXMgaXMgbm90IHRoZSBv
bmx5IGNvbW1hbmQgb24gc291cmNlIHRoYXQgZmFpbHMuDQpTbyBJIGFudGljaXBhdGUgdGhhdCBR
RU1VIGFuZCBsaWJ2aXJ0IG9yIGFueSB2ZmlvIHVzZXIgd291bGQgYnVpbGQgdGhlIG9yY2hlc3Ry
YXRpb24gYXJvdW5kIHRoZSBwb3NzaWJsZSBmYWlsdXJlIGJlY2F1c2UgdGhlIFVBUEkgaXMgd2Vs
bCBkZWZpbmVkLg0KDQpXaGVuIHRoZXJlIGlzIGh5cGVydmlzb3IsIHRoYXQgbXVzdCBoYXZlIHpl
cm8gZmFpbHVyZXMgb24gc3JjIHNpZGUsIHN1Y2gga2VybmVsICsgZGV2aWNlIGNhbiBidWlsZCBl
dmVyeXRoaW5nIHJlc2VydmVkIHVwZnJvbnQuDQoNCkRvIHlvdSBzYXksIFFFTVUgaGFzIHplcm8g
bWVtb3J5IGFsbG9jYXRpb25zIG9uIHNvdXJjZSBzaWRlIGZvciBtaWdyYXRpb24/DQpUaGF0IHdv
dWxkIGJlIGludGVyZXN0aW5nIHRvIGtub3cuDQo=

