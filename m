Return-Path: <virtio-comment-return-6340-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238C8EB64DA
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 03:48:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6BCDCF3F47
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 03:48:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4F88E98668E
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 03:48:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3CC77986656; Wed, 14 Jun 2023 03:48:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2A5C698665C;
	Wed, 14 Jun 2023 03:48:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftaLOJMK8+vnxOBTWjR23Vxwq6w6QyoIqsk0wqvRkYvBW/XWNafrDFW7kFi6p07Bc7UtSL3fJmRpYzrGuLt/NEJZ3ojbrofmFDT/VbHTkmDOtkP3CbmYCMopNfa0ub78Dv3PBzxi+styIenMBN4YbVZ5foW7AjE25fgP0RUpwt9+AZ4NA/F37grwZ3DJblgbMVSSs8gDmUWnZG4o66rVTzarH5Zq4JyxlL8X/pLgRdCA8LM1oMMHekw6br9tbXoDZMjNYyTfuC3+vLx7j6oUaC8co0JuZHgv95eKNBtX7zk7MwNixTRYZN9bVmnsFfamVBj0UFywQ/OhZlls/vii7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXED9O8ZSxxumBHc4nMPCurqC95o2Sqo5jNZXPAZbOQ=;
 b=bbaVhWN4VrxxTZ4NDFtKjnfFZ+wSHemKat2fsxJFoWfIBsU/rHt4XoADuO0yE6QQFHhUxfSE5ZTLss45D7FVJyPNQI+EJ9TrxjfPJA4a+81uGXvb7h8T0Q3eZJ4yljx/Fn7pbhryWMJRHiQr5qyfdhWwdLqiRlK2uMgU9I0DH4yNx+zT7XqXQCFhK7FtyPdD2EXQK9+UEq1ijWEXjsTt4NnE9EyxOEBCI9OJUgfl4TsagJQBR5seqIZhF+fJnGwNL/kDE+IwD4JW6xfcvOKQdAgjXGrvZ8QkarZO6ePt46TouVuBVN+O4ol4/mX/ewIj/qwDaeKHFR/yxqPY6HlQow==
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
Thread-Index:
 AQHZlNTpsDXVjHsOf0G4vfVcY0pgc6+IG88AgAAT5pCAAA+sgIAAeVnQgAECPwCAAABToA==
Date: Wed, 14 Jun 2023 03:48:29 +0000
Message-ID:
 <PH0PR12MB548176C28A3ECA7E09E6345ADC5AA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-6-parav@nvidia.com>
 <ae7b4a7f-dc9b-3466-1a46-8535f288856a@linux.alibaba.com>
 <PH0PR12MB548142D52698EFD9E101D555DC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2e035358-d16e-92ae-e4c3-92d141787876@linux.alibaba.com>
 <PH0PR12MB5481978B30D222EE4E3254FBDC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7536eeda-ff4e-633a-89bf-aad94aca317a@linux.alibaba.com>
In-Reply-To: <7536eeda-ff4e-633a-89bf-aad94aca317a@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5174:EE_
x-ms-office365-filtering-correlation-id: 29becc3c-3455-44ac-83ed-08db6c8a3799
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 iCTiOcyZqc4kHo56DDDR2LyNMNvHD3Dnl6u1pcdJLx7vgUPL9auoJHK2h9jmar2fXeFpsh08WeE04jyLvCYwKYAuiLBBPtgFonZQFx559tQ7JMjvgtuf7afJ4fARrj03sSGuyu5bc5q1o2nuEUuctH27Fb0sIOpCugfmaNN7mUqTV7noFPtyM6cNJ3D8on0uQ5nCSZbpDVRqxpp1XN0YurS+jhTQqvOSfObzhX5aZPbJfSNqWf1bSp299zIf5ZxgPePDoWtTTbZ0ZG+1fwsbTjEAiPa9ATNYMpUs/ZOiXO+sktXtnQAretYC5uKihgKdgizjwvSwIfIWC3PcqAsLnOTC5w1QQZxIInRvcsIhL3+MCb7bPQLKdArlGGsgVLyXiKOqGJDVMM9DyEhqImpJ+j8JDESxeJx3ueFTs8Hk2xxZg9NkiFXpuXrpQqf+AtugCV/8Xw6QH8Oy/LyFUcfb/m0j/8CpX4sdnUB0co5S75w0dPpxadDWT7ymt9XZqCXxo+8K9A5P83Tg3O6nopmv4g4jC15eeqSHHwtGK3GUWMdwDLbRttGpkXgU/PwHrChs5VKA0IFZrJBdnyKEswgIUJunrqRWQQNduU8sU4Jwm/xxBYXaXbVIH2HB2cDGQozN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199021)(76116006)(66446008)(66946007)(64756008)(66556008)(66476007)(4326008)(41300700001)(316002)(110136005)(54906003)(8676002)(52536014)(8936002)(2906002)(5660300002)(66899021)(71200400001)(478600001)(7696005)(55016003)(26005)(9686003)(33656002)(83380400001)(186003)(6506007)(122000001)(38070700005)(38100700002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WTVtWXZsYnpvOGlBYkNhUmc3ZVRUMWgxTENrTWNGVmVRejdCMkZ3Z1laZDIv?=
 =?utf-8?B?bzM3Y3FGZ2k5UTRkaXNYWHJiczYzYjJNbHF1SjdobGowS09rYm5sL0VlRTBG?=
 =?utf-8?B?ZkRacm4zNGt4c1N5M3c5ZEhFbTR0M1BtOUNQRmY1YVNWVEd1dTdqdFJhUEZ0?=
 =?utf-8?B?VHY4TFZmYTA4a29HdGdRUFFHME5aZGtpVGZOeHBYTW1YclRUUXFJcGlHZHIv?=
 =?utf-8?B?UGNwMHVvZEFtYU0ydkhMOENQSXBteEtLc2FFYzFpRDE5VjVXOUo1QUlMNS9P?=
 =?utf-8?B?YmVmbXJPU1ZiMjFJTFRGMVlPMjNqVnkxRUlHSjExd0xsaUwwaTR5dnpPUVIy?=
 =?utf-8?B?R2FTME8xREVxejZIRTE3MkZpd2NsUklXVkhja1VJUnNFUW1uWkdoQlFXanpl?=
 =?utf-8?B?MTQ1UkRpdnA5SUJPUHc4ZDhEZkc2dkowSmwvMzRtUi9PL0NqRENjbEFaN2J6?=
 =?utf-8?B?VS9wOVBrdGJ0eFkyTGxhMUhHZ1FuZXQ4R2MvcGVTejVBQkRpYWl6MGw1Rk16?=
 =?utf-8?B?eld0Q1YrQVRBT2FjelFMUjlpZGVsMjNZZ2xvTlF5cnVFam1ndTdSYXpqb2xO?=
 =?utf-8?B?cE4rL2UxWkZiRkJIdFFpMGxyRzBId1JKejVTZ3QxeS82OW1XZU9NWHBvUXZj?=
 =?utf-8?B?Tm9NUFQwY242cDZ2NEZrcTRRTmp5RkF2STVMOGZwd3RFVFFBTjRraGdDam5Y?=
 =?utf-8?B?OUhiOHUzbi9LUUtpeW9Ib2xDR0NwbnFnUXFyQ29yYkRrYzMrSm41SWY1L1E3?=
 =?utf-8?B?T0Vxd0c2c3h5NXBTRlJXb0hNa2xVZ3JOSnBGeFdPakxNbk5tOW4vMC90Mjkr?=
 =?utf-8?B?WkZLTkhnT1VBY3YwOUQwNWtCTXBXQXZUZ2o3TkdrUFVoM05RMFJFbTlPajBm?=
 =?utf-8?B?NUZBOXJRL1gvcXovS2t2aHUzczhJWGxESTJidVhGd2tSVE1LTkN3TW5Geitw?=
 =?utf-8?B?YXhidkNwSi96S2phNy9INTFDTmtXRjJ2Y3ZJdHR1eXRyR1R0V01XV0hOaGdw?=
 =?utf-8?B?aS9QeHJOOXM5SnVpNTZKZW1sa3IvYXhnbG5VL1dZZVFoMlJ2alZsNEZONlZE?=
 =?utf-8?B?S1J3eFB3OXZqWXZmbFVLNmdtQXAwcVNCbkhxTUZoSjN2Z3lnTVNNSmYrcVBB?=
 =?utf-8?B?ci9BRnNFMUNsTVF3TGxCSXpSNXU3dXhiRVo0dUZkTythT2pSbWx1S2VZRE1a?=
 =?utf-8?B?UlJLSk94UUVBUE0zUThJQ2QxRU5hVE13SlZaL3B4aUJ6ZWhNK2Y2QzVqZ2xq?=
 =?utf-8?B?OVNJeTgrWlNGZ3FUSEwwREhackR1SysrZzFKUTg5Tm9BSG9xMGdpdVE0Y3gz?=
 =?utf-8?B?MW5FZTVPcmVVSFpENS9LWVFqRE1TbXhRbW96NUIwaEdhQUt5d1QwVG9nMFpQ?=
 =?utf-8?B?S2pnL0pzRzBWckFuQWo2cnJVZGhlWUF5WEJkQzZDUzBOMit3VnZveHJyK0Jy?=
 =?utf-8?B?dnQwVGh3NDd2OXYwekdqNEtVRTdUbGRyWjdRNURsRU5OL09Gb0loZGQxcVBT?=
 =?utf-8?B?Sys0ZmxoWlBnb3EwSllWWDM5M1M3ZEhJc3c3QTNERjRRd3Z5TUIzVHBlVkZk?=
 =?utf-8?B?ekMvb0RwY3lrR0FmcHpFUXlEb3RYb25JK0YweFZoakppTTIrMTBHcCtVZ2RO?=
 =?utf-8?B?MG1vdHorTUlWd0E0RUc0V2ZQLzIxSDN1eDk2eGxnZE50R3JrSmFTdWplQ0RI?=
 =?utf-8?B?anlHUjg2S0E4MjJ3ajRzMVBzdVErZERjSkJRMjhBcTBtZk9GeHJ2bWxmK3p3?=
 =?utf-8?B?RHlZTUVLUHFBbXlFSGptaWFsVmFHTkdVVFMzQzRRTGtxaHlZbDNGV05tanZr?=
 =?utf-8?B?WGpuV25DRDJZWnNlT2hGT0xLL1lwVFRJVG1tVGJkK2ZtS295ZHl3OFBiS250?=
 =?utf-8?B?TTBPeW95Zy9jNmtJQmhDMXY0by9rcW1JbVFaaVVTZytCNDk1T2I1UHlQc3Rr?=
 =?utf-8?B?QjlMazN5b2xkUnJJZk9zekVGYTVWN0UwVnoyeVcwM2VvKzIzU3ZWclNDS3RH?=
 =?utf-8?B?UUZpSk9sZUxUT3FQMGhvcjNYeXN1U0VIQXJwR0FmT0tCZlgxSERJY0NNWXBh?=
 =?utf-8?B?WXk0bTZyNE5tbEkzME9jcTF1SWZMSFMzVk9MQmtGSk4xdGpCTFdHRllmZUZT?=
 =?utf-8?Q?HRI4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29becc3c-3455-44ac-83ed-08db6c8a3799
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 03:48:29.6771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KfbLjI25Rx7irz5VxUGYJVDcK2Vve7vWRTEQ8dX/b6cFXvZLY3nS3uK9oi2cQROa9gHIlkZjbh2C3NOsXUtgQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5174
Subject: [virtio-comment] RE: [virtio] [PATCH requirements 5/7] net-features: Add n-tuple
 receive flow steering requirements

DQo+IEZyb206IEhlbmcgUWkgPGhlbmdxaUBsaW51eC5hbGliYWJhLmNvbT4NCj4gU2VudDogVHVl
c2RheSwgSnVuZSAxMywgMjAyMyAxMTo0MyBQTQ0KDQo+ID4gSWYgaXTigJlzIGEgImZsb3d2cSIg
ZGVkaWNhdGVkIHF1ZXVlIGRldmljZSBib3RoIHRoZSByZXF1aXJlbWVudHMgYXJlDQo+IGFkZHJl
c3NlZC4NCj4gPiBEZXZpY2UgY2FuIGNob29zZSB0byBpbXBsZW1lbnQgaW4gaXRzIHByZWZlcnJl
ZCB3YXkuDQo+IA0KPiBJIHRoaW5rIHRoaXMgaXMgYSBtaWdyYXRpb24gaXNzdWU6DQo+IERldmlj
ZXMgQSBhbmQgQiBlYWNoIG9mZnNlciB0aGUgVklSVElPX05FVF9GX1JFQ0VJVkVfRkxPV19GSUxU
RVIgKHRoaXMgaXMgYQ0KPiB0ZW1wb3JhcnkgbmFtZSkgZmVhdHVyZS4NCj4gQW5kIGRldmljZSBB
IGltcGxlbWVudHMgZmxvd3ZxLCBkZXZpY2UgQiBkb2VzIG5vdCBpbXBsZW1lbnQgZmxvd3ZxLCB0
aGV5IGFyZQ0KPiBib3RoIHVzaW5nIHJlY2VpdmUgZmxvdyBmaWx0ZXJzIGJ1dCBBUkZTIGlzIGRp
c2FibGVkLg0KPiBUaGUgbWlncmF0aW9uIHNob3VsZCBmYWlsIGF0IHRoaXMgdGltZS4gRG9lcyB0
aGlzIG1lZXQgdXNlciBleHBlY3RhdGlvbnM/DQo+DQpJZiBGX1JFQ0VJVkVfRkxPV19GSUxURVIg
aXMgb2ZmZXJlZCwgaXQgbWVhbnMgYSBkZXZpY2Ugc3VwcG9ydHMgZmxvd3ZxIG9uIHNyYyBhbmQg
ZHN0Lg0KU28gbWlncmF0aW9uIHdvbnQgZmFpbC4NCiANCkl0IGlzIG5vIGRpZmZlcmVudCB0aGFu
IGFueSBvdGhlciBuZXQgX0YgZmVhdHVyZS4NCkZvciBleGFtcGxlIG5vdGlmaWNhdGlvbiBjb2Fs
ZXNjaW5nIG9yIF9NUSBvciBfUlNTLg0KDQpXaGF0IEkgbWVhbnQgaW4gYWJvdmUgInByZWZlcnJl
ZCB3YXkiIGlzLCBkZXZpY2UgY2FuIGNob29zZSB0byBvcGVyYXRlIGZsb3cgdGFibGUgZW50cmll
cyBhcyA1IGZsb3cvc2VjLg0KT3IgaXQgY2FuIGNob29zZSB0byBkbyAxMDBLIGZsb3dzL3NlYy4N
Cg0KVGhlIGJhc2ljIHJlcXVpcmVtZW50IGlzIHRoYXQgZmxvdyBydWxlIGVudHJpZXMgc2hvdWxk
IGJlIGEgbG93IGxhdGVuY3kgaW50ZXJmYWNlLg0KDQo+IE9yIGRvIHdlIHdhcm4gaW4gdGhlIHNw
ZWMgdGhhdCB1c2luZyBmbG93IHZxIG1pZ2h0IGNhdXNlIHRoZSBtaWdyYXRpb24gaXNzdWU/DQo+
IA0KSXQgc2hvdWxkIG5vdCBjYXVzZSBtaWdyYXRpb24gb25jZSB0aGUgZGV2aWNlIGZlYXR1cmVz
IGFuZCBhc3NvY2lhdGVkIGF0dHJpYnV0ZXMgY2FuIGJlIHF1ZXJpZXMgYnkgdGhlIGdyb3VwIG93
bmVyLg0KDQo=

