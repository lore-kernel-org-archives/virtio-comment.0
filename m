Return-Path: <virtio-comment-return-6090-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55A8C7EE2A
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 03:51:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 056BC2AF86
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 03:51:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EBAC29867E0
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 03:51:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D33C7983E8D; Fri,  2 Jun 2023 03:51:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B92069867DB;
	Fri,  2 Jun 2023 03:51:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHTkuQwp6P79k0LVo4a4h1wgU/1iizYKNK/DpW6j9Ps/dFy4Kg/UmFFE0x9iPH19jDuLljgCL8ly12IpLjJN/d+0TG2aDKNz+ejL53cbsd6AXNO4wGqmf11tnikBGpdpDWUmGi3zmF8Dn4HCTLG/w15ODrbUp8UfVJmCT5mQWk1Dv0TDUHmvCwxSN3jpaEtR3yuUcWawgVf6hY3odgtX6417ro1IGtUAt7Y3cPx9MXw3WDnPWCD90N9efjXLBdOB6TbGZR92kI6Jl1KM+D5/mVlNioTXEXY1+b54PycNshbFs/bvP88zNI3oNjuBK1UTD6zyj6YtHse7NFBmiS4APg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ygfZOSp7M1eKKxhI71AFPA12ymPFGb8MDCsszCausU=;
 b=JkVnFIYXR0Xr+sOcMB/yJWjRsig97/KxkEHRn38YK+MVkdae6FWlW0q9er8bWInC6o0XNTR55Z3MOMfeOpfLjn9+BBKYtH4m+9IlfS0rWVen2jFM4xC+5/YWvqqxPM5N094Nl0knfy2tma00onIVw+UZqS/0VoQwuUzq15FklHgN947fvZFWpXDrbmTE7hEcDj71UN7EXT5uexIavmY3G9a20uagxKo+Ka/UB32Nxb84RUDWXlLyzJlkwQc7TyP+VMfxuBc4/blENQp80b6a+aR1t5t6oTgtnHkhlrFpwdfI+aaXx1JmSdqvVhzXxHkklvtmh+57wCaEPbMwFyq0FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
CC: Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Thread-Topic: [virtio-comment] [PATCH requirements 5/7] net-features: Add
 n-tuple receive flow steering requirements
Thread-Index: AQHZlNTpsDXVjHsOf0G4vfVcY0pgc6923NWAgAABgBA=
Date: Fri, 2 Jun 2023 03:51:34 +0000
Message-ID:
 <PH0PR12MB5481647B8D459F5594756C93DC4EA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-6-parav@nvidia.com>
 <a471e048-b492-eb04-608d-4312da4d0b09@linux.alibaba.com>
In-Reply-To: <a471e048-b492-eb04-608d-4312da4d0b09@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS7PR12MB6142:EE_
x-ms-office365-filtering-correlation-id: faa9b44d-f2bc-418a-9609-08db631ca8a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Z8jOwzyuZhVmlYP6561Bj0HftcnS0rMD5dhhlX4kT8nd5VTTNIVWh2Ur0vOL7g/X806em6af0pAvroU/a+7FCZamoUxGVviIDdBQJ6EpVEN9vzXgSZ3uIIsG6QUBYpD3CHm8MrOCVpbfQgpNHn4p0M3obVZbtP8Qfj1kTYzUT2bl9+7BKGoBKjY23tsR2GSd79Gkou8dSywM9FG92tGgl1zYs56YYIXNSC0D2buPhXADUsZSj05Hoi7qoQuRU0erujst7Bwg6nxuFrk40Q5JHcmQSlQJdyFFYNIHRzuNHO2GTuFih0Gjf++R7IJ6Jhu7xCnf1qlacWmKayIk1dvy8UMOcH3ZTakP1ZqOmscimkjBgDHv4lq9G3Yq4kWR3Zt/j5ixdXVfwQUEesl5w+t0WnFkD7/uEt2z+9+nJ2Y1hQzIt6pYJP6OrprXk3cQl6l9ROLYUsVd105gOPAdCKnLCoOnwtyVsIAoyD0rgZE8/iNeekiomCWogX6suMmxEkVIbBBOTy+szETDhih3dYfaLbw//cbS+JDqXw/4/wnd2K9Sg/LNot6WylAcnsGBG41Z7J/gJMMBGqaRS+TCjRnPWQ8q1cebnF5Iz6q9vHS/wstmjm78DR9uNoFeW4D9WMuv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(9686003)(6506007)(186003)(71200400001)(83380400001)(41300700001)(5660300002)(52536014)(2906002)(316002)(8936002)(8676002)(478600001)(66556008)(64756008)(66946007)(66476007)(76116006)(66446008)(7696005)(110136005)(54906003)(86362001)(55016003)(33656002)(4326008)(38070700005)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXdpRllVYmQ0V0s2K2ZLblZWQjl3RENBQVFoR1BaOUdxR0NsanNzQVBETWNH?=
 =?utf-8?B?UjZDTFlLcE9GMG91elFWTG0vVVBra2FNcmI0OFg1MXB1OFVJeW1rK2d1WnB6?=
 =?utf-8?B?bkhTSHVxRi9xblpBa0lxR2FvZDduRHVVRWxIbTNSZzI3UGRLUm0zSGh5NEpL?=
 =?utf-8?B?alp0WEJ1MDhVOFRScU9XbEVVT0gxU3llY2VlLzJiYjI0K3NsMEk4NXRvalVi?=
 =?utf-8?B?YW5KSHFHVEczM2xGdHh3bFBCbHBoZVVVblU4S09kKzB6emNOelhCYk9QSjZ0?=
 =?utf-8?B?d09Oa01MemFaOFVlYnJROFBBMlk3czVYVEN6VC8vczFCczVnYkhpM3hyeGJp?=
 =?utf-8?B?SVh5dUhwVU1oK2RyUE1LRGZrc3l1TUE3d0ZZVXljWGg0blg1RlBlSFNXSzJn?=
 =?utf-8?B?OW52V1BoYXp6RVFCR01GQ1FyeElLeUZJbll3R0FIRi96S1ViSVY1Z0xOY3Z0?=
 =?utf-8?B?bzRQQVRKVGlhdnVaWnYrNGlCYTZmUXdDV1VwcmQvL0l5QVhQN3UrRm1UdW0w?=
 =?utf-8?B?SWJ5UjJCSWJ3T1FmdWU3TjVDRTBDdU41ekoyMTArT1p1eGx4bWlJK3JsdTBG?=
 =?utf-8?B?T1BQUFlSUnVia0pHYUFQdDNuUGJOeHpZM210VkJkZmJPaW1ycUlibXhJM3hy?=
 =?utf-8?B?Q2hEK2RUUFpibmZ2MkViN3hkYndUQnNmbnlwQlRvVHhzaktuaitGMHp5VEpl?=
 =?utf-8?B?R0tHMGEwZklDUDdCbERhZzdVNEdwTCt4YWVKZmt0ZmtZdnVJVlBzNTcwRHlP?=
 =?utf-8?B?S3FtTVNkUldZeWlucWM1emhIaExWSGdsZFFGWm8yUnBOcHhab0dkR2VYNHFs?=
 =?utf-8?B?YTMxNkNNZXVReURtaVZnaUN1T3BlbUV5T3RmQlNhNldZL1hOOEs0YkZodElv?=
 =?utf-8?B?eVc0SzQ1cFNDa2RzZjdCMTNFOTZ6TnVMb01qOSs3WkRvSVNJR1VxQ1o4RE9N?=
 =?utf-8?B?alNrWm82SWFnY3A3a2hzYWJmU1FZWTZLMFN4UTFOUXQ3ZEcxc29TaGZnMlRI?=
 =?utf-8?B?ZlAyT3Azd1dJK043YkprTU93NjhiS1BRaFhpRFlxSTFMUlBwTXYrenBnT3Zy?=
 =?utf-8?B?dldXaUhIQ1M5NDlCVHNOd1FESkNGVHlia2p1K2JVQjd6aFNGUktPeU40cTNo?=
 =?utf-8?B?RVNqci9hUXkzOHRlSWsvN3hDVUhzWmpLM0FzeFMxRlRPRTNGOEZ2T0xZaDNk?=
 =?utf-8?B?VUZsVTFJbkM4SFpZd1c1dU5uWEYzaHlpNUhQc1JtV2l0ZDA1c3JrcklEak9m?=
 =?utf-8?B?MXJGM0RENXREclhnL1l0b1BmTkJNb0lNM3U2NVl5TFZVVWRoQWU4ZkxXWXpR?=
 =?utf-8?B?T3NUVm92c3JCVXlLdVR3WjdjNnMvK0pxVll4YTBEVUNPeFhiR1A4aE9CMFdj?=
 =?utf-8?B?WFRGOTRtUGFCWllzOGdYeFZkcE94WVhta0ZCcGtTR3c4ZTMzRC9BOFRHRVRj?=
 =?utf-8?B?bk1pNFQyZk15SElIMTNjQUtuR09DQVJDbWpqWEVERFhKdFNMd0svZ2ttZ2Vz?=
 =?utf-8?B?eGF0K1dGMDg2bk5POTNJaTVUYlhEbjg0cm9aNW5hZytHSFdrTUU3cHYzVnIw?=
 =?utf-8?B?cXRLRENkcW5OdFVSYUx3TnYraUUyeXpnLzhvbC9GVjlMeDRXT1FuYVlFaXYr?=
 =?utf-8?B?aDFkMlhtUEZ5RGNVbk5pa3krUG5CRHJRWkxJVWFSUXJROUkxUzBTSzBVMWRK?=
 =?utf-8?B?UHpzNXBMblJZd2pZNkQ1TSttUWQzNXVjdHJUM0U3Zno2U1Y0Nm83QkF0aGsr?=
 =?utf-8?B?N2hsV2VXd3laNXQ0OTRCTzJkVDMydjR2S2RONjMzN0Q5bmRUUFZLQ2dKTmZR?=
 =?utf-8?B?ZnFudEg5QjBId3FBWHI3Nk9CMS9Oa25vMjRSUWJXMnNVMlBFSzNNYnYzOVF6?=
 =?utf-8?B?VWdnT1dOc1FWWTBsVmYvUkxGTXFMRkNoSFRxT2srV1JIbHVvMGdOZzJyUE01?=
 =?utf-8?B?YzloTFJ3L0l2aHJndzhtQmtqNGd0Sm1PMm1VYXZsVGdKVXdlVlVWcU4yYjVh?=
 =?utf-8?B?T2dXQVVLUHAzVGV5bGJSYVpEQnJMeUJkTDltalNiMGp0cS82SnZkY2E4ZGhu?=
 =?utf-8?B?UFJxVFJKNEpFWjhFVVpxQ1ArT1J1eVpsUzVNOHJ2cFZ1YmppOVAzc0xEK2Y2?=
 =?utf-8?B?Z3FOdG9XYzhhdUw4VlljS20rTmttZ3NsTW0vNkQ0MjlRNXp3dWVtYlg1MDZQ?=
 =?utf-8?Q?XJDSWxVFtnjq20uNmoiCCjE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa9b44d-f2bc-418a-9609-08db631ca8a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2023 03:51:34.2298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5TDH1SGsq+Wu/JPi7t7dzMpI6mkLOyaHGftBMKQ9CdmMDxmVYeTcWot4uovT0Gkprz5Du/L50MbG5RRRHatLgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6142
Subject: RE: [virtio-comment] [PATCH requirements 5/7] net-features: Add
 n-tuple receive flow steering requirements

SGkgSGVuZywNCg0KPiBGcm9tOiBIZW5nIFFpIDxoZW5ncWlAbGludXguYWxpYmFiYS5jb20+DQo+
IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDEsIDIwMjMgMTE6MzUgUE0NCj4gDQo+IEhpLCBQYXJhdi4N
Cj4gDQo+IEkgYWxzbyBkaWQgc29tZSB3b3JrIG9uIHRoaXMgZmVhdHVyZSwgYW5kIEkgdGhpbmsg
aXQgd291bGQgYmUgdmVyeSB1c2VmdWwgaWYgd2UNCj4gY291bGQgd29yayBvbiB0aGlzIGludGVy
ZmFjZSBkZXNpZ24gYW5kIFZpcnRJTyBTcGVjIHRvZ2V0aGVyIQ0KPg0KU3VyZSwgaGFwcHkgdG8g
YnJpbmcgdGhpcyBhbGl2ZSB0b2dldGhlci4NCk1vcmUgYmVsb3cuDQoNCj4gPiArDQo+ID4gKyMj
IDMuNCBSZWNlaXZlIHZpcnRxdWV1ZSBuLXR1cGxlIGZsb3cgc3RlZXJpbmcgKFJGUykNCj4gDQo+
IEkgdGhpbmsgdGhpcyBhYmJyZXZpYXRpb24gY2FuIGJlIHJlcGxhY2VkIHdpdGggZWcgUmVjZWl2
ZSB2aXJ0cXVldWUgbi10dXBsZSBmbG93DQo+IGRpcmVjdG9yLCBSRkQ/IG9yIHNvbWV0aGluZyBl
bHNlPw0KT25lIGh3IHZlbmRvciBwcm9kdWN0IG5hbWUgaGFzIGRpcmVjdG9yIGluIGl0LCBzbyB3
aWxsIHByb2JhYmx5IHdhbnQgdG8gc3RheSBhd2F5IHBpY2tpbmcgc3VjaCBUTS4NCg0KTWF5IGJl
IHdlIGNhbiBqdXN0IHNheSBmbG93IGZpbHRlcnMuDQpBIGZpbHRlciBtYXkgaGF2ZSBhbiBhY3Rp
b24gYW5kIGEgZGVzdGluYXRpb24uDQpTbyBpdCBjYW4gYmUgZ2VuZXJpYyBlbm91Z2guDQoNCg0K
PiBUaGlzIGFsbG93cyB1cyB0byBkaXN0aW5ndWlzaCBtb3JlIGNsZWFybHkgZnJvbSAoQWNjZWxl
cmF0ZWQpIFJlY2lldmUgRmxvdw0KPiBTdGVlcmluZywgKEEpUkZTLg0KPg0KVGhlIGlkZWEgd2Fz
IGZvciBBUkZTIGFuZCBSRlMgYm90aCB0byByZXVzZSB0aGUgc2FtZSB1bmRlcmx5aW5nIGluZnJh
LCBqdXN0IHRoZSBPUyBob29rcyBhcmUgZGlmZmVyZW50LiAoc3RhY2sgdnMgdXNlciBldGh0b29s
IHJlc3BlY3RpdmVseSkuDQogDQo+IEFSRlMgY2FuICphdXRvbWF0aWNhbGx5KiBpc3N1ZSBSRlMg
cnVsZXMgYmFzZWQgb24gbi10dXBsZSBydWxlcywgYW5kIHdlIGNhbg0KPiBzdGlsbCBpc3N1ZSBu
LXR1cGxlIHJ1bGVzICptYW51YWxseSouDQo+IFNvIFJGRCBzZWVtcyBtb3JlIHJlYXNvbmFibGUg
dGhhbiBSRlMgYWJicmV2aWF0aW9uLCB3aGF0IGRvIHlvdSB0aGluaz86KQ0KPiANCiJSZWNlaXZl
IGZsb3cgZmlsdGVycyIgaXMgcHJvYmFibHkgbW9yZSBuZXV0cmFsIG5hbWUuIDopDQoNCj4gPiAr
MS4gVGhlIGRyaXZlciBzaG91bGQgYmUgYWJsZSB0byBkZWZpbmUgYSByZWNlaXZlIHBhY2tldCBt
YXRjaCBjcml0ZXJpYSwgYW4NCj4gPiArICAgYWN0aW9uIGFuZCBhIGRlc3RpbmF0aW9uIGZvciBh
IHBhY2tldC4gRm9yIGV4YW1wbGUsIGFuIGlwdjQgcGFja2V0IHdpdGggYQ0KPiA+ICsgICBtdWx0
aWNhc3QgYWRkcmVzcyB0byBiZSBzdGVlcmVkIHRvIHRoZSByZWNlaXZlIHZxIDAuIFRoZSBzZWNv
bmQgZXhhbXBsZSBpcw0KPiA+ICsgICBpcHY0LCB0Y3AgcGFja2V0IG1hdGNoaW5nIGEgc3BlY2lm
aWVkIElQIGFkZHJlc3MgYW5kIHRjcCBwb3J0IHR1cGxlIHRvDQo+ID4gKyAgIHN0ZWVyZWQgdG8g
cmVjZWl2ZSB2cSAxMC4NCj4gPiArMi4gVGhlIG1hdGNoIGNyaXRlcmlhIHNob3VsZCBpbmNsdWRl
IGV4YWN0IHR1cGxlIGZpZWxkcyB3ZWxsLWRlZmluZWQgc3VjaCBhcw0KPiBtYWMNCj4gPiArICAg
YWRkcmVzcywgSVAgYWRkcmVzc2VzLCB0Y3AvdWRwIHBvcnRzLCBldGMuDQo+ID4gKzMuIFRoZSBt
YXRjaCBjcml0ZXJpYSBzaG91bGQgYWxzbyBpbmNsdWRlIHRoZSBmaWVsZCBtYXNrLg0KPiANCj4g
VGhlIG1hc2sgc3RydWN0dXJlIGNhbiBiZSBjb25zaWRlcmVkIHRvIHJldXNlIHRoZSBzYW1lIHN0
cnVjdHVyZSBhcyB0aGUga2V5DQo+IHN0cnVjdHVyZS4NClllcywgbWFzayB3aWxsIHByb2JhYmx5
IGhhdmUgdGhlIGJpdCBtYXNrIGRlZmluaXRpb24uDQoNCj4gDQo+ID4gKzQuIFRoZSBtYXRjaCBj
cml0ZXJpYSBtYXkgb3B0aW9uYWxseSBhbHNvIGluY2x1ZGUgc3BlY2lmaWMgcGFja2V0IGRhdGEg
b2Zmc2V0LA0KPiA+ICsgICBsZW5ndGgsIGFuZCBtYXRjaGluZyBwYXR0ZXJuLCB3aGljaCBtYXkg
bm90IGJlIGRlZmluZWQgaW4gdGhlIHN0YW5kYXJkDQo+IFJGQy4NCj4gPiArNS4gQWN0aW9uIGlu
Y2x1ZGVzIChhKSBkcm9wcGluZyBvciAoYikgZm9yd2FyZGluZyB0aGUgcGFja2V0Lg0KPiA+ICs2
LiBEZXN0aW5hdGlvbiBsb2NhdGlvbiBpcyBhIHJlY2VpdmUgdmlydHF1ZXVlIGluZGV4IG9yIHJz
cyBjb250ZXh0Lg0KPiANCj4gV2UgbWF5IGhhdmUgYW4gYWRkaXRpb25hbCByZXF1aXJlbWVudCBp
bnRlcm5hbGx5LCBzdWNoIGFzIHNwZWNpZnlpbmcgdGhlIHF1ZXVlDQo+IGlkIG9mIGEgY2VydGFp
biBWRiwgYnV0IHdlIGFyZSBzdGlsbCBhbGlnbmluZyB0aGlzIHJlcXVpcmVtZW50IGludGVybmFs
bHksIGFuZCBpdCBtYXkNCj4gYmUgbW9yZSByZWFzb25hYmxlIHRvIGltcGxlbWVudCB0aGUgd29y
ayBpbnZvbHZpbmcgZGV2aWNlIGdyb3VwIGJhc2VkIG9uDQo+IGFkbWluIHZxLg0KPg0KVGhlIHN3
aXRjaCBzaWRlIEFQSXMgYml0IG1vcmUgY29tcGxleC4NCldlIHdlcmUgZmlyc3QgY29uc2lkZXJp
bmcgdXNpbmcgdGhlIGZsb3cgZmlsdGVycy9zdGVlcmluZyBmb3IgdGhlIGd1ZXN0IGRyaXZlciBh
bmQgZXh0ZW5kIGZ1cnRoZXIgZm9yIHN3aXRjaGluZyBzaWRlLg0KIA0KPiA+ICs3LiBUaGUgZGV2
aWNlIHNob3VsZCBwcm9jZXNzIFJGUyBydWxlcyBiZWZvcmUgUlNTIHJ1bGVzLCBpLmUuLCB3aGVu
IHRoZXJlIGlzIGENCj4gPiArICAgbWlzcyBvbiB0aGUgUkZTIHJ1bGUgUlNTIHJ1bGUgYXBwbGll
cy4NCj4gPiArOC4gVGhlIGRldmljZSBzaG91bGQgYmUgYWJsZSB0byBhZGQvcmVtb3ZlIHRoZXNl
IHJ1bGVzIGF0IGEgcmF0ZSBvZiAxMDBLDQo+ID4gKyAgIHJ1bGVzL3NlYy4NCj4gPiArOS4gSWYg
bXVsdGlwbGUgcnVsZXMgYXJlIHByb2dyYW1tZWQgd2hpY2ggaGFzIG92ZXJsYXBwaW5nIGF0dHJp
YnV0ZXMgZm9yIGENCj4gPiArICAgcmVjZWl2ZWQgcGFja2V0LCB0aGUgZHJpdmVyIHRvIGRlZmlu
ZSB0aGUgbG9jYXRpb24vcHJpb3JpdHkgb2YgdGhlIHJ1bGUuDQo+IA0KPiBDb25zaWRlcmluZyB0
aGUgY2FwYWJpbGl0aWVzIHNpbWlsYXIgdG8gc29tZSBjdXJyZW50IHRvb2xzIHN1Y2ggYXMgZXRo
dG9vbCwgaWYgaXQgaXMNCj4gYSBzaW1wbGUgaW1wbGVtZW50YXRpb24sIHRoZSBmaXJzdCBtYXRj
aCBwcmluY2lwbGUgY2FuIGJlIGFwcGxpZWQuDQo+IA0KWWVzLCB0aGlzIGxpa2VseSBuZWVkcyBy
ZWZpbmVtZW50LCBJIGp1c3Qgd2FudGVkIHRvIGdldCB0aGUgc2VlZCBmb3IgcHJpb3JpdHkgdG8g
YmUgYWZsb2F0IHdoZW4gSSB3cm90ZS4NCkkgYW0gdGhpbmtpbmcgb2YgZGVmaW5pbmcgdGhlIHBy
aW9yaXR5IGF0IGludGVyZmFjZSBsZXZlbCwgYW5kIGRyaXZlciBjYW4gY2hvb3NlIGZpcnN0IG1h
dGNoIGluIHRoZSBwcm9ncmFtbWluZyBtb2RlbCBiYXNlZCBvbiB0aGUgdXNlLg0KDQo+ID4gKzEw
LiBUaGUgZHJpdmVyIHNob3VsZCBiZSBhYmxlIHRvIHF1ZXJ5IGZsb3cgc3RlZXJpbmcgdGFibGUg
ZW50cmllcw0KPiBwcm9ncmFtbWVkIGluDQo+ID4gKyAgICB0aGUgZGV2aWNlIGJ5IHRoZSBmbG93
IGlkLg0KPiA+ICsxMS4gVGhlIGRyaXZlciBzaG91bGQgYmUgYWJsZSB0byBhZGQgdGhlIGVudHJ5
IGZvciBhdHRyaWJ1dGVzIChhKSBtYXRjaA0KPiA+ICsgICAgY3JpdGVyaWEsIChiKSBhY3Rpb24s
IChjKSBkZXN0aW5hdGlvbiBhbmQgKGQpIGFzc2lnbiBhIHVuaXF1ZSBpZCBvZiAzMiBiaXRzLg0K
PiA+ICsxMi4gVGhlIGRyaXZlciBzaG91bGQgYmUgYWJsZSB0byBkZWxldGUgdGhlIHN0ZWVyaW5n
IHJ1bGUgZW50cnkgdmlhIGEgdW5pcXVlDQo+IGlkLg0KPiA+ICsxMy4gVGhlIGRyaXZlciBzaG91
bGQgYmUgYWJsZSB0byBhZGQgYW5kIGRlbGV0ZSB0aGUgc3RlZXJpbmcgcnVsZXMgaW4gb3V0IG9m
DQo+ID4gKyAgICBvcmRlciBtYW5uZXIgd2l0aG91dCBkZXBlbmRpbmcgb24gcHJldmlvdXMgY29t
bWFuZHMuDQo+ID4gKzE0LiBBIGdyb3VwIG1lbWJlciBkZXZpY2Ugc2hvdWxkIGJlIGFibGUgdG8g
cXVlcnkgdGhlIGF0dHJpYnV0ZXMgb2YgdGhlDQo+IGZsb3cNCj4gPiArICAgIHN0ZWVyaW5nIHRo
YXQgZGV2aWNlIHN1cHBvcnRzLg0KPiA+ICsxNS4gVGhlIGRyaXZlciBhbmQgZ3JvdXAgb3duZXIg
ZHJpdmVyIHNob3VsZCBiZSBhYmxlIHRvIHF1ZXJ5IHN1cHBvcnRlZA0KPiBkZXZpY2UNCj4gPiAr
ICAgIGxpbWl0cyBmb3IgdGhlIHN0ZWVyaW5nIGVudHJpZXMuDQo+IA0KPiBEbyB3ZSB3YW50IHRv
IHN1cHBvcnQgc29tZSB1c2VyLWRlZmluZWQgZmllbGRzLCBzbyB0aGF0IG1hbnVmYWN0dXJlcnMg
Y2FuDQo+IGN1c3RvbWl6ZSB0aGUgaW50ZXJwcmV0YXRpb24gb2Ygc29tZSBmaWVsZHMuDQo+DQpZ
ZXMsIHdlIGNhbiBwaGFzZSBvdXQgdGhlIGNvbW1vbiBjYXNlIG9mIGlwdns0LDZ9IGFuZCB7dWRw
LHRjcH0gYXMgZmlyc3QgcGhhc2UgYW5kIG1vcmUgY3VzdG9tcyBmaWVsZCBhcyBzZWNvbmQgcGhh
c2UuDQpUaG9zZSB1c2UgZGVmaW5lIGZpZWxkcyBjYW4gYmUgdXNlZnVsIGluIGN1c3RvbSBmaWx0
ZXJzLg0K

