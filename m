Return-Path: <virtio-comment-return-8432-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F861C072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:03:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C2D272AD54
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:03:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B7738986E20
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:03:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id ACAED986E1A; Fri, 17 Nov 2023 10:03:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9EB19986E1B
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 10:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRd2s33Dq7AuSiZwwYguJYbGHXcAZUzLiSloX+oAU/xsOgj8EnZXuJibjeUTHtz8nC4lXsis4E/24ny+cTNJ41ktccco5acYZwuCl5udEOlWIB72e4IZ3g6AvdoRhCa7zKES26e+MDYkisbeD+Bx0Nko77gpT34lRpZhMXnZwmd2QNwthQRWCbK+2UEn0omPvd7TiG429xqchQyGBWtyNEynUWtmMgfGLzbqy7oL2S4I2c8RIM0kckI9kKUkvLOYDaXX1M4mzbNw/S9pWMY3ydn6aaJmqg7M6Con5+daebpmWk139a8POcupGBxdaGArF9qqsd8jn/sEBy6Tr/yZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArozSscdh1CEEpcvMTPLEfLJh13MRUENFS/gvVUMUlQ=;
 b=ZybFn/oTxv9H7N/aA3UDgfE+kabVrLf5hHCOAqAwXD3AITJohtvlGKreTQaDg3CitspgpZ2VyQrSYJBbeX4nK6tDOJw8fCFJDS7HjCQnvAd0urdsm1nmfgDjlyLe5FpUeQLVhaa3zZV4USe2vxAkTUSK4fr86ASCDEMt10spNF6bgn39VYQLaxDkJBfW9DM24OT7D5Ap4ZkAm06M316KG+3X52xmpOAHUvN+DPnd5wO8yjCrtc9dYmWX0f8AoCw9FGpzUx/7TcNnOetSYRcTRgYSdFN6/1cPGk20yaTavF5SyGBSxzP58ptk6DYUOP5YkKreW79TJSL6TczaqtrIfQ==
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
Thread-Topic: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAATUGAgAAZpoCAAXC2gIAAADIw
Date: Fri, 17 Nov 2023 10:03:47 +0000
Message-ID:
 <PH0PR12MB5481C2B37901FDBBE672EF98DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsRjdg8-YN1GY1fyRHU8UvCthvDgBUzURmTVB4JdbFGZA@mail.gmail.com>
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <b0ad9991-4372-4900-8baf-a111777f6d92@intel.com>
 <20231116065416-mutt-send-email-mst@kernel.org>
 <705e728a-368a-4e28-a7b2-61afddb15ce9@intel.com>
In-Reply-To: <705e728a-368a-4e28-a7b2-61afddb15ce9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB7545:EE_
x-ms-office365-filtering-correlation-id: d3bc9588-8f87-45af-f547-08dbe7547daf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 RF0UA/nvyANKDMeBVkIqamzKeh0ZGiDs17pd4CQ0kRm9BbPnvL3aXKSg7UDnZigs3X0mU5G+78EDKdZKhVqLzUAgaMdc2GhMWn7NdIGjcJehxwC835MuXj+MjmY/ots73Xe0BD5g33v5JIgmPs+gba3qpb/avxTWucsN2S1I3pKXdazywOtRQFcLq8EB6ugnai6xiGV21Nca465ydl7MiAzCsGMUZnfHYvKtY9KN/+fz7oNDqgYrkhkS4+J9b/QqQBB/1wzFFFj2jZaTVBTvCzMJGrGj6FgkcmkT98YVfyEHHJ6IZlkEgTFG2ROy1VomYl3KApPlQoxa/oJ25Qba4rMvDNHxufxi+vA7vWqQJWf7POjjISR5dkrwFo5zOfpKIMzxoAaYCpnkPbltMXSAy10Th9ueLn1JvTgDVhjiau6e3VuWcGuR4pV2XZ5KLfBC4uz3bPggME1Ia8+m8JEldyrCzqdHBIhBgx52hZPLS3bAflUgEZ9sKuu2zGo6P4PvtfIYmK0OJl1utNfv5cZrLb2kooT5lkjNWWHR85XaiJ+fEaR02+5qMZQYdYl7FZ9WwkOikwh6YV8T1kneoAZ4u5GSuYYi2YZrPyXhk0h2DkOqDAKTJYNyYIHzbs1V2U80FkZ61whslRfnlV7YRFWu7HgrH94Q5GzWMqBqtdD6mRI0mgdQo7XitYrSkpF0i/WQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(346002)(136003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(122000001)(2906002)(38100700002)(55016003)(86362001)(5660300002)(8936002)(52536014)(4326008)(8676002)(41300700001)(83380400001)(33656002)(9686003)(316002)(26005)(107886003)(64756008)(66946007)(66556008)(66446008)(110136005)(66476007)(76116006)(54906003)(55236004)(53546011)(71200400001)(7696005)(6506007)(478600001)(38070700009)(966005)(69594002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RUU4bkczWHlHN2RiMnpVckd1ZmQ3SThtd3lpVDF2ejdVcmlPN05QY2VEY0k3?=
 =?utf-8?B?TGRaZFFieXZnTDRIcGJCWjV0TERrTklZdk0xRFk4V0M1cHFjV3d1WkNRMTEv?=
 =?utf-8?B?V2FSQXBVbFAxV3drT01qVVM0TFhsNElyYUNGVW1rSGVjVVNIWi8zMUIvUTBJ?=
 =?utf-8?B?VnNybERrRkprM3VHTlpiYTZaZ1ZYZFJjUG0xV3N0K0JJZm5vUGp1MmhBYWlH?=
 =?utf-8?B?SkJYSzVBYUhIQ3o3YTMwL2RxUU9TdnF5bDg2WGQ3ck5wWW1IUmM2b2JtMzFi?=
 =?utf-8?B?UFdEalU4dmU3UDRHV1FrRUw5SE9kK0NwOHh3a2FRWFg5RHkvQWo3NVVRUFU4?=
 =?utf-8?B?NW9POEU1b1pqS2Jmek1qZCtkYnNzTDRVOEU5WnRMZlg0cGRETWg1QWpTNlhk?=
 =?utf-8?B?ck92QTJqWnh1aXBQdlVUdWJuQ1lseGNCeElaaFE5RFNTUzh0MTF5dWFja1NI?=
 =?utf-8?B?QW1VNVV4aDRoRFhJRUh5WDFuQmk3b2IzcVBYYUp0KzFCVGI4dERxN3BEdzZi?=
 =?utf-8?B?Wk9nZXRnckZRSkRScXZESHFDWVRQTFF1Zmp4bC9hcnpQL3dxdm9DRmFtWnhu?=
 =?utf-8?B?a2Q3NytxVzFZUkJHaVNnMFdRQysxY2V2MHN3OHBmZy95eTFNUkc0czFUNDZ0?=
 =?utf-8?B?MlNxcnFvVlcrcThqcGp0MWozSk5PbHJ0TGpib2M0Y0F3SGxpSE03VjNhU0N2?=
 =?utf-8?B?UWN3a21MT1AyOG5QcDhVanBXZnJ6Ly9wZ3NNeXJCQXZpNy9Xc3kzTzdhQWds?=
 =?utf-8?B?cXRUYTRqY0lVamJ1TVFodHo5akhsS0xVRDU0VUoyK1BlQkQ3QlVmZHg0aUxG?=
 =?utf-8?B?WnpnTm5wSzZOczJwTkFzY1VBUThaWVhOU0RWR1RPSGxyZkZTZFdlOFYxMFNa?=
 =?utf-8?B?MXNxQWZteUZRTWw4RVplaEVoMGEzUVdUS296RUNKYzZ6Qis3VVFneTNsVmll?=
 =?utf-8?B?RFFHY3ZJNFZNc05sVUlnaXdRWmZwc1lhZzMrT2VTNk5xTGNGL3VoOEtib3BK?=
 =?utf-8?B?THJJdENpMzljWVQvLzBmVmozNjhYRmgzZGtoSU1jWFAyM1B4MzVCSWJQd2xv?=
 =?utf-8?B?VDM1bzFwUEJXMk1iV1BlVldQT0ZycnhxVnRKQXdlOUkvRnFJRWdDd2NMY09G?=
 =?utf-8?B?VHJxVEFaWk5PcXovd0JDNC9vVVlaRGRsTnFTZnNMMnpybkd5L3lKSHYvNGJt?=
 =?utf-8?B?dU1tZ2x5NWpkaG91bFpVbUQ4RzM1SSszVDJrL1M4RURTU1M5RDdnbU1LOFV5?=
 =?utf-8?B?ZldQOXUxZUFDS295Vk4zeDlldWNXTU5CWHBQckdNUC91emFjRGd4eVd2WFpS?=
 =?utf-8?B?U3dYQnpZT1F4ZTVjZWh3RHlwaUdPY3ViaC93TGI1WW5KU0FpMUw1U3hoWC96?=
 =?utf-8?B?cmNzYVF0YmpSeGUvcEQzMmdZZHdsQTZyUWFtMlBKbW5NQS93cUNVS1RZMW1I?=
 =?utf-8?B?RHZOcDRXdkVVcU1aVlVhd0ZvWUdBRzJwK3J0UUt4ZWJ6U1R4UjFxeXBHWHhw?=
 =?utf-8?B?Tmo3dG1rZTI1bmdqR1FUaDFFTEMvT0UxNU5GSVdqYW1QZzhpTkFDVmg5WjdU?=
 =?utf-8?B?RG9ONk94QmlETVpXMkJ1NDBmOXBWUFBicGdwdlNobzEwMGZOZmJId2V0VHpU?=
 =?utf-8?B?ZG15dGlKck9RVHdhZUpOMDJKWFBCRThTUEdXTG03dGdycEhvNGVNcHhBdVFk?=
 =?utf-8?B?VHh1emZNQlRjTDh1MWYrc0ZRaDY3WE04dVBmUi9DektkYlB2RExrMHZPbTlU?=
 =?utf-8?B?Zm1vS3FmUSsybncrdDdiaFRnODlEYnlDRVV1RS9JS1BseVRUa0VxZTlCMzla?=
 =?utf-8?B?SjN4aHVLVmVuQlUxVkFJR1NtVWdzRDBUWDRQeUtYZU1hL0cyTXI0SjZSMWU2?=
 =?utf-8?B?Z0JjcG45OVllR3hBdnYyTDFqTk5yUlNhY0lmY09wSHZFYnBZOGpGV2grOG1J?=
 =?utf-8?B?UzBnUlgza0VKRk9HV2NLTlpydkNNeGRIeVF2THV2SzBKUHpBZDlMNWdMVWlk?=
 =?utf-8?B?cHY3NUliSXJadHdHRmlvMURrSEZMRTNucGMyQm01RDUvVXNIeEpRK09Jc2lh?=
 =?utf-8?B?U0srS0JGUUdsTjA0Vy90T2EwZ2tuQUl1ZEVKN01vWVlhUDNhd0NIMG5UQVJR?=
 =?utf-8?Q?Ou6Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bc9588-8f87-45af-f547-08dbe7547daf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 10:03:47.4620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JAxx3uQirvEWdhW+yN1P29fry3dyU14AN/piwzuOSpD8/tuZogp6yLw8G2gpntDRaB/lFLdiRkhItKo9/dnDRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7545
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

DQoNCj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gU2Vu
dDogRnJpZGF5LCBOb3ZlbWJlciAxNywgMjAyMyAzOjMwIFBNDQo+IA0KPiBPbiAxMS8xNi8yMDIz
IDc6NTkgUE0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPiBPbiBUaHUsIE5vdiAxNiwg
MjAyMyBhdCAwNjoyODowN1BNICswODAwLCBaaHUsIExpbmdzaGFuIHdyb3RlOg0KPiA+Pg0KPiA+
PiBPbiAxMS8xNi8yMDIzIDE6NTEgUE0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPj4+
IE9uIFRodSwgTm92IDE2LCAyMDIzIGF0IDA1OjI5OjU0QU0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3
cm90ZToNCj4gPj4+PiBXZSBzaG91bGQgZXhwb3NlIGEgbGltaXQgb2YgdGhlIGRldmljZSBpbiB0
aGUgcHJvcG9zZWQNCj4gV1JJVEVfUkVDT1JEX0NBUF9RVUVSWSBjb21tYW5kLCB0aGF0IGhvdyBt
dWNoIHJhbmdlIGl0IGNhbiB0cmFjay4NCj4gPj4+PiBTbyB0aGF0IGZ1dHVyZSBwcm92aXNpb25p
bmcgZnJhbWV3b3JrIGNhbiB1c2UgaXQuDQo+ID4+Pj4NCj4gPj4+PiBJIHdpbGwgY292ZXIgdGhp
cyBpbiB2NSBlYXJseSBuZXh0IHdlZWsuDQo+ID4+PiBJIGRvIHdvcnJ5IGFib3V0IGhvdyB0aGlz
IGNhbiBldmVuIHdvcmsgdGhvdWdoLiBJZiB5b3Ugd2FudCBhDQo+ID4+PiBnZW5lcmljIGRldmlj
ZSB5b3UgZG8gbm90IGdldCB0byBkaWN0YXRlIGhvdyBtdWNoIG1lbW9yeSBWTSBoYXMuDQo+ID4+
Pg0KPiA+Pj4gQXJlbid0IHdlIHRhbGtpbmcgYml0IHBlciBwYWdlPyBXaXRoIDFUQnl0ZSBvZiBt
ZW1vcnkgdG8gdHJhY2sgLT4NCj4gPj4+IDI1NkdiaXQgLT4gMzJHYml0IC0+IDhHYnl0ZSBwZXIg
VkY/DQo+ID4+Pg0KPiA+Pj4gQW5kIHlvdSBoYXBwaWx5IHNheSAid2UnbGwgYWRkcmVzcyB0aGlz
IGluIHRoZSBmdXR1cmUiIHdoaWxlIGF0IHRoZQ0KPiA+Pj4gc2FtZSB0aW1lIGZpZ2h0aW5nIHRv
b3RoIGFuZCBuYWlsIGFnYWluc3QgYWRkaW5nIHNpbmdsZSBiaXQgc3RhdHVzDQo+ID4+PiByZWdp
c3RlcnMgYmVjYXVzZSBzY2FsYWJpbGl0eT8NCj4gPj4+DQo+ID4+Pg0KPiA+Pj4gSSBoYXZlIGEg
ZmVlbGluZyBkb2luZyB0aGlzIGNvbXBsZXRlbHkgdGhlb3JldGljYWwgbGlrZSB0aGlzIGlzIHBy
b2JsZW1hdGljLg0KPiA+Pj4gTWF5YmUgeW91IGhhdmUgaXQgYWxsIGxhaWQgb3V0IG5lYXRseSBp
biB5b3VyIGhlYWQgYnV0IEkgc3VzcGVjdCBub3QNCj4gPj4+IGFsbCBvZiBUQyBjYW4gcGljdHVy
ZSBpdCBjbGVhcmx5IGVub3VnaCBiYXNlZCBqdXN0IG9uIHNwZWMgdGV4dC4NCj4gPj4+DQo+ID4+
PiBXZSBkbyBzb21ldGltZXMgYXNrIGZvciBQT0MgaW1wbGVtZW50YXRpb24gaW4gbGludXggLyBx
ZW11IHRvDQo+ID4+PiBkZW1vbnN0cmF0ZSBob3cgdGhpbmdzIHdvcmsgYmVmb3JlIG1lcmdpbmcg
Y29kZS4gV2Ugc2tpcHBlZCB0aGlzIGZvcg0KPiA+Pj4gYWRtaW4gdGhpbmdzIHNvIGZhciBidXQg
SSB0aGluayBpdCdzIGEgZ29vZCBpZGVhIHRvIHN0YXJ0IGRvaW5nIGl0DQo+ID4+PiBoZXJlLg0K
PiA+Pj4NCj4gPj4+IFdoYXQgbWFrZXMgbWUgcGF1c2UgYSBiaXQgYmVmb3JlIHNheWluZyBwbGVh
c2UgZG8gYSBQb0MgaXMgYWxsIHRoZQ0KPiA+Pj4gb3Bwb3NpdGlvbiB0aGF0IHNlZW1zIHRvIGV4
aXN0IHRvIGV2ZW4gdXNpbmcgYWRtaW4gY29tbWFuZHMgaW4gdGhlDQo+ID4+PiAxc3QgcGxhY2Uu
IEkgdGhpbmsgb25jZSB3ZSBmaW5hbGx5IHN0b3AgYXJndWluZyBhYm91dCB3aGV0aGVyIHRvIHVz
ZQ0KPiA+Pj4gYWRtaW4gY29tbWFuZHMgYXQgYWxsIHRoZW4gYSBQb0Mgd2lsbCBiZSBuZWVkZWQg
YmVmb3JlIG1lcmdpbmcuDQo+ID4+IFdlIGhhdmUgUE9SIHByb2R1Y3Rpb25zIHRoYXQgaW1wbGVt
ZW50ZWQgdGhlIGFwcHJvYWNoIGluIG15IHNlcmllcy4NCj4gPj4gVGhleSBhcmUgbXVsdGlwbGUg
Z2VuZXJhdGlvbnMgb2YgcHJvZHVjdGlvbnMgaW4gbWFya2V0IGFuZCBydW5uaW5nIGluDQo+ID4+
IGN1c3RvbWVycyBkYXRhIGNlbnRlcnMgZm9yIHllYXJzLg0KPiA+Pg0KPiA+PiBCYWNrIHRvIDIw
MTkgd2hlbiB3ZSBzdGFydCB3b3JraW5nIG9uIHZEUEEsIHdlIGhhdmUgc2VudCBzb21lIHNhbXBs
ZXMNCj4gPj4gb2YgcHJvZHVjdGlvbihlLmcuLCBDYXNjYWRlIEdsYWNpZXIpIGFuZCB0aGUgZGF0
YXNoZWV0LCB5b3UgY2FuIGZpbmQNCj4gPj4gbGl2ZSBtaWdyYXRpb24gZmFjaWxpdGllcyB0aGVy
ZSwgaW5jbHVkZXMgc3VzcGVuZCwgdnEgc3RhdGUgYW5kIG90aGVyDQo+ID4+IGZlYXR1cmVzLg0K
PiA+Pg0KPiA+PiBBbmQgdGhlcmUgaXMgYW4gcmVmZXJlbmNlIGluIERQREsgbGl2ZSBtaWdyYXRp
b24sIEkgaGF2ZSBwcm92aWRlZA0KPiA+PiB0aGlzIHBhZ2UNCj4gPj4gYmVmb3JlOg0KPiA+PiBo
dHRwczovL2RvYy5kcGRrLm9yZy9ndWlkZXMtMjEuMTEvdmRwYWRldnMvaWZjLmh0bWwsIGl0IGhh
cyBiZWVuDQo+ID4+IHdvcmtpbmcgZm9yIGxvbmcgbG9uZyB0aW1lLg0KPiA+Pg0KPiA+PiBTbyBp
ZiB3ZSBsZXQgdGhlIGZhY3RzIHNwZWFrLCBpZiB3ZSB3YW50IHRvIHNlZSBpZiB0aGUgcHJvcG9z
YWwgaXMNCj4gPj4gcHJvdmVuIHRvIHdvcmssIEkgd291bGQNCj4gPj4gc2F5OiBUaGV5IGFyZSBQ
T1IgZm9yIHllYXJzLCBjdXN0b21lcnMgYWxyZWFkeSBkZXBsb3llZCB0aGVtIGZvciB5ZWFycy4N
Cj4gPiBBbmQgSSBndWVzcyB3aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIHNheSBpcyB0aGF0IHRoaXMg
cGF0Y2hzZXQgd2UgYXJlDQo+ID4gcmV2aWV3aW5nIGhlcmUgc2hvdWxkIGJlIGhlbHAgdG8gdGhl
IHNhbWUgc3RhbmRhcmQgYW5kIHRoZXJlIHNob3VsZCBiZQ0KPiA+IGEgUG9DPyBTb3VuZHMgcmVh
c29uYWJsZS4NCj4gWWVzIGFuZCB0aGUgaW4tbWFya2V0aW5nIHByb2R1Y3Rpb25zIGFyZSBQT1Is
IHRoZSBzZXJpZXMganVzdCBpbXByb3ZlcyB0aGUNCj4gZGVzaWduLCBmb3IgZXhhbXBsZSwgb3Vy
IHNlcmllcyBhbHNvIHVzZSByZWdpc3RlcnMgdG8gdHJhY2sgdnEgc3RhdGUsIGJ1dA0KPiBpbXBy
b3ZlbWVudHMgdGhhbiBDRyBvciBCU0MuIFNvIEkgdGhpbmsgdGhleSBhcmUgcHJvdmVuIHRvIHdv
cmsuDQoNCklmIHlvdSBwcmVmZXIgdG8gZ28gdGhlIHJvdXRlIG9mIFBPUiBhbmQgcHJvZHVjdGlv
biBhbmQgcHJvdmVuIGRvY3VtZW50cyBldGMsIHRoZXJlIGlzIHRvbiBvZiBpdCBvZiBtdWx0aXBs
ZSB0eXBlcyBvZiBwcm9kdWN0cyBJIGNhbiBkdW1wIGhlcmUgd2l0aCBvcGVuLXNvdXJjZSBjb2Rl
IGFuZCBkb2N1bWVudGF0aW9uIGFuZCBtb3JlLg0KTGV0IG1lIGtub3cgd2hhdCB5b3Ugd291bGQg
bGlrZSB0byBzZWUuDQoNCk1pY2hhZWwgaGFzIHJlcXVlc3RlZCBzb21lIHBlcmZvcm1hbmNlIGNv
bXBhcmlzb25zLCBub3QgYWxsIGFyZSByZWFkeSB0byBzaGFyZSB5ZXQuDQpTb21lIGFyZSBwcmVz
ZW50IHRoYXQgSSB3aWxsIHNoYXJlIGluIGNvbWluZyB3ZWVrcy4NCg0KQW5kIGFsbCB0aGUgdmRw
YSBkcGRrIHlvdSBwdWJsaXNoZWQgZG9lcyBub3QgaGF2ZSBiYXNpYyBDVlEgc3VwcG9ydCB3aGVu
IEkgbGFzdCBsb29rZWQgYXQgaXQuDQpEbyB5b3Uga25vdyB3aGVuIHdhcyBpdCBhZGRlZD8NCg0K
PiA+DQo+ID4+IEZvciBkaXJ0eSBwYWdlIHRyYWNraW5nLCBJIHNlZSB5b3Ugd2FudCBib3RoIHBs
YXRmb3JtIElPTU1VIHRyYWNraW5nDQo+ID4+IGFuZCBzaGFkb3cgdnFzLCBJIGFtIHRvdGFsbHkg
ZmluZSB3aXRoIHRoaXMgaWRlYS4gQW5kIEkgdGhpbmsgbWF5YmUNCj4gPj4gd2Ugc2hvdWxkIG1l
cmdlIHRoZSBiYXNpYyBmZWF0dXJlcyBmaXJzdCwgYW5kIGRpcnR5IHBhZ2UgdHJhY2tpbmcNCj4g
Pj4gc2hvdWxkIGJlIHRoZSBzZWNvbmQgc3RlcC4NCj4gPj4NCj4gPj4gVGhhbmtzDQo+ID4gUGFy
YXYgd2FudHMgdG8gYWRkIGFuIG9wdGlvbiBvZiBvbi1kZXZpY2UgdHJhY2tpbmcuIFdoaWNoIGFs
c28gc2VlbXMNCj4gPiBmaW5lLiBJIHRoaW5rIGl0IHNob3VsZCBiZSBvcHRpb25hbCB0aG91Z2gg
YmVjYXVzZSBzaGFkb3cgYW5kIElPTU1VDQo+ID4gb3B0aW9ucyBleGlzdC4NCj4gSSBhZ3JlZSwg
dGhlIHZlbmRvciBjYW4gY2hvb3NlIHRvIGltcGxlbWVudCB0aGVpciBvd24gZmFjaWxpdHkgYXMg
YSBiYWNrdXAuDQo+ID4NCg0K

