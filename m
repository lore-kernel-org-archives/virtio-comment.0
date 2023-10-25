Return-Path: <virtio-comment-return-7948-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5373CC25B47
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 07:03:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 93C0D2AEE3
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 07:02:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 72B059869E4
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 07:02:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5A8699869DD; Wed, 25 Oct 2023 07:02:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4B3D79869DC
	for <virtio-comment@lists.oasis-open.org>; Wed, 25 Oct 2023 07:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1b9EdVc9g8wlvmwCXGm5yMClwnoo53bUE7gDAluwWhXLNAWb3XzXL40q844UZniT5jT846oyZ2/L27yUfY7dORWHDhF8mtT2OqvAhzpjMPjGtqgzwpf8i+AT8je4uuNDW7JKxvPhHCGxFZn75tV9vrUgLycdzeTgVh/FAqIx2cGEzHTTNPjSNFglTNm8OtQ1o/0yKB0SNE0yOuTLHfq3g/CqMZ9P+/qMqk6JW/kBPrJAA/ijy05GyXNBJwDOg1LXuo3DHyUSNvyxGY0Gs0pF3x8Jl4Mci8dYAlyWFKBs6e1kAQ+smQ/64SWnxPIrRTyG54fyG53yi5DtUAmCGeUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejXcDfMAABjX+lc2nOGL1EC+S5cBrChom/8O1Qi2SAM=;
 b=jQcnSJ6Xjvde9KKE9oNzCwek+hvkUTVYEPABTayaE7qfV6eq5otYXWOFjpeN9Xrk22kmS5HfGxuGRYHUVPpKUgh/73vMCUbb23lBznCMIipws4Od2XW8uVJYfl3Rr7cDjKekHNqv/2Byxo4DpNgMbv017X0sWQ9YlbudS+g62TUsFCHINB10c5/yzBHZZBPnss7VvUg42BwpeyK/UMUeOcszYtXfJlCxb1KdC5vn13X3ZRw1Vy3EEByWpjWCqQnxnENA6aEyfELd9Kni7acycEBd9C0HekDmKKX7mem1k8crbjOTT1Mbyyb5SZ5FjWE/5YNNbZjL8Pt8NAu/CJc4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCABizrAIAAD2aggAGUBACAAABcUIABWsEAgABcQLA=
Date: Wed, 25 Oct 2023 07:02:56 +0000
Message-ID:
 <PH0PR12MB5481C28D6E1C3C9490AF682BDCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com>
 <PH0PR12MB5481F8312139BB197CEB024BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtihTxYADd1dbG=vX9=VLp0xfRJSQ4jd_m0UiuZNz_2sg@mail.gmail.com>
 <PH0PR12MB5481E85F17F9D22CBCC9FDF8DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com>
 <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMF4JVEQJ6skT2DrEWjop6wjKS6ad6dW2UNOA1oRuPKQ@mail.gmail.com>
 <PH0PR12MB548109DEAE4B6C76025BD57ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com>
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsfyOCf-qCxr7kGM7WPco3YgeBsbOXbDT9AtigZpXF6Tg@mail.gmail.com>
 <PH0PR12MB5481A39FADD3A19F0CBF1B66DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt_aVfMgYQo3uMy-_DXrYDpgkWHtSq_qfr-tXs289pQWg@mail.gmail.com>
 <PH0PR12MB54817E76866D0E98863F6C5DDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEs+M+z0HoBo9i_w5qjNt7=MxViSu2PYbTSyfe+Pm-dnqQ@mail.gmail.com>
In-Reply-To:
 <CACGkMEs+M+z0HoBo9i_w5qjNt7=MxViSu2PYbTSyfe+Pm-dnqQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|LV2PR12MB5799:EE_
x-ms-office365-filtering-correlation-id: fb12075c-a3ed-42db-577a-08dbd5286a98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VswzaVbbzEI+RAGLUHTNkGRxEepq5u+O2C74b6ArSxJX5WkXO+PAEmBhZk6jVrzjuFYtIF4ybDLXwWkaU+IZRbqGc+jgEdvJyRUdzGsNOX2cEieERfgUplTgaeAthlracxCUzDo6EAl7hVTW5vTVg1WqP7ZrJkKGSRBYW91SlkXrMy71utQdka8KA7C+LP6IJiJOe+KrYbRRHHks66Px4tb5o2ffylJq9qW/HstzOhvlvKUKa77v8Vd2+AtChyW6T9rCHSayb//s5sXytkTTX0N6z7tGxV1IIDnkev4v3GM+LBNhCIYrljcZAtsH+e/WIm+yVIaMvcNNnPrt1sUPj9Ya57WSXlAd5KxiAxah7v+CVDpEG/mQVMLSxYuwCqLzRJizq0E7j0zH3Y9WmvDyw/64jrIR2Q96jd2QjQUCj4y4/LZO9RTULBCoOnMEap5aYICpTpQW+0253VowelsHsuBEwmBYd1fsCTYYswR/HQlv5nPAltpMGDyweZaocNJcCzugznoeBS8G7IY+PdKbr9XIagsGd2fqWe+2iu04x3pIj76Ud8mHxrpyJPdpzQbdweHmpqwILBUAzV3sZ2VpauIc1iiKMuofAusKHfXuWqOfP2csY4WVNBWTPveXtGce
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(396003)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(71200400001)(55016003)(38070700009)(38100700002)(52536014)(6506007)(5660300002)(107886003)(2906002)(8676002)(7696005)(9686003)(122000001)(26005)(41300700001)(66946007)(66899024)(478600001)(86362001)(8936002)(33656002)(4326008)(6916009)(76116006)(66446008)(64756008)(66556008)(66476007)(316002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VWJpckxmTXBaTGxWbHI1TDU5K3ZIbkNtZzg3UmM1RmlNNWlRVDFtdHVackoy?=
 =?utf-8?B?QVM1cU1ocU9MaU5IbndzVUhxY2M4TGtTc09BMjdOYmxlN1lLSTFoTjZObWQy?=
 =?utf-8?B?SWxWV29Uc3NJcmt2S2Zsb082L1BSTTJhS0RDd1M4Ykw5cEZ2bGFNYVpRRkFG?=
 =?utf-8?B?Z0ZSS2dYYzVXUWFBNHVBQWw1YXo0MDRVU01tRi85eHJLaUZlc2pZUE54bllx?=
 =?utf-8?B?cEhrM1lGd2VFYTNBMzc1bmxHdlN1Q2VCVXM0a1FUWnJQQ1VjbElGTTZub3Mr?=
 =?utf-8?B?Y2VCZjlITUc2cDd6NzlOdWViL01oSEFlQmV1UzhhditmK3VJTm9Scnc0S1ky?=
 =?utf-8?B?dmJ6Y2hFOHQySlBGSW1xcUZWZTJaNVJ0bTRGeEs2QkhXWS9ackdrU0Fld2pi?=
 =?utf-8?B?NU5CSFJoZ0p0bzBKV2hseUVVeFFseG84NEFxL29TMnZvcmx0ZkQvWDJzR3Zj?=
 =?utf-8?B?L0VFb0J4MGx2aXdtbFZkYTFDTHc1VUVabFgzQ0dvNjZYTTlBU1RtaExRVU1a?=
 =?utf-8?B?UlBBWGJHTGswTmR6dG1FNmZqQU1rR2pHbWNCYXZPbXlLa2pHRTlkRmplaHhC?=
 =?utf-8?B?ZGQxd3hYcks4eGRWSy9jMkNFL2dHalNKZTVmNmZtNXVrREc0RWt4Nkx5Ymox?=
 =?utf-8?B?aFlSUHlwWU9STWJzYUZyaGN0Z2xreStKc1lKS0dWUWtJSXBNaXV0c2ExZit0?=
 =?utf-8?B?VkFiK0Jzd1YyWXRlbDhhS2dkY1R1aXB2Z1BidnVwVEJyTWRaYXJDd2dFVC9Z?=
 =?utf-8?B?OHhKRUs3bFp2UDZMOHpuMHNpcWpjT3RlNVhBT1hpM3FQZWhvUWlBQzRGMno4?=
 =?utf-8?B?ZnNlUHo4cHdCTTZsMjhPcGdQOEVQa0hFRmN3SHoxb25vcVZqMEN5U0E0Rk5n?=
 =?utf-8?B?RGxYK2dMVGJzKzNKMW1NNE1lMWEyald6SXhPY2Z5OG1qU21mUzRvN3NZVDRv?=
 =?utf-8?B?bEJwZ0tZYm90QmlrUnpPcWMwbU0ydWU2ZWE3b25GRnlsR2NKM09qZmdCeHF0?=
 =?utf-8?B?cGdOaXdCZWxtNk5WdDltZmxLQzVEMTh1aTVaU2tWOFpGcVBhbFNBUGdVUStp?=
 =?utf-8?B?OE9INElJTGtEWXRnbEtXb2FOUGZSWE8yS0hMOStSZ2pFd2ZFRkk3eitVMyt0?=
 =?utf-8?B?K0JiUXBlOUM4Z3dUS2IrWUxQdkFRMml4MEttZGg4N2VXZ3NTT0R5RXcxL1J3?=
 =?utf-8?B?NCs4RnlaYlpLSUtONzVwYmNZNnl5cTBjbWtlbmxhRG54MGdRUHpaT1FpUjVt?=
 =?utf-8?B?Y2lKcTJZQWtGRGlKNTlWN3lTbWkzWE9CeVJFc2l3eXo4cjJWVC82SGh5dStT?=
 =?utf-8?B?d3hQN2xmQ3MxNmM3UUpFVDltTFlyMGlsV0YxZWIrcERQYmpTQVlHTldpMndC?=
 =?utf-8?B?N3hIZHdVWFVTTXhSVC8rM0JCa1Z4cEtDYmdoc2hlSzJqZVBHSFZRWThDeXkz?=
 =?utf-8?B?NkVvaktsOUhjSnNGU0podWZnUHNvVmtjTHZSVWlGcFVsN0JzY1ZlZjFYMW90?=
 =?utf-8?B?VkFIOXdadDFNTTI5NUk1MStSeG9OSVU0RS8yOWlsWS9GUFFNT2gxYWNPamFq?=
 =?utf-8?B?aUhUbm5TTzk4c0ZIcEV1Szl4ckowMmFXVFl1R2ZlcUU5Ky90eTNYYnlZV1Rw?=
 =?utf-8?B?ZlQ4M1RNY0NwODdlckRmckNIZXIvUCtWVTZaYUp1RFpTSWIxamNLajdEU2ZW?=
 =?utf-8?B?VjZ2a0Z0ZE5DY1pFUEsySGc3Z2FCdFg3d2ppdTk2VWdIc1pzeWVFcGdjVU4r?=
 =?utf-8?B?Q2FwNGtJZThWcEMwRXBZdjlpUStCY3VCdnlTZ0xpelZSYXRMeEhXZHliMXlB?=
 =?utf-8?B?ZGRSUVRFbU5rZEZCNVR0Y1dZSFZ5N0VGbGgvMnVEODZxVEFFQlMxYjZuTW04?=
 =?utf-8?B?M21wNUZndjN0K09ZZTVuRC9zMXRQekNya3ZhWHlPak1RUjZNN3FIdnh6ZERC?=
 =?utf-8?B?azBzVGR4QTJXM1ExVitvekVqTE1ZeFVJUDk0VzF0RWdVY0NUaVBsZEFEL1dq?=
 =?utf-8?B?MW1xRG8rdnMzWHEvektMVnJsMml1dXBvanVXTzNEeWYyOUJJNTNXQ003Uk82?=
 =?utf-8?B?VUhMbUZvcSs3SE52Z2xESFV3RkJCNlZraVNCV0ZOaUJ5RVhidUI5bnRUQUUz?=
 =?utf-8?Q?Kgkg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb12075c-a3ed-42db-577a-08dbd5286a98
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 07:02:56.6741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KzuOuZavgTaQ0TVwoyJOI5C/6W6wWPz59Mi2uAqk59nMwNlxgipCJizaAWkGdZq6FDSFHl3gJ/sEK+7uHgrD/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5799
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgT2N0b2JlciAyNSwgMjAyMyA2OjU5IEFNDQo+ID4gRm9yIHBhc3N0aHJvdWdoIFBBU0lE
IGFzc2lnbm1lbnQgdnEgaXMgbm90IG5lZWRlZC4NCj4gDQo+IEhvdyBkbyB5b3Uga25vdyB0aGF0
PyANCkJlY2F1c2UgZm9yIHBhc3N0aHJvdWdoLCB0aGUgaHlwZXJ2aXNvciBpcyBub3QgaW52b2x2
ZWQgaW4gZGVhbGluZyB3aXRoIFZRIGF0IGFsbC4NCg0KPiBUaGVyZSBhcmUgd29ya3Mgb25nb2lu
ZyB0byBtYWtlIHZQQVNJRCB3b3JrIGZvciB0aGUNCj4gZ3Vlc3QgbGlrZSB2U1ZBLiBWaXJ0aW8g
ZG9lc24ndCBkaWZmZXIgZnJvbSBvdGhlciBkZXZpY2VzLg0KUGFzc3Rocm91Z2ggZG8gbm90IHJ1
biBsaWtlIFNWQS4gRWFjaCBwYXNzdGhyb3VnaCBkZXZpY2UgaGFzIFBBU0lEIGZyb20gaXRzIG93
biBzcGFjZSBmdWxseSBtYW5hZ2VkIGJ5IHRoZSBndWVzdC4NClNvbWUgY3B1IHJlcXVpcmVkIHZQ
QVNJRCBhbmQgU0lPViBpcyBub3QgZ29pbmcgdGhpcyB3YXkgYW5tb3JlLg0KDQo+IA0KPiA+IElm
IGF0IGFsbCBpdCBpcyBkb25lLCBpdCB3aWxsIGJlIGRvbmUgZnJvbSB0aGUgZ3Vlc3QgYnkgdGhl
IGRyaXZlciB1c2luZyB2aXJ0aW8NCj4gaW50ZXJmYWNlLg0KPiANCj4gVGhlbiB5b3UgbmVlZCB0
byB0cmFwLiBTdWNoIHRoaW5ncyBjb3VsZG4ndCBiZSBwYXNzZWQgdGhyb3VnaCB0byBndWVzdHMg
ZGlyZWN0bHkuDQo+IA0KT25seSBQQVNJRCBjYXBhYmlsaXR5IGlzIHRyYXBwZWQuIFBBU0lEIGFs
bG9jYXRpb24gYW5kIHVzYWdlIGlzIGRpcmVjdGx5IGZyb20gZ3Vlc3QuDQpSZWdhcmRsZXNzIGl0
IGlzIG5vdCByZWxldmFudCB0byBwYXNzdGhyb3VnaCBtb2RlIGFzIFBBU0lEIGlzIHlldCBhbm90
aGVyIHJlc291cmNlLg0KQW5kIGZvciBzb21lIGNwdSBpZiBpdCBpcyB0cmFwcGVkLCBpdCBpcyBn
ZW5lcmljIGxheWVyLCB0aGF0IGRvZXMgbm90IHJlcXVpcmUgdmlydGlvIGludm9sdmVtZW50Lg0K
U28gdmlydGlvIGludGVyZmFjZSBhc2tpbmcgdG8gdHJhcCBzb21ldGhpbmcgYmVjYXVzZSBnZW5l
cmljIGZhY2lsaXR5IGhhcyBkb25lIGluIG5vdCB0aGUgYXBwcm9hY2guDQoNCj4gPiBDYXBhYmls
aXRpZXMgb2YgIzIgaXMgZ2VuZXJpYyBhY3Jvc3MgYWxsIHBjaSBkZXZpY2VzLCBzbyBpdCB3aWxs
IGJlIGhhbmRsZWQgYnkgdGhlDQo+IEhWLg0KPiA+IEFUUy9QUkkgY2FwIGlzIGFsc28gZ2VuZXJp
YyBtYW5uZXIgaGFuZGxlZCBieSB0aGUgSFYgYW5kIFBDSSBkZXZpY2UuDQo+IA0KPiBObywgQVRT
L1BSSSByZXF1aXJlcyB0aGUgY29vcGVyYXRpb24gZnJvbSB0aGUgdklPTU1VLiBZb3UgY2FuIHNp
bXBseSBkbw0KPiBBVFMvUFJJIHBhc3N0aHJvdWdoIGJ1dCB3aXRoIGFuIGVtdWxhdGVkIHZJT01N
VS4NCkFuZCB0aGF0IGlzIG5vdCB0aGUgcmVhc29uIGZvciB2aXJ0aW8gZGV2aWNlIHRvIGJ1aWxk
IHRyYXArZW11bGF0aW9uIGZvciBwYXNzdGhyb3VnaCBtZW1iZXIgZGV2aWNlcy4NCg==

