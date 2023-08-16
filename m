Return-Path: <virtio-comment-return-7177-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB021C25B7A
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 10:46:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0F51F3357C
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 10:46:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E54D4986400
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 10:46:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CFB469863D7; Wed, 16 Aug 2023 10:46:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C1F0A9863D8;
	Wed, 16 Aug 2023 10:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dboicNoGT2IqR/jfsfOF6JQhzNi64OsUzCyWx8svR+yGXjKEt4rV0uA1u72pC/5+DUUsWp+WG9clBbglwNgQ1wg1KHuB9hafFljfEP52AKIjHd4MdGkSau5k+bBQeYZcrlyFcqIPCjRU5ibGE+gyd6k4G5dl33JypC7PbclZ9rZXkSx1YNuRD1FbB/7QRkgZtQwbk5dOYv7JU4SfJSnybkwJM8ZknK2aBl6/bUjYviG4he4Hw9xVNnvT+pPIdXjlszqapCFmTZJ46KkKrHh6c3t94gRM3IW2z24WovnlKQ1ukAb8elArwUIjTSPlIVjUo/4I9zs02MWPeFcZsRJwoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrU8qqVyH0HVmGhBFla5iI7Bh2ClIx/ppDtq/w0ynMs=;
 b=MeCnLZWa7uTn69dl1IZrTFEdCP9lL/MBcGvifpUWHjL7zWhiiA5uOSPONH8RWYWAwQP13n9UUim92iRkgr7aMEMdvuak2F+OsWTvnpeaQ5EH9NYcYeaBRPXQMvdI1/lmeD6Lv0iAjHOUYfRdmlSjHU2ATtq3LtCCPaZHbknerpoZ43x0NhLQSTxUtk9k54OESrbUvRMIQfJZKJ3VJhiYK+K9rxHQf0EsXA56fgBJerUArjrZd/e/RnmRG12mT+II4a+HHumVCwXbji5VanCcMExuMPk50b4f0sG2TEiT/C+mOeTYFDREkUrL7hbWGXk1K79IJzkIDLnBTp132f15uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "david.edmondson@oracle.com"
	<david.edmondson@oracle.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "sburla@marvell.com" <sburla@marvell.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [PATCH requirements v4 4/7] net-features: Add notification
 coalescing requirements
Thread-Index: AQHZz0yaD3nRfQHwDE2VYaiYBbnhPK/smUSAgAAkuxA=
Date: Wed, 16 Aug 2023 10:46:08 +0000
Message-ID:
 <PH0PR12MB54815DBA73F066BFAE3824CBDC15A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230815074600.473933-1-parav@nvidia.com>
 <20230815074600.473933-5-parav@nvidia.com>
 <6b48e787-7910-4714-b0a6-ea118c6a072f@linux.alibaba.com>
In-Reply-To: <6b48e787-7910-4714-b0a6-ea118c6a072f@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA3PR12MB8048:EE_
x-ms-office365-filtering-correlation-id: 7fae8957-601b-4e2c-277c-08db9e45fff4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aCIzriKXPlDOKnFOGXbPWADNAyxAFI/fDI/WYgtEJgFxbLkvAE7eZnM7xRFkDNQWBiUd3zhQ0rLbnyuho1Axq49ntmfJ4KJhtSDcThtCUGkSMpv5G+QAWFJXevAyKmA6LyPmxHg7flb84asLDOHLXDbYysnl8bM8DPnH9aWcHsrPxxADq0rSPE1aMeO24wNDexmo56VrhQLBPxO4VqNvGCUTgcjGgik9JIH6op0Gh9VpI336ikKI82SmrlsS/LltCG9Am5nn99wLifcBRv31kpNRbhuyU0KWVID2AYxwNY97bPjkUQfCtCheWWaSkQ+GtKfJKjV3a8UnpNKCbcsqmvZpNj7RXqiOjREUsC44agjsa7tZrl0bbz6t6aY4uioWjoZtcgijc5K2vboff8oAubWUs1/4qsL/56syIfoCtIwvtXoeplMXWlQUEeUs2NBEc9jDDjxbvLQax75ZebPQwobMhLqLQ5rnQA611F+ehmwx3hrTYQDtWEPotFjy+Pj+n7/MnTMDsCtSYQed2Y7L5oOGDF+fVxNSmaNpTLOJHKAVF95ijpaPzKUnyjLiN6qDSq+lLloWZkxSq8e69YK6xHJBPGpR3l+d2vESrinsR3xPX/86aPAMsl1se6MKCTH4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(366004)(346002)(376002)(1800799009)(451199024)(186009)(316002)(54906003)(76116006)(66946007)(110136005)(64756008)(66446008)(66476007)(66556008)(122000001)(41300700001)(52536014)(5660300002)(38070700005)(38100700002)(8676002)(4326008)(8936002)(2906002)(15650500001)(83380400001)(26005)(55016003)(478600001)(86362001)(9686003)(33656002)(7696005)(6506007)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzBoZEZjR3ZWK1VHV3psc1hGOUJUbE9oR0EwamYzT3pORFdWV0U4ekEwK2Q2?=
 =?utf-8?B?NE13NkxMY1J4RkttbUFUOXNzQW93cHRxR0hpWUhsUmF2TzJiTGs3c0plWFVi?=
 =?utf-8?B?OVBsZ01ud0hXQkM0WVZuY2RaR25TKzZCV2ZieWd3MDBKM0RCV1N6Z0p2Y2E5?=
 =?utf-8?B?NUtOalNOME1OS2t2djdNYk93ajVTZlc4TUVNN1ZXcnpYSngvUjgrQi8xVWk1?=
 =?utf-8?B?SVF1aW0vSTVvblVHbVNmLzkwRlpkcm13ZXA5UGpRSEFROVc2UTFiUW11b09J?=
 =?utf-8?B?eVFyMVNadjZlcFpZL2lYanJ2elF4Q0J4eGZrL0NuQlE2dlg3bmJaUEtldGNN?=
 =?utf-8?B?czhjWHNVMGZ3eDFpZjlrT0xYUVI0cTZaR2hZTGxKQi9EMUpIZitwZVBBbXpP?=
 =?utf-8?B?bW5JbnI1RDVEVng1REFJajJuN2NWNEdsUG1uMWxvTk9IUW4waC9uRm1yVXNW?=
 =?utf-8?B?a0l0R285TFY3VTBEVDVJNStaa0toaGEvNXBWb0JIaWtXVzBsY3RpYU42Y09n?=
 =?utf-8?B?dHhmZVBEK1J0OTRzYUFrcEtmR2pLamYyVllWTzE5Zk1qSVMxQ29CNXI0UFlZ?=
 =?utf-8?B?MmNqdXZWQy9MRmFPM1BrL0VwU1U2Q0tvYW8yclJiMDh4dG44aHE2UjdaZWVU?=
 =?utf-8?B?aVhUaHdoTmhKbk9RM05QakpJNEpoaHJtVGdhQkhEV1gzc2xTbDlwRGloMDBj?=
 =?utf-8?B?bW5ONjBRVFpZYjgzMkpqU3BNV05zYXdiRTlCU1h4L1g3LzVSRDB2YUUxN0FG?=
 =?utf-8?B?bnU1dWoxajcwcHEyQnNzaDBXM3dJSk5IOEJuelphYmtsbnJBTWNkOFM2dkVE?=
 =?utf-8?B?VDQwbVVZMU1lelhVMHB0Um9ZNDRleVNpLzh6UVc4NnFyKzdlOFJhZnFQdDg3?=
 =?utf-8?B?M2tScVFMK05zZDRqZlVUYjVERTI2WGtOcnp1Z250Q2dFcEsxbElqODRhaVhw?=
 =?utf-8?B?d1dhb29sYzJrNUxJczAzSzZQQTN6c2N6WVhlM1hJWmtqcU9NNWpGUnl1VUpL?=
 =?utf-8?B?Y0Y4Q2FING91NTBHdGpHd3MyTENkWnpsUGlJNnduaE5XSUJCQWNLdHlSR3Ur?=
 =?utf-8?B?ckNTNHVGbHdMNS9XMUg2cmRFRXhobUZBNE1Wbm1Wd3BSZ1BkOElodUFxcWR5?=
 =?utf-8?B?VlJxTXNSOHVOS0ZMNSs4Z3N1UGRuN3g5Z3pKcnV0NzlQdDYzN2VBdkZ5MVJB?=
 =?utf-8?B?SmtrRDdIaHhCSG9Ob1YvVDA0d1ROUER6THVDcjhKeFpTZzAwU2k3bnpiRGo5?=
 =?utf-8?B?RHF2aHZlZTRkbE5xaG1UelViZURnWjE2R3J2d255eU1HK0ROWlZJd3Badzl1?=
 =?utf-8?B?VHRFQk9RVldzRWdVZVFkS1lFQ3VNY1B4aHExK1VzMk1hTEdoV2F1ZWtIYTA2?=
 =?utf-8?B?SDYwamRnNXZRY2V5VlZPVXl2UjRVMUQvVkdiaUphWjZZQUpBZG91MUdNR0pv?=
 =?utf-8?B?Qlh1azQ3NXpHL25hMy9qVzduY0NuVy9UMjdnUWNmbEQydmF1SmUwVk83ZFdr?=
 =?utf-8?B?aVNmS2JGd0hrZXhQN0tTem5INkU2RGR6MTZDemlmcHVQSm8rd2F0ejRTMjRT?=
 =?utf-8?B?U3QyUWZqK3J4VlZHSlQ0a0tTb2VtK3NKWmhNelFIU3pwMUZBaU9HanNMeEFF?=
 =?utf-8?B?S3ZIQjZTM1lETEtsVHZrS0dVQnlPSzJpRHBTWkdrTWRIdER1Q2xOMXdUTVhu?=
 =?utf-8?B?dXlCcjgrVFV6UFVJb0xrZU5lS2V0dkJvT2VrOHZqbWU1eFlBQXYrTnFxa3Y1?=
 =?utf-8?B?M2NPb1hFbHQ2cS82UTlCdmJJeE9HUUhITFpqQnJYdVVkNWhnYVNrd2RBaDRy?=
 =?utf-8?B?c3NlUVBLK00wbVQyb1V4enplMnh5blFMMDN1STU5UnI3V0dmcTA2aFlyLzc4?=
 =?utf-8?B?SmpCdWNzdHlHNzFHQ1VxSnl6STAvbWd3bWpQUzhFSEVxcVZyY3o0RTAyVTBh?=
 =?utf-8?B?ZEREZ3QyRkZEcXkrYVlyUzd3bWxia2M2SUN5MnB2K0lnUjdVVEpuSU9hQlVo?=
 =?utf-8?B?U1RYbWNDeldkV3E2YmlFSW0wbWU5V1NzSjdHN29ZMERHeDExWm5zUTJRRzRL?=
 =?utf-8?B?amRvOGNpK0l3OUlaS09HYlBVM3ZaK1VVamc2ZWIwWkdJV2VRdS9ubmRmQ1Bo?=
 =?utf-8?Q?PJyY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fae8957-601b-4e2c-277c-08db9e45fff4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 10:46:08.6626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LJXcLllyOOH+54ThkkZFswgDOXo+u3nrXcFGP5qNiZIvRhmtQe6T+9bsUiMSiq5Pb9p8kWqE100k6rs+V7/aTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8048
Subject: [virtio-comment] RE: [PATCH requirements v4 4/7] net-features: Add notification
 coalescing requirements

DQoNCj4gRnJvbTogSGVuZyBRaSA8aGVuZ3FpQGxpbnV4LmFsaWJhYmEuY29tPg0KPiBTZW50OiBX
ZWRuZXNkYXksIEF1Z3VzdCAxNiwgMjAyMyAyOjAxIFBNDQo+IA0KPiDlnKggMjAyMy84LzE1IOS4
i+WNiDM6NDUsIFBhcmF2IFBhbmRpdCDlhpnpgZM6DQo+ID4gQWRkIHZpcnRpbyBuZXQgZGV2aWNl
IG5vdGlmaWNhdGlvbiBjb2FsZXNjaW5nIGltcHJvdmVtZW50cyByZXF1aXJlbWVudHMuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+DQo+ID4g
QWNrZWQtYnk6IERhdmlkIEVkbW9uZHNvbiA8ZGF2aWQuZWRtb25kc29uQG9yYWNsZS5jb20+DQo+
ID4NCj4gPiAtLS0NCj4gPiBjaGFuZ2Vsb2c6DQo+ID4gdjMtPnY0Og0KPiA+IC0gbm8gY2hhbmdl
DQo+ID4NCj4gPiB2MS0+djI6DQo+ID4gLSBhZGRyZXNzZWQgY29tbWVudHMgZnJvbSBTdGVmYW4N
Cj4gPiAtIHJlZHJhZnRlZCB0aGUgcmVxdWlyZW1lbnRzIHRvIHVzZSByZWFybSB0ZXJtIGFuZCBh
dm9pZCBxdWV1ZSBlbmFibGUNCj4gPiAgICBjb25mdXNpb24NCj4gPiB2MC0+djE6DQo+ID4gLSB1
cGRhdGVkIHRoZSBkZXNjcmlwdGlvbg0KPiA+IC0tLQ0KPiA+ICAgbmV0LXdvcmtzdHJlYW0vZmVh
dHVyZXMtMS40Lm1kIHwgMTEgKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbmV0LXdvcmtzdHJlYW0vZmVhdHVy
ZXMtMS40Lm1kDQo+ID4gYi9uZXQtd29ya3N0cmVhbS9mZWF0dXJlcy0xLjQubWQgaW5kZXggNzJk
MDRiZC4uY2I3MjQ0MiAxMDA2NDQNCj4gPiAtLS0gYS9uZXQtd29ya3N0cmVhbS9mZWF0dXJlcy0x
LjQubWQNCj4gPiArKysgYi9uZXQtd29ya3N0cmVhbS9mZWF0dXJlcy0xLjQubWQNCj4gPiBAQCAt
OCw2ICs4LDcgQEAgdG9nZXRoZXIgaXMgZGVzaXJlZCB3aGlsZSB1cGRhdGluZyB0aGUgdmlydGlv
IG5ldCBpbnRlcmZhY2UuDQo+ID4gICAjIDIuIFN1bW1hcnkNCj4gPiAgIDEuIERldmljZSBjb3Vu
dGVycyB2aXNpYmxlIHRvIHRoZSBkcml2ZXINCj4gPiAgIDIuIExvdyBsYXRlbmN5IHR4IGFuZCBy
eCB2aXJ0cXVldWVzIGZvciBQQ0kgdHJhbnNwb3J0DQo+ID4gKzMuIFZpcnRxdWV1ZSBub3RpZmlj
YXRpb24gY29hbGVzY2luZyByZS1hcm1pbmcgc3VwcG9ydA0KPiA+DQo+ID4gICAjIDMuIFJlcXVp
cmVtZW50cw0KPiA+ICAgIyMgMy4xIERldmljZSBjb3VudGVycw0KPiA+IEBAIC0xNzIsMyArMTcz
LDEzIEBAIHN0cnVjdCB2bmV0X3J4X2NvbXBsZXRpb24gew0KPiA+ICAgICAgd2hpY2ggY2FuIGJl
IHJlY3ljbGVkIGJ5IHRoZSBkcml2ZXIgd2hlbiB0aGUgcGFja2V0cyBmcm9tIHRoZSBjb21wbGV0
ZWQNCj4gPiAgICAgIHBhZ2UgaXMgZnVsbHkgY29uc3VtZWQuDQo+ID4gICA4LiBUaGUgZGV2aWNl
IHNob3VsZCBiZSBhYmxlIHRvIGNvbnN1bWUgbXVsdGlwbGUgcGFnZXMgZm9yIGEgcmVjZWl2ZSBH
U08NCj4gc3RyZWFtLg0KPiA+ICsNCj4gPiArIyMgMy4zIFZpcnRxdWV1ZSBub3RpZmljYXRpb24g
Y29hbGVzY2luZyByZS1hcm1pbmcgc3VwcG9ydCAwLiBEZXNpZ24NCj4gPiArZ29hbDoNCj4gPiAr
ICAgYS4gQXZvaWQgY29uc3RhbnQgbm90aWZpY2F0aW9ucyBmcm9tIHRoZSBkZXZpY2UgZXZlbiBp
biBjb25kaXRpb25zIHdoZW4NCj4gPiArICAgICAgdGhlIGRyaXZlciBtYXkgbm90IGhhdmUgYWN0
ZWQgb24gdGhlIHByZXZpb3VzIHBlbmRpbmcgbm90aWZpY2F0aW9uLg0KPiA+ICsxLiBXaGVuIFR4
IGFuZCBSeCB2aXJ0cXVldWUgbm90aWZpY2F0aW9uIGNvYWxlc2NpbmcgaXMgZW5hYmxlZCwgYW5k
IHdoZW4NCj4gc3VjaA0KPiA+ICsgICBhIG5vdGlmaWNhdGlvbiBpcyByZXBvcnRlZCBieSB0aGUg
ZGV2aWNlLCB0aGUgZGV2aWNlIHN0b3BzIHNlbmRpbmcgZnVydGhlcg0KPiA+ICsgICBub3RpZmlj
YXRpb25zIHVudGlsIHRoZSBkcml2ZXIgcmVhcm1zIHRoZSBub3RpZmljYXRpb25zIG9mIHRoZSB2
aXJ0cXVldWUuDQo+ID4gKzIuIFdoZW4gdGhlIGRyaXZlciByZWFybXMgdGhlIG5vdGlmaWNhdGlv
biBvZiB0aGUgdmlydHF1ZXVlLCB0aGUgZGV2aWNlDQo+ID4gKyAgIHRvIG5vdGlmeSBhZ2FpbiBp
ZiBub3RpZmljYXRpb24gY29hbGVzY2luZyBjb25kaXRpb25zIGFyZSBtZXQuDQo+IA0KPiBJJ20g
d29uZGVyaW5nIGhvdyB0aGlzIHJlbGF0ZXMgdG8gdGhlIGV4aXN0aW5nIG5vdGlmaWNhdGlvbiBj
b2FsZXNpbmdbMV0gYW5kDQo+IG5vdGlmaWNhdGlvbiBzdXBwcmVzc2lvblsyXToNCj4gDQo+IFsx
XQ0KPiBUaGUgZGV2aWNlIHNlbmRzIGEgdXNlZCBidWZmZXIgbm90aWZpY2F0aW9uIG9uY2UgdGhl
IG5vdGlmaWNhdGlvbiBjb25kaXRpb25zIGFyZQ0KPiBtZXQgYW5kIGlmIHRoZSBub3RpZmljYXRp
b25zIGFyZSBub3Qgc3VwcHJlc3NlZCBhcyBleHBsYWluZWQgaW4gXHJlZntzZWM6QmFzaWMNCj4g
RmFjaWxpdGllcyBvZiBhIFZpcnRpbyBEZXZpY2UgLyBWaXJ0cXVldWVzIC8gVXNlZCBCdWZmZXIg
Tm90aWZpY2F0aW9uDQo+IFN1cHBwcmVzc2lvbn0uDQo+IA0KPiBbMl0NCj4gSWYgdGhlIFZJUlRJ
T19GX0VWRU5UX0lEWCBmZWF0dXJlIGJpdCBpcyBub3QgbmVnb3RpYXRlZDoNCj4gXGJlZ2lue2l0
ZW1pemV9DQo+IFxpdGVtIFRoZSBkcml2ZXIgTVVTVCBpZ25vcmUgdGhlIFxmaWVsZHthdmFpbF9l
dmVudH0gdmFsdWUuDQo+IFxpdGVtIEFmdGVyIHRoZSBkcml2ZXIgd3JpdGVzIGEgZGVzY3JpcHRv
ciBpbmRleCBpbnRvIHRoZSBhdmFpbGFibGUgcmluZzoNCj4gIMKgwqAgXGJlZ2lue2l0ZW1pemV9
DQo+ICDCoMKgwqDCoMKgwqDCoMKgIFxpdGVtIElmIFxmaWVsZHtmbGFnc30gaXMgMSwgdGhlIGRy
aXZlciBTSE9VTEQgTk9UIHNlbmQgYSBub3RpZmljYXRpb24uDQo+ICDCoMKgwqDCoMKgwqDCoMKg
IFxpdGVtIElmIFxmaWVsZHtmbGFnc30gaXMgMCwgdGhlIGRyaXZlciBNVVNUIHNlbmQgYSBub3Rp
ZmljYXRpb24uDQo+ICDCoMKgIFxlbmR7aXRlbWl6ZX0NCj4gXGVuZHtpdGVtaXplfQ0KPiANCj4g
T3RoZXJ3aXNlLCBpZiB0aGUgVklSVElPX0ZfRVZFTlRfSURYIGZlYXR1cmUgYml0IGlzIG5lZ290
aWF0ZWQ6DQo+IFxiZWdpbntpdGVtaXplfQ0KPiBcaXRlbSBUaGUgZHJpdmVyIE1VU1QgaWdub3Jl
IHRoZSBsb3dlciBiaXQgb2YgXGZpZWxke2ZsYWdzfS4NCj4gXGl0ZW0gQWZ0ZXIgdGhlIGRyaXZl
ciB3cml0ZXMgYSBkZXNjcmlwdG9yIGluZGV4IGludG8gdGhlIGF2YWlsYWJsZSByaW5nOg0KPiAg
wqDCoCBcYmVnaW57aXRlbWl6ZX0NCj4gIMKgwqDCoMKgwqDCoMKgwqAgXGl0ZW0gSWYgdGhlIFxm
aWVsZHtpZHh9IGZpZWxkIGluIHRoZSBhdmFpbGFibGUgcmluZyAod2hpY2ggZGV0ZXJtaW5lZA0K
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2hlcmUgdGhhdCBkZXNjcmlwdG9yIGluZGV4IHdhcyBw
bGFjZWQpIHdhcyBlcXVhbCB0bw0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXGZpZWxke2F2YWls
X2V2ZW50fSwgdGhlIGRyaXZlciBNVVNUIHNlbmQgYSBub3RpZmljYXRpb24uDQo+ICDCoMKgwqDC
oMKgwqDCoMKgIFxpdGVtIE90aGVyd2lzZSB0aGUgZHJpdmVyIFNIT1VMRCBOT1Qgc2VuZCBhIG5v
dGlmaWNhdGlvbi4NCj4gIMKgwqAgXGVuZHtpdGVtaXplfQ0KPiBcZW5ke2l0ZW1pemV9DQo+IA0K
PiBSZWdhcmRpbmcgbm90aWZpY2F0aW9uIHN1cHByZXNzaW9uOg0KPiAxLldoZW4gdGhlcmUgaXMg
VklSVElPX05FVF9GX0VWRU5UX0lEWCwgZXZlbiBpZiB0aGUgbm90aWZpY2F0aW9uIGNvYWxlc2lu
Zw0KPiBjb25kaXRpb24gaXMgbWV0LCB3ZSBuZWVkIHRvIHdhaXQgZm9yIHRoZSB1c2VkX2V2ZW50
IG5vdGlmaWNhdGlvbiBjb25kaXRpb24gdG8NCj4gYmUgbWV0KHRoZSBkcml2ZXIgZG9lcyBub3Qg
cmVhcm1zIHRoZSBub3RpZmljYXRpb24gb2YgdGhlIHZpcnRxdWV1ZSBub3cgYW5kDQo+IHRoZSBh
dmFpbCByaW5nwqAgaXMgc2V0IFZSSU5HX0FWQUlMX0ZfTk9fSU5URVJSVVBUIGluIGZsYWcpLg0K
PiAyLldoZW4gdGhlcmUgaXMgbm8gVklSVElPX05FVF9GX0VWRU5UX0lEWCwgaWYgdGhlIGRyaXZl
ciB0dXJucyBvZmYgdGhlDQo+IG5vdGlmaWNhdGlvbiwgZXZlbiBpZiB0aGUgbm90aWRpY2F0aW9u
IGNvbmRpdGlvbiBpcyBtZXQsIHRoZSBkZXZpY2UgY2Fubm90IHNlbmQNCj4gdGhlIG5vdGlmaWNh
dGlvbi4NCj4gDQo+IFRoZXJlZm9yZSwgaWYgSSdtIG5vdCB3cm9uZywgYSBkZXZpY2UgY2FuIGlz
c3VlIGEgbm90aWZpY2F0aW9uIG9ubHkgaWYgdGhlIGRldmljZSBpcw0KPiBub3Qgc3VwcHJlc3Nl
ZCBmcm9tIG5vdGlmeWluZyB0aGUgZHJpdmVyLg0KPiBbMV1bMl0gc2VlbXMgdG8gaGF2ZSBtZXQg
dGhpcyBjb25kaXRpb24uDQoNCk5vdGlmaWNhdGlvbiBzdXBwcmVzc2lvbiB1c2luZyBfRVZFTlRf
SURYIGZvciBub24tbWVtb3J5IHRyYW5zcG9ydCBpcyBqdXN0IHN1Yi1vcHRpbWFsIGZvciB0d28g
cmVhc29ucy4NCg0KMS4gSXQgcmVxdWlyZXMgZGV2aWNlIHRvIHBvbGwgb24gdGhlIHVzZWQgZXZl
bnQgdG8gbGVhcm4gYWJvdXQgd2hlbiB0byB1bi1zdXBwcmVzcy4gKGFybSkNCjIuIHRoaXMgYml0
IGFsc28gY29udHJvbHMgZHJpdmVyIG5vdGlmaWNhdGlvbnMgeWV0IGFnYWluIGRlbWFuZCBkZXZp
Y2UgdG8gYXJiaXRyYXJpbHkgcG9sbCBvbiBuZXcgZGVzY3JpcHRvcnMgcG9zdGluZw0KDQpIZW5j
ZSwgYW4gZWZmaWNpZW50IHNjaGVtZSBpcyBuZWVkZWQgYW5kIGRldmljZSBub3RpZmljYXRpb25z
IHRvIGJlIGRldGFjaGVkIGZyb20gZHJpdmVyIG5vdGlmaWNhdGlvbi4NCkFuZCBub3cgdGhhdCBW
USBsZXZlbCBub3RpZmljYXRpb24gY29hbGVzY2luZyBpcyBpbiBwbGFjZSwgd2hpY2ggc3VwcHJl
c3NlcyB0aGUgZGV2aWNlIG5vdGlmaWNhdGlvbnMsIGl0IGlzIGxvZ2ljYWwgdG8gY29tYmluZSBp
dCB3aXRoIFZRIGRldmljZSBub3RpZmljYXRpb25zLg0KDQoNCg==

