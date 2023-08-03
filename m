Return-Path: <virtio-comment-return-6985-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008F4C0015E
	for <virtio-comment@archiver.kernel.org>; Thu,  3 Aug 2023 10:01:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3B7F4342F
	for <virtio-comment@archiver.kernel.org>; Thu,  3 Aug 2023 10:01:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2CA389866DA
	for <virtio-comment@archiver.kernel.org>; Thu,  3 Aug 2023 10:01:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2408E9866AE; Thu,  3 Aug 2023 10:01:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1304B9866B1;
	Thu,  3 Aug 2023 10:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmAmNh4JmFnZPJyVTaPJ5gA35vH7NjNB+RCgNolu+BOQ3N2v5oPWZlE20Ucx4L/AVrVNzCsdu1FO3sEJIJ1fhMMH+EqXJb2uHu9tutMl/GrxOmZi4R/38QFGcqrenUPOCwFa3pTu51uAotEkaVF/IqFI2PrEz2cxfUSSQd6pSMzU0ig9DcvMxia9mbWhn63HG68Bv/rW7EovsuhwAnwzcTat56nWeXLdUF2DtAjqhgjuKZhSrfN6YjWrSL+bUWKyd4YELKDSCKyUZJEUA9tDhAuOXZovIg64OVz+9bWk8XUb+OCrJowlGoN/8UxAKlnUs9EnCfB/Z/EmFwMf2g/VLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrVzIoBztZlDjvwyySM2NAawhWrmLXChr3Siiuo8RGc=;
 b=ihQ/pPUHNsf+woutHvWKRohYWa8hWt689s+ECieVvH17rP8XlDZpbdzNWcs1G7RS8BwJneZjoy6GapxQiymTtBRGQQxGRMNurj781pkGQlmSxp0nnfml5zs2gXS2z7L2SI2xco48/p6M3kMOjeA8KDeYfKZHQnpfX+AuC3WctILfN9fsih/KDYKZtL1LMO5LzFuTTACEcm79zwuZlN+IF8p2NQYjhtSl4SA6Sf7IB/vyIokkRspvfVhQevLHKCsm59qxjVDcFIXQoPFI/mvdxzlxTAx6SAZd44aCTwB1/diptni63Yn20I/S33iu14u3Cajtp0ksLRNefPueV8r/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] RE: [PATCH requirements 5/7] net-features: Add
 n-tuple receive flow filters requirements
Thread-Index: AQHZvd/S1zVkOCRsJ0eCMof906XE7a/VKJZQgAF0pOCAAJQ/gIABNVnQ
Date: Thu, 3 Aug 2023 10:01:30 +0000
Message-ID:
 <PH0PR12MB54812B87B28DBF467F546021DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
 <PH0PR12MB5481BFAC574390286C5BA0FBDC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB54816E5CA04DAFD03581F6CBDC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d7dea4fb-5c47-fc3b-f220-0865aecf4cb7@linux.alibaba.com>
In-Reply-To: <d7dea4fb-5c47-fc3b-f220-0865aecf4cb7@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB6329:EE_
x-ms-office365-filtering-correlation-id: e52972a1-f4f2-47c5-b4c8-08db94089c7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mj5YFyaUaM/ojYD2jG0kKpZdD7/tSaW5tNH2h7F1S47ej/noR5zivDug9fZf+PTYEfrVNcWlDJM3pJ/OXXkfI4wwxVve6QLRi4XChMBElr1cjPh26pnmJbwtWNwZemdmGLdLfkvDthzDcgHclhXQ+7L6gqVNh9v2oT17Ccmq2qrLvnUPMpS9IFYAOajrvQO0zBpIZ4mMYcM53IC6n6DKlCH5EGfYBpEVTnlJAHRu74XGUnwibNcB5Qu4lawN8+NfhEEIGk15FxKbUB7lysWgYb28iWz38lzb0pS/HCvcInNeufrQZZNQx84GyYevwbqBL1u397kDX+UO8G5ALfIQZmgc9J69pAFM0w+Z7jzo3Kp04wjdAqNIqPDK5qrb4I+G3xxIIow+MrypvxNqD4hqOovv7+Yra3pvV+Q1Ixz+0ReuO4H6WeR0J7LfT0LoctlhJRadUhFu9TGAW7/QqUoNOXur3TS/iG8zcKzmKHl9yS3yKZO5483tAG+w1JZoDIQoC2NQsvXF9ycep+skYwgf/xhHlrDc9+XQemzmJlYoR4vOVRW51HjhE5pcX5E13qlp6Q8Q338EElh9sVLUGIkaJ1FWkL4/m00JvTtmf7/4vqxiQej49XhdmlvI9DtfDSZp
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199021)(6506007)(26005)(186003)(4744005)(316002)(76116006)(2906002)(66946007)(4326008)(64756008)(66446008)(66476007)(66556008)(5660300002)(41300700001)(8676002)(8936002)(7696005)(71200400001)(52536014)(9686003)(54906003)(110136005)(478600001)(55016003)(38100700002)(122000001)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K3IxZEZqY0V0RkVITk8yUFBxQkp3dXY4alhWc2k2SlUzSEFpN2hXMGlCeG9l?=
 =?utf-8?B?dG9WRUU2MnRPTjNQOWtVNnNRL01OL2hCN1dON0xSRG5yaWo3VGlNeFNYczZp?=
 =?utf-8?B?eWRhM01oOXRVQ0o2Wmp3aEhnb0pIWDFSbUI4VnFic25IUTVVNlI1ZnZKYVBj?=
 =?utf-8?B?MnlTb1BjWnI1RGZPOThtVTVKNVAzbUNBVzN3S0doclBTVnR1UzUxZ2QrUDNa?=
 =?utf-8?B?YndMRjQ4V21abE5wcC8rMk9QakNzQXVWUGFxOXRib2dtc1VhQXMwRndVVEI0?=
 =?utf-8?B?MGxiSjF3UXIwL2VRNDhoa2Z6WjlxdEpkQTVZYUIyVmpuTnRYSkpHVCtsYlp1?=
 =?utf-8?B?OTE1cmd4bThoREVUZlAwN1pVSHFSVkF1eEVDek5meitkRHduL0lXeUZvc0Yy?=
 =?utf-8?B?QnJOOWZzdzZBbDF0TVpJZWJkMzlSSEgrTVg1ZGd5S3lha0lzMjRuT0hmYkhR?=
 =?utf-8?B?ZVdIUG4yWlgvQTBOUDBtV2JIUlRSWlZlVXNzVEdBQ3IyWUdHbVVXY2d3czZo?=
 =?utf-8?B?ZzFxZC95Szk3bFZQVDJwRGNyQVlZV0dmSHROTUdHbFhFN0xLYjJrbFJVRk9z?=
 =?utf-8?B?Si95Nlh5RW5LUlJIL21BUzhTMjZ0SFZ1cmpNZFdUT2FmcTdhK2l2YUVZWGR0?=
 =?utf-8?B?R1lEVC9pRzhHOTdiTGczVThnaTlmRGwxVnFqRFFPMWYwYzNHRDVXa29BbVBZ?=
 =?utf-8?B?MTNWSU9kMUE3UjNXSENlVXZDWVNPSlk1VGFFeGZvbUpLVEtQem9GTk1DbGw4?=
 =?utf-8?B?WG9ZQ1R0TFNlVDJCbnRvY01ZSEJHVWxMOEV1anVsY1hNMy8rS0hoUWpWNGZ3?=
 =?utf-8?B?TTFLSEFQeTRDUWlLdmJUN1MyTWxsOU83dUd1dXZLYW1SUEY4YTh6Q0NKL010?=
 =?utf-8?B?clJtaEszaGtPd0JYQTFScm5sM21YWXI4bzVPY0V1MEJBaXN0Ym5vY2xvaDRH?=
 =?utf-8?B?ZlcweU5OWmI3TDdHWTFhR2U2TmM1OXZQZExTWUFhejNJeStnNllUKzR6enNV?=
 =?utf-8?B?L2tyRGZiRUdjRmJJM3Q1T0xsUHB3K2w1ZUJ5QllBa0dSa3pEWkV5aHVJWHcz?=
 =?utf-8?B?NnRqMk8zUlVkVTh4MDFmeDN4UlVKV1MySHlLQ280NUZlaU9xS0tGNmplU054?=
 =?utf-8?B?K0RwdVVaR2N6RGt1TzhEMDNkUCtqMGtCK3FaZUNMbGxQWkViVnpDbVA2NzZj?=
 =?utf-8?B?cERxcVVOZ1N1WjNiWXFwYjNWTnp3UlMxLzVOQjFmZkw0MGFqbkUySWhsQTUr?=
 =?utf-8?B?dFZ6NGZNWE4yZnZaOVlXb0hJWWhWRERRZWs1UFlSWDNjcmdZcDcrMytvTHox?=
 =?utf-8?B?YU5VSjB4cEJUV1drU2pyMkJqd0lJZ0V0Rk5BOXF1MTNBc1phcEJzM1NYZDhl?=
 =?utf-8?B?eDQ0WERHZDF5Y2xadXRIQUVaaUZMUVlyVDgxcWRRMDRGa0lrRnladnBiNi96?=
 =?utf-8?B?ZWI4WHFSNDZ2VlZPZjhQUy8razFHMUtRN2dhMWU1SUt3QkIzbjFPN0dnSmVJ?=
 =?utf-8?B?TEh4NllFYm95ckg5TThIZGJ2Wno2eVp4WXBxbTh0U1BJTHRYQ1VjaWRVc1Ny?=
 =?utf-8?B?bm9UVUx6UFE2aHNLTDFyQWhGbFoyWkhTOVdBQkhteXJ6Uk9LV2E3czh1ZzRH?=
 =?utf-8?B?SHZDRktWOW9LOU5pTmdqWUlxYkQra2pEN1BTZGRFQXJaaEdrOWZ4RUFsNEZS?=
 =?utf-8?B?Yzh5Y1hpN3NobXZSL2FPbWQ3bjk0aHhhdzJEczhFTm9icGxPQ0drZWZTd3dC?=
 =?utf-8?B?aEl3R21FNmIySk40ZytLU1Rxd3o2SzdtQStFTFFPZ3VUamQxK09ZUHlNUWFr?=
 =?utf-8?B?NS80MDUxdlhtRjJZN0loSzh3MnVPQzg5NGx0cXhxcE1pTHpLUEpnNTVCNEp6?=
 =?utf-8?B?Mk5xL2RaNWE3YS9RRHAyb3E0SndrYlB4Tk5CMDlTWmxCMVN4THhzbUJaYTVl?=
 =?utf-8?B?SzFWVWJuVk50K285TWVvVzAwaHNUU1hnQWhvNWI0Tnk3NjZNT1p0TFZTVVV6?=
 =?utf-8?B?SzBNdG1GeGcwNWFhdmJRSWxXK0FpYk1oZEYyRjZaRmo2Zm5ocTNvaThGMUho?=
 =?utf-8?B?NjNOR0dWTGRuSWkxQ1lWZXFXU3h1VzZwWXloVWh4ME1rNlkwZTBFQlFZcFJV?=
 =?utf-8?Q?IBfY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52972a1-f4f2-47c5-b4c8-08db94089c7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 10:01:30.8768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3QpJLDdwaVmtZ56nUjbbBmE27Ru+VnB/9F9yYOVWPVgHUsFPZJbAFM022lLadfywvR23BZAuBd2KnMtEzSbSdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6329
Subject: RE: [virtio-comment] RE: [PATCH requirements 5/7] net-features: Add
 n-tuple receive flow filters requirements

DQo+IEZyb206IEhlbmcgUWkgPGhlbmdxaUBsaW51eC5hbGliYWJhLmNvbT4NCj4gU2VudDogV2Vk
bmVzZGF5LCBBdWd1c3QgMiwgMjAyMyA5OjAzIFBNDQoNCj4gSGksIFBhcmF2Lg0KPiBJIHJlbWVt
YmVyIHRoYXQgdGhlIGxhc3QgbWVldGluZyAoNy4yNikgd2FzIGNhbmNlbGVkIGFuZCB0aGUgbWVl
dGluZyB3YXMNCj4gcG9zdHBvbmVkIHVudGlsIHRvZGF5ICg4LjAyKT8NCj4gSWYgeWVzLCB1bmZv
cnR1bmF0ZWx5IHdlIG1pc3NlZCB0aGlzIG1lZXRpbmcgOiguDQo+IA0KPiBJcyB0aGUgbmV4dCBt
ZWV0aW5nIHN0aWxsIHR3byB3ZWVrcyBhd2F5ICg4LjE2KSA/DQo+IA0KWWVzLiBJIHdhcyBzZXZl
cmVseSBpbGwgZHVyaW5nIGxhc3QgdHdvIHdlZWtzLCBzbyBjYW5jZWxsZWQgaXQuDQpJIGFtIHNv
cnJ5IGZvciB0aGUgZGlzcnVwdGlvbi4NCldlIHdpbGwgY29udGludWUgdGhlIHJlZ3VsYXIgc2No
ZWR1bGUgb2YgOC8xNi4NCg==

