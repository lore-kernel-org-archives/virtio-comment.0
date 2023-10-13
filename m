Return-Path: <virtio-comment-return-7704-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7DECDB482
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 06:36:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5747229FF7
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 06:36:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6C405986855
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 06:36:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EF50D9868B6; Fri, 13 Oct 2023 06:36:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8B161986870
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 06:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMcuPlWcfKmiOXKHoW2JQizePq/ZDB+iXwgAwGq6RaLfhJY8EJ/PjpMQsL3El4ShMXmQ21tu4E/nFWAklQwb5kO5D4iW+tfh7ZCK6UqkTMKHxs882D/TXSGjmZMp8LlosZICUzRnlO27Gf4KwOOiVwBcD8eiuHUrmq8w+gxLeb5m7WriizAn+n4Gw71ENWznSLfTsDiYEER5Rlgaf2hS9bCdf01ghmJpHlQe9hlJRXE5LyuxhfHS6ep2fZ68POyHRon4NPcViIS2fS5+4sNcC0s2dzF7nvedGH42nA1zawKnk5RBpLlMsdelFic5pXWjngfkUEZ4bBXShupIDEtnHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grOgy7nx7LdVpysbTVP3JEPKRZQMBNgLBnD9/TkDXwk=;
 b=irXTWzcC2o6d/cCdKrnY3znfbK6PYPfK4uIiAC1SW5r4UH4OIMYRSjrDW2bxsvTpnB4+Q2jOlK6BDB8j1x4bK0r8Oyrx5XXNtkFkTApUeETzt9dO+XNPxcBfoVE37232JAyE+EmhigpeFTWCt91GJZSXw0dUfTHzcsx7T4mGz4uvT8gCZxqq78KpAXebo5vzseAPKTvTlqINPgZFnXLNYm+v2Q91S7R5dzWdc2AayTSLoHXfJpoW1Psqw/6P0Gq1+T9Akk9DhsARVkHL4PFRKdeIvJI+IVUZdbnc74qDV8c1YDlVPHcKQeGpjCOZo4pAQb2MDAhlcQoUYKGuCm0zHA==
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
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkA==
Date: Fri, 13 Oct 2023 06:36:32 +0000
Message-ID:
 <PH0PR12MB5481F8312139BB197CEB024BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
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
In-Reply-To:
 <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB7701:EE_
x-ms-office365-filtering-correlation-id: 9ea1e18f-b7cd-483b-982c-08dbcbb6bd2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4v0UwIHv4FyUNqQQSdpEIyfPFDRAbXk1KF5qqcbmLjb7FFB+5FJoTK9F9rPeMEbryp5u05jB8wU8xeL50nIOLZjUFQaSExpDzNXkAvv9xkEgOylUdLtqC9uEFgOwBu/LxGfxntRX6R58cgkhKROkatQt9aMfGxPaHVmi6qXIx2Ef20e/uc76wllsIEt8aNxOpJOdOgDSlthmtim9I/e4hPfibtLNaO78e1+3v7r8r/dG1h+L3LoWlJkKTwhSsuOXS9q4ory8P/iE0pWZYOP/lD6UceVLytHs4eM4lQ+zrOUAMjJGzXl80h77vAqeozGPaD5GOnIvFPc2ym6oSJentsHrmM50hGof60MfurnhNsHMD+e53/rqWit1m6kdfcWQZX6stEJFvB1H3jDcJT70x4bwzJ5SQYBkl9uvoY6LDO5lK5HGHQJJDmLalYVu7e9jC47mXA9H/DA1qkhTJzDoVOpJKy97xTMzrWV9/QliMbiZccUtrw6lP1ByGoKYWtdssPMIlpZ0MT6RhtB0atLthvPPA4Flz28UMTIjqqOy7GF0prM+a0UbbIP3a6vUv+9C8YVeRePpkBL5YuruisZvHwMrYkYCfYKIt4rsbfSsIVUcx/NnbZdJysmQD1S29F5M
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(396003)(366004)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(55016003)(71200400001)(2906002)(478600001)(41300700001)(4326008)(8676002)(8936002)(52536014)(5660300002)(66476007)(66946007)(64756008)(66446008)(54906003)(66556008)(76116006)(7696005)(316002)(83380400001)(6916009)(33656002)(26005)(6506007)(9686003)(122000001)(53546011)(86362001)(38100700002)(38070700005)(107886003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NUErRCtMNTBEVWZlZWpvNDQxcmRxeC9neUQ1QTJsZUpGcVVEN3BZdGJsbTdB?=
 =?utf-8?B?Q3FxYmhXclhzYU8vRTdTcXMySXRKV3NYR05aZk1Fcm5vbG8zajVtTVg0VnZu?=
 =?utf-8?B?MHI2akhaYnNxYnVBSy9XU1Q2bjNjVXlQNTVSU3dMWk12c0RiT05rTGRPYkRC?=
 =?utf-8?B?UVRWNjZ0TE5CNzQyWW11OUJKR01qV3V3eXV1QmhyQUUzMFlMVm1BSVVpeDBv?=
 =?utf-8?B?elRSaTdzdUVLOXdjYjF5UmRzVlRhWUNZQmZ4R1lIUGJSR0U1RXMvU0dHaE9y?=
 =?utf-8?B?amhmeTdzVjFMdUdqSkdYalhid2NSTFJvbThINjlSbktHYVg0WnRiUDlVeEhY?=
 =?utf-8?B?c3dpN0NXaGlxanM0MS9paFlmTDMyd3lFamJzYzU3aG82Y24xY253VmlUL29E?=
 =?utf-8?B?OTRaMUNNSmx6L0NaYi9NYWEwY2R2NkJGZWhzOGtNR2EwaWZDUzI5elR3UWp5?=
 =?utf-8?B?SkVPbkh6Wmx2akg5MVZNcHp5SDJhM3hiVnE4WWNnZTVaWnA2ZWpEV252VnlT?=
 =?utf-8?B?cHAxbUorSVpOWUhKN1p2SXBLYTlobUNTQlNrMUZKZGEzazd4NGwwSDM1Z2F4?=
 =?utf-8?B?RkdQTXEwRnUyS0FRaXFDbVdNNEtxWnB4VlovUllqTjhZbjRJNUxzY2s3ckk4?=
 =?utf-8?B?cHE1MXpBS1VwYWlxSkxmcndXSURLODNmWkZQQ21EaWdFNWFTMHhqcmFqSDlB?=
 =?utf-8?B?UUozRTF3N2ZFN21HWk9sdFpSSGhEV3I2eE9GTjR4RHJVMHBZbEVyU2l1NzY2?=
 =?utf-8?B?V0c5cVRZa1Mrc3liLzhWZ01vYWU5UjNsK1pnT1ZobHpyUEtPVEovZDQ1ektD?=
 =?utf-8?B?MWV5WU8vS3h5NE9pUFQ3eTIxRVJmRWt1WU1zWjc4L3JIaVZnVENkQlFiamVw?=
 =?utf-8?B?M0w1anliNlYxdWEvT2NpY2NhcTlyYUExU1FqcmVhUmtVeVd1cGwvRWFCY2VR?=
 =?utf-8?B?SnUvSWJuTGcxSDZuMXY5MmRZaGJKUTRJTU1Pd1dpaG9UQThDOG5TWnVzU0J6?=
 =?utf-8?B?eEZKQmpENEtVOGxkUWhMTmduYTE2aUI0cE9TUXRqYXBCK3FQcjFJRkhQcDJQ?=
 =?utf-8?B?YitnRXFoVlJoWGN4VWNid1h4dXNsajRLRk9aZ1A0SXMrREtJdVRmUWVObXlZ?=
 =?utf-8?B?YWN5REdxRUw3cWlBZWlFOWpKT3Q0TWl2LzE2L3puNEFKL2lDK21mdnduTitT?=
 =?utf-8?B?N2VLSjBqK0QvaXczVE41NlR1WFNEdk1KcTB3ZjRuUldtVHZTb1dNQ3c5YTl4?=
 =?utf-8?B?YlEraXk3bUlqRkRWa1JpeGp3NnZSUnk4S0hPdjZnYW5HNlI1KzJmQWQvM3RD?=
 =?utf-8?B?RnJtRVpNRTJyaDVFcTU0UFhKZ2wwTCtZdUg2VWxJOFIwdUg0djV5SlhrODRH?=
 =?utf-8?B?ZnVqYjMxU2dBendrSjltNGxPbjA3S2VaTDMrZmdDOE5RTnRHT2FQYUJUYStP?=
 =?utf-8?B?NzhvSjZCcUQwU1JwV1p2NWcyNGRvWHVQSktYZnNIWFZ2c1d0K0hlcGllWUFY?=
 =?utf-8?B?bXZ3bFJyUGRUT3RRNFpvR3NhK0xzVUxYbG1HYXFFVWtzVXdKMlJHQjJFVXlr?=
 =?utf-8?B?UnM3b3IxQmJIZkpXd2NNSzU4TU1KQzFWRzNFZnpaTVRLNUthT2M3d0VuQU05?=
 =?utf-8?B?OTE2enN4TGdEazdvRm5rK2plVVlzZDQ0L1NKR0w3S1J5cnNCWDkzN0xjbkZP?=
 =?utf-8?B?a21pL1BvK0NLdHl3RG04UkhCWjJqQ3lva2hKdUZ3cDhibk5DV0Rab3RLaUg3?=
 =?utf-8?B?S2t6OU9Xc2RHakM2SDRxVG4xN1QwUllYeks3Sjg0RXBHOGVtWDEyMWJ5WVpt?=
 =?utf-8?B?U3NrQ1dMRHYrTDlDSDVUcGt2QTB0N0xMMVZIclg1WHUwb0xxYnIveW9sa3JV?=
 =?utf-8?B?RzdydmQyQ2hUVTM4dUlPUnBvSUhUYmwyWDlGYjNYeGVPeUM2a2ErMXU0dWZP?=
 =?utf-8?B?d1ZUUDhpV1ozYm1VZHpVb215anV6UjVEa1VmUFEvWjQwTklWOHdkOW80SHZv?=
 =?utf-8?B?MFpXM3hLSzVncm9HRS8xTk5EQVpxenBmREhhRUZxaGZ3QkFZRnAwRWhDby9l?=
 =?utf-8?B?cjNXWU1acFRwZTlUYXRHYmVnbFZzdDBDTjdmZzRWaEVKOWR4Tnc1bml6cnZr?=
 =?utf-8?Q?4+Sk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea1e18f-b7cd-483b-982c-08dbcbb6bd2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 06:36:32.0997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o8GM6f9vPeLY1QEkRYqtx72jmUgeiZK0Vd1WOooW0Glc2DbS5D2RExxMtrMoGB5V2PMEfCZUAdBEfdirwqPe+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7701
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IEZyaWRh
eSwgT2N0b2JlciAxMywgMjAyMyA2OjQ3IEFNDQo+IA0KPiBPbiBUaHUsIE9jdCAxMiwgMjAyMyBh
dCA2OjU44oCvUE0gUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPiB3cm90ZToNCj4gPg0K
PiA+DQo+ID4gPiBGcm9tOiBaaHUsIExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPg0K
PiA+ID4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMTIsIDIwMjMgMzo1MSBQTQ0KPiA+ID4NCj4g
PiA+IE9uIDEwLzExLzIwMjMgNzo0MyBQTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+ID4gPj4g
RnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gPiA+ID4+IFNl
bnQ6IFdlZG5lc2RheSwgT2N0b2JlciAxMSwgMjAyMyAzOjU1IFBNDQo+ID4gPiA+Pj4+Pj4+IEkg
ZG9u4oCZdCBoYXZlIGFueSBzdHJvbmcgb3BpbmlvbiB0byBrZWVwIGl0IG9yIHJlbW92ZSBpdCBh
cw0KPiA+ID4gPj4+Pj4+PiBtb3N0IHN0YWtlaG9sZGVycw0KPiA+ID4gPj4+Pj4+IGhhcyB0aGUg
Y2xlYXIgdmlldyBvZiByZXF1aXJlbWVudHMgbm93Lg0KPiA+ID4gPj4+Pj4+PiBMZXQgbWUga25v
dy4NCj4gPiA+ID4+Pj4+PiBTbyBzb21lIHBlb3BsZSB1c2UgVkZzIHdpdGggVkZJTy4gSGVuY2Ug
dGhlIG1vZHVsZSBuYW1lLg0KPiA+ID4gPj4+Pj4+IFRoaXMgc2VudGVuY2UgYnkgaXRzZWxmIHNl
ZW1zIHRvIGhhdmUgemVybyB2YWx1ZSBmb3IgdGhlIHNwZWMuIEp1c3QNCj4gZHJvcCBpdC4NCj4g
PiA+ID4+Pj4+IE9rLiBXaWxsIGRyb3AuDQo+ID4gPiA+Pj4+IFNvIHdoeSBub3QgYnVpbGQgeW91
ciBhZG1pbiB2cSBsaXZlIG1pZ3JhdGlvbiBvbiBvdXIgY29uZmlnDQo+ID4gPiA+Pj4+IHNwYWNl
IHNvbHV0aW9uLCBnZXQgb3V0IG9mIHRoZSB0cm91YmxlcywgdG8gbWFrZSB5b3VyIGxpZmUgZWFz
aWVyPw0KPiA+ID4gPj4+Pg0KPiA+ID4gPj4+IFlvdXIgdGhpcyBxdWVzdGlvbiBpcyBjb21wbGV0
ZWx5IHVucmVsYXRlZCB0byB0aGlzIHJlcGx5IG9yIHlvdQ0KPiA+ID4gPj4+IG1pc3VuZGVyc3Rv
b2QNCj4gPiA+ID4+IHdoYXQgZHJvcHBpbmcgY29tbWl0IGxvZyBtZWFucy4NCj4gPiA+ID4+IGlm
IHlvdSBjYW4gcmViYXNlIGFkbWluIHZxIExNIG9uIG91ciBiYXNpYyBmYWNpbGl0aWVzLCBJIHRo
aW5rDQo+ID4gPiA+PiB5b3UgZG9udCBuZWVkIHRvIHRhbGsgYWJvdXQgdmZpbyBpbiB0aGUgZmly
c3QgcGxhY2UsIHNvIEkgYXNrIHlvdQ0KPiA+ID4gPj4gdG8gcmUtY29uc2lkZXINCj4gPiA+IEph
c29uJ3MgcHJvcG9zYWwuDQo+ID4gPiA+IEkgZG9u4oCZdCByZWFsbHkga25vdyB3aHkgeW91IGFy
ZSB1cHNldCB3aXRoIHRoZSB2ZmlvIHRlcm0uDQo+ID4gPiA+IEl0IGlzIHRoZSB1c2UgY2FzZSBv
ZiB0aGUgY2xvdWQgb3BlcmF0b3IgYW5kIGl0IGlzIGxpc3RlZCB0bw0KPiA+ID4gPiBpbmRpY2F0
ZSBob3cgcHJvcG9zYWwNCj4gPiA+IGZpdHMgaW4gYSBzdWNoIHVzZSBjYXNlLg0KPiA+ID4gPiBJ
ZiBmb3Igc29tZSByZWFzb24sIHlvdSBkb27igJl0IGxpa2UgdmZpbywgZmluZS4gSWdub3JlIGl0
IGFuZCBtb3ZlIG9uLg0KPiA+ID4gPg0KPiA+ID4gPiBJIGFscmVhZHkgYW5zd2VyZWQgdGhhdCBJ
IHdpbGwgcmVtb3ZlIGZyb20gdGhlIGNvbW1pdCBsb2csIGJlY2F1c2UNCj4gPiA+ID4gdGhlDQo+
ID4gPiByZXF1aXJlbWVudHMgYXJlIHdlbGwgdW5kZXJzdG9vZCBub3cgYnkgdGhlIGNvbW1pdHRl
ZS4NCj4gPiA+ID4NCj4gPiA+ID4gWW91ciBjb21tZW50IGlzIGFnYWluIHVucmVsYXRlZCAocmVw
ZWF0ZWQpIHRvIHlvdXIgcGFzdCB0d28gcXVlc3Rpb25zLg0KPiA+ID4gPg0KPiA+ID4gPiBJIGV4
cGxhaW5lZCB5b3UgdGhlIHRlY2huaWNhbCBwcm9ibGVtIHRoYXQgYWRtaW4gY29tbWFuZCAobm90
DQo+ID4gPiA+IGFkbWluIFZRKQ0KPiA+ID4gb2YgYmFzaWMgZmFjaWxpdGllcyBjYW5ub3QgYmUg
ZG9uZSB1c2luZyBjb25maWcgcmVnaXN0ZXJzIHdpdGhvdXQNCj4gPiA+IGFueSBtZWRpYXRpb24g
bGF5ZXIuDQo+ID4gPiBPSywgSSBwb3AtZWQgSmFzb24ncyBwcm9wb3NhbCB0byBtYWtlIGV2ZXJ5
dGhpbmcgZWFzaWVyLCBhbmQgSSBzZWUgaXQgaXMNCj4gcmVmdXNlZC4NCj4gPiBCZWNhdXNlIGl0
IGRvZXMgbm90IHdvcmsgZm9yIHBhc3N0aHJvdWdoIG1vZGUuDQo+IA0KPiBIb3cgYW5kIHdoeT8g
V2hhdCdzIHdyb25nIHdpdGgganVzdCBwYXNzaW5nIHRocm91Z2ggdGhlIG5ld2x5IGludHJvZHVj
ZWQgMg0KPiBvciAzIHJlZ2lzdGVycyB0byBndWVzdHM/DQo+IA0KSWYgcGFzc2VkIHRvIHRoZSBn
dWVzdCB3aG8gaXMgbm90IGludm9sdmVkIGluIHRoZSBsaXZlIG1pZ3JhdGlvbiBmbG93LCBjYW5u
b3Qgb3BlcmF0ZSB0aGUgZGV2aWNlLg0KVkYgPSBtZW1iZXIgZGV2aWNlID0gY29udHJvbGxlZCBm
dW5jdGlvbg0KUEYgPSBvd25lciBkZXZpY2UgPSBjb250cm9sbGluZyBmdW5jdGlvbg0KRGV2aWNl
IG1pZ3JhdGlvbiBjb21tYW5kcyBmcm9tIHRoZSBoeXBlcnZpc29yIGFyZSBub3QgZm9yd2FyZGVk
IGluc2lkZSB0aGUgZ3Vlc3QuDQoNCj4gVGhpcyBpcyB0aGUgcXVlc3Rpb24geW91IG5ldmVyIGFu
c3dlciBldmVuIGlmIEkga2VlcCBhc2tpbmcuDQo+IA0KDQo+ID4gU3VyZSwgYXMgSSBleHBsYWlu
ZWQgdGhlIGNvbmZpZyByZWdpc3RlciBtZXRob2QgZG8gbm90IHdvcmsgZm9yIHBhc3N0aHJvdWdo
DQo+IG1vZGUsIGFuZCBkb2VzIG5vdCBzY2FsZS4NCj4gDQo+IFdlIG5lZWQgdG8gbWFrZSBzdXJl
IHlvdXIgbWlncmF0aW9uIHByb3Bvc2FsIGNhbiB3b3JrIGZvciAxIFZGIHdoaWNoIGlzIHN0aWxs
DQo+IHF1ZXN0aW9uYWJsZSB0aGVuIHdlIGNhbiB0YWxrIGFib3V0IG90aGVycyBsaWtlIHNjYWxp
bmcuIE5vPw0KU3VyZSBidXQgaW4gbWFraW5nIHN1cmUgdGhhdCwgdGhlIGludGVyZmFjZSBpcyBi
dWlsdCBzbyB0aGF0IGl0IGNhbiB3b3JrIGZvciBOIFZGcyB0b28uDQoNCj4gDQo+IEFuZCBtb3N0
IG9mIHlvdXIgY29uY2VybiByZWdhcmRpbmcgc2NhbGFiaWxpdHkgc2VlbXMgbW9yZSBsaWtlIGEg
bGltaXRhdGlvbiBvZiBhDQo+IHRyYW5zcG9ydC4gTGV0J3Mgbm90IG1peCB0aGUgc2NhbGFiaWxp
dHkgZm9yIGEgc3BlY2lmaWMgdHJhbnNwb3J0IHdpdGggdGhlIG9uZSBmb3INCj4gY29yZSB2aXJ0
aW8gZGV2aWNlcy4NClZpcnRpbyBkZXZpY2UgaXMgZm9yIHRoZSBkZWZpbmVkIHRyYW5zcG9ydC4N
ClNvIGl0IG5lZWRzIHRvIHdvcmsgZm9yIHRoZSBkZWZpbmVkIHRyYW5zcG9ydC4NClRoZXJlZm9y
ZSwgc2NhbGFiaWxpdHkgY2Fubm90IGJlIGlnbm9yZWQuDQoNCkl0IGlzIG5vdCBhIHF1ZXN0aW9u
IGFueW1vcmUgYXMgZm9yIGFueSBidWxrIHRyYW5zZmVyIHZpcnRxdWV1ZSBpcyB0aGUgc3BlY2lm
aWNhdGlvbiBjaG9pY2UgZm9yIG9idmlvdXMgdGVjaG5pY2FsIGdhaW5zLg0KDQo+IA0KPiA+DQo+
ID4gPiA+DQo+ID4gPiA+PiBpbmZsaWdodCBkZXNjcmlwdG9yIHRyYWNraW5nIHdpbGwgYmUgaW1w
bGVtZW50ZWQgYnkgRXVnZW5pbyBpbiBWMi4NCj4gPiA+ID4gV2hlbiB3ZSBoYXZlIG5lYXIgY29t
cGxldGUgcHJvcG9zYWwgZnJvbSB0d28gZGV2aWNlIHZlbmRvcnMsIHlvdQ0KPiA+ID4gPiB3YW50
IHRvIHB1c2ggc29tZXRoaW5nIHRvIHVua25vd24gZnV0dXJlIHdpdGhvdXQgcmV2aWV3aW5nIHRo
ZQ0KPiA+ID4gPiB3b3JrOyBkb2VzIG5vdA0KPiA+ID4gbWFrZSBzZW5zZS4NCj4gPiA+IERpZG4n
dCBJIGV2ZXIgcHJvdmlkZSBmZWVkYmFjayB0byB5b3U/IFJlYWxseT8NCj4gPiBOby4gSSBkaWRu
4oCZdCBzZWUgd2h5IHlvdSBuZWVkIHRvIHBvc3QgYSBuZXcgcGF0Y2ggZm9yIGRpcnR5IHBhZ2Ug
dHJhY2tpbmcsDQo+IHdoZW4gaXQgaXMgYWxyZWFkeSBwcmVzZW50IGluIHRoaXMgc2VyaWVzLg0K
PiANCj4gWW91IGtub3cgdGhlcmUgYXJlIHZhcmlvdXMgd2F5cyB0byBkbyBkaXJ0eSBwYWdpbmc/
IEZvciBleGFtcGxlLCB0aGUgd2VsbA0KPiBrbm93biBiaXRtYXAgYW5kIGl0cyB2YXJpYW50cy4g
SSB0aGluayB3ZSd2ZSBkaXNjdXNzZWQgc2V2ZXJhbCB0aW1lcyBpbiBtYW55DQo+IHBsYWNlcyBp
biB0aGUgcGFzdC4gSSBkb24ndCBzZWUgd2hlcmUgeW91IGV4cGxhaW4gd2h5IHlvdSBjaG9vc2Ug
b25lIG9mIHRoZW0NCj4gYnV0IG5vdCB0aGUgb3RoZXJzIGJ1dCB5b3Ugd2FudCB0byBmb3JiaWQg
b3RoZXIgdHlwZXMgb2YgZGlydHkgcGFnZSBsb2dnaW5nPw0KPiBXaHk/DQpUaGUgd2VsbCBrbm93
biBiaXRtYXAgc2ltcGx5IGRvIG5vdCB3b3JrIGZvciB0aGUgcGNpIHRyYW5zcG9ydCBpbiBhdG9t
aWMgd2F5LCBlZmZlY3RpdmVseS4NCllvdSB0ZW5kIHRvIGRlcml2ZSBtYW55IGNvbmNsdXNpb25z
IHRvIG9wcG9zZSB0aGUgd29yayBmcmFua2x5LiA6KQ0KT3RoZXIgdHlwZXMgb2YgZGlydHkgcGFn
ZSBsb2dnaW5nIGlzIG5vdCBmb3JiaWRkZW4uDQoNCkkgZG9u4oCZdCBzZWUgdGhlIG5lZWQgdG8g
ZXhwbGFpbiBldmVyeSBzaW5nbGUgd29yZCB3aHkgYSBnaXZlbiBzY2hlbWUgaXMgY2hvc2VuIGlu
IHRoZSBzcGVjIGxhbmd1YWdlLg0KVGhlcmUgaXMgbGluZSBkcmF3biB0byBhdm9pZCB3cml0aW5n
IGEgYm9vayBhbmQgYSBzcGVjLg0KDQo+ID4gU2Vjb25kbHkgSSBkb27igJl0IHNlZSBob3cgb25l
IGNhbiByZWFkIDFNIGZsb3dzIHVzaW5nIGNvbmZpZyByZWdpc3RlcnMuDQo+IA0KPiBXaHkgY2Fu
J3Qgd2UgdHJhcCB0aGVtPyB2SU9NTVUgZXZlbiBtaWdyYXRlcyBpbnRlcm5hbCB0cmFuc2xhdGlv
biB0YWJsZXMuDQoNCkJlY2F1c2UgdGhleSBhcmUgYWRkZWQgYW5kIHJlbW92ZWQgb3ZlciB0aGUg
dmlydHF1ZXVlcyBhbG1vc3QgYXMgZGF0YSBwYXRoIG9wZXJhdGlvbnMuDQpWaXJ0aW8gcXVldWVz
IGFyZSBub3QgbWVkaWF0ZWQvdHJhcHBlZCB3aGVuIHRoZSBuYXRpdmUgZGV2aWNlIGlzIHZpcnRp
byBtZW1iZXIgZGV2aWNlIGl0c2VsZi4NCg==

