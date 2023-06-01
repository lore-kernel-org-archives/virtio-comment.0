Return-Path: <virtio-comment-return-6068-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0105DC77B7A
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 15:14:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 26F6C44341
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 15:14:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 60FA1986617
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 15:14:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 52C68986608; Thu,  1 Jun 2023 15:14:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3F983986610;
	Thu,  1 Jun 2023 15:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vvzq4UJsYwd0R8N8JnyOk++4YFeUyXaKOR4c/KgvRZBBPdl0LKJuqUNPFa6enCT3ZAfFLr38GdNVH1RZ1mwigSfmXJmv5e4oSvzWm39+dLUYFYFb0O8T0epclqbMed5gJB/f/6xgVn1QltBYqXBzbDxwzHpJGFqPWHz92I9+srAT6DZg3KQIbScHmhep7fsgUnT1vkEplWwtc+8gxyDYFpUPz+2ZnGzBa+z53RUUjcqDbKxry65pbmZZYLl+MZ8GT/Xq+nFNPDvmowKuGtFg5aVwQLXD+nntFU2puQGBCXag/8Yd440JmTPvHW/f6zSFeyI5ClAHg5NlUNFwwox7eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zp1kLz15oiBIGVwW8Ad3u67joVqv+3ReywaeZw4uZXw=;
 b=IpW7AT9lzeA0SLmqwcUjgHAEEktqoQU/rr5U5dAHgj8zMw70Lh72vfGm8NxtuJIxcF/WCun2uWBONib9z5Fx6i6LRIQsNIQoAYKLde7OjZ2YYASAArw3xd6gZqcOHvKwc8agxJsCQmq84hIUN+5vIChw4YbOOfDzB9BMw3XYv5F5vfFpQg6Ix6J3c5Nscribyidn07exLlHVSclZfWf/k2/xOoLlgcxIOTlFZ74mupfEi/Kz3NjO+C5J183Y3wTwT1yyLS3YV8JGEhiFBsK0SFQNmPveMAeA5fuQ8VzsxW0PlRPkKwB/bYU3sgWDsmzRCJk3KEGB8+MYFsrWRu2Vrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>, "Michael S.
 Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] virtio networking collaboration meeting: call
 for agenda
Thread-Index: AdmJCcjCjRUFdJrUSz6FqEiskKvSlQLBKLYAAASG6KAAHrrnsA==
Date: Thu, 1 Jun 2023 15:14:00 +0000
Message-ID:
 <PH0PR12MB54812B9D56589F5A44ED1CC4DC499@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b2e85349-35e2-23ed-46c9-20f0cf47760f@oracle.com>
 <PH0PR12MB54811BFA23452BEA3313DBCADC499@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB54811BFA23452BEA3313DBCADC499@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB7275:EE_
x-ms-office365-filtering-correlation-id: 366d8638-bba9-46c7-8edc-08db62b2d452
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GJkPfS/rUnmy3u0tKEv2PQ+zNK5/jrW6fKuBJM6fgDTVnte3rbyE9mZN3ZyALlxEAcT7xAHvJLbByTlTdAtKvnzjg7qKkYCacb62BaerSSGnmmHcthJWGTnrorCEuAJ/xHjtS4uCdM3+CoHmfxkgOTOwA/GSPfvZRtalBMuVNk0qfd+5Ix3gM7XyvKC+yjj3ciMQRuAxLYJGWXrlv5lE0puqyItxEDpmcRbtPTuRRp+HcgA0fY944LJ2kUkXfb5GLmA/mAe9pcjlLiO+eD9R+dxILDAmGwnI+dXggyPLfk4rcp5Vb0KqZeLvCx7/+hooFF+0+46FARssm8vVVAGbSsgITgucGE2/yv0mVbUtWj5AQf31vRu5EVDQDqgAJH7kNgQvfSCnn8eRtUSENKe5Zwma9haDU12/peXcxC0UfIsPTzK+z4PWuO6merDmzjwOIYWftyd4RxIi9kdDE/3bHyMrwGQPLbnTDpiOaIXAwcE6kdIdZJ/obKgoS5bV95z4Q/prEO9H8tso0I0Myr0FN4BN7Ix69ZwNJGZxi8GP5I6SvlKyCwqhHioA/jo/00E56aYVWo7gAcb6wWd2LqWJgRrnG8lsa9wDMf2U8wtVs+OL1KDj3qo61IdHS5TyBPd4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199021)(110136005)(9686003)(478600001)(8936002)(8676002)(122000001)(38100700002)(64756008)(66556008)(66946007)(66476007)(66446008)(76116006)(6506007)(4326008)(71200400001)(316002)(55016003)(38070700005)(5660300002)(186003)(41300700001)(7696005)(4744005)(86362001)(33656002)(2940100002)(52536014)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDNxQlorUFVsSVZSSzFzeXM3VVMzbXlIWUNWN08zWVk2ZVpaK3FHVnR5NmVv?=
 =?utf-8?B?cGFVRTRwMUhkRG81VkxIV3FBWFd3d25yZEFPRytSUnErc0VSaFh5UGtFTWxt?=
 =?utf-8?B?M3pPZTNCWFYzdmduV1JGeDc3dVA3UCtHVnAzNFlzbXNZbGxzeVlOY0JRZ0Ra?=
 =?utf-8?B?bVhtL2lYNU5FU3JIckJVZ2xCeEIvZTJNbzdOdndIT3FmVHV6V1k5cjE4Q3Rv?=
 =?utf-8?B?U0tFaWlBcmx4cFFmTDdVWmdlNTY1eEVFYmI2VkgvbDZFMU9pdWllTlA5ZFpD?=
 =?utf-8?B?cjJZUlpiMlFBYXVqb1FhSitiTEM3MUdxMjQ3YjFCaVoydmsvd1R6cXkwN2tK?=
 =?utf-8?B?MmxuMGhPejM0RXdPTC96QnlwVTAwdTc0RWlhQjhRRWI5cFh2RGZtajJlSFZV?=
 =?utf-8?B?ZG1lV1NJZXlqTzRBRUttOGNFZkd1MzZKemkwZW9wS0dqSU9UUHg4YzE3YmVH?=
 =?utf-8?B?OXhRR3Uva0lJZGxPUlVmVVU0ZW5MVFFnS0N4QzhhR0ZzV0xsTnRldEl0QitE?=
 =?utf-8?B?RnMrTzM4Vnl3dy9rWEUrQUM4bnFyR2NjNTNuMDZXb2pRU2t0d1ZCREV1T3BO?=
 =?utf-8?B?NjJuSDRUaXhxQW9ySkFIWXNsL0l4OWV2Vy9VQ2cyanhwaThsR2lRcnZ5WDdB?=
 =?utf-8?B?TVBwRmRCblJWMGVSMXMzcUtXSHRBZDdEVisvNjBBcXpSZW4yQVR0OFhlVm9L?=
 =?utf-8?B?alFIY3RyeHpJL2VzWG1RQ0ppQlZHbXFYZm9SaW5CNU5tMkc5NnZSWFhXNEN2?=
 =?utf-8?B?ZnB2UXc4U0ZZNlBub0d5N0RWYlJ0UWdlcFdQTUR2bVNUTmZEVXdnVTJQVnVk?=
 =?utf-8?B?emt4N3pLaWI2SkR5anoyY0VvSFk1K0xOQ0ZqSmN3UEQvV1Y4N3NlRklYd0JZ?=
 =?utf-8?B?K1Zyb0xSei9yNzQxUEt6dWlubHQzaHM5cW9nTEgrWDluRjJ0UFNuVzlvTU9F?=
 =?utf-8?B?ZElwN1puYzhMWE8vS3Z4N3RLR1AweTkzb2p1UjRoN0M2b2NWK2RyZUU2RmlF?=
 =?utf-8?B?RTd4MzU1aFRzODBlU05mM3hrYXVhZjlkL1hwL2lIbWF4L2RPU3FxdlE4eDh3?=
 =?utf-8?B?dlNEenVMQkFqTm9lVENjZDlic1YxZFpNUXJ2UmpXejRubWJ2SHZyUHA4VzVQ?=
 =?utf-8?B?WmZ1bUx0ZVhGcUd4OGJTa2hNMk1SYzNkamFCaTMrZGVpNG1mNmM0NmlVOE1E?=
 =?utf-8?B?QTZPVDhLa1ZPR2lPcFdHcEtDUk5Vd1pwclZ2QXhtYXZDeGtwN0daRHpHbGtR?=
 =?utf-8?B?UkdtUU9MaTE3QVI3YzBDQlRROGliVm8xYjVpQkQwbzRCaUhzZjVGL1pRVXpS?=
 =?utf-8?B?dnJodWpWdkVSRlZya2p4K3N5dS82R2JSbjlnWjJrMWlFTHJUQVc3MlBHQ0NG?=
 =?utf-8?B?Ti8yMXpaQURjMDh6TEx1Q1ZUNDJRV3dpMGdoMXppOW0vVGNSNlIwaVVHc3lH?=
 =?utf-8?B?VDFaQ1JEeC9sTk9EODRvckQvNzVtWEFiMm1Vc1YyS24rOGIyOFBRSHBRNGFr?=
 =?utf-8?B?VVZuaUpxL0hFang3bEZZMzJIU05NcFlLdkNKZmo1RXZXak9vcWN6N0hYSFhP?=
 =?utf-8?B?cVBRU2FGeCs3R2xQSjhMVFdJdTJwRlJybWZ4dkYybXZTdld4d1YwT3AvUElu?=
 =?utf-8?B?Y01nNDNPVmR5WVllNXVxM0lUcmpQKzNOUzFoUVNTVUtzaVdNL0NHZzJnQ3BP?=
 =?utf-8?B?M2RJWGdCYXJnTnBqRER3dTVsT213RUN3elM0UEJ0d1FRZENpdXpYTGdXYkZF?=
 =?utf-8?B?K1pLM05idEgzaXR3bHBSWkE0VDBDaHdwN293eVVmeVhVZ1FldjBwMG1PNHFr?=
 =?utf-8?B?WnFSdXY2QWxtZWE3ZEZTbm5lK3E1MGxjOURyQS9aNEZOSFVOWVUzN2tEYWVU?=
 =?utf-8?B?NUdPQ3BFSGlZVCthczFFdTVVOTFXa2JYUkZlZkVlbmZYaHVOV0xnRzhWU3R1?=
 =?utf-8?B?VVVEbW56UU15dVZCVk9DZzlCV1huZjUrbCtpTWxIWXZwUWRRQmRqc3hIbnh2?=
 =?utf-8?B?TVIzemIvYnZCbXBhM0srS2cwRlh3VTVTME9qR0FDODBCZit3YlpFUElpV002?=
 =?utf-8?B?V0FZOWhvUkcrUXM3dHlxbUZFNWFKNVlGNnRFYjIyd3RsK1BtTVlaZDBUWTlP?=
 =?utf-8?B?a2Y0TlowSEh1TTBhVUorZFJmUmNhU2trUm1HNjh1YkxGWkdXaFhjaEFYKzdN?=
 =?utf-8?Q?gkhFsG0HBlXBFbPy2qkKe+A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366d8638-bba9-46c7-8edc-08db62b2d452
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 15:14:00.8443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1oaown65+hV8ZOFo9uqE2igPAbQrSGBOe7X7qpcn3fGnIC7ZF786ooopxuUkhLsCf46nhtuu4LASImhEc5+Stg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7275
Subject: RE: [virtio-comment] virtio networking collaboration meeting: call
 for agenda

SGkgTWljaGFlbCwNCg0KPiBGcm9tOiB2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy1vcGVuLm9y
ZyA8dmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtDQo+IG9wZW4ub3JnPiBPbiBCZWhhbGYgT2Yg
UGFyYXYgUGFuZGl0DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDMxLCAyMDIzIDg6MzQgUE0NCj4g
DQo+ID4gRnJvbTogU2ktV2VpIExpdSA8c2ktd2VpLmxpdUBvcmFjbGUuY29tPg0KPiA+IFNlbnQ6
IFdlZG5lc2RheSwgTWF5IDMxLCAyMDIzIDY6MjMgUE0NCj4gDQo+ID4gPiBJIHN1Z2dlc3Qgc2V2
ZXJhbCBkYXkgJiB0aW1lIHNsb3RzLg0KPiA+ID4gRGF5czoNCj4gPiA+IC0gVHVlIChNYXkgMzAp
IG9yDQo+ID4gPiAtIFdlZCAoTWF5IDMxKQ0KPiA+ID4gVGltZToNCj4gPiA+IC0gMiBwbSBHTVQs
IG9yDQo+ID4gPiAtIDUgYW0gR01UDQo+ID4gPg0KPiA+ID4gV2UgY2FuIHBpY2sgb3RoZXIgdGlt
ZS9kYXkgb3B0aW9ucyBhcyB3ZWxsIGRlcGVuZGluZyBvbiB3aG8gd2FudHMgdG8NCj4gPiBhdHRl
bmQgYW5kIGluIHdoaWNoIHRpbWUgem9uZS4NCj4gPiA1IGFtIEdNVCBXZWRuZXNkYXkgd29ya3Mg
Zm9yIG1lLiBJZiBwb3NzaWJsZSwgSSB3b3VsZCBsaWtlIHRvIGF2b2lkDQo+ID4gc2NoZWR1bGlu
ZyBpdCB0byB0aGUgc2FtZSB3ZWVrIG9mIHRoZSB2ZHBhIG1lZXRpbmcsIGFzIEkgaGF2ZSB0byBh
dHRlbmQgYm90aC4NCj4gDQo+IE9rLiBTb3VuZHMgZ29vZC4NCj4gV2lsbCBjb2xsZWN0IHNvbWUg
bW9yZSBmZWVkYmFjayB0aGlzIHdlZWsgYW5kIGlmIHRoaXMgd29ya3MsIHdpbGwgc2NoZWR1bGUg
MXN0DQo+IGFuZCAzcmQgd2VlayBXZWQuDQoNCkRvZXMgdGhpcyB0aW1lIHdvcmsgZm9yIHlvdT8N
CldvdWxkIHlvdSBiZSBhYmxlIHRvIHBhcnRpY2lwYXRlPw0K

