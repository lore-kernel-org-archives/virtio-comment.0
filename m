Return-Path: <virtio-comment-return-7691-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A2ECDB46E
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 11:23:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 304848C126
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 11:23:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 116E3986837
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 11:23:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F00B0986474; Thu, 12 Oct 2023 11:23:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E02B098660E
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 11:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pa1PnpejGcYSCRGYDZb/nTjIEwScGwulWfZdCex05Hx21vmaNv2vvUv3UD62tFgHoH4Q4QfxJbXs9TDPoz8cdq/FNm8/tK9NwJHe71GTddmBH3ooY35L+6BoOINBaQc1wkD4NVfjWvscC3eT8nblPleb5YSjYsw7DJ16aE9EPb2rSrmzFYAbGZyLbMtJqkrmPaevaC589ApyWH9kkidAh+/SlyAYt+M0njDAbRoUlZxcdt2943T2kI8wyFvRSsD1zTlSHik6VsAeQEbiQ+zf67WDWfQOBmgS7/qFGmR08CL2IURmceZwTg8LcIrp+PBiXFNANoWZLc2++dditsVDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcnxmVIoVBtGfwbCT6fErFWH5rc9hrVSDx69lZCT8tY=;
 b=IdtDQ9x+uTTMzI37ULrXJlNpTXVx26Lh+AUHiyJOlscsM5H7lpC1xK58xMlbnpsKvWVtXP1zjyRrq2AuwK9GqguzWYirYGrheDE0mqzsfhdigyhr8H8Wb91eU/A7WdTdKwP925GZyR9Kfqfqa+uPfvge53/eQVJjoikJsw75edRpXVKm7wnZWi5gcSccLiaBUWX2YR1drw33WZXCacoL6N3S7UWTOaKZbkr8WnIvjoClsr3kuVMGUouCaF5NUtvKt7evuAFkMgDQd/2m/Gw1ioGuVUYiG7QPwuU/11HlFkqHDh+NpogzfGgmIGDmPUq5RTge5LNsFl+41cEgJ4ZWaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Jason Wang
	<jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAADA8AgAAJCgA=
Date: Thu, 12 Oct 2023 11:23:07 +0000
Message-ID:
 <PH0PR12MB548177A7E56E5C6336920109DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org>
 <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
 <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
 <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
 <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231012063407-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231012063407-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB7665:EE_
x-ms-office365-filtering-correlation-id: f34fe22b-ca8c-4527-5e27-08dbcb159bbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4683twqPdUPGcrrOdwcPOodPYKyD7nibaOlR1bIxHBuAsL00o6jwHlkSPw9/s1swLPXF1uzO2tMB6QrXzx+h1MQJgD/BG/VyBAoq0ODQ31tlZAIhJuVeMRy+lvP91MePu8gJ4R8Whga5p/YB6ZYvkAtOLlcCuurMJ61pVL5TvMO71Ja5wgoEFwlp2Va+ciDNyiizvLYctveM17vIDFOJnikjGnQmmkhTwDb/Mr28S0V2WgQUXHoJ1g3CO9PUoWyB6GrBpeKYy6ZP+/F2oTZQse1csqGZ4twBpHoyEIBNMB5iGX3eON70pCuWejskVwE5En8BwUrz+8pNdTWFiwJWfDiCgqvPdNnqclVDXEl/rfVD1DCQIPT5ANGoXSICqwsIEjTf8S4fMa25xH8jhKn9Uj7wX1STIaT01vBRd5PhtkYokC67+OEJKoTNTOZsR8NiA+7tYOYLngsr4i2eQ7k1dOgVr0Wlur+Y7XcmEP8s/b2NCdCi9ld5QOLWwSpRTSRSkczWTeB422KVW+FH+YOdkhL7dCWFZaA63AEZX4UWqk4dSBgvZmAKJMXPPS28vhoDFxFeNQ+flbi0f0gmZ5ZI7/c6nCEiOBryGEFTOUm3VMaDjec+nB2ysGPb1vtIfsim
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(346002)(39860400002)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2906002)(38070700005)(66899024)(52536014)(38100700002)(5660300002)(8936002)(4326008)(8676002)(122000001)(41300700001)(55016003)(33656002)(86362001)(83380400001)(107886003)(9686003)(478600001)(71200400001)(7696005)(6506007)(76116006)(66476007)(66946007)(64756008)(54906003)(26005)(66556008)(66446008)(6916009)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RE5OM0p1TjZLRTMwQkZGSVpFcFlXR001aHQ5cStZUURBZ2l0NVJKUHBjSmJs?=
 =?utf-8?B?U3I4Nm0ySnVSeUZMdEF2SUl6REZXeEVQYWZnZ0NWbE9xd0JjNUlWUTQ3WEJx?=
 =?utf-8?B?UnVUYy91MGJ5SmVBWlZBd2hBU3ovL2VKUzhQY1Y0OEM0N2V4WHBmV0lPV1FD?=
 =?utf-8?B?SEVZdG05ZC9abDRydDR2Q3dNNlpTbjVRa0l1TTZBeHdxa05mSCtjTjN5SVFY?=
 =?utf-8?B?VzlPa2dhN3hlSlZnb0hHVW5JVEVabDkzNmVhdXlMaTlybUVmY3JnRzRJcDRQ?=
 =?utf-8?B?RHU1MWNKNHJOUUhRQ0pWUFI1djhndEd5S294T3h3eXFPem9JVVBsc3UrUDI4?=
 =?utf-8?B?K3J4b2RkdVJ3MjIyaGhUcm9oaFYxaGdoRW9XNVM2bUxyWHNJK0IwNkJHY2ZI?=
 =?utf-8?B?YzFBMm1zN3VyVmNtNHVoUVBDL1hxUHdwT2M5azdlaXRheVNDZnlZaVM1Ylg2?=
 =?utf-8?B?a0JhaG5mcnpXazVQM0Vna3hPeDBYTmJMS1RtSHFyYWR0cmQrRVBrbCtuMVI0?=
 =?utf-8?B?a1VmbVUxSUpPSng3UmtVZDI0OFhyZnlPSFZGL2lJbEtvYVJoalkxOTdNNW56?=
 =?utf-8?B?endaVzZrcjYzV2NncjhZMVVsMVFGY2RwWm4zVUtCV05YSnhnNThlOTI0dlY5?=
 =?utf-8?B?MEMvQk1NS2pZTWlraWZWU3dxZy9maFA3S001N0F1M3JzcUwvVnhFY2dOL0ho?=
 =?utf-8?B?UG10cWFHa0N6UCtTczM4blZ1SThoTFA5SDF1d215cnhUVGxkb3ZrdXo3UGxs?=
 =?utf-8?B?bFlWeXcxT1FjODBXSytYaHV1TEVrV3hIZGx6UmdXdGVkNzRhdENFc3dqOEZi?=
 =?utf-8?B?alBUOFlVOThmcitJTFR1K1dFRGxqdlJNWFNUSGdDKzJqNk4waU0yLzVsR3pa?=
 =?utf-8?B?R1BDcDA2Um9MSHZWbmdxTzM2QXZlelVwYUZWSHQ3RUdNSE9lNDl6SWtEZ1Fz?=
 =?utf-8?B?U05IMGpiRm9kN2lGbmoxVVJBYXY5NjhYaDFzM0gvN29pbkNMdmJwUENKbmpm?=
 =?utf-8?B?RThuY3hNa0pLSUhTU2RiQ0NjMTNZTDJ3a2pZTGdLdGFielBsbS9vQ2FHQ3Vr?=
 =?utf-8?B?UXN2UjE5SHROdjB3M0pRZ1NLWmhCbkhibnpuVEo1QTErcFNXTWt2Z0VYZWV6?=
 =?utf-8?B?aklUYXNyc29ZSmM0Q3FtTnBwdVR5WWJsRUxPYk42cmtwdEIzUmtxOW1Ucjhu?=
 =?utf-8?B?Mjk4cHNsSU1uUTl0SEpPWDBIRXcxYXFpN2s3WTBuZWw2dkJXWmtMeC83WUkx?=
 =?utf-8?B?aDRDSW9Qdnc2OXhNQm9MejZ0djNGb2JtbjllKzBaMEhSNUtVNnExaXhBOW5u?=
 =?utf-8?B?aUVaSStJbkhwY2J6cVNvR01QcTdoZDVuSUV2NEFxTHNuaDlzZ01SRnlEWjAx?=
 =?utf-8?B?TXJncGlWcytmRWlybGhNZ3JHWVNZdjZwVk14VnlnSktnSk84MUh2MWk4ZEs1?=
 =?utf-8?B?WFI4WTlPR1FNNmRyMW9KZ1FuOUpRWTh1Zjk3ZnZFSEpVNTR4Szd2TXduWXFH?=
 =?utf-8?B?YjRXOGJUbWFJUDZRb1RyNEwyS21QMTZnTFZVRHhVNTJ0ZXl6M1ZLakEzMnQ1?=
 =?utf-8?B?RGJjMlhib2JreFR2UVJuL0NseitXSXBvSFNWaitQelBvaUtSU2c1dS9lc1V4?=
 =?utf-8?B?clRZVWM3SVBUZXEwNlppVWRQTmMyY2dBYXozV2d2cWFFL1poK1dWbkdOQ2kv?=
 =?utf-8?B?UC9Xa055M1BjTysxNWRkRDc5MXpKQURnUWF4eXJ1Zmd2ei9JZk85d1F3bXky?=
 =?utf-8?B?ZDJmK0xoaVp3UEpUUVZ6RDBydUptdEMreVRLL2Zjek85NEhsRjFNOFpxamtQ?=
 =?utf-8?B?RVREdENCcTZlOElZNCs3UW15WmZ3NS80RTBDdnV0M3kxQnNhWWlrYVVXMkt0?=
 =?utf-8?B?d01yUGxTaU9DZXN4L3R2Rm5yL1FLK1ZNQmtOWnNRN2F2WENvSVhTa1V5Mkpq?=
 =?utf-8?B?R0I1T3VvRFVJdkVHZU5hWE9Ec1h5cTFvbUZ0c2JISkVxY0I4U3ltTjZVME1H?=
 =?utf-8?B?RzduUEtDa3I0dFRRU3hpZnlLWXpDYS9tTHRZdURYemZhcXRtMFR4ZVlzWjJW?=
 =?utf-8?B?azRyc2xqdXk1WUFRa3hDeXlpQkd3RHZodkczUVQ3OEJ2U2tqaGJFR1liZW51?=
 =?utf-8?Q?QldA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34fe22b-ca8c-4527-5e27-08dbcb159bbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 11:23:07.0573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uPusq+m3NAhauYTiNhZ3OdvjoCU8ywWKAV5eLfFQ9REGqfrCVzFDtfynltOaNLTFfMAo9dKYsAU5+/5Awf5t8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7665
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBPY3RvYmVyIDEyLCAyMDIzIDQ6MTUgUE0NCg0KWy4uXQ0KPiA+IFBsZWFzZSBkb27i
gJl0IHVzZSB0aGUgdmVyYiAiYnJlYWsiLg0KPiA+IFlvdXIgcHJvcG9zYWwgaXMgdGhlIGZpcnN0
IG9mIGl0cyBraW5kIHRoYXQgc3VwcG9ydHMgbWlncmF0aW5nIG5lc3RlZCBkZXZpY2UuDQo+ID4g
VGhpcyBpcyB3aHkgbmV3IHBhdGNoZXMgb2YgY29uZmlnIHJlZ2lzdGVyIG9yIGFkbWluIGNvbW1h
bmQgZG9lcyBub3QgYnJlYWsNCj4gYW55dGhpbmcgZXhpc3RpbmcuDQo+IA0KPiBXb3JkaW5nIGFz
aWRlLCBuZXcgZmVhdHVyZXMgc2hvdWxkIHN1cHBvcnQgYXMgd2lkZSBhIHZhcmlldHkgb2YgY29u
ZmlncyBhcw0KPiBwb3NzaWJsZSwgaWYgc29tZSBjb25maWcgaXMgbm90IHN1cHBvcnRlZCB0aGVy
ZSBzaG91bGQgYmUgYSB2ZXJ5IGdvb2QgcmVhc29uLg0KPiANCkkgYWdyZWUsIGlmIHBvc3NpYmxl
LCB3ZSBzaG91bGQgZGVmaW5lIG9uZSBzb2x1dGlvbiB0aGF0IGNhbiB3b3JrIGZvciBuZXN0ZWQg
YW5kIG5vbi1uZXN0ZWQgY2FzZSBhdCBzYW1lIGxldmVsIG9mIHBlcmZvcm1hbmNlLg0KSSBqdXN0
IGRvbuKAmXQgdGhpbmsgdGhhdCBpdCBpcyBwb3NzaWJsZSBmb3IgUENJIGRldmljZXMuDQpBZGRp
dGlvbmFsbHksIHRoZSBlY28tc3lzdGVtIGZvciBOIGxldmVsIG5lc3RpbmcgaXMgYWxzbyBub3Qg
aW4gcGxhY2UgZm9yIHBhZ2UgdGFibGVzLCBQTUwgZXRjIHRvIG15IGtub3dsZWRnZS4NCkFuZCBJ
IG1heSBiZSB0b3RhbGx5IHdyb25nLg0KDQpbLi5dDQo+ID4gPiA+IEl0IGRvZXMgbm90IGJyZWFr
IGFueSBleGlzdGluZyBkZXBsb3ltZW50cy4NCj4gPiA+IHdlIGFyZSB0YWxraW5nIGFib3V0IG5l
c3RlZCwgZG9uJ3QgYnJlYWsgbmVzdGVkDQo+ID4gVmlydGlvIHNwZWMgZm9yIG5lc3RlZCBpcyBu
b3QgZGVmaW5lZCB5ZXQuIEhlbmNlIG5vdGhpbmcgaXMgYnJva2VuLiBQbGVhc2UgYXZvaWQNCj4g
dXNpbmcgdGhlIHZlcmIsIF9icmVha18uDQo+IA0KPiBXZWxsIHBlb3BsZSBhcmUgcGFzc2luZyB2
aXJ0aW8gZGV2aWNlcyB0aHJvdWdoIHRvIG5lc3RlZCBndWVzdHMuDQo+IElkZWFsbHkgc3VjaCBj
b25maWdzIHNob3VsZCwgc29tZWhvdywgc3VwcG9ydCBuZXN0ZWQgaHlwZXJ2aXNvcnMgbWlncmF0
aW5nDQo+IG5lc3RlZCBndWVzdHMuIA0KSSB0aGluayBuZXN0aW5nIG5lZWRzIHNvbWUga2luZCBv
ZiBtZWRpYXRpb24gYW5kIHBhc3N0aHJvdWdoIG5lZWRzIHRvIGF2b2lkIGl0Lg0KU28gYmVzdCBJ
IGNhbiB0aGluayBvZiBzb21laG93IHRoZSBhZG1pbiBjb21tYW5kcyBvZiB0aGlzIHByb3Bvc2Fs
IGlmIHRoZXkgY2FuIHdvcmsgb24gdGhlIEFRIG9mIHRoZSBtZW1iZXIgZGV2aWNlLCBpdCBtYXkg
d29yay4NCkFuZCBpZiBMaW5nc2hhbiBjYW4gaGVscCB0byBleHRlbmQgdGhlc2UgY29tbWFuZHMg
aXQgd2lsbCBiZSByZWFsbHkgbmljZS4NCg0KT3IgdGhlIHNlY29uZCBpZGVhIHlvdSBwcm9wb3Nl
ZCBvZiBkdW1teSBQRiwgY2FuIHNlYW1sZXNzbHkgd29yayB3aXRoIGFkbWluIGNvbW1hbmRzIHRv
by4NCg0KPiBDb25zaWRlcmluZyBlLmcuIHdyaXRlIHRyYWNraW5nIG5lZWRzIGRlY2VudCBwZXJm
b3JtYW5jZSBmb3INCj4gbGl2ZSBtaWdyYXRpb24gdG8gZGVzZXJ2ZSB0aGUgbmFtZSwgSSBkb3Vi
dCBwdWxsaW5nIGRhdGEgYWNyb3NzIFBDSWUgd2l0aA0KPiBzeW5jaHJvbm91cyBNTUlPIG9wZXJh
dGlvbnMgd2l0aCBubyBwaXBlbGluaW5nIHdpbGwgd29yayB3ZWxsIGVub3VnaC4NClJpZ2h0LiBF
dmVuIEludGVsIFBNTCBkb2VzIG5vdCBzdXBwb3J0IG5lc3RpbmcgYXMgcGVyIG15IGxhc3QgcmVh
ZC4NCg==

