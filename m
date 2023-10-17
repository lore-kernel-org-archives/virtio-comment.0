Return-Path: <virtio-comment-return-7748-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5807CDB474
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 03:26:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 298C92AFF6
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 03:26:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 113A598684C
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 03:26:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E91679863B5; Tue, 17 Oct 2023 03:26:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D20BE986843
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 03:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htFk/gpKBw9EpFXVo1atgIet/wGxajFXPK4NRHq6ZT+eAbvHppI6YxqT7QLktAgcxC79hWU1SVNAf/MHpZmy/CvDC7r2M+x2aXd+O6ASohyYfH8v0BSQSdH+bt77tr+J9Hnx1aV1p8QMKU3hQFzjJdh9e5/194jyclEjDM6pm6MzzjnVcFWJ7jPenIqRbcHITvEDI1vufWJEpYpX5fOD+DcfSMe2YQXAtOXzkvjFBQETyXOx3vl2zjIYjYoCXmD1LM+xWruAe+ZmbY99j129yl7Gxot3jpR87IFZeB77E7NEq/Km3v3NbLzVJSZ78//iAGbwg6tf9OWg6SakTeCSZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXJAsFvWuoLoBZai8YXLgo1LN0kDy3ibmF1EPgwDPK4=;
 b=Rfjhx5K3iDSQ1q+S4lX/kgmfSNCAEd4nVjh2JFgmqZJbkbyWE4SjwgUuEbAW5uzilmxOfnuLvDOVuC+/CMwgfIZCpEGxCXLBaG8Gn7/xRQtT6i3EQaJa4efL9nKrU40d1QDL45sM9b1CODLVvnHjgYPBHrU3DLp+K4sSOVxHIV7Dm097JyeLaiNBvHvsIWSgJKz/NCgAqkw4wKh/l08cIlfNsAYFIGk10VTK5WdKRgE6xeNH3DFaybph0fcIEE/qPB7miqE2CAi3Xk7HcNdNlmE36zdl86ypZrQCxvqSqsYQOpyr35L8gcK1REGEO+PWui+D0m/cpHD/UIQWofQFbw==
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
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlA=
Date: Tue, 17 Oct 2023 03:26:27 +0000
Message-ID:
 <PH0PR12MB5481E85F17F9D22CBCC9FDF8DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
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
In-Reply-To:
 <CACGkMEtihTxYADd1dbG=vX9=VLp0xfRJSQ4jd_m0UiuZNz_2sg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW6PR12MB8759:EE_
x-ms-office365-filtering-correlation-id: 172b914e-1764-4832-bbc1-08dbcec0d8ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8OwxbrRlbC3tPIEFPHs390KYCm9c+i25brQruPWcxCfFLY8ZM3Z/Im7Sx59b1ARQC+5y5PI1W307X7S5Vu3S54TW3nmzUOPIi2BWg+eq8jt24V4+Ksw5TkMhqFRsxEYNOVagEkaC7lpTabh0s6kAqrxnwE2uGsnxRhlQ0inqUyXBhuRDHn4Oq3VvQZ1JpZYYpChfQ2YGZcLqfjWIVtVDQNN2FAJF64WTLGhaE4iUkhvxa+eeCYEv78GYO8cYVRJfFMf1BtmD9DXtcrvhWGhaeITllo20B7ZOvHKxz+wHw/svONJe7F5O4BkTMywtCO8uu1XO/TBAodSrjSsuRmlba+opR/nk2MFk72cYwnUq2ovjiZRT/+r+RFAjH2cUCQsO+cjvfXtkOuAv3Ckbdw3AqlUTE9xulNFoikG37CFmGmL3PbBUQPHAy+yfCTMdkiPweIMbH9XMPbsN+nuNkDTudrSqgg8a83WGkM984x5Zz+hPXb2OKX4fL+JBaP9d7KycPTQnXDtXxYlQiSphWCNP6W0LebvkcqjJ637YwZtrD9o/7I+Y069wJ9VOh7smPfO+3AEN6Y54U6nJ+F2wpOfjw9D1duPlNEMDHJr4r2ray3ULKqW9oG7XnloLiS7qRsT6
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(66476007)(66446008)(64756008)(66556008)(66946007)(76116006)(54906003)(41300700001)(316002)(6916009)(478600001)(55016003)(38070700005)(122000001)(2906002)(5660300002)(8676002)(8936002)(4326008)(52536014)(38100700002)(33656002)(71200400001)(6506007)(53546011)(7696005)(9686003)(86362001)(83380400001)(107886003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZzFBUkFnSHFpdG5lV25QTGRZQXZ2QkE4MTZYMllWdFJpT1RMa1VrdW5EaXls?=
 =?utf-8?B?Vlo0akMvT01NZkRwQzZwWXUrN1o1cjRyN1E0MXR4M1VVL0ZqSGNJaTJWWUFW?=
 =?utf-8?B?MTFMdkdrQ2ZIb2Q2L3NkcXczTXhBQnRnN3h0TUNHY0ZxOVhWVnN2WW83U2c1?=
 =?utf-8?B?L0ZyOGhBVTViaDlJbXMwWmVUdW8rdmlDd2R1YjEzbnZ0a1VyZy9ZWUwzT2pa?=
 =?utf-8?B?dWQxTmd3RW9ZZHYzRXpNTTVXYVNZM3ZHazNhak5FYmtxWFJjSTZ4YVFmSWNS?=
 =?utf-8?B?d1BPQXArbGNZYVA2cnpyeWVkRTRYSFJtcm5JWEFOR3pOVTA1R3FrYVMzZ1JO?=
 =?utf-8?B?bW5xVFg1WlVENm5YR3R4MkY3KzNDeVhVQVNhaXIrZE1lQzM5dnNrOUMvVWhX?=
 =?utf-8?B?ZzFXd0NpeHFqZVNvbVJLSUpqK2o1ck9lbDdRWnREMTE5K2t5K2RpRXZHa1VJ?=
 =?utf-8?B?QUpobHJ1V01yY1huK1FHOW95ZEZwNnNhb01KWUVPQmtZSzZJaFkzQnR2aHEr?=
 =?utf-8?B?MURFU3hLN09Gd2JkakNPMnpBSjlKSnY1K1huR2ZXYjBuYmhoMHlnbTlKaGhj?=
 =?utf-8?B?SEwyT1BMcjQ1UTdMMmZCdkpFcmxqZjQrNUtnaDRPMm1MYjM1UVMzRldJNTg0?=
 =?utf-8?B?a0RVL2lURUJPZi9ZanZ3cVNJMXEwckFidlRLcElaTDk1bllFRVM1VUYvWjJG?=
 =?utf-8?B?ai9SdGxnN293SzNLSzdHUk9PTXNaK2ROSVZkMmJoSCtaaTE2OXd6eE5hTTZY?=
 =?utf-8?B?ZWs2Mko2QWJ1ZDl6SGRUcU1nK3VwQy9GL3Y3Z29ENUtHdzMxNHZKcUdIZXVT?=
 =?utf-8?B?dkdMWmFOUDFHYVZQL2ljbk1aK3hBR2VZVHJPcTZ4U2k3N3BRQm9UUFZVdmhX?=
 =?utf-8?B?WFpPRC9iZ1NCaERtdHhGcVVmRVhrbnNDd1puVFRuSHM2QlBXMXBjVzZsS2p5?=
 =?utf-8?B?V3JCNWdOdEVFeTd4c0dENDR6bFEvWXpZb3kvZFJDUTNJT01RTFh1T3Q4cHZt?=
 =?utf-8?B?MGFXK05USm9NQlZld3ZTRk5WSGF1R05kaktlUmVYZmZqUTR0ck4rTnZ5TjAw?=
 =?utf-8?B?R0E3NHI3RDk1M2ZHZkRtU2lDK1pmRlZaNmQ0bnhJOCt6VDdxSWtvRUFOS0Vl?=
 =?utf-8?B?VHlDa0JVQXZvNlo2b2hVelV0UVF6RW83cTFaczRpYlhnWmJtYURMSEx2Lzhs?=
 =?utf-8?B?YkpEQU41RDZYaENIRjJBaUNibk1qVHdmN0dyQW5aVGlPaU5NTTIxekxYQ0Zr?=
 =?utf-8?B?STFSNXNJYk9QVTZ6RVNqWWtSQVN3TzRGemhYV1RIRjFGY2hwVVNab3NBNG84?=
 =?utf-8?B?eG5GQTZaQ0hWTldoU0dlb1BpR0Z2a0NIR0g3ODNwZ0RyRFJQNlFnZDcvWEFn?=
 =?utf-8?B?RE9CTERQZ0NlODNJTjFTbnFTZjVlZjFKSm5IYU9mZmJHR0ducndrR0ovYmh3?=
 =?utf-8?B?TFlkTnFYVkR0QzJMdE4wT2NNdFlEeG53RmwrV2ZGSno0dzI2bmhmUktHVFA3?=
 =?utf-8?B?QUFkZWpQNGErNUxraWowR1pHVzRObkhRNU4zOVhNb3V2NEZlT0kyUU1nRzFn?=
 =?utf-8?B?UHVOd1U4eDdhRFlROEE2bzAyUTFCQkNJKzhrUjZnZlNhamdsVFU1TGNPbWdo?=
 =?utf-8?B?Z0RsOFZCaWpxQ25jck5SWDJMaGpDdW8xSGlqTUx5ZFI5ZGlCc0VOMkEySmVr?=
 =?utf-8?B?MjVna2M2NFgyTWg3NFFzQkx5aU5kUDRmVTZ0VnJPOFpNRVJJOWJkbFExQk9j?=
 =?utf-8?B?dFAyTEhxZkVMQ0lWWGRZQmU2OGRjdzFkOE5RMWZlRjNSNklvSDlCM0pSaXk1?=
 =?utf-8?B?d2pWN2pXV3VkR2Jvbm15NlRxWXdVaXNJUTZtUlorM3JlSGdGUFVzMEdnKzdC?=
 =?utf-8?B?a2xRVVhzN0VDc3AyR3hFWnVLQXkzbk4yQlFLQ3lwV0ZUUzFxSWNSamJxdFp4?=
 =?utf-8?B?ZmtQTGZwelVZeVcrNWZiMmFpR3k4ZzZzVk1rVDIwYm1Wb29haVNnVUNuVCtv?=
 =?utf-8?B?OGZrZWF1bm41OEgrVDZUbWhYc0xaTmVXQzRtenNpQWNWZk5zQ1RCQkRld0p6?=
 =?utf-8?B?czJBaHlSNlQrR2VlelFMRDFKNCsyUkw0UHpIRVo3TGtWMWRnRUVtRnR1Nk9Z?=
 =?utf-8?Q?2iJ0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172b914e-1764-4832-bbc1-08dbcec0d8ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 03:26:27.1579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QmdbrzOENZf5xLmpeZ1J5kzNNwEb6Ie8v5W0cog9iQIXPoJONFV0Fbltkleu5qswlmiYjZQk3TcDe97kUKnXbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8759
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVl
c2RheSwgT2N0b2JlciAxNywgMjAyMyA3OjIzIEFNDQo+IA0KPiBPbiBGcmksIE9jdCAxMywgMjAy
MyBhdCAyOjM24oCvUE0gUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPiB3cm90ZToNCj4g
Pg0KPiA+DQo+ID4gPiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiA+
ID4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDEzLCAyMDIzIDY6NDcgQU0NCj4gPiA+DQo+ID4gPiBP
biBUaHUsIE9jdCAxMiwgMjAyMyBhdCA2OjU44oCvUE0gUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlk
aWEuY29tPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gPiBGcm9tOiBaaHUsIExp
bmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPg0KPiA+ID4gPiA+IFNlbnQ6IFRodXJzZGF5
LCBPY3RvYmVyIDEyLCAyMDIzIDM6NTEgUE0NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9uIDEwLzEx
LzIwMjMgNzo0MyBQTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+ID4gPiA+ID4+IEZyb206IFpo
dSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+ID4gPiA+ID4gPj4gU2VudDog
V2VkbmVzZGF5LCBPY3RvYmVyIDExLCAyMDIzIDM6NTUgUE0NCj4gPiA+ID4gPiA+Pj4+Pj4+IEkg
ZG9u4oCZdCBoYXZlIGFueSBzdHJvbmcgb3BpbmlvbiB0byBrZWVwIGl0IG9yIHJlbW92ZSBpdA0K
PiA+ID4gPiA+ID4+Pj4+Pj4gYXMgbW9zdCBzdGFrZWhvbGRlcnMNCj4gPiA+ID4gPiA+Pj4+Pj4g
aGFzIHRoZSBjbGVhciB2aWV3IG9mIHJlcXVpcmVtZW50cyBub3cuDQo+ID4gPiA+ID4gPj4+Pj4+
PiBMZXQgbWUga25vdy4NCj4gPiA+ID4gPiA+Pj4+Pj4gU28gc29tZSBwZW9wbGUgdXNlIFZGcyB3
aXRoIFZGSU8uIEhlbmNlIHRoZSBtb2R1bGUgbmFtZS4NCj4gPiA+ID4gPiA+Pj4+Pj4gVGhpcyBz
ZW50ZW5jZSBieSBpdHNlbGYgc2VlbXMgdG8gaGF2ZSB6ZXJvIHZhbHVlIGZvciB0aGUNCj4gPiA+
ID4gPiA+Pj4+Pj4gc3BlYy4gSnVzdA0KPiA+ID4gZHJvcCBpdC4NCj4gPiA+ID4gPiA+Pj4+PiBP
ay4gV2lsbCBkcm9wLg0KPiA+ID4gPiA+ID4+Pj4gU28gd2h5IG5vdCBidWlsZCB5b3VyIGFkbWlu
IHZxIGxpdmUgbWlncmF0aW9uIG9uIG91ciBjb25maWcNCj4gPiA+ID4gPiA+Pj4+IHNwYWNlIHNv
bHV0aW9uLCBnZXQgb3V0IG9mIHRoZSB0cm91YmxlcywgdG8gbWFrZSB5b3VyIGxpZmUgZWFzaWVy
Pw0KPiA+ID4gPiA+ID4+Pj4NCj4gPiA+ID4gPiA+Pj4gWW91ciB0aGlzIHF1ZXN0aW9uIGlzIGNv
bXBsZXRlbHkgdW5yZWxhdGVkIHRvIHRoaXMgcmVwbHkgb3INCj4gPiA+ID4gPiA+Pj4geW91IG1p
c3VuZGVyc3Rvb2QNCj4gPiA+ID4gPiA+PiB3aGF0IGRyb3BwaW5nIGNvbW1pdCBsb2cgbWVhbnMu
DQo+ID4gPiA+ID4gPj4gaWYgeW91IGNhbiByZWJhc2UgYWRtaW4gdnEgTE0gb24gb3VyIGJhc2lj
IGZhY2lsaXRpZXMsIEkNCj4gPiA+ID4gPiA+PiB0aGluayB5b3UgZG9udCBuZWVkIHRvIHRhbGsg
YWJvdXQgdmZpbyBpbiB0aGUgZmlyc3QgcGxhY2UsIHNvDQo+ID4gPiA+ID4gPj4gSSBhc2sgeW91
IHRvIHJlLWNvbnNpZGVyDQo+ID4gPiA+ID4gSmFzb24ncyBwcm9wb3NhbC4NCj4gPiA+ID4gPiA+
IEkgZG9u4oCZdCByZWFsbHkga25vdyB3aHkgeW91IGFyZSB1cHNldCB3aXRoIHRoZSB2ZmlvIHRl
cm0uDQo+ID4gPiA+ID4gPiBJdCBpcyB0aGUgdXNlIGNhc2Ugb2YgdGhlIGNsb3VkIG9wZXJhdG9y
IGFuZCBpdCBpcyBsaXN0ZWQgdG8NCj4gPiA+ID4gPiA+IGluZGljYXRlIGhvdyBwcm9wb3NhbA0K
PiA+ID4gPiA+IGZpdHMgaW4gYSBzdWNoIHVzZSBjYXNlLg0KPiA+ID4gPiA+ID4gSWYgZm9yIHNv
bWUgcmVhc29uLCB5b3UgZG9u4oCZdCBsaWtlIHZmaW8sIGZpbmUuIElnbm9yZSBpdCBhbmQgbW92
ZSBvbi4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJIGFscmVhZHkgYW5zd2VyZWQgdGhhdCBJ
IHdpbGwgcmVtb3ZlIGZyb20gdGhlIGNvbW1pdCBsb2csDQo+ID4gPiA+ID4gPiBiZWNhdXNlIHRo
ZQ0KPiA+ID4gPiA+IHJlcXVpcmVtZW50cyBhcmUgd2VsbCB1bmRlcnN0b29kIG5vdyBieSB0aGUg
Y29tbWl0dGVlLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFlvdXIgY29tbWVudCBpcyBhZ2Fp
biB1bnJlbGF0ZWQgKHJlcGVhdGVkKSB0byB5b3VyIHBhc3QgdHdvDQo+IHF1ZXN0aW9ucy4NCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJIGV4cGxhaW5lZCB5b3UgdGhlIHRlY2huaWNhbCBwcm9i
bGVtIHRoYXQgYWRtaW4gY29tbWFuZCAobm90DQo+ID4gPiA+ID4gPiBhZG1pbiBWUSkNCj4gPiA+
ID4gPiBvZiBiYXNpYyBmYWNpbGl0aWVzIGNhbm5vdCBiZSBkb25lIHVzaW5nIGNvbmZpZyByZWdp
c3RlcnMNCj4gPiA+ID4gPiB3aXRob3V0IGFueSBtZWRpYXRpb24gbGF5ZXIuDQo+ID4gPiA+ID4g
T0ssIEkgcG9wLWVkIEphc29uJ3MgcHJvcG9zYWwgdG8gbWFrZSBldmVyeXRoaW5nIGVhc2llciwg
YW5kIEkNCj4gPiA+ID4gPiBzZWUgaXQgaXMNCj4gPiA+IHJlZnVzZWQuDQo+ID4gPiA+IEJlY2F1
c2UgaXQgZG9lcyBub3Qgd29yayBmb3IgcGFzc3Rocm91Z2ggbW9kZS4NCj4gPiA+DQo+ID4gPiBI
b3cgYW5kIHdoeT8gV2hhdCdzIHdyb25nIHdpdGgganVzdCBwYXNzaW5nIHRocm91Z2ggdGhlIG5l
d2x5DQo+ID4gPiBpbnRyb2R1Y2VkIDIgb3IgMyByZWdpc3RlcnMgdG8gZ3Vlc3RzPw0KPiA+ID4N
Cj4gPiBJZiBwYXNzZWQgdG8gdGhlIGd1ZXN0IHdobyBpcyBub3QgaW52b2x2ZWQgaW4gdGhlIGxp
dmUgbWlncmF0aW9uIGZsb3csIGNhbm5vdA0KPiBvcGVyYXRlIHRoZSBkZXZpY2UuDQo+ID4gVkYg
PSBtZW1iZXIgZGV2aWNlID0gY29udHJvbGxlZCBmdW5jdGlvbiBQRiA9IG93bmVyIGRldmljZSA9
DQo+ID4gY29udHJvbGxpbmcgZnVuY3Rpb24gRGV2aWNlIG1pZ3JhdGlvbiBjb21tYW5kcyBmcm9t
IHRoZSBoeXBlcnZpc29yIGFyZQ0KPiA+IG5vdCBmb3J3YXJkZWQgaW5zaWRlIHRoZSBndWVzdC4N
Cj4gDQo+IEkgZG9uJ3Qgc2VlIHdoeS4NCj4gDQo+IEZvciBleGFtcGxlLCBjYW4geW91IGV4cGxh
aW4gaG93IGEgdmlydGlvIHJlc2V0IGluIGd1ZXN0cyBjYW4gc3Vydml2ZSB3aXRoIHlvdXINCj4g
cHJvcG9zYWwgYnV0IG5vdCBhIHZpcnRpbyBzdXNwZW5kPw0KPg0KSW4gdGhpcyBwcm9wb3NhbCB2
aXJ0aW8gcmVzZXQgZ29lcyBkaXJlY3RseSBmcm9tIGd1ZXN0IHRvIHRoZSBkZXZpY2Ugd2l0aG91
dCBpbnRlcnZlbnRpb24gb2YgaHlwZXJ2aXNvci4NCldoZW4gc3VjaCBkZXZpY2UgcmVzZXQgaXMg
ZG9uZSwgaXQgZG9lcyBub3QgcmVzZXQgdGhlIGRldmljZSBjb250ZXh0LCBub3IgaXQgY2xlYXJz
IHRoZSBkaXJ0eSBwYWdlIHJlY29yZHMsIGJlY2F1c2UgdGhleSBhcmUgZG9uZSBieSB0aGUgY29u
dHJvbGxpbmcgZnVuY3Rpb24uDQoNCj4gSSdtIG5vdCBjb252aW5jZWQgdGhhdCB0aGUgc2NhbGFi
aWxpdHkgaXMgYnJva2VuIGJ5IGp1c3QgaGF2aW5nIDIgb3IgMyBtb3JlDQo+IHJlZ2lzdGVycy4g
V2UgYWxsIGtub3cgTVNJWCByZXF1aXJlcyBtdWNoIG1vcmUgdGhhbiB0aGlzLg0KPg0KU2F5aW5n
IHRoZXJlIGlzIHNvbWUgb3RoZXIgaGlnaCByZXNvdXJjZSBjb25zdW1lciBtZXRob2QgZXhpc3Rz
LCBzbyBsZXRzIGNvbnN1bWUgbW9yZSBpbiBuZXcgaW50ZXJmYWNlIHdlIGRvIG5vdywgaXMgbm90
IGdvb2QgYXBwcm9hY2guDQpNU0ktWCBvbiBpdHMgdjIgaXMgdW5kZXJ3YXkuIEhvcGVmdWxseSBp
dCB3aWxsIGJlIGZpbmlzaGVkIHRoaXMgeWVhciwgd2hpY2ggaXMgYWxyZWFkeSBjdXR0aW5nIGRv
d24gTyhOKSByZXNvdXJjZXMuDQoNCj4gWW91IGNhbid0IHNvbHZlIGFsbCB0aGUgaXNzdWVzIGlu
IG9uZSBzZXJpZXMuIEFzIHN0YXRlZCBtYW55IHRpbWVzLCANCkkgYW0gbm90IHNvbHZpbmcgYWxs
IGlzc3VlcyBpbiBvbmUgc2VyaWVzLiBUaGlzIHNlcmllcyBidWlsZHMgdGhlIGluZnJhc3RydWN0
dXJlLg0KDQo+IGlmIHlvdSByZWFsbHkNCj4gY2FyZSBhYm91dCB0aGUgc2NhbGFiaWxpdHksIHRo
ZSBjb3JyZWN0IHdheSBpcyB0byBiZWhhdmUgbGlrZSBhIHJlYWwgdHJhbnNwb3J0DQo+IHRocm91
Z2ggdmlydHF1ZXVlIGluc3RlYWQgb2YgdHJ5aW5nIHRvIGR1cGxpY2F0ZSB0aGUgZnVuY3Rpb25h
bGl0eSBvZiB0cmFuc3BvcnQNCj4gdmlydHF1ZXVlIHNsb3dseS4NCj4gDQpUaGlzIHdpbGwgYmUg
aW1wb3NzaWJsZSBiZWNhdXNlIG5vIGRldmljZSB3aWxsIHRyYW5zcG9ydCBkcml2ZXIgbm90aWZp
Y2F0aW9ucyB1c2luZyBhIHZpcnRxdWV1ZS4NClRoZXJlZm9yZSwgdmlydHF1ZXVlIGlzIG5vdCBz
b21lIGdlbmVyaWMgdHJhbnNwb3J0IHRoYXQgZG9lcyBldmVyeXRoaW5nIC0gYXMgc2ltcGxlIGFz
IHRoYXQuIGhlbmNlIHRoZXJlIGlzIG5vIHRyYW5zcG9ydCB2aXJ0cXVldWUuDQoNCkFuZCB2aXJ0
cXVldWUgZm9yIGJ1bGsgZGF0YSB0cmFuc2ZlciBleGlzdHMgc28gbm8gbmVlZCB0byBpbnZlbnQg
eWV0IGFub3RoZXIgdGhpbmcgd2l0aG91dCBhIGdvb2QgcmVhc29uLg0K

