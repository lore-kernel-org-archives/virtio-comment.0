Return-Path: <virtio-comment-return-8109-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90331C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 06:10:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E8A6B330A0
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 06:10:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DEFF8986BF4
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 06:10:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D55D4986BE9; Thu,  2 Nov 2023 06:10:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C8085986BEA
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 06:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UULzaWjDVzMBxMFERDaICmksPcwkwYwgDg/K0quIvhITPhiM0PtVwd8SPqJDMzehCUrKoTMovgCNFxwzMBLOCMmHyqKga1bGfoXfxFI0YduQ4lWamYFZ0bNNC2BSYW4Fc7HG2cq8ICbYuA0nL49H3YeGq/0shOI9LXvQPaRXwYyQN3/zRRk2nlBQt7mQzdFxhwUo/mzoXRlPhtKz/RRNpiXlH5D4AF3x5Yt/gguQpLAY0Qz8O0eTtk0V1OQwuQHTlcx7MGIY6YlZaKHp/6PHr44yUk+AjOi5NaE0Fpl4bLvSJfg9Twr7oB0iDVBmMj7BIon9EctTcqNy/cYdIOaBsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRk/TQD6FaiC92h8SLqH0JEh5be1fH2wOh/gnF/eCik=;
 b=R+yC63f22B7DrALyKl4ddx4v02IDJX/yBk3muaFMVErB1o4L6ikdrJs7952dZDn52zCLcjZ6YInuTddyynK6BgJ65DC9ITc2H0Uh7z0pb+6YaJ8WtNhAkJHDOV9b7OQDuCnQ4ej7k5qwREOzLNsce0BiUM+qTcCthZxGAZvi18WhI8mZCZc2kUC/G18gNke0cORRnR8Y6HvdirQkP0U3bD++epNc86vyFje4CUOzqKAwKOilVRjGEw88CYmtg3hqkxrKwHzxmR/wvWuFTFbMfnnO8Zw2A3svCg8OIW9VNATUaY2EO/51ZpgsxfZlPwAbv+lu8gHsAETwEmVEDeK16A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIAAFBIAgAABIMCAB3K1AIAADNZggAGZtoCAAFHP0IABBk6AgABdlBCAASjtgIAAM0kQgAZNdoCAAAPWsIABZTAAgAA9LXCAAUN1gIAAKeEAgAGo8QCAABeXUA==
Date: Thu, 2 Nov 2023 06:10:25 +0000
Message-ID:
 <PH0PR12MB548181EA329E774DC359FD10DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018055422-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsJVxPuxCGjKs3R-kaVGfDMNjtAovM7PpBt3TVd8HON0g@mail.gmail.com>
 <PH0PR12MB5481DD16B25251BAC25AA908DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthURdu4UNYXPseA-5g6mci2CFDP_UKKC1qFy+n7NHAKg@mail.gmail.com>
 <PH0PR12MB5481BBC4E48145A02C8963ABDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3nC8G3Xo2EaunQ4k4rnB27UQMUvruXaf81_sZF7w-cQ@mail.gmail.com>
 <PH0PR12MB548120210DC4AC23382D8A99DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvwFno6ynKzi1WPAj=fF2xmzRS_kUKfL8UJU8sTcjDHbA@mail.gmail.com>
 <PH0PR12MB548140823FA205FA06597692DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d3b029a0-5a50-c697-066a-e4f8e85b807c@redhat.com>
 <PH0PR12MB5481CE2BD779F1D96914FB6EDCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsC9F0SY=ydOSe+nV11L7d2t1Ypzr6nz_UoUc3w632VUQ@mail.gmail.com>
 <PH0PR12MB5481F7BE5C7F4430D1F26B06DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt_HnZ26ZySCt8w58-OdH+UDzqveqZ2=LN3mK3Z3oy4EA@mail.gmail.com>
 <DM8PR12MB548082010AC006539B04CB16DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEuh+9h9nwGbv63onEh2MgGoCEkKmCwsLEvJ9O5NqtFs-Q@mail.gmail.com>
In-Reply-To:
 <CACGkMEuh+9h9nwGbv63onEh2MgGoCEkKmCwsLEvJ9O5NqtFs-Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB6909:EE_
x-ms-office365-filtering-correlation-id: 7091c287-db78-49ef-944d-08dbdb6a675e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 g0FSeNrx39LvsgeW5Lmha1ksIqtIKp8iHZdWKt0UhwoeNBrrZOlXLAaYJXcH5CneZiNee3jg+XVSs2XygdSr/9nufa1VMkvs6f9HQNHFqIufEP2RsmmI3JVG+l/q2Zh6g1Ou+KWnJFi7XlrGWwfWzYb92lE2KyUvtm6BLmB8U53Hf0Inqy9bdZeaXwjPfA+tO0SB1W5FZvQ9VRqd5stGEF6vD3preXkjuQUS7dmAfxDDhzW6h7BQW5CCTdNDjR+DvBgg8xAyFugCRKBDs8Q6L1UQsOkGwtD5d0IskHOrgPdF0RhMyuo19d6+GK+anLfuifUzxJ7TJcbmNF7yzYxQxhKImqtt+39Pc+w0B8KlQ2tOXpLSPcdEluBnU2VS8iR9kWW5unkU8ddj3zpJKoJ+TN4S1LCDaY3V+zkkTtBq8/D162UQshreTWyS+RxhGalsN9zx2yV5cUp7luo8h8iQEhWlODdZvm784+9ctj027Aj8QUx0CHVMhuwr2waeErWhl7/ZIqPQYDyqeY/ekcbkbIE9dRdpbklOMSmgeBjELLCudjEE2Av/g6YnvWx6QoUUJx5wWu4ks2yAWhByGVlYQNAbur+lg3Aq/dqH8VpmLn9uMYU7rgVWdeq+VlzeD0alzTmqlIwC00RB3vJAIy3Ub7QKjfkkgm14rfRG0saqAEA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(376002)(366004)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(9686003)(86362001)(122000001)(55016003)(966005)(38100700002)(7696005)(53546011)(33656002)(26005)(71200400001)(38070700009)(45080400002)(6506007)(83380400001)(478600001)(107886003)(2906002)(66946007)(66476007)(52536014)(66446008)(41300700001)(66556008)(64756008)(76116006)(8936002)(4326008)(8676002)(316002)(5660300002)(54906003)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2s5Tld5ODd4VXBZZnRWWFVUa3JOSlZIbkZaV3hoWjR1bmFYNjNDWkRMMzVr?=
 =?utf-8?B?d1pQVkZsbkwyUy9MeGQyZ0Jtbld2ZldGZHJTM2JTVXZyOXJTVXJ3bnhxTWFk?=
 =?utf-8?B?eHNRS3lFQjRMdThueGJlL083L3YraWYzMUU5WTJ5SmpnUStFNkpRTkM5dU1B?=
 =?utf-8?B?RVlUcnNsVkdPUHlRQ3BCUXNkdTlHOWQ0R2NXR1dqSmlZOFFSNzhiaE53M0VB?=
 =?utf-8?B?WldSWExBRktGMEh4dEQ4Q041V2E2UFN0TndzdERueDRCL05zK1M3NFJaeVZF?=
 =?utf-8?B?bzczRmwybVowWld1QXAzZXo0VE9WZkdHQnBmcnoyR25ka1lhYkFSRlJjeFM2?=
 =?utf-8?B?N2FQV2pZZFVtcXhmVFZzV0ZwMlNJVXNxbkhXbW9Ud09aRXZqNDFWUzdzOFhH?=
 =?utf-8?B?M3UwQ3VpYks5NGE4MTJiblEwK1o4SFVtT25TQzBVTEVBTGIvK2lyb2NFRG5C?=
 =?utf-8?B?OTdmQmNLOWc3RUs1Rlc0NVg0UlNyK2J0dGdLMVAzTk50cVpmSW9LV3VpeEow?=
 =?utf-8?B?dU1GY21yY2pqbldNVHh6TW9VNDJiUUEzRFpjUlNiMlErcG11TUpLNC95akJV?=
 =?utf-8?B?R2EvK2hCaU5hM2xtMUZHL3lSTW1CTWpqSGxOdW56RlhtOCtDeU9YRVJmTi9l?=
 =?utf-8?B?V05ybUNMMmRHZERDSGF4VWZodi9JQk1HSStETmJCQzhnbFB3ckkySmwrc2hT?=
 =?utf-8?B?aXhPS0UrQm5zWGZ5MVo3NGRIbTFOYWNFRHZ6a09jcGZlMDg1NE0zLzVJNmdr?=
 =?utf-8?B?cWJEM2VOSTUyUlJOUGs2UVNPYjZwL3Nnelg3VVNmUm02L2plMy9zSDVMeHdP?=
 =?utf-8?B?akhhUWQwUG9TU0lQSml1TjAvbjZJNW80SFFwT1BtSjZhR1RCTmV2M2EvTE5Q?=
 =?utf-8?B?YkFoWjVNcStUcXZLeWZ1NEVwcit3bWdGR1Njc3pxRHV5VEprQmZnT3psNXBD?=
 =?utf-8?B?UFVBd2szUHRLY1RwMU9hc3V5REZDYVZ1RU52M0RkOXQwQnFHTlRwamkyWWZ6?=
 =?utf-8?B?d3BBTTlULzlFQkhuMlpaNldEcWFDVm50a05MSmRpdGdZN3B0dTl0UkNzVmRY?=
 =?utf-8?B?c0RqdVA1VTVkMmJvK1oxUjVnNFlqWUh2bFRBOU9nRGdqUFJCak5KQ1NxaHY4?=
 =?utf-8?B?L0U3dDVXNXR3ZUxMMDRlcXNPdmtZUGx0eUdad3lKRXNtcDhEQ0tMdHdxVWJH?=
 =?utf-8?B?cm9teWZzSEp6YldJTE1LZ2E3VCs5S3JuRVI3Mmx0UkxIN2M0UzRQSEgySktH?=
 =?utf-8?B?R0NLY0xoZXdldE1ycGtrZFhlV21TdW9JQmxtT2FZa1BJcU1hYkhYOGo0ZVFO?=
 =?utf-8?B?WTVSRGVoTmRreU1jWkZHd2Jia3JtSHl2MEdIZ3VOMXJ2TG5tenZXT0oxeTF1?=
 =?utf-8?B?OVJaMDB4NkJZL1Q0SWtlY3VuSHlhdEsxTUZha1pHQ1NOSU1seGxzcmdXN0pj?=
 =?utf-8?B?NElOM3RvN3d0cmhKVWNHR1hCYlNNNjBhUlV3SlBFZW1KSWRTTmVtWXl0dDFh?=
 =?utf-8?B?eVduUy94emN2YlFYZFppakhuNzVyYzBIUlVMNEkyWnl3WlFWUFpPNDlBMjRP?=
 =?utf-8?B?ckJOQWV5Y0ZMS2hFK3F5NVpnbEZ6UHhad0FxTmFsZkFsTUJDdVkxSjhHSXdl?=
 =?utf-8?B?aENFMGFOSGs0a3p1dE00YjVabVp2SWw2WHlnSVMvZkJsWkFmY0lwQnhCeER5?=
 =?utf-8?B?aGNobklHbTdickRFaUFkbk9WZjhCZi9IT3AwMnRTSVFBaGF1RnIzazNxNGNU?=
 =?utf-8?B?VTczSGdYMHRSUGI5UVMxYjlyK24xeXUvbkR3N3p0RzE0N1NXWTV4SE5oUjB4?=
 =?utf-8?B?N0I1Vm4wSEQrNWt5NnNZdURuS3EwUWRROWcrUVhXSktiODNtYTFhL2ExakxN?=
 =?utf-8?B?Q2JDbFdBeGNZcm5HVEd5MnUrWlJndnhaQlRlZU1JV0o0ZVVHaGMvaVZUWkth?=
 =?utf-8?B?U3ZmTEl4bktBYmVFdVl4SEg2dVRhcWJHbXY1YlRwVWwxaUI3MXBvaHFrTmlR?=
 =?utf-8?B?RDdCaXM0UTZjUHNMNVZFUGhna0N0a1BRK1J2NGN6Q0hkYmZzdGI4RjhZb0RF?=
 =?utf-8?B?dkt3YzJrdlBJVUs2MnkzR1JOZjlZcWQvbERlZlMvSEVqUi9nSFBDN3dNbnpy?=
 =?utf-8?Q?PNmY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7091c287-db78-49ef-944d-08dbdb6a675e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2023 06:10:25.0305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSFYHe4E6n1fa3aJ5racbcdynJrgwAAM/I/nM2719vEBpkj3r9myGWF3wDO3MBI+ESs8lJufFrG7t4nPmU3+Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6909
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFRodXJz
ZGF5LCBOb3ZlbWJlciAyLCAyMDIzIDk6NTQgQU0NCj4gDQo+IE9uIFdlZCwgTm92IDEsIDIwMjMg
YXQgMTE6MDfigK9BTSBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+IHdyb3RlOg0KPiA+
DQo+ID4NCj4gPg0KPiA+ID4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4N
Cj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMSwgMjAyMyA2OjAzIEFNDQo+ID4gPg0K
PiA+ID4gT24gVHVlLCBPY3QgMzEsIDIwMjMgYXQgMToxN+KAr1BNIFBhcmF2IFBhbmRpdCA8cGFy
YXZAbnZpZGlhLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+
ID4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmcNCj4gPiA+ID4gPiA8
dmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtIG9wZW4ub3JnPiBPbiBCZWhhbGYgT2YgSmFzb24g
V2FuZw0KPiA+ID4gPiA+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMzEsIDIwMjMgNzowNyBBTQ0K
PiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gTW9uLCBPY3QgMzAsIDIwMjMgYXQgMTI6MjjigK9QTSBQ
YXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+DQo+IHdyb3RlOg0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhh
dC5jb20+DQo+ID4gPiA+ID4gPiA+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAzMCwgMjAyMyA5OjM1
IEFNDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IOWcqCAyMDIzLzEwLzI2IDExOjUwLCBQ
YXJhdiBQYW5kaXQg5YaZ6YGTOg0KPiA+ID4gPiA+ID4gPiA+PiBGcm9tOiB2aXJ0aW8tY29tbWVu
dEBsaXN0cy5vYXNpcy1vcGVuLm9yZw0KPiA+ID4gPiA+ID4gPiA+PiA8dmlydGlvLWNvbW1lbnRA
bGlzdHMub2FzaXMtIG9wZW4ub3JnPiBPbiBCZWhhbGYgT2YgSmFzb24NCj4gPiA+ID4gPiA+ID4g
Pj4gV2FuZyBGb3IgZXhhbXBsZSwgeW91IHN0aWxsIGhhdmVuJ3Qgc3VjY2VlZGVkIGluIGRlZmlu
aW5nDQo+ID4gPiBwYXNzdGhyb3VnaC4NCj4gPiA+ID4gPiA+ID4gPiBJdCB3YXMgZGVmaW5lZCBv
biAxOXRoIE9jdCBpbiBbMV0uDQo+ID4gPiA+ID4gPiA+ID4gV2hhdCBwYXJ0IGlzIG5vdCBjbGVh
ciB0byB5b3UgaW4gZGVmaW5pdGlvbiBvZiBwYXNzdGhyb3VnaCBkZXZpY2U/DQo+ID4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBbMV0NCj4gPiA+ID4gPiA+ID4gPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy92aXJ0aW8tDQo+ID4gPiA+ID4gPiA+IGNvbW1lbnQvUEgwUFIxMk1CNTQ4MUVB
NkE0RDBDNjRDNUFGNkQzQQ0KPiA+ID4gPiA+ID4gPiA+IDU3RENENEFAUEgwUFIxMk1CNTQ4MS5u
YW1wcmQxMi5wcm9kLm91dGxvb2suY29tLw0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiBMZXQgbWUgY29weS1wYXN0ZSBpdCBhZ2FpbjoNCj4gPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+ID4gRm9yIGV4YW1wbGUsIGFzc3VtaW5nIHlvdSBhcmUgY29ycmVjdCwgeW91
IHN0aWxsIGZhaWwgdG8NCj4gPiA+ID4gPiA+ID4gZXhwbGFpbg0KPiA+ID4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4gPiAxKSB3aGF0IGlzIHRyYXBwZWQgYW5kIHdoYXQncyBub3QsIG9yIHdoYXQncyB0
aGUgYm91bmRhcnkNCj4gPiA+ID4gPiA+IFBhc3N0aHJvdWdoIGRlZmluaXRpb24gd2FzIHJlcGxp
ZWQgZmV3IHRpbWVzLg0KPiA+ID4gPiA+ID4gT25lIG9mIHRoZW0gaXMgaGVyZSwNCj4gPiA+ID4g
PiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3ZpcnRpby0NCj4gPiA+ID4gPiBjb21tZW50L1BI
MFBSMTJNQjU0ODFFQTZBNEQwQzY0QzVBRjZEM0ENCj4gPiA+ID4gPiA+IDU3RENENEFAUEgwUFIx
Mk1CNTQ4MS5uYW1wcmQxMi5wcm9kLm91dGxvb2suY29tLw0KPiA+ID4gPiA+ID4gSSBkb27igJl0
IGtub3cgd2hhdCB5b3UgbWVhbiBieSAnZXhwbGFpbicuIFdoYXQgZG8geW91IHdhbnQgdG8NCj4g
PiA+ID4gPiA+IGJlDQo+ID4gPiBleHBsYWluZWQ/DQo+ID4gPiA+ID4gPiBXaGF0IGlzIHRyYXBw
ZWQgaXMgbGlzdGVkIGluDQo+ID4gPiA+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy92aXJ0
aW8tDQo+ID4gPiA+ID4gY29tbWVudC9QSDBQUjEyTUI1NDgxRUE2QTREMEM2NEM1QUY2RDNBDQo+
ID4gPiA+ID4gPiA1N0RDRDRBQFBIMFBSMTJNQjU0ODEubmFtcHJkMTIucHJvZC5vdXRsb29rLmNv
bS8NCj4gPiA+ID4gPiA+IFdoYXQgaXMgbm90IHRyYXBwZWQgaXMgYWxzbyBsaXN0ZWQgaW4NCj4g
PiA+ID4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3ZpcnRpby0NCj4gPiA+ID4gPiBjb21t
ZW50L1BIMFBSMTJNQjU0ODFFQTZBNEQwQzY0QzVBRjZEM0ENCj4gPiA+ID4gPiA+IDU3RENENEFA
UEgwUFIxMk1CNTQ4MS5uYW1wcmQxMi5wcm9kLm91dGxvb2suY29tLw0KPiA+ID4gPiA+ID4gU28g
d2hhdCBtb3JlIGRvIHlvdSB3YW50IHRvIGV4cGxhaW4gaW4gdGhlcmU/DQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBZb3UgZXhwbGFpbmVkIHRoYXQgTVNJLVggaXMgdHJhcHBlZCBidXQgbm90IHRoZSBv
dGhlcnMuIFBlb3BsZQ0KPiA+ID4gPiA+IG1heSBrbm93DQo+ID4gPiB3aHkuDQo+ID4gPiA+ID4g
b3Igd2hhdCdzIHRoZSBib3VuZGFyeSB0byBjaG9vc2UgdG8gdHJhcCBvciBub3QuDQo+ID4gPiA+
ID4NCj4gPiA+ID4gSWYgYSBwbGF0Zm9ybSBjYW4gc3VwcG9ydCB3aXRob3V0IHRyYXBwaW5nLCBp
dCBjYW4gYmUgYXZvaWRlZCBhcw0KPiA+ID4gPiB3ZWxsIGFuZCBjYW4NCj4gPiA+IGJlIGFkZGVk
IGluIHRoZSBmdXR1cmUuDQo+ID4gPg0KPiA+ID4gV2hvIGlzIGdvaW5nIHRvIGRvIHRoYXQgc3lu
Y2hyb25pemF0aW9uPw0KPiA+IExldHMgZmlyc3QgYnJpbmcgdGhhdCBoeXBlcnZpc29yIHN3IGRl
c2lnbiBiZWZvcmUgZGlzY3Vzc2luZyBwaGFudG9tIHByb2JsZW0NCj4gc29sdmluZy4NCj4gPiBB
bGwgbmVjZXNzYXJ5IG1vZHVsZXMgd2lsbCBiZSBpbnZvbHZlZCBpbiBzeW5jaHJvbml6YXRpb24g
ZGVwZW5kaW5nIG9uIGhvdw0KPiBpdHMgZG9uZSBpbiBmdXR1cmUuDQo+IA0KPiBJdCdzIG5vdCB0
aGUgY2hhcmdlIG9mIHRoZSB2aXJ0aW8gc3BlYyB0byBtYW5kYXRlIGFueSB0eXBlIG9mIGh5cGVy
dmlzb3IgZGVzaWduLg0KPiBCdXQgaXQgbG9va3MgdG8gbWUgeW91IHdhbnQgdG8gZG8gdGhhdC4N
CllvdSBhbHdheXMgYXR0cmlidXRlIGlzIHdyb25nIHRvIGRpc3JlZ2FyZCB0aGUgcHJvcG9zYWwg
d2hpY2ggaXMgaW5jb3JyZWN0Lg0KVmlydGlvIHNwZWMgZG9lcyBub3QgbWFuZGF0ZSBpdC4NCldo
eT8NCkJlY2F1c2UgdmlydGlvIGlzIHNvIGxhdGUgaW4gdGhlIGN5Y2xlIG9mIGRldmVsb3Bpbmcg
ZmVhdHVyZXMsIHRoYXQgaXQgaGFzIHRvIGZpdCBpbnRvIHRoZSBleGlzdGluZyBoeXBlcnZpc29y
cyBkZXNpZ24gdG8gc3VwcG9ydCB0aGUgZmVhdHVyZSBhbmQgcHJvdmVuIFVBUElzLg0KDQpTbyBs
aWtlIFJTUywgZmxvdyBmaWx0ZXJzLCBzdGF0aXN0aWNzLCBwcm92aXNpb25pbmcsIGFuZCBtb3Jl
LCBpdCBpcyBhZGRpbmcgdGhlIHN1cHBvcnQgZm9yIFVBUElzIHdoaWNoIGFyZSBhbHJlYWR5IHBy
ZXNlbnQgZm9yIGEgd2hpbGUgYWNyb3NzIG11bHRpcGxlIGRldmljZXMuDQoNClNvIGF0dHJpYnV0
aW5nIGl0IGFzIG1hbmRhdGluZyBpcyBzaW1wbHkgd3JvbmcuDQpJdCBpcyBhZGRyZXNzaW5nIHRo
ZSBleGlzdGluZyB1c2UgY2FzZS4NCg0KT25lIGNhbiBhbHdheXMgYnVpbGQgbmV3IGh5cGVydmlz
b3IgYW5kIGRlbWFuZCBuZXcgZmVhdHVyZXMgZnJvbSB2aXJ0aW8uDQpUaGF0IGlzIHBlcmZlY3Rs
eSBmaW5lLg0KDQpZb3VyIGV4cGVjdGF0aW9uIGlzIHRoYXQgZGV2aWNlIG1pZ3JhdGlvbiBmcmFt
ZXdvcmsgdG8gd29yayBmb3IgYW4gdW5kZWZpbmVkIGh5cGVydmlzb3IsIHdoaWNoIGlzIGp1c3Qg
c2lsbHkuDQoNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IDIpIGlmIHRoZSBoeXBlcnZpc29y
IGlzIG5vdCBkZXZlbG9wZWQgd2l0aCB0aG9zZQ0KPiA+ID4gPiA+ID4gPiBhc3N1bXB0aW9ucywg
dGhpbmdzIGNhbiB3b3JrDQo+ID4gPiA+ID4gPiBXaGF0IHRvIGV4cGxhaW4gaW4gIzIuIDopDQo+
ID4gPiA+ID4gPiBUaGluZ3MgY2FuIGV4cGFuZCB3aGVuIHN1Y2ggaHlwZXJ2aXNvciBpcyBib3Ju
Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU28gdGhlIHBvaW50IGlzIHN0aWxsLCB0byBtYWtlIHlv
dXIgcHJvcG9zYWwgdG8gYmUgdXNlZnVsIGluIG1vcmUgdXNlDQo+IGNhc2VzLg0KPiA+ID4gPiA+
DQo+ID4gPiA+IFdoZW4gYSB1c2UgY2FzZSBhcmlzZSwgZGV2aWNlIGNvbnRleHQgY2FuIGJlIGV4
cGFuZGVkLg0KPiA+ID4NCj4gPiA+IEl0J3Mgbm90IGRldmljZSBjb250ZXh0Lg0KPiA+ID4NCj4g
PiBJIGRvbuKAmXQgc2VlIHdoeSBub3QuIEl0IGlzIHN0b3JlZCBpbiB0aGUgZGV2aWNlLg0KPiA+
IFJlbWFwcGluZyBwYXJ0IHdpbGwgYmUgaHlwZXJ2aXNvciBzcGVjaWZpYywgc28gaXQgbWF5IGJl
IHN0b3JlZCBpbiBwbGF0Zm9ybQ0KPiBzcGVjaWZpYyBtaWdyYXRpb24gZGF0YS4NCj4gDQo+IFRo
ZSBwb2ludCBpcywgZGV2aWNlIGNvbnRleHQgc2hvdWxkIHdvcmsgZm9yIGFsbCB0eXBlIG9mIGh5
cGVydmlzb3JzLg0KPiBZb3UgY2FuJ3QgY2xhaW0gaXQgY2FuIG9ubHkgd29yayB3aXRoIHlvdXIg
InBhc3N0aHJvdWdoIiBtb2RlbC4NCj4gDQpXaGljaCBvdGhlciB0eXBlIHlvdSBzcGVjaWZpY2Fs
bHkgaGF2ZSBpbiBtaW5kPw0KVGhlIGN1cnJlbnQgcHJvcG9zYWwgc2hvdWxkIHdvcmsgZm9yOg0K
MS4gcGFzc3Rocm91Z2ggbW9kZWwNCjIuIG1heSBiZSBmb3IgdmRwYSBtb2RlbC4gDQpUaGUgbW9k
ZWwgc2VlbXMgdG8gd29yayBmb3IgcGFzc3Rocm91Z2ggYW5kIHZkcGEgYm90aCBjYXNlcyB0byBt
ZS4NCg0KSWYgc29tZXRoaW5nIGlzIG1pc3NpbmcgZm9yICMyLCBlaXRoZXIgZGV2aWNlIGNvbnRl
eHQgY2FuIGJlIHVwZGF0ZWQsIG9yIG5ldyBjb21tYW5kcyBjYW4gYmUgYWRkZWQuDQoNCj4gPg0K
PiA+ID4gPiBObyBwb2ludCBpbiBtYWtpbmcgdGhpbmdzIG5vIG9uZSBpbXBsZW1lbnRzIG9yIG5v
dCBwcmVzZW50IGluIGh5cGVydmlzb3IuDQo+ID4gPiA+IFRoZSBpbmZyYXN0cnVjdHVyZSBpcyBl
eHRlbmRpYmxlIHNvIHNwZWMgaXMgY292ZXJlZCBmb3IgaXQuDQo+ID4gPg0KPiA+ID4gSXQgd291
bGQgYmUgcHJvYmxlbWF0aWMgaWYgeW91IHN0aWNrIHRvIGNsYWltICJwYXNzdGhyb3VnaCIgYnV0
IG5vdC4NCj4gPg0KPiA+IEkgZG9u4oCZdCBrbm93IHdoYXQgdGhpcyBtZWFucy4gSSBhbSBub3Qg
ZGViYXRpbmcgcGFzc3Rocm91Z2gvbm9uLQ0KPiBwYXNzdGhyb3VnaC4NCj4gPiBXaGF0IGlzIGlu
c2lkZSB0aGUgZGV2aWNlLCB3aWxsIGJlIHBhcnQgb2YgZGV2aWNlLWNvbnRleHQuDQo+ID4gV2hh
dCBpcyBwYXJ0IG9mIHRoZSBwbGF0Zm9ybSBjb250ZW50LCB3aWxsIGJlIHBhcnQgb2YgcGxhdGZv
cm0gY29udGV4dC4NCj4gPiBTaW5jZSB0aGlzIGlzIGdlbmVyaWMgdG8gYWxsIHR5cGVzIG9mIFBD
SSBkZXZpY2VzLCBJIGRvbuKAmXQgc2VlIGEgbmVlZCB0byBvdmVyLXNvbHZlDQo+IGl0IG5vdyBp
biB2aXJ0aW8uDQo+IA0KPiBPaywgc28geW91IGFncmVlIGl0IGNhbiB3b3JrIGV2ZW4gaWYgaHlw
ZXJ2aXNvciB3YW50IHRvIHRyYXA/DQoNClllcy4gSSBiZWxpZXZlIHNvLCBpdCBjYW4gd29yay4N
CklmIHNvbWV0aGluZyBpcyBtaXNzaW5nLCB3ZSBzaG91bGQgZGlzY3VzcyB0byBlbmhhbmNlIGl0
Lg0K

