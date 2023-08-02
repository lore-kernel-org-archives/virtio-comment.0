Return-Path: <virtio-comment-return-6956-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AEDC001DE
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 08:59:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 669662A882
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 08:59:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 487F3986649
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 08:59:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 357679865F7; Wed,  2 Aug 2023 08:59:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 130C39865F9;
	Wed,  2 Aug 2023 08:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqlcQTFkEc5X9hyLdNXbQKS/3lNmHLyOMkIYTyzE75SxtwURRW4v7Ufrf4Ed74w4r+VRgI7FoelEqm+rdbuJ+nQD9snpBLVPzIS/4/M0j472K4DHyHMthrkZi1ZTjLKdLJT6+JaZU79B1cQuwNtEs5voI3j9rKjfnxyJcJ9pvID41YbmbLWFu00XZs9LnFVzwFbz5tk1ToTGLqGDC4psJ8PyYDoAb1oO4/T7kwZ6VbjzsLgkSlsxhr1+y8NfZby0pbndmfTHbEPDKH9id0xfVJEm3txCQ2VFL6K1VQSojGA+TlxuGCZamuxCnD7HKvSyRmgCjOJ3edB7qvJBhL6Lsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hqn5Inf13IJpASsvoibqE11OYmPDnnSBGLNDlOXTe7E=;
 b=GKPxs+0tTAhJ0oby1TwZglVh37FO01QzWtbgEn7QGMhDN7olf3ITcAlEnoDxINU8OeoVLPvMHA4FmkKI0SX+f07Q8++ftNejc3vQeiDC784BiE0eQEbmL4yEBGZ2SDSG+zA58N/mZsryxcjw0oQnTje3RMhFm70C4Q8AhjcuX2mSt0ADBGgwi6jQ5k0C2Pym3nMaVy/z2JgDxMuhV+n+o8j8igV571588jgxFpOeY9WUGo0hxbwoL3SQuAnka/gFVKBBv8Fx03l1qRAyzO3xskYex10uk+NF+zpIVJZOkG0UNPYyHKz1MZuzxk8yPKxY7sLEF1ZDNeurzKfvQeMG0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
Thread-Topic: proposal: use admin command (and aq) of the device to query
 config space
Thread-Index: AdnERrUyzvIBkM4LRwukraLndwiuSgAseh0AAAlA/AAAAFJY4A==
Date: Wed, 2 Aug 2023 08:59:30 +0000
Message-ID:
 <PH0PR12MB54813732BE7EA68DC440D981DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802000955-mutt-send-email-mst@kernel.org>
 <3b88c1fe-a5c8-7bc3-b30b-5babe741ffb9@intel.com>
In-Reply-To: <3b88c1fe-a5c8-7bc3-b30b-5babe741ffb9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5029:EE_
x-ms-office365-filtering-correlation-id: 5baa5fa5-c752-4545-0f84-08db9336c871
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 UDqVBgpsjVOYASeWBfq8scTaijx7f108GiLxVfVPsbpts91PMCVo7zCiXy6x2PDb5GJNSjmRytjAi8MGL+CIeG4suTNAoBMXnMfC4/0MVGt5pMQPO00R4IIiPKkdZ4EHB4kCRd8r8wtYUprCl+W8e8PUuQhCdOs1nRlOZbnVcGwP/SRcLcQ4gXwjLwQuhIIxfuauO3Vw5iv7Om4HCZHjzc+wS2wYFa8hzGDkJAAtrQ5ndzgLv+mMgYARMJ3bcEcQmZIxNVq1rb27flgPJcmhWMoUevizxr8pCXJEUQUinWnwyOnquc5LWMZZhNH7+h6ENprLRU7TsvaN229Uuf1C34jo6A3cAkLqq7iJqGMUKvIUfYQMWdj2TmUthYrMbF9J4w9SyrJmKdWWDj9yEaPoJ2KpUZHXwljKydUWQzr0W7i6SNi5XIxbMVzZH4RD2pZfRX71LMnDSfZcIWW9jwGNRzQ9CrGycfIAjANPiZILN3wo/qHirF04a8yIKmnv37maba1yAt7/rn9WbASVJxOdQ9MGieA0G0CSZGsr0Tb01YZQ8acUUAQ35GXSV9LOJor45fxeWPYVSILyVn+g1twyQRYoLQ2+LTlZI+hZZmOKIUpYxk7W3h1QCCa9d6rYit9j
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199021)(64756008)(66446008)(66556008)(66476007)(4326008)(52536014)(66946007)(76116006)(2906002)(38100700002)(122000001)(186003)(6506007)(26005)(38070700005)(83380400001)(54906003)(110136005)(55016003)(86362001)(478600001)(33656002)(9686003)(71200400001)(7696005)(41300700001)(8936002)(8676002)(5660300002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZjFLV1NSbHlQMzlpTkFvRGZ2N3krdld6QW9yRjhXMEEzZ2FtMjNpeHVTYitn?=
 =?utf-8?B?NmpXZ0FYUCtyUjdaWklFOGVwTHd2R05DSDBlWlRGd0xtNkxHNk1TMncwODdr?=
 =?utf-8?B?d2EwbWZGWjVtS2NtMVh0VVBjZDV1d2paR0g4L2hMM00vWko2NXB4NjZBNlJN?=
 =?utf-8?B?N1FhUnhVZ1pUYzhhUUNVb1FQdHBicE5VaHcyZURabnJGMlZHVnNkWXRBb2xW?=
 =?utf-8?B?aG9HZ0dSUUFnR2IvZ2ZGYStvb2xJSDZNYzBwZHVUbTlqQ0p6TklzSHByRHRW?=
 =?utf-8?B?OHo3Ync2ODU0TzNnZHpvaFNFN1pQWS8ydW92NkZjTE84cThqMzZlbm90STM2?=
 =?utf-8?B?ZW1uS0Z3SXZLRisvNlVUbHR5RGRtY1BvZW45RkxycTExSjJ2S09MRWZWc1FQ?=
 =?utf-8?B?ZFcwTlJUcXVycWtjRjZrVFhrdmdoRVRvR3gzNWdRaGlYMDFZaGlaM0FZYUdo?=
 =?utf-8?B?Qm4zOXI2UVFLek5DbE9Hd1k1eDc5UlowelRMWVVCVTllclNteUJnTVRJT3dv?=
 =?utf-8?B?dU14SERaQ2NsMlh1QXpXY1pnTnBmOFplZkR4OEcvMVFMblljczd4RDMwQjFK?=
 =?utf-8?B?eFRwNVdsZS8yWk55NkN2ZGJQOWU3TmhNdEpTblhLbmYyVk9HY1ArL0tGNDY1?=
 =?utf-8?B?dUY1dzM1Y3V5NEtxenpGZFd0ZXNVSnBjMmVLQitKY0hPeUlXNmc2Wk9vdkpO?=
 =?utf-8?B?ZG9lak9sMHVTbzA2QkdBWUp3VXNrUVRJZ2JZZ2FXWlNNSEFFVFB1MnN6L21R?=
 =?utf-8?B?OFN3Y1MwWlVnMHlxdSt6SDlQaWF6ZjI5cUdNQm9qU05wT1d5KzNWSmZJQzUz?=
 =?utf-8?B?c3hGMmhGeGRHU25tM3FhQk45ZW9MNDlzZ1d5aDUzU1ZpOG1rc1BVZnZVZW5T?=
 =?utf-8?B?aTcrK05tbm92TWxnY0l4aEk4Y2VodTZzOVFwUVI5WEp4S1NCUXF3WkNsSk84?=
 =?utf-8?B?UGw0VVdGaUZYVGJWa1hObHR6WElqdk14YlV0QkxkVHlJTEpibjhjZFYrbzgx?=
 =?utf-8?B?d1F5L0FhOFdXMzRwZVNmVTVBdERYYkxVZ0g3dmgxY3NNUUxlOTlTSnRLVkVh?=
 =?utf-8?B?RmpnR3lRR3B3d1lyd0tWS0dhMi9pbWVlNCtPc3JiaE14bFBQcHVyUjNCakU1?=
 =?utf-8?B?QmJpeE91dDhMbjhCTjMyMzhrTWgvWHVWUHR4QVBybnBKeTdURmZ6UDlvNVFr?=
 =?utf-8?B?bVczd1pPSEg0MDFuZlhady8raGpyYk5SOXUxaEl5NUduWHBUY2ExK2tkZ1Z1?=
 =?utf-8?B?RHVQUXFPK09WaHRHak5hREdDM3d6cCtnR3N0R3VIa0lHN1VHbFlpU0w1eHBm?=
 =?utf-8?B?NHZaVFlWU0ZBVXdaL0E0cXpoWnNnWDMwMzI2N1VxVUhuajVac0YzamRDc1cx?=
 =?utf-8?B?a3BNcEptTmFNWTF0NXZYeTdKamhZdkkwNXlkM2QrUlVaT0xOdWJkMzVlekxj?=
 =?utf-8?B?WVk3ckFrejRuSnhUREJHMUc5T3hLSzN1R3pYd1A0WjVRL2xZamgwSDNBbVp4?=
 =?utf-8?B?OVZqUzdVTlJ1N2U4V3NTeVU5Smp1SlU4ZmV6L3ZETk53aWNhamxzTFFGaW9P?=
 =?utf-8?B?UHhzZkl5YUJNeUFkVjZKR3AyR0xZVDZsT0g1YWFhenRQdDQyVDIzMzY4MXQ0?=
 =?utf-8?B?UVNxMld4TWJ4RjU4TlhLY2lRcEk0aEVTeHY3cXJML0ZYbDlxNmQ4K2hHZjJt?=
 =?utf-8?B?aGs3TUJYTFJKSVNsUkhzT0x1bTQrYjVtVE1IalVlL0puSURJV2xBRGpZMlJR?=
 =?utf-8?B?aDB6bTNpaGJ5OEsxMFUyRGJqTy95RzNYTHBtRit0aUMrRjdURnJ3UDRnZGtB?=
 =?utf-8?B?ZzVJcTRETGkxYy80eFhIUTZ5YmU2K1VLZitMMnlWT1lDY2NBVlp0bHZxZHZR?=
 =?utf-8?B?Mk9Bclk0SjllOVhsQ2kxUVZqVGpaZHVCZ09jRUlER1FyNDgzcS9ROG4vanBG?=
 =?utf-8?B?dS9XUzg0M0JsWVZSUkU5aGlXQTl2Mk9meVRPcVNaOEtqQlRQSXVubllRRSth?=
 =?utf-8?B?Y09nM0lNUklteU1rZ256eFFKSVVXWURHOGtvL0JySzU2ekRPaEViTWVCNXMv?=
 =?utf-8?B?TkY5dDQrR2dBN3VoWlY0Y2RkYS9NRWxQTGc0aHNoRDVTMjd0VmUwRUZlbkt6?=
 =?utf-8?Q?d/84=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5baa5fa5-c752-4545-0f84-08db9336c871
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 08:59:30.3168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: suo4K2Y9QMko3Ry4aLqWkmGyFI+Ehup59ayg+UabOUWWo7d7umJ/ytpSufy3yxkSt6+7W9oDXK3krGCap3oEdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5029
Subject: [virtio-comment] RE: proposal: use admin command (and aq) of the device to query
 config space

PiBGcm9tOiBaaHUsIExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPg0KPiBTZW50OiBX
ZWRuZXNkYXksIEF1Z3VzdCAyLCAyMDIzIDI6MTUgUE0NCj4gUmViYXNpbmcgInRyYW5zcG9ydCB2
cSIgb24gYWRtaW4gdnEgaXMgc3RpbGwgaW4gbXkgcGlwZWxpbmUsIEkgYW0gY3VycmVudGx5DQo+
IHdvcmtpbmcgb24gYSBwYXRjaCBzZXJpZXMgaW1wbGVtZW50aW5nIHZpcnRpbyBwY2kgbGl2ZSBt
aWdyYXRpb24gaW4gdGhlDQo+IHNwZWMoY2Fycnkgb24gSmFzb24gYW5kIEV1Z2VuaW8ncyB3b3Jr
KS4NCj4gSSB3aWxsIHBvc3QgaXQgbmV4dCB3ZWVrIGFuZCBiYWNrIHRvIHRyYW5zcG9ydCB2cSB0
YXNrIHRoZW4uDQo+IA0KQXdlc29tZSBhbmQgaW50ZXJlc3RpbmcgdG8gdXMgYXMgd2VsbC4NCkkg
aGF2ZSBkcmFmdCBmb3IgbWVtYmVyIGRldmljZSBtaWdyYXRpb24gYWRtaW4gY29tbWFuZHMuDQpJ
IGd1ZXNzIHlvdXJzIHdpbGwgaGl0IHRoZSBtYWlsaW5nIGxpc3QgZmlyc3QsIHNvIHdlIGNhbiBj
b252ZXJnZSBvbiB5b3VyIHNlcmllcy4NCg0KPiBGb3IgU0lPViwgSSBoYXZlIGltcGxlbWVudGVk
IHRoZSBpbnRlcmZhY2VzIGZvciBxdWVyeWluZyB0aGUgY29uZmlndXJhdGlvbnMsIGZvcg0KPiBl
eGFtcGxlOg0KPiAxKSBBY2Nlc3MgY29uZmlnIHNwYWNlOg0KPiANCj4gMjQ3ICtcYmVnaW57bHN0
bGlzdGluZ30NCj4gMjQ4ICsjZGVmaW5lIFZJUlRJT19UUkFOU1BUUV9DVFJMX0NPTkZJR8KgwqDC
oCA2DQo+IDI0OSArwqAgI2RlZmluZSBWSVJUSU9fVFJBTlNQVFFfQ1RSTF9DT05GSUdfR0VUwqDC
oMKgIDANCj4gMjUwICvCoCAjZGVmaW5lIFZJUlRJT19UUkFOU1BUUV9DVFJMX0NPTkZJR19TRVTC
oMKgwqAgMQ0KPiAyNTEgKw0KPiAyNTIgK3N0cnVjdCB2aXJ0aW9fdHJhbnNwb3J0cV9jdHJsX2Rl
dl9jb25maWdfZ2V0IHsNCj4gMjUzICvCoMKgwqDCoMKgwqAgdTMyIG9mZnNldDsNCj4gMjU0ICvC
oMKgwqDCoMKgwqAgdTMyIHNpemU7DQo+IDI1NSArfTsNCj4gMjU2ICsNCj4gMjU3ICtzdHJ1Y3Qg
dmlydGlvX3RyYW5zcG9ydHFfY3RybF9kZXZfY29uZmlnX3NldCB7DQo+IDI1OCArwqDCoMKgwqDC
oMKgIHUzMiBvZmZzZXQ7DQo+IDI1OSArwqDCoMKgwqDCoMKgIHUzMiBzaXplOw0KPiAyNjAgK8Kg
wqDCoMKgwqDCoCB1OMKgIGRhdGFbXTsNCj4gMjYxICt9Ow0KPiAyNjIgK1xlbmR7bHN0bGlzdGlu
Z30NCj4gDQo+IEkgdGhpbmsgd2UgY2FuIHJlLXVzZSB0aGUgR0VUIGNvbW1hbmQgZm9yIFNSLUlP
ViwgSSBhbSBhZnJhaWQgU0VUIHdvdWxkIGJlIGENCj4gc2lkZS1jaGFubmVsIGF0dGFja2luZyBz
dXJmYWNlIGZvciBTUi1JT1YuDQo+IA0KR2V0IGFuZCBzZXQgYm90aCBzaG91bGQgYmUgaW5iYW5k
IGZvciBQRiwgVkYsIFNJT1YuDQpJIGRvbuKAmXQgc2VlIGFueSBuZWVkIHRvIGRpdmVyZ2UgYW5k
IGNyZWF0ZSBhbnkgd2VpcmQgY29tYmluYXRpb25zIGRpZmZlcmVudGx5IGZvciAzIGRpZmZlcmVu
dCBkZXZpY2UgdHlwZXMuDQoNCj4gMikgYSBzcGVjaWZpYyBjb25maWcsIGUuZy4sIGZlYXR1cmVz
Og0KPiANCj4gMTQyICtUaGUgZmVhdHVyZXMgbmVnb3RpYXRpb24gb2YgbWFuYWdlZCBkZXZpY2Vz
IGlzIGRvbmUgYnkgdGhlDQo+IDE0MyArZm9sbG93aW5nIGNvbW1hbmRzOg0KPiAxNDQgKw0KPiAx
NDUgK1xiZWdpbntsc3RsaXN0aW5nfQ0KPiAxNDYgKyNkZWZpbmUgVklSVElPX1RSQU5TUFRRX0NU
UkxfRkVBVMKgwqAgMw0KPiAxNDcgKyAjZGVmaW5lIFZJUlRJT19UUkFOU1BUUV9DVFJMX0ZFQVRf
REVWSUNFX0dFVMKgwqDCoMKgwqDCoMKgIDANCj4gMTQ4ICsgI2RlZmluZSBWSVJUSU9fVFJBTlNQ
VFFfQ1RSTF9GRUFUX0RSSVZFUl9TRVTCoMKgwqDCoMKgwqDCoCAxDQo+IDE0OSArICNkZWZpbmUg
VklSVElPX1RSQU5TUFRRX0NUUkxfRkVBVF9EUklWRVJfR0VUwqDCoMKgwqDCoMKgwqAgMg0KPiAx
NTAgKw0KPiAxNTEgK3N0cnVjdCB2aXJ0aW9fdHJhbnNwb3J0cV9jdHJsX2Rldl9mZWF0dXJlcyB7
DQo+IDE1MiArwqDCoMKgwqDCoMKgwqAgdTMyIGZlYXR1cmVzX2xlbjsNCj4gMTUzICvCoMKgwqDC
oMKgwqDCoCB1MzIgZmVhdHVyZXNbZmVhdHVyZXNfbGVuXTsNCj4gMTU0ICt9Ow0KPiAxNTUgK1xl
bmR7bHN0bGlzdGluZ30NCj4gDQo+IHN0aWxsIGNhbiByZS11c2UgdGhlIEdFVCBjb21tYW5kcy4N
Cj4gDQo+IFRoYW5rcw0KPiBaaHUgTGluZ3NoYW4NCj4gPg0KDQo=

