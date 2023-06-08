Return-Path: <virtio-comment-return-6235-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E394C7EE23
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 13:21:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 881424282A
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 13:21:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6AB72986671
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 13:21:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5604B986669; Thu,  8 Jun 2023 13:21:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 438C298666A
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 13:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqktVSlMgVVgqAv6+85h8cRBVpwOYBw6dsSUBXOMtniZnfVu3FlI10wLtNq0QHIcEt5NZ01NYJ0eqsVJsp3ywu8/is6utHxXVWYffxogu+rM4FDUVa2Mr6jvQPxRNy5qX0Gk/RGRrS6tFV7PVytGynHaTxNknUY8oyhWgICk56TPxE/FGjN+RrCrpH1cbeaw4XBIyM8Qj65wkbA2brGcqyYSRyu4VZlK3pgqVHeYAvjMo9lN4/CSCIoHH799BWRY2LJs4HQVfygXacXk1ihhDw/XzCEjFNULo/1OQcuX27sZkkWSFMfYF1DRZVrmC6emYvHdPN36n0OkKVym7qYNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7n7aopL/tL0BY3uaLAv+eYco9QHVuj5APApEH398tE0=;
 b=khkfVIuJVuu/wJNly9TTxURqubfoj2Bumry3+5tF0W5zDSnLPm0Jp3Ywk/e+ZoYT7WHRV1KYgiXtPBuc9oDnSMNF35oKACI4AVTZKuJJnmC95Q0dR/d1SwFaDHKasEetsegOu5q2eUPH82ktDDiCXUhB/IID6C7YEH83xk+vzuxzMinf+GszR1HQo63yXis/HbIJkZ1aDHVc7hfcA2kja71YG2LLT4zIPBGf3h/N2UeXy9jfvwn7aqxSwYU7r0aDNzXrdnAHJJzfTokj+mE9NN3aoYH07dQsAM8pFByemoSNoNzwgdXripScHJy/Ubw98LQIEh6Jrqyw/7uDvT1Ddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "alvaro.karsz@solid-run.com"
	<alvaro.karsz@solid-run.com>, Liuxiangdong <liuxiangdong5@huawei.com>, Gautam
 Dawar <gdawar@xilinx.com>, "longpeng2@huawei.com" <longpeng2@huawei.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, Stefano
 Garzarella <sgarzare@redhat.com>, Heng Qi <hengqi@linux.alibaba.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, Zhu Lingshan
	<lingshan.zhu@intel.com>, Shannon Nelson <snelson@pensando.io>, Max Gurtovoy
	<mgurtovoy@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>
Thread-Topic: [PATCH 1/2] virtio: introduce selective queue enabling
Thread-Index: AQHZmKAVwn3zg7X1EUufTilOdi6rea9+EGGQgAAWHICAAqz9gIAAEgvA
Date: Thu, 8 Jun 2023 13:21:29 +0000
Message-ID:
 <PH0PR12MB5481E809D74465F914008EF5DC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <20230606175511.2337208-2-eperezma@redhat.com>
 <PH0PR12MB5481D1ACC60311CE48D622CFDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606151520-mutt-send-email-mst@kernel.org>
 <1686226293.022929-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1686226293.022929-1-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS7PR12MB6118:EE_
x-ms-office365-filtering-correlation-id: ccc42b95-6738-44d1-6717-08db68234508
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 IcUBZBE5ZzSjxKDTM5WQrF77GQYbSl1F7/o9o8MiTH4Tc2zdmkmycvY4TkBX5TeVxI7R1m1twdomb/mXub2ae+6LO1MB5R6nzOfBZpmagAjFF7lw7rgr4bvDxspNz+KAkBri7vrWQ8pH1aIJv+5JM8fWMpdEpIug5QkcDChaaZNeicZ7a1FXsrD/q+UarE50Hqc7aQ/BQVLpKq7Ud/gtf/TEqEcgs8K/OWPBcwug1l1u2MQVscAqLRAQU0ka6E/EE8vZ5tLbMLqPpLbEf4VoRjn8+6KS2Aa2KsxMoTYPiXJWwHYOLy9uLi2oQu0mTMQ+86RFp4rlNA1kxo70v2ZkBZ5y6aXeOfsakG2EOWJ1vh6wR6dSw47aJ4yIwZb8UmFzv21xiNsNgxdleP0Lza6YlACocM36yoa9x7T2J0ckW8vEt0ijfkTU/r3ovvoAHmkNMUHuIA/klufR7CIv9AXhRuxMEb+ZNMpTafgwrS7Z2Qd07eIxJpD2HXplSvGLbnQ6C0K4tRb48sBbNV3PutsmBzbPeE+ElnGKHkkhoILspvh+H7/QK0LNfdSyZRgDLfz1QzYyiol+Ga0XM+JV0p3+1H0J1gOsO+7QlC3Li7h+6IeamXMegc66KnFdBiE+CK6J
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199021)(5660300002)(33656002)(38070700005)(2906002)(4744005)(52536014)(86362001)(7416002)(55016003)(71200400001)(9686003)(26005)(6506007)(316002)(478600001)(54906003)(7696005)(110136005)(64756008)(66946007)(38100700002)(4326008)(41300700001)(66446008)(76116006)(186003)(122000001)(66556008)(66476007)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YWZoWjFOdFhkU0tjVTNhdWFWWjh4bkwrVk5McldOR3lHVVVrdDBBVVljd1RB?=
 =?utf-8?B?MFk1UTZJVE90WWh6TUFOcWNlTjFacXMyRFhYQmtvTFkrdXNBekswemNieEdy?=
 =?utf-8?B?dWNGVjhENEVIZFFLeDVtRCtDUlNPTTM2eDk0cmExejNoWjF2RnZaNTQrK2Zr?=
 =?utf-8?B?NW9NUDM3T05lTVZSQ0t4NWNaenJWM2p4S0ZKMXhQMUNxTjBLQTRhZndFWlpW?=
 =?utf-8?B?WVY3RWJuNkZsQktKZ3Jab3BlaWtWODZXbDlmU1pxVmtxenFPd2hlQm9yVWNE?=
 =?utf-8?B?MnBJYkZ1Z3VqMTRMMnBRWmY1VlZqOFRMcG5aN0xPb2FPZU5zckluL2RFOGpo?=
 =?utf-8?B?dnNQd2o3TTVFbEJJMkpiNVNyN3ZtNE1sMkJqTXJnY3NOcXdZbUltOEVIN3V2?=
 =?utf-8?B?d3dFZEd2d0ZXNlZhTmh6ckpYS0tEUWlwM0RTSVh3Z3FnaUtmQjcyMjQvSXVa?=
 =?utf-8?B?UWF0Um92dkd0OUdTNUlWdWpGSHFOTTZPNUtvZHdiWmk2TFhqK2xCR0JwcE1v?=
 =?utf-8?B?OEEySVRib3U5UEV0VitHTmNManlKRWhRWUc5WHUreGlBbFQwb3lRd0J4Q0hI?=
 =?utf-8?B?ZkI2Y0NzWXZGakZqOE1tSzVKRDd6VW9Vc2lpN3dqb1grbTVmOE0xcEx2VVJ6?=
 =?utf-8?B?cVBRMHlOUktBOUNkZEpYSHlJMVgxaVNLLzV6T1dXd05CaENtTHdWc0d0dlRD?=
 =?utf-8?B?U1pWSGErdExTUU5mako2M2JjTyt0aVlNVmpjU3UxcjBMdjBXZ0JxR1lsdUtH?=
 =?utf-8?B?eFhHNjkwczcxTysxMkt4aWtMeFlPaVlKL3ZxVm1KTkVLN09NK2NLa2p6NFdH?=
 =?utf-8?B?NkpqQ3FHT2xiSGVIcUl0WVN2RThqTzZpU0V4MnVMMXhKQ2wxN2lzQ2ZqdWQx?=
 =?utf-8?B?TldjZ3U5b3JMclJnUTJic2wxcEFOTE5Qd0diL3A2TlF0WXVyRm9qMVk1cU9O?=
 =?utf-8?B?Q1BUdHdELzRjRzlqYUsxSmY2eERNekpzYXRsT1VvTWQxTlpqRmdFS25rOVhV?=
 =?utf-8?B?L3pTS1ViSldzZkVFOVNCRWQ1SnRjMEs0U2NESW5vaEJaR3Z5cUl6ZVhBWnR3?=
 =?utf-8?B?NXE5Y0ZDcVg0OVpRVkhmNzFoYXlxQlVXZjcrQmtrUFNWVTNhOVY0eXRuWWxp?=
 =?utf-8?B?Z3F0WTNhY2hheENSMlR6TlIwRHpDakNWU3R4VDZjVUF5SzMxV2N1ejRlSWpI?=
 =?utf-8?B?aWkvam84akdWK3kwZDFicFFtTTI0VGpYWCt3cjh2R1NONHFwR2swcTNLSXhH?=
 =?utf-8?B?UEU5MWsvaDkzMU1MVmczUml4MVE1Y2FrSXBBc2VnWDBBeWoyVktKVEg5RVBv?=
 =?utf-8?B?d1R4ZWhzZHBjTlFGdS9jMlhiNWNTc21VbGZqeU16cnYyOXB4OTBOclBZOEpG?=
 =?utf-8?B?NXhzV09OSTdlLzk3M1JlRW1kbXFHQXlhbTFrbWpSdGdtZ0ZDdHVBdEw0UGJY?=
 =?utf-8?B?NGh4K1JGZU1nYzNzL0llN0VGbFNQMUs1dmluVVV0cCtpbFQzV3QxOHd2ajFP?=
 =?utf-8?B?V1ZGei9MZHY3Wm5DM1B6eFUrTytvQ3RtMVUwdjQwbm1leFo2cHF4N3pvUk9l?=
 =?utf-8?B?WjF4ZjlPaERKMUlRTEFEam9hdVFsOFhuMEJKTzhOR2JMdzd1d0ZCRnQxREt0?=
 =?utf-8?B?WDVuRjdPTVhMaUNCVkQ0bUtLbmJKRkN3SjVIUnYxb0xVdUxPQ2RVQWorT0NJ?=
 =?utf-8?B?bk50WW9SRFBSeE5WNW9CekRVYWZSdUVENHNMeVFBK2pkSHgzVEFVRHU0NmJj?=
 =?utf-8?B?R0wyTTRnZVR2Uzh3ejJpb1BZb2MwRkVPMFFRVHdnMG5PbEYzdm9wTXJMMG1Q?=
 =?utf-8?B?UVdFalNaWG9NdWd6NjNkUmNPNjcyTTRUR0MrZFR4WVlaT09sQUxnUnVjWTVR?=
 =?utf-8?B?azk0MkdJR1NyQTF4V0FZVTR3OGJXUVdxbVAzT2JPMVd0VzBCRmYwaUZQZklL?=
 =?utf-8?B?eGt2VHY4MkIzV1J4bHNaNmUzekpFaFQyeXYwSFBLeUxib1lEdVlWZS9wZUNF?=
 =?utf-8?B?Umx1cy9meVFYTm9Fa3FENk5tbFA1elpCRUgvbTViajVMemYyUWRSMk4ydUZ1?=
 =?utf-8?B?VkRPczljZDRJNGs4bXZGTTBxU2dwMms2VE40dTZvdXBBQlRMbE1IbDhhSzlP?=
 =?utf-8?Q?2EiM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc42b95-6738-44d1-6717-08db68234508
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 13:21:29.4071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1FL23kp9LfjvtLIMlOSN1+j8yST0hdR6sOZTFksbMuRcE+TKHlVUCqRDdhdgH3VyrQR4AWVCgF1s/8eryfpBwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6118
Subject: [virtio-comment] RE: [PATCH 1/2] virtio: introduce selective queue enabling

DQoNCj4gRnJvbTogWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbT4NCj4gU2Vu
dDogVGh1cnNkYXksIEp1bmUgOCwgMjAyMyA4OjEyIEFNDQoNCg0KPiBBbHRob3VnaCB0aGVyZSBp
cyBubyAiYWxsIHF1ZXVlcyIgaGVyZSwgaWYgdGhlIHF1ZXVlIGlzIG5vdCByZWFkeSwgdGhlIGRl
dmljZSBtYXkNCj4gdXNlIGFsbCB0aGUgcXVldWVzIGFmdGVyICJEZXZpY2UgT0siLiBTbyBJIGFs
c28gdGhpbmsgaXQgbWlnaHQgYmUgZGFuZ2Vyb3VzLg0KPg0KRGV2aWNlIGNhbiBvbmx5IHVzZWQg
ZW5hYmxlZCBxdWV1ZXMgYXQgYW55IHN0YWdlIGJlZm9yZS9hZnRlciBEUklWRVJfT0suDQpJZiB0
aGUgcXVldWUgaXMgbm90IGVuYWJsZWQsIHRoZXJlIGlzIHNpbXBseSBubyByeCBwYWNrZXQgb3Ig
YW55dGhpbmcgb24gdGhhdCBxdWV1ZS4NCiANCj4gQnV0IEkgYWxzbyByYW4gaW50byB0aGlzIHBy
b2JsZW0uIFdlIHdhbnQgdGhlIGRldmljZSB0byBzdXBwb3J0IDEwMCBxdWV1ZXMsIGJ1dA0KPiB3
ZSBhbHNvIHdhbnQgdG8gdXNlIG9ubHkgMTYgcXVldWVzIGJ5IGRlZmF1bHQuIFRoZSB1c2VyIGNh
biB0aGVuIG1hbnVhbGx5DQo+IHNjYWxlIHVwIHRvIDEwMCwgaWYgdGhlIHVzZXIgaGFzIGEgbGFy
Z2UgbWVtb3J5Lg0KPiANClNvLCBvbmUgY29uZmlnIHNlcXVlbmNlIDoNCmEuIGRyaXZlciBjYW4g
ZW5hYmxlIDE2IHF1ZXVlcyBiZWZvcmUgIGRyaXZlciBvayANCmIuIGRyaXZlciBkb2VzIGRyaXZl
ciBvaw0KYy4gZmV3IGhvdXJzIGxhdGVyIGRyaXZlciBlbmFibGVzIHJlbWFpbmluZyA4NCBxdWV1
ZXMNCg0KaW4gc2Vjb25kIGNvbmZpZyBzZXF1ZW5jZToNCmEuIGRyaXZlciBjYW4gZW5hYmxlIDAg
cXVldWVzIGJlZm9yZSAgZHJpdmVyIG9rIA0KYi4gZHJpdmVyIGRvZXMgZHJpdmVyIG9rDQpjLiBm
ZXcgaG91cnMgbGF0ZXIgZHJpdmVyIGVuYWJsZXMgcmVtYWluaW5nIDE2Kzg0IHF1ZXVlcyANCg==

