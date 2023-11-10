Return-Path: <virtio-comment-return-8308-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F63C4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 06:46:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1BB0426A35
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 06:46:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E86EB986D01
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 06:46:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C9940986CF8; Fri, 10 Nov 2023 06:46:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B7786986CF9
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 06:46:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+GfMZiudOoLbhnnhOJZnIjByXC8LFSsRONJBb+08oa1yuUqSN4hSJgDLWU+uJDOE0YUzmU06ALBYDE4csmqF9Nvv/ilc1nrZGG5/taLA07+UjfP+7lr+s/RTtzE4Y4NeqAF8PGpFsx6ho/jEzeB3pY6pxa8QsQgolzK9uz/D3xuMw3FjKU/YnbdqY65Wgju2plH7nhJEQ8C3P84Qn7ZXiX/WkrZXXsrqm7aYFn9buC5tN6/H2QX671fcSHOP2jreTEa1ekAHfYf51SbaNtbP+Ia95ku59U8LDr8qZ2XwO54RFvymy0tlE20t9F5EexOl8AHJnsXuDWG2x+KX9bsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pfXLdh3n6GA+6v48KT7JPcFBJ03yfYZAyh0x9K+JGI=;
 b=T8ifPaWdA8lhbL3Lp+wCo7az4DExS25ubWL/hhXDAHDHWDcR/V90baz34JIE7tq7hCHfVDfdDJ/SkQGTGw7H1dKFcTzhM6LWFswtDa5K8+cu9NAm9oaTMm24viw24qN5NQxgUMM3aMr4TJbDh83mgrzDTM8+e2FII01zfCjKuLL9PlRs32lpq83ynzzI9IBPktTj5Ycvm+UEWn3g9B/nadoJb2RhHsQEnu+WQa2KbL8l9WjXnwuF4FRSvCY2D8tt9nDOrYdEgwTrrQwWrgXcq9h7VBT4+Ym5/ZqhPAwwwODICmo5AwN79wL5us3sDMTyEinO6ZBaMp781rq6ocyRcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands
Thread-Index: AQHaEfwUGl0o9tnLPEOcv64rj4RwurBwFAEAgAFCeICAAEregIABfKLQ
Date: Fri, 10 Nov 2023 06:46:37 +0000
Message-ID:
 <PH0PR12MB54813C84CFA5601DB1B47885DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org>
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org>
 <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231109022647-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CYYPR12MB8655:EE_
x-ms-office365-filtering-correlation-id: 94844118-b0f2-46ff-9316-08dbe1b8c993
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5o5onlyXQugWQAw4is1sRrXzTws0/UVDG0c0p9EGqMCIgF4rHhF9PDGPW8RziCqiHySrQm65NKgtcL0peIdgCErBaGxNUU/iZ86T2TugkNF8rxRukQLjYFLETTMO8XUV49vKkmTuCPNsQnT5kiTQ1vj6UcQcEqcOrCXgdaHfcNXx0mq+v6nfVGGwd1lvF02aqPNrFPf8LrLG9c1pvDYDAI6nYAbOU/FZcw+LpwK3n8JH2v06200vtKv16+I+oohEg6SxtDu9iWv6FpVjROFtNky7tlWZO33fku5Iyym+jKnrHlg8lKH4qY7MYV1AenHZEwt3Xhi5MHCEHB8uuhPKH3lffZVAzQswhP+D4bDovjIV+GOClTNo3W3K+jUDDSLknFLJQ/iyGwhs4FWS+wstf12dKJyPk7dfblstThXkjzP92o8u4JAk91fs/wsOhs8QflVcHsIwjnuLjEZPAWKkAG2xE0b60aNgcdMiJRZaEITb+11SB4PxPuSrbP1IVeNyMUeq2I4I5OKxGiS+KrIIK0HVZGZ06KyATHig+zzU+mB1D/FT6xigi/Fgv3x9n9s6Lx4P/jJoJqQ0OhLPI5WckuVqVMr0IYVcTa7nU16ckgJY95mciCelsntRL+qJoC8k
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(39860400002)(376002)(136003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(38070700009)(33656002)(478600001)(52536014)(5660300002)(55016003)(4326008)(8936002)(8676002)(76116006)(2906002)(9686003)(66556008)(66946007)(316002)(26005)(66476007)(66446008)(110136005)(64756008)(54906003)(6506007)(7696005)(71200400001)(122000001)(86362001)(41300700001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?KzdCcXVaTEFyWHhRNzBGOXY1Z1ZJbmhCTllMcjhhcTB0SnNLT3V3K24yOXEy?=
 =?utf-8?B?NjROd0VpNEpxS1pwU01ReHU5SlJkVVNpS3k1R21HS2MydmtUYkZtM2hydS9q?=
 =?utf-8?B?SUJtTEVQdFpGR3FkdTI2Z293Nmc0QmlVd3NWSm9HZE9mckFTRHFXSEFock9a?=
 =?utf-8?B?alpEdGVNSk93dHoyZ3FPTE1LTTRGK3Z0amhGMFpNQUlBeUtOL0Z1RG1TZ2NR?=
 =?utf-8?B?bTVkUFUyWFN3bVk5cWV6QU14WENkTGxXb0VUeTNET2hRMGRRc3JBOGR3azdZ?=
 =?utf-8?B?VHo4dVo5Z2Yxa0hlL2w4aTZLRTRYVkNEeTRQQnVDVXhBaDVSUmplWVAvd2Fu?=
 =?utf-8?B?SVZCQVpDSFpVVTFrT1BQbEVaMkFvOVA4T1h6dEhiSDAraFFuSDBiaGlHa3dU?=
 =?utf-8?B?ekkxNDRTeFluNnNLa2JqUXRkTE00VTRQNExPY01IeUM4NWkzYllBRGIwcjNy?=
 =?utf-8?B?U2ZUSmF3ZU9NY2hEeWRkeFMxTU1HZHJnQkFER2RnajFaYk54bS9oRy9UOEg5?=
 =?utf-8?B?ZFFkdjdHbXJodUZJT1MwQ0NoZ3BCQVFQU24xdHRkWWI0K1JWSFpZdGoxUzV4?=
 =?utf-8?B?cWJudThYQWpjUm1Jc3Buck5LTVpNUEVxVzdRdEtHVE9HSUk2RllrcDBVL3BN?=
 =?utf-8?B?cnRFTG8vUzJHREJEU0w1MmNpSzdaNzRtdnJneUsyT21MWnI5L2piMkFiQjVu?=
 =?utf-8?B?OUNTc1hTTkxnc1Y4cVFsNjdJUTNSUDdweWZhRWQ0b1pEdUV3WWMyTE5ZNGlB?=
 =?utf-8?B?b0daNEJYYXdvS3FwVGdGc0xYLzNYV0tLT1dVL3l5WFVDcEFxUkNiYVR4OGV5?=
 =?utf-8?B?ZDgycWk1V1p5elE2c2J1Sk1uaWUvL0tBQm45ejhldHZJY0dPMkU5d2Uxa3pZ?=
 =?utf-8?B?UTlJdHdXSTdhejZXU1JJOHlFSTF1aVlrZmhoR2dOemdKT29LYmRIdG9HRTRq?=
 =?utf-8?B?d1hpVTBlb0ZOemdnRVI4Wk1TMnMxVXhXWXNGTzBzeDlCdlZmVnNvaUladEVl?=
 =?utf-8?B?Q0hvY2ZyQ3ZRaEMyNUFYanNyVjhmQnE3bms3VnQxVzZxOG5Sa2plVS9BVUNn?=
 =?utf-8?B?UjNpNTdPQXcyaVFqcmxaZlVHUXFiM2FxSWlCc1ByVWFCd2dBMTh2QW1GVlo5?=
 =?utf-8?B?SWg0aHNYM2VlUTFrRG92amNQSnNXVTFHSDNJbjFmc2NheGwyQXFIa0lBZjFF?=
 =?utf-8?B?R3ZPd3NXbGlWSUFVRE05TW9zNzF0UUZjNEx5ZEUxQnRNVEFrQkRFT2M0V3FY?=
 =?utf-8?B?RDY5b1lzd3k4Yk1BcXhLQ0Zrcm5CZUdMdE1RV3M4VUhRQm9FYVVCeVlxWnBX?=
 =?utf-8?B?T2lwZ2UzRHR0ZlpJM2pjVnpGVTZSWGpsRVJCSVA2SE1DM0FRMmdDbWdobVp5?=
 =?utf-8?B?cVlvSlQ0Mmt2WkJLZFBtaDZlSUJmZzR6QWhvYmozejBXREhSdFVUNVo4NEJB?=
 =?utf-8?B?QzN2TDh5NXJ6V3JkMXhQa0o1STMzSXlUQVpadk9CWVZPYWIxamN4bHZhbGtm?=
 =?utf-8?B?S2JJT2hjWkpkdENUL09UQmRlYjVxN2JINW1vcTNyeXEvZXlCRkVxZ20veEo0?=
 =?utf-8?B?WXFyeUVLQ3ZoR0twN2Y2ZTBDdkZ1Wm9qUnp4UWVxM1JJWWpvSFRMb1JWUko3?=
 =?utf-8?B?dUFoYlFBSFNtL2lDL25OdG9Bb1J3dTdYcytrRFFHTThWbkRCekw3ZmZnNWYv?=
 =?utf-8?B?THFwVlZJSUxlTFRVSUJIck4yV3VYQjRFSVFMNTE2VFFIMVFYM3k4OTFkYjdW?=
 =?utf-8?B?VFdPM2c2bEhqL0ludEgxVlRpQUpSQXViSlFGOVErMk1IckJuQlRkTjV4NjZH?=
 =?utf-8?B?SWdFTGl2Y1ZTY0ZmckpORC9keE5oRFJKNDFQeFZPVERXZnkxQ2xqcVM2Tzl4?=
 =?utf-8?B?anc4RkZlK0xzeXVuVkRkUmVHVjRid2pvcUQ1Uno1WjFOczhVbXRTSnVFa1NZ?=
 =?utf-8?B?RU1GOGlremw3VnhqakRWVm53SXVVZkFBeFFzeHZ4VVUzMmgzV2pReFF2Sko4?=
 =?utf-8?B?cDlFNGhyazNXUGZHbGJuMFJDdk5Hd3IwemNsNDBsSjBpMmp2Z0oxMEhtODdV?=
 =?utf-8?B?c1VRd09CYmx6Y3B4cHpkRmw1dEVLTlVrV2xwTW5aMEQ2ci9lS3d0QXo5OStX?=
 =?utf-8?Q?7SCs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94844118-b0f2-46ff-9316-08dbe1b8c993
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 06:46:37.4702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yUoDLDJQfRVk+5ghwnWTxcjPwjoKRczKvnaKN0hoxGuq/iKMnXmLCIK7M4Q8AouRU549pEvRHy3e54gE0cmd6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8655
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands

SGkgTWljaGFlbCwNCg0KPiBGcm9tOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29t
Pg0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgOSwgMjAyMyAxOjI5IFBNDQoNClsuLl0NCj4g
PiBCZXNpZGVzIHRoZSBpc3N1ZSBvZiBwZXJmb3JtYW5jZSwgaXQncyBhbHNvIHJhY3ksIGFzc3Vt
aW5nIHdlIGFyZSBsb2dnaW5nDQo+IElPVkEuDQo+ID4NCj4gPiAwKSBkZXZpY2UgbG9nIElPVkEN
Cj4gPiAxKSBoeXBlcnZpc29yIGZldGNoZXMgSU9WQSBmcm9tIGxvZyBidWZmZXINCj4gPiAyKSBn
dWVzdCBtYXAgSU9WQSB0byBhIG5ldyBHUEENCj4gPiAzKSBoeXBlcnZpc29yIHRyYXZlcnNlIGd1
ZXN0IHRhYmxlIHRvIGdldCBJT1ZBIHRvIG5ldyBHUEENCj4gPg0KPiA+IFRoZW4gd2UgbG9zdCB0
aGUgb2xkIEdQQS4NCj4gDQo+IEludGVyZXN0aW5nIGFuZCBhIGdvb2QgcG9pbnQuIEFuZCBieSB0
aGUgd2F5IGUuZy4gdmhvc3QgaGFzIHRoZSBzYW1lIGlzc3VlLiAgWW91DQo+IG5lZWQgdG8gZmx1
c2ggZGlydHkgdHJhY2tpbmcgaW5mbyB3aGVuIGNoYW5naW5nIHRoZSBtYXBwaW5ncyBzb21laG93
LiAgUGFyYXYNCj4gd2hhdCdzIHRoZSBwbGFuIGZvciB0aGlzPyBTaG91bGQgYmUgYWRkcmVzc2Vk
IGluIHRoZSBzcGVjIHRvby4NCj4gDQpBcyB5b3UgbGlzdGVkIHRoZSBmbHVzaCBpcyBuZWVkZWQg
Zm9yIHZob3N0IG9yIGRldmljZS1iYXNlZCBEUFQuDQpUaGUgbmVjZXNzYXJ5IHBsdW1iaW5nIGlz
IGFscmVhZHkgY292ZXJlZCBmb3IgdGhpcyBpbiB0aGUgcXVlcnkgKHJlYWQgYW5kIGNsZWFyKSBj
b21tYW5kIG9mIHRoaXMgdjMgcHJvcG9zYWwuDQpJdCBpcyBsaXN0ZWQgaW4gRGV2aWNlIFdyaXRl
IFJlY29yZHMgUmVhZCBDb21tYW5kLg0KDQpXaGVuIHRoZSBwYWdlIHdyaXRlIHJlY29yZCBpcyBm
dWxseSByZWFkLCBpdCBpcyBmbHVzaGVkLg0KSG93L3doZW4gdG8gdXNlLCBJIHRoaW5rIGl0cyBo
eXBlcnZpc29yIHNwZWNpZmljLCBzbyB3ZSBwcm9iYWJseSBiZXR0ZXIgb2ZmIG5vdCBkb2N1bWVu
dGluZyB0aG9zZSBkZXRhaWxzLg0KTWF5IGJlIHN1Y2ggcmVhZCBpcyBuZWVkZWQgaW4gc29tZSBv
dGhlciBwYXRoIHRvbyBkZXBlbmRpbmcgb24gaG93IGh5cGVydmlzb3IgaW1wbGVtZW50ZWQuDQo=

