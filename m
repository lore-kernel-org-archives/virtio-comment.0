Return-Path: <virtio-comment-return-6658-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9048EB64D7
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 11:35:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 359A72ACAA
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 11:35:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1ACDB9866F0
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 11:35:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F0E119865E9; Fri, 30 Jun 2023 11:35:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DFC9B9866EC
	for <virtio-comment@lists.oasis-open.org>; Fri, 30 Jun 2023 11:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhdVCQfZU/x2ujHMm3DIrYBmN4rGK/+0ywdjygQQWozzVSs/vzz3FqGdUXGXaXWiBhWLz5b0eVd9w12DXKs+0+IwZkBPVzBmU4cu9wYu8ADf8e7Q0NNuXcbsyhRcHs0BnW8SNNBm6b2K9TW0VJLcuQp/0PSCVMUhc5C8w/zm7oVmIWCpr0KoBhvczG5tyh3Zx59g+Li1uTK72v+aM6kE42MKGwzzer+an65T+M5IEZF8n/t3ysD3FGDQgSNoOeLHP38QiFh40pMh6OeGYEMs9Pk6AJ3PnbiauZDQumf+eAw32wBagrOISIcyWrL08s/uONCg6nktkQgrFTohcpCXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2g/KGNWuPj4PZgDz4zgmwS8cb7YrYu5FKgQdNSRbt0=;
 b=DurPLQBoXIhCOC4VARDgTeIdi7h7T/LptrcsEnSBRuqLU+3F+Z0IW3JtZ9QmX0XxvdEBOsvLWAQbxlUcO6OrS62wGIRxpoADopIvEl/nz3P2UeHJBDQipubNPUH2A2tyu74FfOJT7L6A0IcjRFRsHy2L50gLhBFcL6eo/2bPIeIfDb/VYBB/LKbyGUw3mIgNPo3Vg/6dBudy/123v2W4HFzG7ipJJK1VkNDMlr2pPJkN4duJfX0cjfm7wzCR1AQgxOmo6PYHnbuzdxm+Ywnb1Du3FwWrXQ5jZCtyxB5PhufUB8my5AgHD2BstK9h7bYXnRRLzieG9YI4X34n8vcpHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>
Thread-Topic: [virtio-comment] About the plan of Admin Queue
Thread-Index:
 AQHZo0OgMaVHGskGLUio/ZFR6jh2f6+TVwYAgA+RFwCAAAcYgIAAGFcAgAACKwCAAAB8AIAACicAgAALnICAABYRAIAAC8gA
Date: Fri, 30 Jun 2023 11:35:11 +0000
Message-ID:
 <PH0PR12MB5481243B22A694E42C351C20DC2AA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com>
 <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
 <b95673d9-21e5-0fea-abdf-c0f8389e5cee@intel.com>
 <1688111214.8488657-2-xuanzhuo@linux.alibaba.com>
 <ac6bb15c-bb44-b1de-aef6-9974350962da@intel.com>
 <1688111784.0426908-3-xuanzhuo@linux.alibaba.com>
 <7ab5978d-c503-c279-a42e-bcdbf40184d4@intel.com>
 <1688116457.7400494-4-xuanzhuo@linux.alibaba.com>
 <259c7b04-58df-8085-755f-a36993556a89@intel.com>
In-Reply-To: <259c7b04-58df-8085-755f-a36993556a89@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS7PR12MB5766:EE_
x-ms-office365-filtering-correlation-id: 1120b42a-2d8c-4d11-0ed0-08db795e10b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SXeP4QtfSjRt1j0kfHoRG5idBaLHpRc3ZeQX1m+tp57R23zz1JKdQAARiV4zSt3BeEMZwYBc5QWgfSoClnebkyMi7qKxoTFLT6Za8HAyDOmnBLJgQ/Q+9b5GeeF2aSazqJtC4PkIWC548hpT+HzU2jEHNi+5uaolqePXGKQohZp9OLaAKUy/Ybdxp8LTuG1uNXSPNuLouYLKHqSQVLkjOZjQTCX4z3mYtoxB2tNYrOzJ3dy3LmhkhSAoPEZttRkZOq93kgTo4suugcKA4GRj9fJeNXzo5rG/kpUYILKwI8dI1RevgsQW8MfyB5recSqaTdLXlWXrbYCZ8kwQiC7hd9nBiWF2mMkvJ2Pt0m0djU1h/xv7+df+aThhlTeP4g/1gRm6har58ZpkDOaPi/VBAmQ13TTWh/1BZvP4IoMkSFXnGXJH2mJelGBDwXxg1X6RSO5RxWr57plD3CFQnVOQh4YA2NhSK7zM5Lhv+xiwerWkfPglw113TfjMfxCqW92cGNPPvlzdA0TjxKywokAZmgSzS8gcJmAna3udNZhXfE/IRnFaP2qLY1oOFPkMppx+7DGkzcofjzmBoZDkEzmxx4aeVwBtXxR6fgQ3MvTkmP2DyMAnQctVxHQzt6KU7dzGWITb3AliZNTWnD3Tbhs7YgA4FYQV6peoe9nccLA0at0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199021)(8936002)(8676002)(5660300002)(64756008)(76116006)(66946007)(66556008)(66476007)(66446008)(55016003)(4326008)(2906002)(316002)(52536014)(41300700001)(54906003)(110136005)(478600001)(71200400001)(7696005)(966005)(6506007)(83380400001)(33656002)(186003)(26005)(9686003)(38100700002)(122000001)(38070700005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0tEeUJPMG01U1J2cmowVnVPWC9HVDFNd3pWcTd1S3lFQWFhZTlBcmc1TXNU?=
 =?utf-8?B?S0E2SzJxbUxsMk5KM2hQU0V2OUpZc0kwNG1wZGtJemlZVlJQNWxBZCtmQm4y?=
 =?utf-8?B?YTdBMDlPanJ5VXM2U0tvcVBmUzZFYXF3OXdvNDBZN1ltODNmKzk3YkdtQ2RP?=
 =?utf-8?B?a1ViVjZoUkl6Q2E2TzkzR013OXAvV1M1VXRWa291UlhJcDdKK3JHMU9HZmVi?=
 =?utf-8?B?WnR1eGVIb2dlSXpPUThxQ0VXcUJhK1o5b0hJdXFvSFl4WGYzNG9OQ1JLOGsz?=
 =?utf-8?B?SENERXNaSzk4S0s1UTdhYzhNa2lPenE2SXp2TlhHM0NORW5nZ081NU41V3Zt?=
 =?utf-8?B?bHJadi9SQnZLTEN6Tzh6UkIyV1FhVWlvWmRzaUZtcFRjWFpvRnJxVEcrSytB?=
 =?utf-8?B?aFJrOUI1aGlCM1hsb09sZzVMdzc5cjZKMmo4OVVIdzYzM1p6d3ZrMGtwYU5G?=
 =?utf-8?B?bjJzOTNMVHU5bmk1SWZCenQxRVFOZDMvdXN6SmFiOSt1VDJWVm9SQzdnTnQ0?=
 =?utf-8?B?ZFpQb1ZhNUdxTi9vSk9HWTJmblNFOVR6d2F0Q2ZZcWV5YmJCSDdiK205SjBW?=
 =?utf-8?B?M0hjZkptSU1scUNZVzdrZktZRjdISlJrVkhQQnhXS1ovbWw0R0J5Qmo5bFRI?=
 =?utf-8?B?bDdxYjNiNWdmTTlsc2NuRFZ3VTFCUFFqd3pGb0tEa3QvSGthS3ZMUVFIcHJv?=
 =?utf-8?B?Q2xlRzhKTU5yVUY5dWFYdHo4ejVERXpMSTJ6NTR5Z3MwRkZNbkFDVUpDU2Yr?=
 =?utf-8?B?UnBVSnl6SDFFOWFrVVhlMXJJaldOSGM5dVVma2MzTEhCSE1rdWxxSHFUVDE3?=
 =?utf-8?B?R1hlRmM1RGptT21yZGtWOHFqenZHeHh1STZ5Z2pYQ3BvdG4yc0xmNU5SWjRq?=
 =?utf-8?B?bVQ2aXFMQ2xqY3pyUG9rd1Zjcjh4OER5K3pZV2VNbE9STVphWHFUbWxub1da?=
 =?utf-8?B?RS92UkxMelIwc1UzaXZZSlZaTGxKUFlGRHN6NGxHVFArMzBLNnBMS1NpRjlS?=
 =?utf-8?B?NTFCVnByN25oUmxubnVxSHdsVUxvaTZLZmNpY1Zmdm9jYWtySDBYU3FYRFVy?=
 =?utf-8?B?ejlWZkJVejZjUjFGMFNPSTB1RWw5YTYyS3BMSkdoY0tJY2ZPYk45d3Q3MDg0?=
 =?utf-8?B?MTQ4bG5Ea1VQUExtdnB2M2R6eStUQk5IcWpSb3d1R2IrdWNySzBxR3JNZXdX?=
 =?utf-8?B?UUtkNlFGZlpNeEdhUWlmZnV0T0dqRTYyci9WcXpjMW01NExQVmwwQjIwbUpr?=
 =?utf-8?B?MlNXUlc2ZG5hSXVyQThidFdDMXZwSWNwT1BEdGNBbnA3VFRQMXdic0toMUs1?=
 =?utf-8?B?VEV6czlveERXN3psOWNsQmMrVWY2SXcxWFl6VWwyNFhNUGsyNFJ0RUtzbHNN?=
 =?utf-8?B?cVZQQWpZSDA4dDc0Tkl6ZkhhdDRkQnoxUFJFZjE3RjllNFQyL05KdndJcm5m?=
 =?utf-8?B?WkNLR2hEb21WMUorK2h1MklGOGxxWHgrNkZTb1ZYeGR6dW1qWi9qQm5pUkQ2?=
 =?utf-8?B?anJsVm83azJMS3FuT3p2Y0NuM3JJRHBRVTVwUDg2dWsxSDJheEFyd2tBa1ZI?=
 =?utf-8?B?WXJ5S0xTVVcxK2xoUjM5MHZQaStJR0tsOVFhQjdYMCtjaFRVTkZ2ZUVhNWda?=
 =?utf-8?B?RHNxOXFBMFpsNmdLOTArZGRjNmMwd0NqeW5Wdm5yTlJPVWxPaEZuQ3RxZGVp?=
 =?utf-8?B?WDB3d0dFbGZmVnRWQUU1YlFhMDRGK3QrS0p0S01MQmIyNlhxTXRNb3B6ZThH?=
 =?utf-8?B?dnRmS3hPK29Pam9XMjRJanJOdVh3QVVrU3pwWVk2WkN4RllFZW1Jd2g0N0h1?=
 =?utf-8?B?TXlPdjdiekltYmFhTWJhemRhR0wvQXJRbGRWTUxKNW9DQ1lkazAzSyt4c3FD?=
 =?utf-8?B?VndLMGY4SCtha3ViWDZ4Y1dDL055MUJuSjBVcVRoNmsxR0Z4b01CdGJyUE5S?=
 =?utf-8?B?Uk4zZGliQWtIYWFXMXhBOFBJMGVoMkRmZFozV05nQUZmSHRiNStGQmN3NUx0?=
 =?utf-8?B?YkEvdFJQc0ZORzJvVnAvNlorSm13NHhGZ3BYUmNqN1oyN1RjUVg4YWFTMU44?=
 =?utf-8?B?RHBwNnhINExueHBURk9vWnZERnZYelgrSW1RWjdDUjZUSjN1YnVHNGZZT1Zy?=
 =?utf-8?Q?Dy6M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1120b42a-2d8c-4d11-0ed0-08db795e10b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2023 11:35:11.7033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uzSKBxuy8IvPriO2uUCozesT9D7jxyc1K2PPJd4ouqQzfROvmiX6KqB1j1B15h+vFNua+VaTt1zUvX713f5Rgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5766
Subject: RE: [virtio-comment] About the plan of Admin Queue

DQo+IEZyb206IHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnIDx2aXJ0aW8tY29t
bWVudEBsaXN0cy5vYXNpcy0NCj4gb3Blbi5vcmc+IE9uIEJlaGFsZiBPZiBaaHUsIExpbmdzaGFu
DQo+IFNlbnQ6IEZyaWRheSwgSnVuZSAzMCwgMjAyMyA2OjMzIEFNDQo+IA0KDQoNCj4gPj4+IENh
biB3ZSBsZXQgdGhlIERQVSBub3RpZnkgdGhlIGRyaXZlciB0byBjcmVhdGUgYSBuZXcgZGV2aWNl
ciBmcm9tIHRoZQ0KPiBiYWNrZW5kPw0KWWVzLCB3aHkgbm90Lg0KDQo+ID4+Pg0KPiA+Pj4gVGhl
IGtleSBwb2ludCBpcyB3aG8gd2FudCB0byBjcmVhdGUgYSBuZXcgZGV2aWNlLg0KPiA+PiBEUFUg
Y2FuIGNvbWUgd2l0aCBhIGNlcnRhaW4gbnVtYmVyIG9mIHByZS1jcmVhdGVkIEFESXMsIGp1c3Qg
bWFrZQ0KPiA+PiBzdXJlIHRoZSBvcmNoZXN0cmF0aW9uIFNXIGlzIGF3YXJlIG9mIHRoZWlyIGRl
dmljZSBJRHMuDQo+ID4+DQoNCkNsb3VkIG9mdGVuIG5lZWQgdGhlc2UgZGV2aWNlcyB0byBiZSBj
cmVhdGVkIGR5bmFtaWNhbGx5LCBtYW55IGEgdGltZSBhZnRlciB0aGUgaG9zdCBPUyBpcyBib290
ZWQuDQpUbyBiZSBtb3JlIGdlbmVyaWMsIHRob3NlIGRldmljZXMgdG8gYmUgY3JlYXRlZCBhbmQg
Y29ubmVjdGVkIHRvIHRoZSBob3N0IHJlZ2FyZGxlc3Mgb2YgdGhlIGxpZmUgY3ljbGUgb2YgdGhl
IGhvc3QuDQpYdWFuIHBhcnRseSBleHBsYWluZWQgaXQuDQoNCj4gPj4gSWYgeW91IHdhbnQgdGhl
IERQVSByYW5kb21seSBjcmVhdGUgQURJcyBhbmQgbm90aWZ5IHRoZSBkcml2ZXIsIEkNCj4gPj4g
dGhpbmsgd2UgbmVlZCBpbnRlcnJ1cHQsIGUuZy4sIHJlLXVzZSBjb25maWcgaW50ZXJydXB0LiBC
dXQgd2h5IERQVQ0KPiA+PiB3YW50cyB0byBjcmVhdGUgYW5kIGhvdCBwbHVnIGluIGEgZGV2aWNl
IHRvIGEgZ3Vlc3Q/DQo+ID4+IFNoYWxsIHRoZSBob3N0IGhhbmRsZSB0aGF0IG9yIERQVSBwcmUt
Y3JlYXRlIHRoZW4gZXhwb3NlIHRvIGJhcmVtdGVhbA0KPiA+PiBtYWNoaW5lcz8NCj4gPg0KPiA+
IEluIHlvdXIgc2NlbmFyaW8sIHRoZSBzdXBlcnZpc29yIGlzIG9uIHRoZSBvcywgd2hpY2ggY29u
dHJvbHMgdGhlIERQVQ0KPiA+IHRvIGNyZWF0ZSBuZXcgZGV2aWNlcy4NCj4gPg0KPiA+IEluIHRo
ZSBjbG91ZCBzY2VuYXJpbywgdGhlIHZlbmRvciBtYW5hZ2VyIGlzIGluIHRoZSBEUFUsIGFuZCB0
aGUNCj4gPiBlbnRpcmUgaG9zdCBpcyBmb3IgdXNlcnMuIE9mIGNvdXJzZSwgdGhlcmUgYXJlIHNp
dHVhdGlvbnMgd2hlcmUgdGhlDQo+ID4gdmVuZG9yIG1hbmFnZXIgYXJlIGluIHRoZSBIT1NULiBC
dXQgZm9yIGJhcmUgbWV0YWwgbWFjaGluZXMsIHRoZSBob3N0DQo+ID4gYmVsb25ncyB0byB0aGUg
Y3VzdG9tZXIsIHRoZSB2ZW5kb3IgbWFuYWdlciBpcyBvbmx5IGluIHRoZSBEUFUuDQo+ID4NCj4g
PiBTbyB3aGVuIHRoZSBjdXN0b21lcnMgYnV5IGEgbmV3IG5pYyBmb3IgdGhlIGhvc3QsIHRoZSB2
ZW5kb3IgbWFuYWdlcg0KPiA+IHdpbGwgcGx1ZyBhIGRldmljZSB0byB0aGUgaG9zdCBmcm9tIHRo
ZSBEUFUuDQo+IEkgdW5kZXJzdGFuZCBvbmNlIGEgY3VzdG9tZXIgb3JkZXJzIGEgbmV3IE5JQywg
eW91IHdhbnRzIHRvIHByZXNlbnQgdGhlIE5JQw0KPiB0byB0aGUgaG9zdC4NCj4gSG93ZXZlciB5
b3Ugb25seSBvd25zIHRoZSBEUFUgYW5kIHRoZSBjdXN0b21lciBvd25zIHRoZSBob3N0LCB0aGF0
IG1lYW5zDQo+IHRoaXMgY3JlYXRpb24gYW5kIGhvdCBwbHVnIG11c3QgYmUgdHJhbnNwYXJlbnQg
dG8gdGhlIGhvc3QgYW5kIHRoZXJlIG1heSBub3QgYmUNCj4gYSBob3N0IGRyaXZlciBoZWxwIGhh
bmRsaW5nIGFuIGludGVycnVwdC9wcm9iZS4NCj4gDQpUaGF0IGlzIG9rLiB3aGVuIGRyaXZlciBp
cyBsb2FkZWQsIGl0IHdvdWxkIHF1ZXJ5IGFib3V0IGl0cyBjaGlsZCBkZXZpY2VzIGFuZCBwcm9i
ZSBpdCwgaWYgd2Ugc3RyaWN0bHkgd2FudCB0byBmb2xsb3cgU0lPViBtb2RlbC4NCg0KPiBIb3dl
dmVyIHRoaXMgaXMgbm90IFBDSSB3aGljaCBoYXMgYSB0cmVlL3N3aXRjaCBhbmQgY2FuIGVudW1l
cmF0ZSBkZXZpY2VzIHRvDQo+IHRoZSBob3N0IGJ5IHNwYW5uaW5nIHRoZSBkZXZpY2UgYWNyb3Nz
IHRoZSBQQ0kgaGllcmFyY2h5Lg0KPg0KVGhvc2UgZW51bWVyYXRpb24gaXMgdHJpZ2dlcmVkIGJ5
IHRoZSBwYXJlbnQgUENJIGRldmljZSBhbmQgcGNpIGJyaWRnZSBhbmQgc3dpdGNoIHdpbGwgYWxz
byBkaXNjb3ZlciBpdC4NCg0KPiBUbyBhZGRyZXNzIGFuIEFESSwgdGhlcmUgaXMgb25seSBhIGRl
dmljZV9pZC4NCj4NClNJT1YgZGV2aWNlIG11c3QgaGF2ZSBhIHVuaXF1ZSBpZGVudGlmaWVyIGF0
IFBDSSBidXMgbGV2ZWwgZm9yIHN1cmUuDQpJIGNhbm5vdCBzcGVhayBtb3JlIGFib3V0IGl0IGlu
IHRoaXMgZm9ydW0gZHVlIHRvIG90aGVyIGxvZ2lzdGljcyBpc3N1ZS4NCkJ1dCBhc3N1bWUgdGhh
dCB0aGVyZSBpcyBQQ0kgbGV2ZWwgdW5pcXVlIGlkZW50aWZpZXIgZm9yIFNJT1YgZGV2aWNlIHRo
YXQgc3dpdGNoZXMgb24gdGhlIHBhdGggd2lsbCBsZWFybiBhYm91dC4NCiANCj4gU28sIGRvIHlv
dSBtaW5kIHNoYXJlIGhvdyB5b3VyIERQVSBvZmZsb2FkIHRoZSBkZXZpY2UgbW9kZWw/IFdoYXQg
a2luZCBvZg0KPiBkZXZpY2UgeW91ciBEUFUgcHJvdmlkZSB0byB0aGUgaG9zdD8gTGV0cyBzZWUg
d2hldGhlciBEUFUgY2FuIG1lZGlhdGUgdGhpcyBieQ0KPiBpdHMgb3duPw0KPiANCkl0IGlzIGEg
dmlydGlvIG5pYywgYmxrIGFuZCBvdGhlciB2aXJ0aW8gZGV2aWNlcyBmb3IgdXMuDQpBIERQVSBo
b3RwbHVncyBhIGRldmljZSwgaG9zdCBzaWRlIGVpdGhlciBnZXRzIGludGVycnVwdCBvciBsYXRl
ciBnZXRzIHRvIGtub3cgYWJvdXQgaXQgd2hlbiBleHBsaWNpdGx5IHF1ZXJpZXMuDQpUaGVyZSBp
cyBubyBtZWRpYXRpb24gcGVyIHNheSBoZXJlLCBpdCBpcyBqdXN0IGEgZHB1IGJhc2VkIFNJT1Yg
ZGV2aWNlIGxpa2UgYSByZWd1bGFyIFBGLg0KDQpGb3Igbm9uIHZpcnRpbyBEUFUgZGV2aWNlLCBJ
IGltcGxlbWVudGVkIHRoZW0gaW4gTGludXggZm9yIGRwdXMgMiB5ZWFycyBhZ28uDQpZb3UgbWln
aHQgZmluZCBhIExpbnV4IHJlZmVyZW5jZSBtb2RlbCB1c2VmdWwgYXQgWzFdLg0KQSB1c2FnZSBt
b2RlbCBhbHJlYWR5IGV4aXN0cyBpbiBvbmUgT1MgYW5kIGluIHVzZSBmb3Igbm9uIHZpcnRpbyBk
ZXZpY2VzLg0KVGhpcyBjZXJ0YWlubHkgd29ya3Mgd2l0aG91dCBTSU9WIHVuaXF1ZSBQQ0kgZGV2
aWNlIGlkZW50aWZpZXJzLCBiZWNhdXNlIERQVSAobm9uLWhvc3QpIG1hbmFnZWQgU0lPViBkZXZp
Y2Ugc3BlYyBzdGlsbCBkb2VzIG5vdCBleGlzdC4NCg0KRm9yIHZpcnRpbywgSSB0aGluayB3ZSBz
aG91bGQgd2FpdCBmb3IgdGhpcyBwaWVjZSB0byBiZSBkZWZpbmVkIGFuZCBsZXZlcmFnZSB0aGF0
LCBpbnN0ZWFkIG9mIHZpcnRpbyB0YyBjcmVhdGluZyBpdHMgb3duLg0KDQpbMV0gaHR0cHM6Ly9n
aXRodWIuY29tL01lbGxhbm94L3NjYWxhYmxlZnVuY3Rpb25zL3dpa2kNCg==

