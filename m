Return-Path: <virtio-comment-return-7647-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2C4CD691B
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 09:40:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1700A157EEA
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 09:40:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EDFC0986581
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 09:40:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D7EE098654B; Tue, 10 Oct 2023 09:40:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C7A7698655C
	for <virtio-comment@lists.oasis-open.org>; Tue, 10 Oct 2023 09:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcuOM1jhGSMUUXplQO4CBfQ/5Xea+gFI1aParPHxR/VirWrMDqgg1f9m0NXUyQQenHAIG++ELwiaKle5+/04ku6Eu1wR4rJw4bAc1lejkrYe3L6CPvnz4PZTNHyGaIHEEWG2QWdd9VOqBRFhNuIt6BGlYz/4dxZfaGsBnoEN1A1V1o+q9lJwSs59Jw9oIcld6/DEjwyfJgke/2dnYdmGn+8eY5E8TK3CfCiPqIDk95Wf4qL3I2aEJj+b9B29GowfYiWi3BRVfgqowQH0nzPfV0Lw5nSIAKpPyGnFCwzGXe9bm+OUOo5VhH6taaE+4ppNq8nMLEEM7cwGEYMGEWLfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WE2sD5amdmymJtInlYEZtpxf5COLJI1bofAENr4E/Nw=;
 b=OosLAfdCICiIu5rEjk8WwyqLJeGrcApV4ZNI+rLzNEKiwY9tCBkc5nKCCPD1sSNSQ/FQgHiJs7cmd0joHIkeDD7KxbYXOPbqsZEps8NshKb/1HV4EjDZ5aKb+kBgDVVQSSPd0xQ9mm1U11fCjib/oH3e69ar9q+loXLSDo5izFuMmkvXEck3Ns9mASTdxW11NaYLHlveR8xXeLu/F/d6NMQ2Y7APJ/tY6IpiDgkdUu1rnm8C34YSEKAzkWjXiyRu2FkJ2EnrBDFxxrkK1GB4n5GcaVB8diB3FUbEkfNTkOt4QbxVhhqopVFYZygpaMfY7XhqyiBs9aOeOrj64E9i1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4A==
Date: Tue, 10 Oct 2023 09:40:05 +0000
Message-ID:
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
In-Reply-To: <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB8696:EE_
x-ms-office365-filtering-correlation-id: 206b8ec9-a0c3-4e07-cb34-08dbc974e28f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 g3Rgf4ezbHghlAaoTnjIl+lwNGBaKURQhlBC99gvmHeCZxm6yAPNCzlmaWLMZDewcPrHT/OVJQa+pCB1PgNj+pDGebFTkm2ljPQdHHFYIiUykfNMUmBnouS3KXm/F0hFVzdoYSx7WiHxjO6db+z7DGrXpea3J1oat6Ip4xjW8otl6OW08vSeCSj3q1YGaCNzPCZqSEmJvddoq2OeVjzgBznQL9/UgRJRT5Tp/2vE4OKxqmq6CYIjU3bKacDn5DxTgYEzDbQh+MLa6qoLesmqU83SRKEy1LtxxMTgGq6Yaj6uJWBR3/BEQCgLjPpO66KyjB/RHbxDvIr03gLIyNsJqcUaNxR2Uj1rf/ZNCRXNkvLSwM0yyKaF6hZrbs4z3z/Pwqais/oUqC4nEvIQl0IfnlC1J8+bXEuOwQH/wgCvGcKa0yoD41awtcUcvtUV3+RuFT/1U/Uq9uj4QvSvX3n+WN3m1p+y01rNwLAUPBjg8hF1roB00ahlWjo6isRdleM541JrJUxxVvGrM4ONqcrSEaEI9KOqRL3xSsWYp1m0Mv5xNrrLKJtHz33zpV5HujczewnZbP+uk9SqJloRvchS3teHcUOihCSeQ0FQYSLFoGwr5CCTPstWJNTYKhus+1tv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(9686003)(53546011)(107886003)(6506007)(7696005)(478600001)(71200400001)(26005)(83380400001)(2906002)(316002)(5660300002)(66476007)(110136005)(76116006)(66446008)(66556008)(54906003)(64756008)(66946007)(8676002)(8936002)(4326008)(41300700001)(52536014)(33656002)(122000001)(38070700005)(38100700002)(55016003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3JOZEhWYXg1NklFN053ZWR4cFVuWUVBMlZRQlpvVERXKzRkNFVJQnJYY3Er?=
 =?utf-8?B?a0JtekQ1M1lqY2pVT0VBS2p1bGNCMkJ5NzVFUzA3c3lvTXNBMy9YVXlOM3NV?=
 =?utf-8?B?QytvMjYvMm5FRkIrMVpCQ3BXY3UrNmpsak0wRnlFVklJQ0liM29pN29ORi9Q?=
 =?utf-8?B?OW5xYWRPZlFoZ2g2MGtBYmM2U0todmRaSHhQdG9mWDZpWkdsR1lOWk95VXhT?=
 =?utf-8?B?OVcycS81UzM3TGRzekNiNFN0clorWC8xSFRLVFZaN1huK091eU1tZnRieWha?=
 =?utf-8?B?SlJDQmU2azZIaCt2Zk5XTmkvUXF2MkdIL1l5YWxaUHJmNWRyWXMvVjRWMnZ0?=
 =?utf-8?B?bG8yMnJ0QjI3SU02OE9aVWtHWDJLMHJMSEpaMmUwRUV3eVY5bU1XbWhEMHpT?=
 =?utf-8?B?TDN3Y2t3cWJVckVZK0wrZHBnZmpLV0pGdmxIb0NSdEsvaTRxbjJEcGUrUlZy?=
 =?utf-8?B?L25VQ2d0UGkwbVRhVE1TRzZvNzJySGh1U1Y1Ylk5bDIyd1hJOVFMUWxQcTRr?=
 =?utf-8?B?eEQ4OWt0Q1ZFNmk1Nm9YYWZ0ZjlqbkFVVENBZ2RTK3QyZDFlMS91V0NhVXdm?=
 =?utf-8?B?QS9MVW5Rb1RQaVhZUHBhNE9vTFJxWDJDQ0ZKNnNqMk1PV1dYUVpPR2tCQ3ZO?=
 =?utf-8?B?MWtPcXNCVUxZRXMzdTdiRHd0dDFpbEFIOWVPKzkvK09lY0kvTnRwb0srMUZI?=
 =?utf-8?B?Sk1BQVlVL1BrVUFVVlJoS1VnLzdKbHRwbGo0eDlEanNHUkFSNGFrSWxHQk92?=
 =?utf-8?B?VytrMlpORXk5dE9BVzVJcXhETFdOakN0VVZvUjFLNnBqWVh6NEpMcVVyemkx?=
 =?utf-8?B?RGkxTUJ5clMydDRCc1FQT1RvWVRMWHNxUjVTMGlUWDFYRkhaRlRyL2MzSm8w?=
 =?utf-8?B?aVE1SzZpT1E4SWx6UzMwTlkzQ05jUmM0NjQyeUtyc3B1a0JtM0JQK21uN2lQ?=
 =?utf-8?B?aW1FZnZBdm9lUUZ3T1JVdURZMENTTm5PNWJmKzFpb1RyclJ2OWJKVDgwMW9j?=
 =?utf-8?B?YkU4N2krTytzOXVQYXJGdzM2dXhmQ3UyWVVJdG91ZW1GWHBLL0xXbEU4ZzJv?=
 =?utf-8?B?VDMrRHB4VVZxSzA0Nm53VWZxV0hiNzlTQnhjUVB3VmJqcHlwN0V6WTRlTDZk?=
 =?utf-8?B?U0lXR0NRTXg2UHExMHp6T1hKbnBoQzl2b1VseGJDSERoZ1pRbGVzakF4ZS90?=
 =?utf-8?B?bkw4cVMzVU1qNml1MXp4c1Vwd3RxZFNKaWRZd3lqMTJqZ0VTSlIxUlVJMGRG?=
 =?utf-8?B?Zm9JcnlTRjJIUFViNkczUUdIV2FLYjVxcjl6eDBQVzQwV3B1djNjd3p2bkVs?=
 =?utf-8?B?TGpyR1VkNFJWT1lrc3czS2dPV1Nta21CSzFUL3Y2SENkaWpBVUNaUEdRVXQ0?=
 =?utf-8?B?andqRlBwQ3RJaE9MZWl2bjl5cE9ET2JYSFFkcFR4TXJBZG5CNzZMeitjOHlR?=
 =?utf-8?B?VlFxSzgrYjB0dXcwUGo1ZzNPUkhiN2c4TkRzbjEzS0c1S09XYzRuT0lHMkpX?=
 =?utf-8?B?WHNXamZ3QUhuNWJPQjRCYnB6dzM2aFFnVzF6anlvRWZDVEpCWEtvSkdXRjNT?=
 =?utf-8?B?YnNQSTZWRk8vRU91RWRRRU8wTEcycXJCYXEwaU44QjU2SlB5aEkyWURrdmNR?=
 =?utf-8?B?U0wzajFrbTVNYkpjeGw3YnNWWUdtSDZSMTE4NExNYlhpbnRYa0x4eGs0NDFp?=
 =?utf-8?B?WUxLclFlZUY2N3ptR0d3cGRZVFprb1lvSVV4djZmMXl3YlpWRldJVTRVRjhB?=
 =?utf-8?B?VnpLV3k5S3dxK2svRDhsUFlkTXZXM2NnMXJwTU95MlU1ME8rQnQwNGo0dU0x?=
 =?utf-8?B?WWxsOXNLeSs4V1dhKzlrb1FURCtUbm5ieTF0d081WWFYc0YycXJ6c2d5RVNo?=
 =?utf-8?B?UDFHZjUxQ0x0NVV5RHlHSmxWeVpwL0ZvSFVLNDMvdUpaQnNvcUdzUzRqT0Ro?=
 =?utf-8?B?YmZyb3g0cFN0c0Z1dkJEeHN2Z2Vxb1VhZWxwOTVicXY5ZXUxaG1VZmFJdDlK?=
 =?utf-8?B?djEwczRpYVFRQjduL25qWjJOSWpFaElqZ245aGFwYkNIeVU4T242SkFBQWNa?=
 =?utf-8?B?dDd6dzF5cCtIMk56cjA2M2hibkdlRG5wWGdxNjYxWmR2YXEvR3AxVVFDU0Q0?=
 =?utf-8?Q?y5Eo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 206b8ec9-a0c3-4e07-cb34-08dbc974e28f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2023 09:40:05.7503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5lGX0OZLml1rCXlhqyNoth3W1wtFet6o7YHkWLZwalWRvGgUjl/lOFAvs1LIcSpz36dzmUxdYHhjWOIwUb2Pcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8696
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

SGkgTGluZ3NoYW4sDQoNCj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVs
LmNvbT4NCj4gU2VudDogVHVlc2RheSwgT2N0b2JlciAxMCwgMjAyMyAyOjI4IFBNDQo+IA0KPiBP
biAxMC8xMC8yMDIzIDE6MjEgQU0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPg0KPiA+PiBGcm9t
OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0KPiA+PiBTZW50OiBNb25kYXks
IE9jdG9iZXIgOSwgMjAyMyA5OjUwIFBNDQo+ID4+Pj4+IE9uZSBvciBtb3JlIHBhc3N0aHJvdWdo
IFBDSSBWRiBkZXZpY2VzIGFyZSB1YmlxdWl0b3VzIGZvciB2aXJ0dWFsDQo+ID4+Pj4+IG1hY2hp
bmVzIHVzYWdlIHVzaW5nIGdlbmVyaWMga2VybmVsIGZyYW1ld29yayBzdWNoIGFzIHZmaW8gWzFd
Lg0KPiA+Pj4+IE1lbnRpb25pbmcgYSBzcGVjaWZpYyBzdWJzeXN0ZW0gaW4gYSBzcGVjaWZpYyBP
UyBtYXkgbWlzbGVhZCB0aGUNCj4gPj4+PiB1c2VyIHRvIHRoaW5rIGl0IGNhbiBvbmx5IHdvcmsg
aW4gdGhhdCBzZXR1cC4gTGV0J3Mgbm90IGRvIHRoYXQsDQo+ID4+Pj4gdmlydGlvIGlzIG5vdCBv
bmx5IHVzZWQgZm9yIExpbnV4IGFuZCBWRklPLg0KPiA+Pj4gVGhpcyBpcyBqdXN0IG9uZSBleGFt
cGxlIG9uIGhvdyB0aGVzZSBjb21tYW5kcyBhcmUgdXNlZnVsLg0KPiA+Pj4gSXQgY2FuIGJlIHVz
ZWZ1bCBpbiBtb3JlIHdheXMgdG9vIGluIG1vcmUgT1NlcyB0b28uDQo+ID4+PiBJIHdpbGwgZHJv
cCBmcm9tIHRoZSBwYXRjaCBjb21taXQgbG9nIGFuZCBrZWVwIGFzIGluZm9ybWF0aW9uDQo+ID4+
PiBwdXJwb3NlIGluDQo+ID4+IGNvdmVyIGxldHRlci4NCj4gPj4+IFdvdWxkIHRoYXQgd29yayBm
b3IgeW91Pw0KPiA+Pj4NCj4gPj4+IEkgZG9u4oCZdCBoYXZlIGFueSBzdHJvbmcgb3BpbmlvbiB0
byBrZWVwIGl0IG9yIHJlbW92ZSBpdCBhcyBtb3N0DQo+ID4+PiBzdGFrZWhvbGRlcnMNCj4gPj4g
aGFzIHRoZSBjbGVhciB2aWV3IG9mIHJlcXVpcmVtZW50cyBub3cuDQo+ID4+PiBMZXQgbWUga25v
dy4NCj4gPj4gU28gc29tZSBwZW9wbGUgdXNlIFZGcyB3aXRoIFZGSU8uIEhlbmNlIHRoZSBtb2R1
bGUgbmFtZS4gIFRoaXMNCj4gPj4gc2VudGVuY2UgYnkgaXRzZWxmIHNlZW1zIHRvIGhhdmUgemVy
byB2YWx1ZSBmb3IgdGhlIHNwZWMuIEp1c3QgZHJvcCBpdC4NCj4gPiBPay4gV2lsbCBkcm9wLg0K
PiBTbyB3aHkgbm90IGJ1aWxkIHlvdXIgYWRtaW4gdnEgbGl2ZSBtaWdyYXRpb24gb24gb3VyIGNv
bmZpZyBzcGFjZSBzb2x1dGlvbiwgZ2V0DQo+IG91dCBvZiB0aGUgdHJvdWJsZXMsIHRvIG1ha2Ug
eW91ciBsaWZlIGVhc2llcj8NCj4gDQpZb3VyIHRoaXMgcXVlc3Rpb24gaXMgY29tcGxldGVseSB1
bnJlbGF0ZWQgdG8gdGhpcyByZXBseSBvciB5b3UgbWlzdW5kZXJzdG9vZCB3aGF0IGRyb3BwaW5n
IGNvbW1pdCBsb2cgbWVhbnMuDQoNCkRyb3BwaW5nIGxpbmsgdG8gdmZpbyBkb2VzIG5vdCBkcm9w
IHRoZSByZXF1aXJlbWVudC4NCkkgYW0gb2sgdG8gZHJvcCBiZWNhdXNlIHJlcXVpcmVtZW50cyBh
cmUgY2xlYXIgb2YgcGFzc3Rocm91Z2ggb2YgbWVtYmVyIGRldmljZS4NClZmaW8gaXMgbm90IGEg
dHJvdWJsZSBhdCBhbGwuDQpBZG1pbiBjb21tYW5kIGlzIG5vdCBhIHRyb3VibGUgZWl0aGVyLg0K
DQpUaGUgcHVyZSB0ZWNobmljYWwgcmVhc29uIGlzOiBhbGwgdGhlIGZ1bmN0aW9uYWxpdGllcyBw
cm9wb3NlZCBjYW5ub3QgYmUgZG9uZSBpbiBhbnkgb3RoZXIgZXhpc3Rpbmcgd2F5Lg0KV2h5PyBG
b3IgYmVsb3cgcmVhc29ucy4NCjEuIGRldmljZSBjb250ZXh0LCBhbmQgd3JpdGUgcmVjb3JkcyAo
YWthIGRpcnR5IHBhZ2UgYWRkcmVzc2VzKSBpcyBodWdlIHdoaWNoIGNhbm5vdCBiZSBzaGFyZWQg
dXNpbmcgY29uZmlnIHJlZ2lzdGVycyBhdCBzY2FsZSBvZiA0MDAwIG1lbWJlciBkZXZpY2VzDQoy
LiBzaGFyaW5nIHN1Y2ggbGFyZ2UgY29udGV4dCBhbmQgd3JpdGUgYWRkcmVzc2VzIGluIHBhcmFs
bGVsIGZvciBtdWx0aXBsZSBkZXZpY2VzIGNhbm5vdCBiZSBkb25lIHVzaW5nIHNpbmdsZSByZWdp
c3RlciBmaWxlDQozLiBUaGVzZSByZWdpc3RlcnMgY2Fubm90IGJlIHJlc2lkaW5nIGluIHRoZSBW
RiBiZWNhdXNlIFZGIGNhbiB1bmRlcmdvIEZMUiwgYW5kIGRldmljZSByZXNldCB3aGljaCBtdXN0
IGNsZWFyIHRoZXNlIHJlZ2lzdGVycw0KNC4gV2hlbiBWRiBkb2VzIHRoZSBETUEsIGFsbCBkbWEg
b2NjdXJzIGluIHRoZSBndWVzdCBhZGRyZXNzIHNwYWNlLCBub3QgaW4gaHlwZXJ2aXNvciBzcGFj
ZTsgYW55IGZsciBhbmQgZGV2aWNlIHJlc2V0IG11c3Qgc3RvcCBzdWNoIGRtYS4NCkFuZCBkZXZp
Y2UgcmVzZXQgYW5kIGZsciBhcmUgY29udHJvbGxlZCBieSB0aGUgZ3Vlc3QgKG5vdCBtZWRpYXRl
ZCBieSBoeXBlcnZpc29yKS4NCjUuIEFueSBQQVNJRCB0byBzZXBhcmF0ZSBvdXQgYWRtaW4gdnEg
b24gdGhlIFZGIGRvZXMgbm90IHdvcmsgZm9yIHR3byByZWFzb25zLg0KUl8xOiBkZXZpY2UgZmxy
IGFuZCBkZXZpY2UgcmVzZXQgbXVzdCBzdG9wIGFsbCB0aGUgZG1hcy4NClJfMjogUEFTSUQgYnkg
bW9zdCBsZWFkaW5nIHZlbmRvcnMgaXMgc3RpbGwgbm90IG1hdHVyZSBlbm91Z2gNClJfMzogT25l
IGFsc28gbmVlZHMgdG8gZG8gaW52ZXJzaW9uIHRvIG5vdCBleHBvc2UgUEFTSUQgY2FwYWJpbGl0
eSBvZiB0aGUgbWVtYmVyIFBDSSBkZXZpY2UgdG8gbm90IGV4cG9zZSANCg0KPiBBY3R1YWxseSB5
b3UgZG9uJ3Qgc2VlIGFueSB0ZWNobmljYWwgcHJvYmxlbXMgaW4gb3VyIGNvbmZpZyBzcGFjZSBw
cm9wb3NhbCwNCj4gcmlnaHQ/DQpJbiBjb25maWcgcmVnaXN0ZXJzIG1ldGhvZCwgZm9yIHBhc3N0
aHJvdWdoIEkgY2xlYXJseSBzZWUgdGhlIHRlY2huaWNhbCBwcm9ibGVtcyAoZnVuY3Rpb25hbCBh
bmQgc2NhbGUpIGxpc3RlZCBhYm92ZS4NCkR1ZSB0byB3aGljaCBjb25maWcgcmVnaXN0ZXJzIGNh
bm5vdCByZXNpZGUgb24gdGhlIFZGIGFuZCBjYW5ub3Qgc2NhbGUgZWl0aGVyLg0K

