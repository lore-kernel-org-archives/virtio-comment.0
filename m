Return-Path: <virtio-comment-return-6326-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91AFC7EE2E
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 12:24:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CC1576004B
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 12:24:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C04ED986542
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 12:24:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B0ADF9842EA; Tue, 13 Jun 2023 12:24:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9CC5798653E;
	Tue, 13 Jun 2023 12:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPLHmNkUMkEvUN8C/bpPeWuWSNQevNk/dFWWlmO0zxzO7NmBzuDrvW17O/uj570M8bMI3X2SFVueSt2wNw++EtpyMQ3tHLamMdnw+xAEQhmPwu/7CtV4+0j/Ngw06yd3kRqYg0PM38axnQDkEYCGutKIlDb2shyQ9COTh4Sob+b8yWlPLNiTU3Wh6Dd2klTFtS6jhkHIko/mypTYBU6tXjLOaxNv2s0rsvAyX47vTOynaV5buzRXJJgmaN12Qb28H+/aguJLjfglOKVztvQp2FRGFeLyjI93inoAiK+MHCnm+LIf2WZxRHXDkP8v/nX8c9k65tg+k7PqgbNxd4mHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThXImHkqkdxIpt2eCPykmcHSzjJ4CGpcHY4bqIdtFh0=;
 b=LyxEKHwCJjYOP8rjcGrNrQrC4wYF8fZ4lRm7Mbmj6NtK1Z6I3U4c9JCk2UhRBUeqiHvnSSgEMNEHrnD7uciXsRJkDGz657ICf1MAAMoLZJ55MuvAUk8XCnAdgDhqyqcJFsH/NsGcF1mYHGbcKHp7mvcoKiNCGhDynfedt3NS4d6kzJTq2JKkJhNZ2JbXAfNcyWcRH8Dg2asCmUKZdR+YzaUXTB+S3QgsQV+TM+NuogdlObnTeWh67GyhCCXL8ffIU0uPojQ64xcA6EzyB2QEvwu/vi3N87rimlVgolZ64r+4FO10v6CJS243YvywCtzgw8ugJHGbsFKHekonU3rNAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
CC: Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Thread-Topic: [virtio] [PATCH requirements 5/7] net-features: Add n-tuple
 receive flow steering requirements
Thread-Index: AQHZlNTpsDXVjHsOf0G4vfVcY0pgc6+IG88AgAAT5pCAAA+sgIAAeVnQ
Date: Tue, 13 Jun 2023 12:24:06 +0000
Message-ID:
 <PH0PR12MB5481978B30D222EE4E3254FBDC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-6-parav@nvidia.com>
 <ae7b4a7f-dc9b-3466-1a46-8535f288856a@linux.alibaba.com>
 <PH0PR12MB548142D52698EFD9E101D555DC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2e035358-d16e-92ae-e4c3-92d141787876@linux.alibaba.com>
In-Reply-To: <2e035358-d16e-92ae-e4c3-92d141787876@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN2PR12MB4406:EE_
x-ms-office365-filtering-correlation-id: 852e4777-aa68-4c0f-6641-08db6c09151a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tQelE2m+GKYCn6N36Ek1rNIz8cHD7m7P5Jl/CNJKDJpaRw+q5Z0omLG+SikFaStLyU8d+ixmboigBuX+OfjzyEMvqu0fE1JqemAO2xq+xvyuUVUPKIpk+wULJ/lzytD0ZPMgN+/1AK8Plj5TGwQp1Voft2PN1C0x2kwM8gGSnSi2mSX1YXo1G9F7T5mpGypUndsG9RDyenMepiSfhK/KOmyfW0+ILVc0PZ7tYU4grHRRbpd/8t3Fw9gtdyoz8CRWP912GT6FRbpOvad7S2G3SFzh7ZDdz6I1IUiz3hNaahG4cW8N+ztYcaKqO6sCfJYMESSs9ERFKypmWLZ4wHfsrAimX0oSgtDco+R5qC70rKz3Mat0gtoc46krWjqGseFSl4iSki6qCagT6Lou78AeCA0OnynyG/+s+frMMSxeYRt8BeIgBM08ykBKTQ9QTbrK73M26Ic62vGmhUVC5t5H8myWrwpS0LS0UxbmD8KYHPEIo7jbD/daCQCtPI8HUPGkDnbfV+BgocNqyQff2ww+E49/9n5+PMETejzXUKfab8FpeOb0ump8Li698NDxeQGv/oPEU9uYy3qkKSMMjBr9OROvppnpOE1ebeVGY9WFY+yltMogO6vhg1zLcROj8V3f
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199021)(5660300002)(52536014)(8676002)(8936002)(2906002)(66556008)(66446008)(64756008)(66476007)(66946007)(110136005)(76116006)(54906003)(71200400001)(7696005)(4326008)(9686003)(6506007)(186003)(41300700001)(316002)(66899021)(83380400001)(478600001)(33656002)(38100700002)(38070700005)(86362001)(55016003)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGgxeWFuYzZSSFFNMDltN2pFSi9BV3pQbHg2UDk0ajd1NzZ1K0dwV0VYT3hK?=
 =?utf-8?B?V3VadjhOakVacFVqZHdyZEV0OXhzVVdxZG9hUTd3Sit3dTlYSFY2L2ljL2Vp?=
 =?utf-8?B?L2JzUnJCczRwMzhadWtGQWkvdXVNZUdHVExCTStwZmhZYk9tZ0pIVWdGNkdS?=
 =?utf-8?B?cHhpdmtvVkZkZHVjODFJWnZRaTE3NUl4TjJFeDRjS0YwL0lFSUpFNmNTVnJJ?=
 =?utf-8?B?MzEvbUgwcjA0a1Zkc2FjS3VHcVJTTnRnOWJXYUFJa1FqTWJwRmVXM0pCdXU5?=
 =?utf-8?B?MkE2aGF6cGZINmFuOWRqQUtJVk5kUjFNWWNBWFltT2tGVjlzR3g0ZFlyRVJo?=
 =?utf-8?B?MTZZWDJ4OVZ6OWtLWW9XSFpIMFIybWNUTHNxYnkvbThzeHdFWWJKeWMrNkIy?=
 =?utf-8?B?SFVNWStocWF0cHZBc3FrRmZQSGJ2bWFXZ2ZBSlJVZFBveSswRnlqcktPcDVM?=
 =?utf-8?B?RVBONWpkMC8raFpKbmtKN0ZvRmFGYzZmaE9xWHRzWWh3T0tYNEV1U1g3OUk4?=
 =?utf-8?B?bnFNandzeE9XOGRWeS8xZERwTHFjdVhwQmFLMm96aXlYUjZ5cnJFVEpuNEtY?=
 =?utf-8?B?R0c5WGwxUUU0dEpKSWdycDh5Ri8xY2dicmhFOWpXMVN2ckFkQ2loUTAzTDlP?=
 =?utf-8?B?NDQrSzhFSVBJanQxK3lkQ3Z6MmhxQlp0aFR2NGZUVnorZzVNTmphMzVKbi9y?=
 =?utf-8?B?aVN0aGVPL2ZoZjI2KzBYbEcvMUNYdmxaMlFKR0R6NnpsTlVQcERsdHRRMWor?=
 =?utf-8?B?V2gvcU5wWnhlSHBaSVRvNldIdzYxa3RFZWRZUkhrNmtkQk5JbFFQb2IyMzA2?=
 =?utf-8?B?ZFd0dnUrdjFybWJFWC9GbndCcGJxVUlCWndpWDNURXR0SGhjamN5R0hkQ0xD?=
 =?utf-8?B?Q3V6Z1FHSTF4QURuOEhaYis2aG5sdCtNdUJSQUNXazM5cFhaWWpEZExlM1ZD?=
 =?utf-8?B?WXJQWkVLSUNueVFEMm9waTkrck55Z0JmZ2JUVEhSMEtTTnNFNWdwc0FPL2pQ?=
 =?utf-8?B?TDFpWnZkRW90OVlOb3lDK0RYaG5pRm9KNk55UmdtN1NCUm9WZHNxTGdxQmlV?=
 =?utf-8?B?SXF0KzdMOGZlZ0RqY1ZVQzd4V25iQUNMaXBwaFRtd3NQVUhWT3hmYkxmZTFB?=
 =?utf-8?B?ZFJ0ZWJ3eTRBMFJVN2dUTytGcWFNYVd6RlB4Q09KN3AvY2lCdjhIZFQ3Smsz?=
 =?utf-8?B?Z2FYU2JjY3pHcEdSSUVWNE9JUjM2eXZmU25SRXNiaFllMmwyRWpjWkdsbm1V?=
 =?utf-8?B?RW1MK3NiSlk2bHNvYlRUYi9jR0g3cS8wLzJ6RDIrRjlkN1F6Q3pSbCttUmlm?=
 =?utf-8?B?Umh2N1BxeWQxSGcwdHZUTm1DdWRsUExpQlByWThReFh2aWV3bFo1WldRSUg4?=
 =?utf-8?B?b3I5YVpSWDRPSHhMNWsyNDJtOTZMU09zd1VDdG1lRVBZWS81c2dnQW5PdldH?=
 =?utf-8?B?UHBuakdNSjJPK2w1K3dtanFZUjBEV3crNnhicnJJcS9OM2drUjZNWUZTSGc3?=
 =?utf-8?B?Yjc3WHZZVWNlNlNrT3grdUJuVTZ3YS9hMWxVcW5GeHd0Qnl6azZFanJ5bUlT?=
 =?utf-8?B?MHc3NGJBYVZhTkNydkxFZVdESjcxZ3lxRFMwaFlUa1ljT1Ayb0I5L1JJa2o3?=
 =?utf-8?B?Rk1ZNWliY3RkYzJDWnYrU1B1bDE2eGZxNERkSklBV0xiLzJmQlZHQk54NnIv?=
 =?utf-8?B?ZUJiVEhGN1JzNG9FeGhtSVNLT1p3MHZmcDIwbk9WOXVXWVJIRFJzR2NyN3dk?=
 =?utf-8?B?bm4xNVFSUU95ZEJtd2E4M3BRUEFxdC9sM2lRSU1zMlVkSXp1WmtSYWtJRHZP?=
 =?utf-8?B?TlZGNW9hTXIxMnBXWDhvbHA2N2cvSEhZUlhNb1UzV2MycW96R1lqMzcyTjdI?=
 =?utf-8?B?YStONWw0Myt1ekVsTHVOQnNSSXZjeXZTU1NDdEFvVXhyVnNWYjBBL2FvNm5P?=
 =?utf-8?B?UFVEM1hDeWtoVFZOeFZ1MHI2K3ZTR0hxUmZMbVlzRHJDcGFpSDViVVJ5Z2tl?=
 =?utf-8?B?NGszVXhNZ3NsNUFsekNWcUZXOWJOZ0kzbjFLcHEwLytSclZsOEhiNXFXTHdD?=
 =?utf-8?B?RnljOTQ1Y0tQd3B3ZmhHd1NoeEo0WFRzUUNYMCtRQmZ3aytuS2w5MHArOVhB?=
 =?utf-8?B?b21oa3dZVEdVclBtbTZibFc0UjJZSGRaajNWRU5ZbEg0QkxNMXdXbGd1Yk0x?=
 =?utf-8?Q?8TS9vch6m9aPN4llCkb5n48=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 852e4777-aa68-4c0f-6641-08db6c09151a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 12:24:06.7353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AWyXOKCTWEqiCOTySO/qxJ0lHd6uF2N3oBsUkn6sOg7pjyGZHKnUdZyCk54vqghr1Cl/g2EsmaUJHtyLONc2NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4406
Subject: [virtio-comment] RE: [virtio] [PATCH requirements 5/7] net-features: Add n-tuple
 receive flow steering requirements

DQoNCj4gRnJvbTogSGVuZyBRaSA8aGVuZ3FpQGxpbnV4LmFsaWJhYmEuY29tPg0KPiBTZW50OiBU
dWVzZGF5LCBKdW5lIDEzLCAyMDIzIDE6MDQgQU0NCj4gDQo+IA0KPiDlnKggMjAyMy82LzEzIOS4
i+WNiDEyOjE2LCBQYXJhdiBQYW5kaXQg5YaZ6YGTOg0KPiA+DQo+ID4+IEZyb206IEhlbmcgUWkg
PGhlbmdxaUBsaW51eC5hbGliYWJhLmNvbT4NCj4gPj4gU2VudDogTW9uZGF5LCBKdW5lIDEyLCAy
MDIzIDEwOjU3IFBNDQo+ID4gWy4uXQ0KPiA+Pj4gKzQuIFRoZSBtYXRjaCBjcml0ZXJpYSBtYXkg
b3B0aW9uYWxseSBhbHNvIGluY2x1ZGUgc3BlY2lmaWMgcGFja2V0DQo+ID4+PiArZGF0YSBvZmZz
ZXQsDQo+ID4+IElzIHRoaXMgdGhlIG9mZnNldCBvZiB0aGUgcGFja2V0IHBheWxvYWQgKG5vdCBp
bmNsdWRpbmcgdGhlIHBhY2tldA0KPiA+PiBoZWFkZXIpPyBJZiB5ZXMsIHdoYXQgbWlnaHQgYmUg
dGhlIHVzYWdlIHNjZW5hcmlvcz8NCj4gPj4NCj4gPiBTb21lIHBhY2tldCBoZWFkZXIgZmllbGRz
IG1heSBub3QgYmUgZGVmaW5lZCBpbml0aWFsbHkgYnkgdXMuDQo+ID4gRm9yIGV4YW1wbGUgc29t
ZSBwcm90b2NvbCBGT08gdHlwZSB3aGljaCBoYXMgc29tZSBoZWFkZXIgYWZ0ZXIgVURQDQo+IGhl
YWRlci4NCj4gPiBBbmQgd2FudHMgdG8gZmlsdGVyIGFuZCBzdGVlciB0byBhIHNwZWNpZmljIFJR
Lg0KPiANCj4gT2ssIEkgZ290IGl0Lg0KPiANCj4gPg0KPiA+IEEgdmlydGlvIG1heSBub3QgaGF2
ZSBkZWZpbmVkIHN1Y2ggcHJvdG9jb2wgYXQgdGhlIGJlZ2lubmluZy4gU28gYSBnZW5lcmljDQo+
IGV4dGVuc2lvbiBhbGxvd3MgdG8gc3RlZXIgcGFja2V0Lg0KPiA+IEF0IHRoYXQgcG9pbnQgbGlu
ZSBiZXR3ZWVuIGhlYWRlciBhbmQgZGF0YSBpcyBibHVycnkuIDopDQo+IA0KPiBUaGVuIEkgdGhp
bmsgaXQncyBqdXN0IGFuICpvZmZzZXQqIGZyb20gdGhlIHN0YXJ0IG9mIHRoZSBwYWNrZXQgc28g
d2UgY2FuIHVzZSB0aGlzDQo+IGNhcGFiaWxpdHkgZm9yIHRoZSBwYWNrZXQgaGVhZGVyIGFzIHdl
bGwuDQo+DQpZZXMsIHdpbGwgY2hhbmdlIGl0LiAicGFja2V0IGRhdGEiIHdhcyBtaXNsZWFkaW5n
LiBJdCBpcyBqdXN0IHRoZSBwYWNrZXQgb2Zmc2V0Lg0KIA0KPiA+DQo+ID4+PiArICAgbGVuZ3Ro
LCBhbmQgbWF0Y2hpbmcgcGF0dGVybiwgd2hpY2ggbWF5IG5vdCBiZSBkZWZpbmVkIGluIHRoZQ0K
PiA+Pj4gKyBzdGFuZGFyZA0KPiA+PiBSRkMuDQo+ID4+PiArNS4gQWN0aW9uIGluY2x1ZGVzIChh
KSBkcm9wcGluZyBvciAoYikgZm9yd2FyZGluZyB0aGUgcGFja2V0Lg0KPiA+Pj4gKzYuIERlc3Rp
bmF0aW9uIGxvY2F0aW9uIGlzIGEgcmVjZWl2ZSB2aXJ0cXVldWUgaW5kZXggb3IgcnNzIGNvbnRl
eHQuDQo+ID4+PiArNy4gVGhlIGRldmljZSBzaG91bGQgcHJvY2VzcyBSRlMgcnVsZXMgYmVmb3Jl
IFJTUyBydWxlcywgaS5lLiwgd2hlbiB0aGVyZSBpcw0KPiBhDQo+ID4+PiArICAgbWlzcyBvbiB0
aGUgUkZTIHJ1bGUgUlNTIHJ1bGUgYXBwbGllcy4NCj4gPj4+ICs4LiBUaGUgZGV2aWNlIHNob3Vs
ZCBiZSBhYmxlIHRvIGFkZC9yZW1vdmUgdGhlc2UgcnVsZXMgYXQgYSByYXRlIG9mIDEwMEsNCj4g
Pj4+ICsgICBydWxlcy9zZWMuDQo+ID4+IFdoeSBkbyB3ZSBuZWVkIHRvIGFkZCB0aGlzIGxpbWl0
IGZvciB0aGUgZGV2aWNlIHBsZWFzZT8gSSB0aGluayB0aGF0DQo+ID4+IGRpZmZlcmVudCBkZXZp
Y2VzIG1heSBoYW5kbGUgY3RycSBhdCBkaWZmZXJlbnQgc3BlZWRzLg0KPiA+Pg0KPiA+IEFSRlMg
cnVsZXMgaW5zZXJ0aW9uIGlzIGZhc3QgYW5kIHRjcCBzdHJlYW1zIHNob3VsZCBiZSBhYmxlIHRv
IGNvbnZlcmdlIHF1aWNrZXINCj4gb24gdGhlIGRlc2lyZWQgY3B1Lg0KPiA+IFNvIHJ1bGUgaW5z
ZXJ0aW9uIHNob3VsZCBiZSBmYXN0IGVub3VnaC4NCj4gPiBNYW55IG9mIHRoZSBkZXZpY2UgY2Fu
L21heSBiZSBhYmxlIHRvIGRvIHRoaXMgYXMgc29tZSBzZW1pLWZhc3QgcGF0aA0KPiBvcGVyYXRp
b24gdW5saWtlIENWUSB3aGljaCBpcyB0eXBpY2FsbHkgYSBkZXZpY2UgbGV2ZWwgY29udHJvbCBv
cGVyYXRpb24sIG9mdGVuDQo+IGRvbmUgYXMgc2xvdyBwcm9jZXNzLg0KPiANCj4gV2UgbmVlZCB0
byBjb25zaWRlciBBUkZTIGZvciByZWNlaXZlIGZsb3cgZmlsdGVycywgYnV0IHJlY2VpdmUgZmxv
dyBmaWx0ZXJzIGFyZQ0KPiBtb3JlIGluZnJhc3RydWN0dXJlLCBkbyB3ZSBuZWVkIHRvIG9mZmVy
IGEgc3ViLWZlYXR1cmUgdG8gZGlzdGluZ3Vpc2ggd2hldGhlciBhDQo+IGRldmljZSBzdXBwb3J0
cyB0aGlzIGRlZGljYXRlZCBxdWV1ZSBvciBub3QuDQo+IFRoaXMgYmVjb21lcyBlYXNpZXIgZm9y
IHVzZXJzIHdobyBvbmx5IHVzZSByZWNlaXZlIGZsb3cgZmlsdGVycyB3aXRob3V0IEFSRlMNCj4g
ZW5hYmxlZC4NCj4gQXQgdGhpcyBwb2ludCwgQVJGUyBhbmQgcmVjZWl2ZSBmbG93IGZpbHRlcnMg
YmVjb21lIG9ydGhvZ29uYWwuDQo+IA0KSWYgaXTigJlzIGEgImZsb3d2cSIgZGVkaWNhdGVkIHF1
ZXVlIGRldmljZSBib3RoIHRoZSByZXF1aXJlbWVudHMgYXJlIGFkZHJlc3NlZC4NCkRldmljZSBj
YW4gY2hvb3NlIHRvIGltcGxlbWVudCBpbiBpdHMgcHJlZmVycmVkIHdheS4NCg0KPiA+DQo+ID4g
U28gZHJpdmVyLWRldmljZSBpbnRlcmZhY2UgdG8gYmUgYWJsZSB0byBzY2FsZSB1cCB0byBsb3cg
bGF0ZW5jeSBhbmQgaGlnaA0KPiB0aHJvdWdocHV0IGZsb3cgaW5zZXJ0L2RlbGV0ZSBvcHMuDQo+
IA0KPiBPay4NCj4gDQo+ID4gSXQgaXMgb2sgb25lIGRldmljZSBtYXkgY2hvb3NlIHRvIG5vdCBz
dXBwb3J0IHN1Y2ggaGlnaCByYXRlLCBidXQgaW50ZXJmYWNlDQo+IGRlZmluaXRpb24gd2lzZSBJ
IGltYWdpbmUgdG8gYmUgb24gaXRzIG93biBkZWRpY2F0ZWQgcXVldWUuDQo+ID4NCj4gPj4+ICs5
LiBJZiBtdWx0aXBsZSBydWxlcyBhcmUgcHJvZ3JhbW1lZCB3aGljaCBoYXMgb3ZlcmxhcHBpbmcg
YXR0cmlidXRlcyBmb3IgYQ0KPiA+Pj4gKyAgIHJlY2VpdmVkIHBhY2tldCwgdGhlIGRyaXZlciB0
byBkZWZpbmUgdGhlIGxvY2F0aW9uL3ByaW9yaXR5IG9mIHRoZSBydWxlLg0KPiA+Pj4gKzEwLiBU
aGUgZHJpdmVyIHNob3VsZCBiZSBhYmxlIHRvIHF1ZXJ5IGZsb3cgc3RlZXJpbmcgdGFibGUgZW50
cmllcw0KPiA+PiBwcm9ncmFtbWVkIGluDQo+ID4+PiArICAgIHRoZSBkZXZpY2UgYnkgdGhlIGZs
b3cgaWQuDQo+ID4+IENvbWJpbmluZyBwb2ludHMgOSBhbmQgMTAsIGNhbiBJIGRlZHVjZSB0aGF0
IHRoZSBhdHRyaWJ1dGVzIG9mIGEgZmxvdw0KPiA+PiBydWxlIGluY2x1ZGUgaWRlbnRpZmllciAo
aWQpLCBwb3NpdGlvbiAoaW5kZXggb2YgdGhlIHJ1bGUgZW50cnkpIGFuZCBwcmlvcml0eT8NCj4g
PiBZZXMsIEkgYWxzbyB0aGluayB0aGF0IHdheS4NCj4gPg0KPiA+PiBBY2NvcmRpbmcgdG8gcG9p
bnQgMTEsIHRoZSBkcml2ZXIgbmVlZHMgdG8gcHJvdmlkZSBhIHVuaXF1ZSBpZCwgaWYNCj4gPj4g
dGhlIGxvY2F0aW9uIGFuZCBwcmlvcml0eSBhcmUgbm90IHByb3ZpZGVkLCB0aGV5IHNob3VsZCBo
YXZlIHByZWRlZmluZWQNCj4gZGVmYXVsdCB2YWx1ZXMuDQo+ID4+DQo+ID4gWWVzLg0KPiA+IEkg
YW0gbm90IGZ1bGx5IHN1cmUgb2YgaXQgYXMgaXQgYnJpbmdzIHNvbWUgdW5jZXJ0YWludHkgaW4g
YmVoYXZpb3IuDQo+ID4gU28gaGF2aW5nIHNlY29uZCB0aG91Z2h0IGFzIGRyaXZlciB0byBhbHdh
eXMgcHJvdmlkZSBpdC4NCj4gDQo+IFllcywgYW5kIHRoaXMgcG9pbnQgaXMgc3BlY2lmaWMsIHRo
ZW4gd2UgY2FuIGNvbnRpbnVlIHRvIGNvbmZpcm0gaXQgaW4gdGhlIGZ1dHVyZQ0KPiBzcGVjIHZl
cnNpb24uDQo+IA0KT2suIEkgd2lsbCByZXZpc2UgaXQgaW4gdjEuDQoNCj4gPg0KPiA+Pj4gKzEx
LiBUaGUgZHJpdmVyIHNob3VsZCBiZSBhYmxlIHRvIGFkZCB0aGUgZW50cnkgZm9yIGF0dHJpYnV0
ZXMgKGEpIG1hdGNoDQo+ID4+PiArICAgIGNyaXRlcmlhLCAoYikgYWN0aW9uLCAoYykgZGVzdGlu
YXRpb24gYW5kIChkKSBhc3NpZ24gYSB1bmlxdWUgaWQgb2YgMzIgYml0cy4NCj4gPj4+ICsxMi4g
VGhlIGRyaXZlciBzaG91bGQgYmUgYWJsZSB0byBkZWxldGUgdGhlIHN0ZWVyaW5nIHJ1bGUgZW50
cnkgdmlhDQo+ID4+PiArYSB1bmlxdWUNCj4gPj4gaWQuDQo+ID4+PiArMTMuIFRoZSBkcml2ZXIg
c2hvdWxkIGJlIGFibGUgdG8gYWRkIGFuZCBkZWxldGUgdGhlIHN0ZWVyaW5nIHJ1bGVzIGluIG91
dCBvZg0KPiA+Pj4gKyAgICBvcmRlciBtYW5uZXIgd2l0aG91dCBkZXBlbmRpbmcgb24gcHJldmlv
dXMgY29tbWFuZHMuDQo+ID4+PiArMTQuIEEgZ3JvdXAgbWVtYmVyIGRldmljZSBzaG91bGQgYmUg
YWJsZSB0byBxdWVyeSB0aGUgYXR0cmlidXRlcyBvZg0KPiA+Pj4gK3RoZQ0KPiA+PiBmbG93DQo+
ID4+PiArICAgIHN0ZWVyaW5nIHRoYXQgZGV2aWNlIHN1cHBvcnRzLg0KPiA+PiBEb2VzIGEgZ3Jv
dXAgbWVtYmVyIGRyaXZlciBzdXBwb3J0IGluc2VydGlvbiBydWxlcz/CoCBUaGUgZ3JvdXAgb3du
ZXINCj4gPj4gZHJpdmVyIGFuZCBhIGdyb3VwIG1lbWJlciBkcml2ZXIgc2hvdWxkIGhhdmUgdGhl
IGFiaWxpdHkgdG8NCj4gPj4gYWRkL3JlbW92ZSBydWxlcyBmb3IgdGhlbXNlbHZlcy4NCj4gPj4N
Cj4gPiBZZXMsIEdyb3VwIG93bmVyIGFkZHMgcnVsZSBmb3IgdGhlIHNlbGYsIG5vdCBvbiBiZWhh
bGYuDQo+ID4gU2FtZSBhcyBncm91cCBtZW1iZXIuDQo+ID4gTm8gZGlmZmVyZW5jZSBiZXR3ZWVu
IHRoZW0gYXMgdGhleSBvcGVyYXRlIG9uIHNlbGYgZGV2aWNlLg0KPiANCj4gT2suDQo+IA0KPiA+
DQo+ID4gSW4gZnV0dXJlLCBhIGdyb3VwIG93bmVyIG1heSB3YW50IHRvIHN0ZWVyIHRoZSBwYWNr
ZXQgdG93YXJkcyBhIGdyb3VwDQo+IG1lbWJlciwgbGlrZSBlc3dpdGNoLg0KPiANCj4gWWVzLg0K
PiBBbmQgd2hhdCBJIHdhbnQgdG8gc2F5IGlzIHRoYXQgb3VyIGNsb3VkIGFyY2hpdGVjdHVyZSBp
cyBzaW1pbGFyIHRvIHR3by1sYXllcg0KPiB2aXJ0dWFsaXphdGlvbiwgYnV0IHdlIG9ubHkgaGF2
ZSBvbmUgbGF5ZXIgb2YgZXN3aXRjaCwgc28gd2UgbmVlZCBWRiBpZCB0byBsZXQNCj4gZXN3aXRj
aCBwcm92aWRlIHNpbXBsZSBmbG93IHN0ZWVyaW5nIGZvciB0aGUgc2Vjb25kIGxheWVyIG9mIHZp
cnR1YWxpemF0aW9uLCBhbmQNCj4gZG8gbm90IG5lZWQgY29tcGxpY2F0ZWQgZXN3aXRjaC4NCj4g
VGhpcyBpcyB0aGUgcHVycG9zZSBvZiBjYXJyeWluZyBWRiBpZCwgYnV0IG5vdyB3ZSBjYW4gbm90
IGNvbnNpZGVyIHRoaXMgKFZGIGlkKSBpbg0KPiB0aGUgZmVhdHVyZSBvZiByZWNlaXZlIGZsb3cg
ZmlsdGVycywgc28gYXMgbm90IHRvIGhpbmRlciB0aGUgcHJvZ3Jlc3Mgb2YgdGhpcw0KPiBmZWF0
dXJlLg0KPiANCk9rLiBMZXRzIGtlZXAgdGhpcyBpbiBub3RlcyBhbmQgbWluZCB0byBoYXZlIHRo
ZSBhYnN0cmFjdGlvbiBhbmQgZG9u4oCZdCBqdW1wIHRvIGJha2UgdmYgaWQgaW4gdGhlIHNwZWMg
aW4gdGhlIGluaXRpYWwgdmVyc2lvbi4NCg==

