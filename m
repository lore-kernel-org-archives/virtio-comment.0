Return-Path: <virtio-comment-return-7777-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484C1CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 04:05:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9816F88E0A
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 04:05:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 791DD98688A
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 04:05:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6271F986887; Wed, 18 Oct 2023 04:05:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 274EF986888
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 04:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FI1rimk1dkLs7xt2iiRw/FQjU5wc5hCRaoJ6Hy6dugQk6EkpfwLc3WhL0VebfoIG3SpZ9ztb9B+lg/OIrzf77WW4bdC/UiI+7dDORDPkZAVdKw0RBvirVJ/IhONcNHZdg0tWmT8p/zOM/KmHwA21OnZpmc9vEuYEUlxhXy6luIarno9VpKv72wNTDfGjdmtudedChLFqU2rW9dz3g2u0TmQDMSnhsJHyzhoMMl71MG6aFT5gwkCZc+GStNaF0aJtx29m4buJiaDCmVm68+qDVJEVmg2pY2XUECmzcZFrAzpHIuYgSDLNp6lzAKP/N5vg07kWB3ZDn98DfS8SdTaMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyBSjfrbx0Tir6MyQuy0PsynpXxPjB8HWvZ5XaQ5m/4=;
 b=G0ECQTuxFGZWT1mUvV5q8VtecCMiF3oHfm4dvzx0zVe3C/E7xyo1Cvn9bDh9vEM+2OJHt/yezr81L7F6hR1ADHfvuizu6+1nlIYjqcRVYfHsZy+ZxuU1buObsUaGwpJz8Iz9Ag5ns2fOASQg/lWMU7KN0HsVyt3S/So5/a0Yh9AuoaIN8aEBC4MjAmWHZy66WW0TNyGL+nIoQ/cklMS8tZF1r6FZcQERXy99t97fnCaI32z2LhZqOlOUTX4nkKgfg8niEF2w49o8EcRBpdrxkvfNVQVV0IiogEIq/y8qrCDxVt6ElIdEjomVZKdGHjVGVgynzCa3H7JZmnff4+y8IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
CC: "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "jasowang@redhat.com" <jasowang@redhat.com>
Thread-Topic: [virtio-comment] [PATCH v2 0/8] Introduce device migration
 support commands
Thread-Index: AQHaATWGrPsaHC6gFE6bswcyyPm03bBOyjcAgAAjN/A=
Date: Wed, 18 Oct 2023 04:04:15 +0000
Message-ID:
 <PH0PR12MB54818B90249B51BC2803BB9DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231017200645.779222-1-parav@nvidia.com>
 <216b7799-9449-4271-b50f-1faead34bd9d@intel.com>
In-Reply-To: <216b7799-9449-4271-b50f-1faead34bd9d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5948:EE_
x-ms-office365-filtering-correlation-id: 3edb0da4-1482-4ffd-b002-08dbcf8f4b4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KMSz/UCtOnbbOZutL6v6P5jNwNma7b1xs5bVHWrDCtZhK2ACzFyqb7LMTF86cpAlobFqwI6OcIkTExOVjQHgT69abqYQ1qK04TdN6tuJXEh/v+CksE49JSlGYItIBQNFlh9lfMG0bfoHkZsRPOrW1Go33mvnN24D3VNwMeT4z75RrFsujUHG8wbUt6q64nPStUeTZcS29lraLDX9XMzkN0pdmi6qceLF990qdnJ1tmm3FXksOZQvTtgpFy9HdtzRPfRNUqqtdtlYhmuusn9IPyR/ZSg3qgAf4BXtBBBzZf6YxzP57yYJWot1QQlIz2yAn9FQaCWd0ABjHPua5d3cwJZE6DUnmIVQK4yJXSWvEKJVrqlKLhA8yjj5lxdcqP7jvnyY6IgwdcilNYEQ5wkyuXKv1nNiTHJ7mkM7NFtgZsJgjEo+JLQ4lqztTEliaAXjKU+Qa8OjoMF0kS0rBTdrPdKW30bJ7rP8LNdwMpQvzpRbuyWP63uZ6iVitoicV33botNZs961DiVYe9y3Jny2EzbecZOc61IW3x7oIls46jNfkHPNfKCVMh2rrqrKOeysur0ALICV2pKgH0J36+M+DvBVBJsNMheYyKXbsy6Loen4On09BEj8FsxuTZF+IgVQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(66556008)(83380400001)(26005)(66476007)(66946007)(66446008)(54906003)(478600001)(71200400001)(110136005)(76116006)(6506007)(41300700001)(5660300002)(9686003)(316002)(7696005)(4326008)(2906002)(8676002)(52536014)(38070700005)(8936002)(33656002)(122000001)(64756008)(38100700002)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?STV1ekxkU2I3R1lhUWpOWUE5NjIvT3M2N0ZCMXN0Q3VURHZvLzlaVEV6TWg2?=
 =?utf-8?B?TmdJWjdWb1BxeTd1eDF2M0FDQy85aGhQeHl3OVhjK2pkU1p0L2NlUElWTHRn?=
 =?utf-8?B?RGc2cFVGa3FFSFo2MjJOSUVNQ29BWDZNb2RsMUw1RVcyV3NhcUN6LzBEUnZX?=
 =?utf-8?B?WjkrbGRFZXFDdDlDckZwbkpDSTNaQU4rRGRJWDk3K2M0SHd5WlN1MzhrdWFa?=
 =?utf-8?B?NitvbUNCMlByekZIOTJ4dTFISGNoV3cwU3dhZFVsLzlyb2hwcVVWRE5GOUc2?=
 =?utf-8?B?VFB0S0h3aTFHWEs4M3A2czVHYVpUNG54bXJBRzA5ZEJoNDFqZ3loVEtpM2FO?=
 =?utf-8?B?aFh0Ukl0bnNTdy9POTR2L3lxU3dMSFUwMXdwMnVaS2tzZDY4RVY3OGVvbTlj?=
 =?utf-8?B?a05Gakl0c1JhWkEzcCtmZGc0RURURVViUGZhY0w1UmZNcEIxcXVLeUNPaTc5?=
 =?utf-8?B?eE9vN3dxcEpxcjhGTVZnWklrSkZQalpGNnBpR1JuNUNZazdLYlhUaHZmamtC?=
 =?utf-8?B?eWw1U0NFU1ZySm1KdTQ2SUxDU3Q3c1dVZC81dUxkWTMzOXhZVWIrTFhjZWZs?=
 =?utf-8?B?b3VqWnd0Um5NaExtUm9DVDh3K01ZcXVBOU5TbURReWI1ZkxaM3FaMXVLT2dk?=
 =?utf-8?B?N3lXbUlQZWJ0dElLYmovM256bGtxbzAxS1N3dzZFaHNiSlhtNVlRcC9NWjlW?=
 =?utf-8?B?SWdxQy9QN3ZKREl0YndSOXlnUDlTYlFKN1k0amVZQm9kcU9FakF1RXZoSUJX?=
 =?utf-8?B?Q2w2MW0vcGpLTkNLRWxndEp2L2lLb0NMeURNUnIyUVQ3eWZtMmxDa3l5eXc4?=
 =?utf-8?B?TTRYZHRxRU51WkRBWkI5NXFFN2F6Sm12K3V4TXRqQ21LSDdKbEZqcVMwVGNB?=
 =?utf-8?B?VnpxQUxXUHgxNCtKczZSaHhHZWU3Slg4RXlXNzdnd01ZMkhKZWt4SUdXMWpI?=
 =?utf-8?B?Z0ZVWW9SOXpkV05LMFZMRjdiQUVkd0xIeE00MVNLUG9kL1A0dnUxb2F4MXNs?=
 =?utf-8?B?Z0liS01Lbjh6NFJOdEdVUHp1a040OCsyWm5MY1hqbUlZbllqbExKMEYrRmw5?=
 =?utf-8?B?N0s5T29JcERLT3haelgwR09VdkVhR2FWMGhHektqVVNWcHFkUWpjVC9XRDdu?=
 =?utf-8?B?YTlON1cweUFUWG5BZlZKK2FBZGY0RlJxdjRYQWh1TXRscnROSUFkNDE3K2U4?=
 =?utf-8?B?K0g2cjBZT3RUQUlXTU5zdEszT1Y4bnVReFBFN3c5SDhmdk1tZ1J1WUZralFV?=
 =?utf-8?B?NW5DRFg4ZTl1RXU1cVRnempRZmNQNTcxbGxJSFpRc0UyYmdWeVYyWjltZDc1?=
 =?utf-8?B?L0dNenBmbm5EUWQ1bkJDZHVlc3dHUHVzQkhpdDRVdFA1cnM1NHVCRW15bEpM?=
 =?utf-8?B?ejBNakJ4NHQwdVQySkYzS0JkUURuOVMrbXBZRVBGS3RuRzc5TFd0RXVFYXZO?=
 =?utf-8?B?Ui9KZDQ4c0dXd1J2OFpodHZMdEtRY0MzWTVlWXlwK3NwalVGUVlNeTlCZnJt?=
 =?utf-8?B?dVJYbTVXUEhCQi83ZXQ2dEhIMDZablpzV1o4cmZuY0JWZVFTZ2pqcmtTclJi?=
 =?utf-8?B?ZkpxRk8xNXJQdFRYSTBKOGozRXpUbTNZbFdSOGdHN1g1SmlURlNyMEVxZTVp?=
 =?utf-8?B?UWxONFExd2xkK1VqbTdTeE0xbWpoTCsrMUlZd2J4Y2hQWTdxbk14RHBzYXFv?=
 =?utf-8?B?b0Q3d2lCTWVUbC9sdVVlM05KbEo2eXEzeEhtVmRicGRaQUtGa2xianpkUVo0?=
 =?utf-8?B?U05KTHJGSTNJQ0lMSWw4UzdQdGdJQ3hEVDJGYkN3cE02d2tMS0Q1Si9rc0Ny?=
 =?utf-8?B?d08zcnZYaHdwZ0ZZMVMveFNnaHYxVnozdzlIWEVvMjVLaEJQOU1sUVN3SXpE?=
 =?utf-8?B?NVVGZXZaelJuNXpKQVpoOHVwQVpLU1NnSVBKOUhvUUFxdGhOMTZ4ajhQRHN0?=
 =?utf-8?B?QVRpWkVPTUJ0R1g5Qy9LTTAxbmlRUEtXb1pRMjhyR1JQYm81UmtBdzMxMFZG?=
 =?utf-8?B?VTE5d3FoRlJNNUlacVhJZkN4VXRyZ2ZoVHZDMGdGUk1kRWdqVjk5MEZGZkxI?=
 =?utf-8?B?ZzhGaXprQnMxc2g1ZXdveXdjY3FiekdNWWRWV2JsZnVLWkxEc2lqOE9XVTRo?=
 =?utf-8?Q?/qJI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3edb0da4-1482-4ffd-b002-08dbcf8f4b4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 04:04:15.3183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jZYg4/QvO+npRMOaVyVoDEWuo5pS7RCL1ziwUkSLZzRndSPqsUYJLUGjZTkr2w0b21dron+uWjeeSIl2ZsCJxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5948
Subject: RE: [virtio-comment] [PATCH v2 0/8] Introduce device migration
 support commands

DQoNCj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gU2Vu
dDogV2VkbmVzZGF5LCBPY3RvYmVyIDE4LCAyMDIzIDc6MjcgQU0NCj4gDQo+ID4gQ2hhbmdlbG9n
Og0KPiA+ID09PT09PT09PT0NCj4gPiB2MS0+djI6DQo+ID4gLSBBZGRyZXNzZWQgY29tbWVudHMg
ZnJvbSBNaWNoYWVsIGFuZCBKYXNvbg0KPiA+IC0gcmVwbGFjZWQgaW92YSB0byBwYWdlL3BoeXNp
Y2FsIGFkZHJlc3MgcmFuZ2UgaW4gd3JpdGUgcmVjb3JkaW5nDQo+ID4gY29tbWFuZHMNCj4gPiAt
IHNldmVyYWwgZGV2aWNlIHNwZWNpZmljIHJlcXVpcmVtZW50cyBhZGRlZCB0byBjbGFyaWZ5LCBp
bnRlcmFjdGlvbiBvZg0KPiA+ICAgIGRldmljZSByZXNldCwgRkxSLCBQQ0kgUE0gYW5kIGFkbWlu
IGNvbW1hbmRzDQo+ID4gLSBhZGRlZCBkZXZpY2UgY29udGV4dCBmaWVsZHMgcXVlcnkgY29tbWFu
ZCB0byBsZWFybiBjb21wYXRpYmlsaXR5DQo+ID4gLSBzcGxpdCBkZXZpY2UgY29udGV4dCBmaWVs
ZCB0eXBlIHJhbmdlIGludG8gZ2VuZXJpYyBhbmQgZGV2aWNlDQo+ID4gc3BlY2lmaWMNCj4gPiAt
IGFkZGVkIGRldmljZSBjb250ZXh0IGV4dGVuc2lvbiBzZWN0aW9uIHRvIG1haW50YWluIGJhY2t3
YXJkIGFuZCBmdXR1cmUNCj4gPiAgICBjb21wYXRpYmlsaXR5DQo+ID4gLSBzZXZlcmFsIHJld29y
ZGluZyBpbiB0aGVvcnkgb2Ygb3BlcmF0aW9uDQo+ID4gLSBhZGRlZCByZXF1aXJlbWVudHMgdG8g
Y292ZXIgY29uZmlnIHNwYWNlIHJlYWQvd3JpdGUgaW50ZXJhY3Rpb24gd2l0aA0KPiA+ICAgIGRl
dmljZSBjb250ZXh0IGNvbW1hbmRzDQo+ID4gLSBhZGRlZCBhc3N1bXB0aW9uIGFib3V0IHBjaSBj
b25maWcgc3BhY2UgYW5kIG1zaXggdGFibGUgbm90IHByZXNlbnQgaW4NCj4gPiAgICBkZXZpY2Ug
Y29udGV4dCwgd2hpY2ggY2FuIGJlIGFkZGVkIHdoZW4gaHlwZXJ2aXNvciBuZWVkIHRoZW0NCg0K
PiBXZSBhbHNvIGRpZG4ndCBzZWUgdGhlc2UgaXNzdWVzIGFkZHJlc3NlZCBpbiB5b3VyIFYyLiBT
bywgd2hhdCdzIHRoZSBwdXJwb3NlIG9mDQo+IHJlbGVhc2luZyB0aGlzIFYyPw0KVGhlIHB1cnBv
c2UgdG8gY292ZXIgY29tbWVudHMgYW5kIGltcHJvdmVtZW50cyBmcm9tIE1pY2hhZWwgYW5kIEph
c29uIGFzIGxpc3RlZCBhYm92ZS4NCk9ubHkgcXVlc3Rpb25zIGZyb20gMTAvMTYgYW5kIDEwLzE3
IGFyZSB5ZXQgdG8gY292ZXIuDQpJIHdpbGwgYW5zd2VyIHRoZW0gdGhpcyB3ZWVrLg0K

