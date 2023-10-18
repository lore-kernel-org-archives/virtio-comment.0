Return-Path: <virtio-comment-return-7793-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE13CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:41:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DFF3E874CB
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:41:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B0D12986896
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:41:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 97B0A98688C; Wed, 18 Oct 2023 06:41:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 86B7298688D
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 06:41:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/LShHryo0QJjzghygvPADAeICSr/dymP8vx6brzqU17pIWv/dAtQjSIVvJqadwtJe1vZxsStxGlRZInH1Dg+DKWDFzm/EZiya3VjxcQs5iqsKzXXwkj2iokA76VoteKBfiO6id4/RazcnPDS5fhOxsay6MKD4hjLefwzKNrY+AcGD053UCSmf7iaDPM59itEWIbBifp6NTU2bFrJAuLXfsmQNLk8spJUON0FszIPmskIPybRAxsOIQJqWJVf76r9fY/XmTYgmKYAQMhEt1V3ytnIvhkKUMiAwetpWRCd7+VBDUHmMlxuBzMVUN49WG5lGANhizJHJGpuE3FIfl3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlpnX/cAJVNaniLIMnPMvTHy1yRj034N5ukziUxMq4U=;
 b=mNuIHHNbvz/ceHioJCDabVVh5CIFfrfQX8I8jzP68tm00J9X5/i2njuLNGfcuwUG+Xgylgb6iwT4jlMlxNw0J69aEGIt9a9XRRuQ0T69N2JMFBQVirhaysBIBNzB36kGkTVNZJtmFhxhQEY/+BmbOCPVvgxqvwvXzRPkp8fKr4EVwRaiUuhBZXx5SzV60uZN2LaUTdyUXSTZYDuwShibHlVcyZJpPiRz1Ek9C+I0M/aPxttWsXJ0lIs5vPGtXXFkR+oTMntYOBtwAQPl/Ss7itx8xIMWnh5mPdT4VdNFk0l5/SK9QrCMcXa799NwMbxk7ZBmO294drkSPzexcYwTSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKA=
Date: Wed, 18 Oct 2023 06:41:53 +0000
Message-ID:
 <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
 <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
 <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
 <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6fc4af28-67d9-781b-a243-a6c2ebf0244c@intel.com>
 <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <PH0PR12MB548139B50AD2D1B86AC9A127DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f7083379-e76c-42f4-8355-ea4ae28eb52c@intel.com>
 <PH0PR12MB548119E2C2EDB212B56E9FACDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
In-Reply-To: <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL0PR12MB4915:EE_
x-ms-office365-filtering-correlation-id: 57f21437-a63e-46b2-38ec-08dbcfa550eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jhhsT13VgSn2q00c9CLY2AZyg4NeWWmc5tJt2wVoKjdeGipfeK4pwjSTA3VMJCQ71qVkq9h4ZGGzXX0SW5wT23MyoNHIf412SWo9H1ecC6ANl4gwfdC69lFeQ4wrporfXapp9sMZrKWuz+1+ASpaHnMgeTfeM/AwEI+xqULate+k6Yt1lf2SmgxSHyfxkEauaT1fJ+vQGR/MVOCqh93t13U4pbz8KmVZaWmnbz4OggLATQm43DNp8ZLgsiXC8/Pne37idD8zx7/YJaKXX99k4/0fqeDXcciftPErVDAR6EPwYOvqWYum+m8xZdSVK9XZw39AUPImsXsLPWwgbSDa9qKnE3W0UfijTYXTwGsLbLO2HSOPPeLY69+jQ4LvYaYY513bg6kU8QJ/F0N1GqhV6CAMtfhomu8gPSEl1tLizBatWIf/HFIlddaAdkEm40OGm/GijVPo0FWAuwxjJ8ZicX2vEHJ22J2qcFU1zP0vVBWdPt5subi2USwvtPj3gdRUtDnuVBLZwrztTs+0v7go7Uf9oWcrSBwvVVaZcLEBXp1hTjAeqYp1RWGHGRmn8exlk2SZaq2CNMXcazXMQ55fk0OZBZomPYq6BiXB5/prwblURTybYlDsgQor7FT7rh1lTnqmnDHpSvbr17kNQn7Zf1nhLKUC4bshZZ4/HDLj53I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(2906002)(9686003)(7696005)(4326008)(5660300002)(8676002)(8936002)(52536014)(41300700001)(316002)(54906003)(64756008)(76116006)(66446008)(66556008)(66476007)(110136005)(66946007)(966005)(478600001)(55016003)(6506007)(38100700002)(53546011)(107886003)(33656002)(83380400001)(86362001)(122000001)(26005)(38070700005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0FmWVBIcUlSTnZTQU4zV1A1VG9GNlJ3amMweThETHpFKzdBOUFUS0lZbDFv?=
 =?utf-8?B?ckZSLzAzdXROTW9XU2VUOVA5M3B0ajVkMUU4QkV3S2FwZkkyOHYzU1VVcml2?=
 =?utf-8?B?c0dXWlBkcjkrZU8zc1pjWDVXUGtKdXMrNjhYc3MzY2Y1enlxNzBlQWhSR3U0?=
 =?utf-8?B?dm9QWHhjUWMyOVRqWjhERjI3Z0kxVEFZc1RXODRaR2hRYjczaEhadWU4ajJ2?=
 =?utf-8?B?UUhSclRVT284Z2pOZ1NtTjU0R2dPNStXTnhsRnhIZlNSVHAyNnNpb1FiMmFs?=
 =?utf-8?B?dFcvNW5BcHc4QVlWYk81RlZYaXF6blNBTnJzQmVVVTFPOGRRM1VQMjNxVENk?=
 =?utf-8?B?dXhqcDUxbHExUy9jZnRwMzdnU1pNZUFXZ01UVTZtS0VKc1JFUUtKRDVMNndz?=
 =?utf-8?B?eThtWEpQbCtMMTREMkpzVlZJRmduMVk3d3V3UTV5Y1R5MGdqZ0t0cTVzNlIy?=
 =?utf-8?B?ZmJwaXVSRHFYMWFFRVJDOXpZU0Uydm1WQnFodm4yWEF4Ym9xRFZteFdUYmlO?=
 =?utf-8?B?QzQrRnRPZi9EQkVvalRGNjVKTVRSRksybzl5WW9tZGdYSlMvem5rT29jVTJx?=
 =?utf-8?B?Z2pzQVUrZFRncWF4VUNoeXd0cnhFWWlsNnIvMHJvS25ZMHAxZ3lxeXVSMUhq?=
 =?utf-8?B?RWpDbTVjcGFudW94L0RIU0ZnejB2Q1NvSTF3VkIwNUwybWRHVDRxVVJ2d2hy?=
 =?utf-8?B?clgwZ3Q3bnpreHkrWTZyOFNOVlZwU3hONDh0T2xQL0ZyMzV4RWhsUFB6OVRG?=
 =?utf-8?B?TjcrM0xpcW1taVBNV3BqNlQreGxUZE90VzRxYlpTV2xnamNyUFhjNnRHTXF1?=
 =?utf-8?B?VXhNVUZKTXR3cE5tWW1idE9DUVdqdTFWRDU2TzE4QUhVUFordmtTNlhKd2l6?=
 =?utf-8?B?cDUxZlNGNG05ZkRWUWNKVFpBUkEvc1U3ZkxwU041OWVUc0p4S3E2TlpCbXkz?=
 =?utf-8?B?dzNCSkhPRENXeEhxb0tTMGgwajk1ZzNvOFhPOWhiM0tueUxaTno3RUZWcmNP?=
 =?utf-8?B?Q0UvdzBTM2JaeTUrN3BXbDZUOWxmV1g0VnVtc2Yyck10RzNqWVNzVlNCcjdw?=
 =?utf-8?B?a2NlTzZBeCtUa25lVTVqcGJJWGJiTWYxWGlHNTRkaHU4SVdBajVHWWtndG9S?=
 =?utf-8?B?aDBtazI2akNNeHYza3ZrcksrRkpFMjFNUlhWWHZmaTBLdCtTU2dYOG9vN05N?=
 =?utf-8?B?RDEzVEhVbWtMYURHdHhISjBEa2ZJMlBpSW5ScUVoM2dnMk9CUzI3UlpyeDZK?=
 =?utf-8?B?aGhNa3FPQitSZzhPSlM3OWNiZERpRkFIT2RrNXp5c1BBZTVhQUdsbGF3dC9R?=
 =?utf-8?B?Q2ltbkIybnZTeUdCcmFqaExsV3RpOFNUR01tdjQ4dVhZWDgvWCtuT20vN1V0?=
 =?utf-8?B?Njlzb0liTWxnNVQxanF4U25LR080ZGI5L2VVSjZjTVIzcXVpWlhrSGNoNEll?=
 =?utf-8?B?UklmRlUySm5KcnZXQWxuVWFvaVJaZUFrZlpKRlFqYVpFd2h1ek50ckFhRnRp?=
 =?utf-8?B?S1NuVlUzL1J4Sms1K21HU3J3UnNBd2Z3WXpIdjhpYUowTkZhMGdsbzNLVmxq?=
 =?utf-8?B?SVlyU3BaMy9HZEhiaWVNZyszTEhkLzlVbHpzd3ZIQ1FUZS81bVdpSVdJTktK?=
 =?utf-8?B?VVhFQjF2WmpEWDI1cmJ5TzViTzVKTExrelVLTnBqWmFncGllQmRraEpTREhC?=
 =?utf-8?B?b0thUkhRYTEyQzRzTnFEYUlGcFJjZG5jMGloZnN1NmN3WnFtbWlWSjhlSUZG?=
 =?utf-8?B?N3ZEK0h1Ny9LNy92YzlWZnM0ZUt1UEdEUkhlOWE1K0xZcEJld1pjU3FVUENJ?=
 =?utf-8?B?TnRUU1JhQnVHbHFCNitZTW5adyt4VEFERTNBY2tuZndkQmRoU2hjcmttd0lN?=
 =?utf-8?B?eWhoMTBSQzdxV1RKUW05U0FRRmVyNkNNWlQ4ZDNZRWhjd0NoU0ZuMVZhS0lR?=
 =?utf-8?B?b3pSOUlKcVMxYUhqNnA4ank0dmJrTFg5Q2Q2VHV5Skpkam1XbGozQlQrYXds?=
 =?utf-8?B?bVRoVXlWNEpRZit2UmhodTRKbTZFS28vN2JIWTNyTkR0aW14czA5VHFoWUdl?=
 =?utf-8?B?cWFSTWNKSmx6UHZCMUtjaFVaTUtYcElFdkhtRXJFbXk1TndQdXFEQ0R5OFNJ?=
 =?utf-8?Q?8yIs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f21437-a63e-46b2-38ec-08dbcfa550eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 06:41:53.6663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ikj7BxfJSXQwnH8+vNoVL8Jrn6ap0sNI1gAwcKQT1ooVsA69MI0LcKGAjmk6fLbe4iZ/54nLChSHfoEVbLIFnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4915
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQoNCj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gU2Vu
dDogV2VkbmVzZGF5LCBPY3RvYmVyIDE4LCAyMDIzIDEyOjA2IFBNDQo+IA0KPiBPbiAxMC8xOC8y
MDIzIDE6MDIgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPg0KPiA+PiBGcm9tOiB2aXJ0aW8t
Y29tbWVudEBsaXN0cy5vYXNpcy1vcGVuLm9yZw0KPiA+PiA8dmlydGlvLWNvbW1lbnRAbGlzdHMu
b2FzaXMtIG9wZW4ub3JnPiBPbiBCZWhhbGYgT2YgWmh1LCBMaW5nc2hhbg0KPiA+PiBTZW50OiBN
b25kYXksIE9jdG9iZXIgMTYsIDIwMjMgMzoxOCBQTQ0KPiA+Pg0KPiA+PiBPbiAxMC8xMy8yMDIz
IDc6NTQgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+PiBGcm9tOiBaaHUsIExpbmdzaGFu
IDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPg0KPiA+Pj4+IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAx
MywgMjAyMyAzOjE0IFBNDQo+ID4+Pj4+Pj4+IEhvdyBkbyB5b3UgdHJhbnNmZXIgdGhlIG93bmVy
c2hpcD8NCj4gPj4+Pj4+PiBBbiBhZGRpdGlvbmFsIG93bmVyc2hpcCBkZWxldGdhdGlvbiBieSBh
IG5ldyBhZG1pbiBjb21tYW5kLg0KPiA+Pj4+Pj4gaWYgeW91IHRoaW5rIHRoaXMgY2FuIHdvcmss
IGRvIHlvdSB3YW50IHRvIGNvb2sgYSBwYXRjaCB0bw0KPiA+Pj4+Pj4gaW1wbGVtZW50IHRoaXMg
YmVmb3JlIHlvdSBzdWJtaXR0aW5nIHRoaXMgbGl2ZSBtaWdyYXRpb24gc2VyaWVzPw0KPiA+Pj4+
PiBJIGFuc3dlcmVkIHRoaXMgYWxyZWFkeSBhYm92ZS4NCj4gPj4+PiB0YWxrIGlzIGNoZWFwLCBz
aG93IG1lIHlvdXIgcGF0Y2gNCj4gPj4+IEh1aC4gV2UgcHJlc2VudGVkIHRoZSBpbmZyYXN0cnVj
dHVyZSB0aGF0IG1pZ3JhdGVzLCAzMCsgZGV2aWNlDQo+ID4+PiB0eXBlcywNCj4gPj4gY292ZXJp
bmcgZGV2aWNlIGNvbnRleHQgaWRlYXMgZnJvbSBPcmFjbGUuDQo+ID4+PiBDb3ZlcmluZyBQMlAs
IHN1cHBvcnRpbmcgZGV2aWNlX3Jlc2V0LCBGTFIsIGRpcnR5IHBhZ2UgdHJhY2tpbmcuDQo+ID4+
Pg0KPiA+Pj4gUGxlYXNlIGhhdmUgc29tZSByZXNwZWN0IGZvciBvdGhlciBtZW1iZXJzIHdobyBj
b3ZlcmVkIG1vcmUgZ3JvdW5kDQo+ID4+PiB0aGFuDQo+ID4+IHlvdXIgc2VyaWVzLg0KPiA+Pj4g
V2hhdCBtb3JlPyBBcHBseSB0aGUgc2FtZSBuZXN0ZWQgY29uY2VwdCBvbiB0aGUgbWVtYmVyIGRl
dmljZSBhcw0KPiA+PiBNaWNoYWVsIHN1Z2dlc3RlZCwgaXQgaXMgbmVzdGVkIHZpcnR1YWxpemF0
aW9uIG1haW50YWluIGV4YWN0IHNhbWUgc2VtYW50aWNzLg0KPiA+Pj4gU28gYSBWRiBpcyBtYXBw
ZWQgYXMgUEYgdG8gdGhlIEwxIGd1ZXN0Lg0KPiA+Pj4gTDEgZ3Vlc3QgY2FuIGVuYWJsZSBTUi1J
T1Ygb24gaXQsIGFuZCBtYXAgb25lIFZGIHRvIEwyIGd1ZXN0Lg0KPiA+Pj4NCj4gPj4+IFRoaXMg
bmVzdGVkIHdvcmsgY2FuIGJlIGV4dGVuZGVkIGluIGZ1dHVyZSwgb25jZSBmaXJzdCBsZXZlbCBu
ZXN0aW5nDQo+ID4+PiBpcw0KPiA+PiBjb3ZlcmVkLg0KPiA+Pj4+IEFuc3dlciBhbGwgcXVlc3Rp
b25zIGFib3ZlLCBpZiB5b3UgdGhpbmsgYSBtYW5hZ2VtZW50IFZGIGNhbiB3b3JrLA0KPiA+Pj4+
IHBsZWFzZSBzaG93IG1lIHlvdXIgcGF0Y2guDQo+ID4+PiBUaGUgaWRlYSBldm9sdmVzIGZyb20g
dGVjaG5pY2FsIGRlYmF0ZSB0aGVuIHBvaW50aW5nIGZpbmdlcnMgbGlrZQ0KPiA+Pj4geW91cg0K
PiA+PiBjb21tZW50Lg0KPiA+Pj4gSSB0aGluayBhIHBvc2l0aXZlIGRpc2N1c3Npb24gd2l0aCBN
aWNoYWVsIGFuZCBhIHBvaW50ZXIgdG8gdGhlDQo+ID4+PiBwYXBlciBmcm9tDQo+ID4+IEphc29u
IGdhdmUgYSBnb29kIGRpcmVjdGlvbiBvZiBkb2luZyBfcmlnaHRfIG5lc3RpbmcgdGhhdCBmb2xs
b3dzIHR3bw0KPiBwcmluY2lwbGVzLg0KPiA+Pj4gYS4gZWZmaWNpZW5jeSBwcm9wZXJ0eQ0KPiA+
Pj4gYi4gZXF1aXZhbGVuY2UgcHJvcGVydHkNCj4gPj4+DQo+ID4+PiAoYy4gcmVzb3VyY2UgY29u
dHJvbCBpcyBuYXR1cmFsIGFscmVhZHkpDQo+ID4+Pg0KPiA+Pj4gQm90aCBhcHBseSBhdCBWTU0g
YW5kIGF0IFZNIGxldmVsIGVuYWJsaW5nIHJlY3Vyc2l2ZSB2aXJ0dWFsaXphdGlvbiwNCj4gPj4+
IGJ5DQo+ID4+IGhhdmluZyBWRiB0aGF0IGNhbiBhY3QgYXMgUEYgaW5zaWRlIHRoZSBndWVzdC4N
Cj4gPj4+IFsxXSBodHRwczovL2RsLmFjbS5vcmcvZG9pL3BkZi8xMC4xMTQ1LzM2MTAxMS4zNjEw
NzMNCj4gPj4gUGxlYXNlIGp1c3Qgc2hvdyBtZSB5b3VyIHBhdGNoIHJlc29sdmluZyB0aGVzZSBv
cGVucywgaG93IGFib3V0IHN0YXJ0DQo+ID4+IGZyb20gZGVmaW5pbmcgdmlyaXRvLWZzIGRldmlj
ZSBjb250ZXh0IGFuZCB5b3VyIG1hbmFnZW1lbnQgVkY/DQo+ID4gQXMgYW5zd2VyZWQsIGRldmlj
ZSBjb250ZXh0IGluZnJhc3RydWN0dXJlIGlzIGRvbmUsIHBlciBkZXZpY2Ugc3BlY2lmaWMgZGV2
aWNlLQ0KPiBjb250ZXh0IHdpbGwgYmUgZGVmaW5lZCBpbmNyZW1lbnRhbGx5Lg0KPiA+IEkgd2ls
bCBub3QgYmUgaW5jbHVkaW5nIHZpcnRpby1mcyBpbiB0aGlzIHNlcmllcy4gSXQgd2lsbCBiZSBk
b25lIGluY3JlbWVudGFsbHkgaW4NCj4gZnV0dXJlIHV0aWxpemluZyB0aGUgaW5mcmFzdHJ1Y3R1
cmUgYnVpbGQgaW4gdGhpcyBzZXJpZXMuDQo+IERvbmU/IEhvdyBkbyB5b3UgY29uY2x1ZGUgdGhp
cz8gWW91IGp1c3QgdGVsbCBtZSB3aGF0IGlzIHRoZSBmdWxsIHNldCBvZiB2aXJpdG8tZnMNCj4g
ZGV2aWNlIGNvbnRleHQgbm93IGFuZCBob3cgdG8gbWlncmF0ZSB0aGVtLg0KPiANCj4gWW91IGNh
bnQ/IHlvdSByZWZ1c2Ugb3IgeW91IGRvbid0PyBEbyB5b3UgZXhwZWN0IHRoZSBIVyBkZXNpZ25l
ciB0byBmaWd1cmUgb3V0DQo+IGJ5IHRoZW1zZWxmPw0KSSB3b250IGJlIGFibGUgdG8gdGVsbCBu
b3cgYXMgSSBkb27igJl0IHRoaW5rIGl0IGlzIG5lY2Vzc2FyeSBmb3IgdGhpcyBzZXJpZXMuDQpJ
ZiBvbmUgb3V0IG9mIDMwIGRldmljZXMgY2Fubm90IG1pZ3JhdGUgYmVjYXVzZSBvZiB1bmltYWdp
bmFibGUgYW1vdW50IG9mIGNvbXBsZXhpdHkgaGFzIGJlZW4gcGxhY2VkIHRoZXJlLCBtYXkgYmUg
b25lIHdpbGwgbm90IGltcGxlbWVudCBpdCBhcyBtZW1iZXIgZGV2aWNlLg0KDQpGcm9tIGV4cGVy
aWVuY2Ugb2YgbWlncmF0YWJsZSBjb21wbGV4IGdwdSBkZXZpY2VzLCByZG1hIGRldmljZXMgKHN0
YXRlZnVsIGhhdmluZyBodW5kcmVkIHRob3VzYW5kIG9mIHN0YXRlZnVsIFFQcyksIG15IHVuZGVy
c3RhbmRpbmcgaXMgY29tcGxleCBzdGF0ZSBvZiB2aXJ0aW8tZnMgY2FuIGJlIGRlZmluZWQgYW5k
IG1pZ3JhdGFibGUuDQpNbHg1IGRyaXZlciBjb25zaXN0IG9mIDE1MCwwMDAgbGluZXMgb2YgY29k
ZSBhbmQgdGhhdCBkZXZpY2UgaXMgbWlncmF0YWJsZSB3aXRoIGNvbXBsZXggc3RhdGUuDQpTbyBJ
IGFtIG9wdGltaXN0aWMgdGhhdCB2aXJ0aW8tZnMgY2FuIGJlIG1pZ3JhdGFibGUgdG9vLg0KSXQg
ZG9lcyBub3QgaGF2ZSB0byBsaW1pdGVkIGJ5IG15IGxpbWl0ZWQgY3JlYXRpdml0eSBvZiAyMDIz
Lg0KTWF5IGJlIEkgYW0gd3JvbmcsIGluIHRoYXQgY2FzZSBvbmUgd2lsbCBub3QgaW1wbGVtZW50
IHBhc3N0aHJvdWdoIHZpcnRpby1mcyBkZXZpY2UuDQo=

