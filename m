Return-Path: <virtio-comment-return-8282-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECE0C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 06:26:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 03E103E584
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 06:26:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E61E8986CC5
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 06:26:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DB60C986CC0; Thu,  9 Nov 2023 06:26:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CDA56986CC1
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 06:26:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KV9fcI4gDoBbRm2r1eld/hScpukVjPenDRRAICQG2btmr1TaszkV0+d7Vlusni09I3Wt8yaKSkvwJ3bHfPU2iLj8aOZrZU+2CmuCkM/XjMDXL9aNQKwm/XEtGA+17ATNcscK+rkZjGmhF0Rgpvpg/03B9dD5cWKgT8tEI1wnbh5E5o5z4GaIo/3mVcNQY9wt/HMabqEQzZS++XGPPL79KFdND44r//5k1t+sKIKmX7v6HcR1COHNI6kFPXL8U712+tJpXRoJ41ZFONWpOgdMWbSWoLdAnm4xBfgYnFyLxDOzQD01ibyX/9H4T4Aq5ANGxjJyufRkv2T7YPdDdK9fXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ln5BPaGwp4AWIZ3l7OBTaBEIXE3P4Wq2r1M5KH7m3ZY=;
 b=miOg8UXMSofxDlv/UIn8kkMEYeNvKZG8pN8y+WBhvtU81uymtJjERdkQBU93cV0XNoNN3hKqifK7BS635DNZ60XdlZGAngedrgYTQaSZxzyFTY6G7WQ5P4AsdoKT8Vs0aGNTJ3bxgGnIDntSZ3MLNcMVs2XGRUC+cKgj4sIfH8JeljsEHwtcodEgSupMc6Q6oV3KQ7HD6EZBfikWkoPSHta/ZJcOopfOL0tHh1+ggRTyLxlZKxxT86RTuavWYcDAqYuWUAENfnF2hY5Lt71DtWBJOG28c/ezyzozADPuSpRbcOWgHIZoVTnVXUbfwTRYVx+RGwqM4vx7Qst7s4IRvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands
Thread-Index: AQHaEfwUGl0o9tnLPEOcv64rj4RwurBxbwXw
Date: Thu, 9 Nov 2023 06:26:44 +0000
Message-ID:
 <DM8PR12MB548057EA201EE985DE6C99C9DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20231030131959.1386107-7-parav@nvidia.com>
 <CACGkMEuHBRwH9LqC+_jBX5OFrzhJw88AZeAQBou+G_hZK1F2Ug@mail.gmail.com>
 <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuA6u-EJCsrhvBRKxB6nxG=H28SEh4ihM3Ptgn1FQdGKA@mail.gmail.com>
 <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org>
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
In-Reply-To:
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|DM6PR12MB4580:EE_
x-ms-office365-filtering-correlation-id: 09756453-9fe2-43df-d03c-08dbe0ecd82f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5wRgJKu7rKmI/jayuVZh7w/tQN1rrd1/B1ZC6/wCbudTQXWaIFQ+u3Oab3JKk13awGmRvFHAU0pK9BTUII6QlFJQMgoXsPq0xvlFUnKA7W6iXlNDEHU/Erd2z8/hoKbg7CPZBwUVfyOgCHeAdzrzXFFhNvAXpevXVXt8JXuEpHwTgaJ55zXM8jXH15JLF4qPQfTmKmnEB9LDH1IHC5X0sU0L+VAj+FmMWmcqF5eFMw4jcUMdqPeSEBqUtEwK0WNMetW8WcYic5ij1pzYn6NZOa8x2BECj1ZT/NQIhLv9oILGDWwlj35iJpt8HFgyZPBhodOjSlN32J1kOYo9FOkgDhgSiZ7Zc0XUILu0+QrgwbjJe8UazuThGZJrVlrL2VwzgQQL62zTyX2WGGV84GQmpGpcMQeKHUZ1QTAQVnSzjW7irTuY8784kYnshJP5GayX18d2RZ+iGhkgWmiHn+fQVKzlgOwwv6fl9qDp3IqdAqgtXL9XtfZEOrXL7R2Fap304F0RsqcnOBT4jMvsPkXJUEgwITtV8Fa/R41uExLuK/QqWT4SnqEn46kV7ZeZnJHKmu5/jm5ozgqsVtBfd29VCSFLcfi/5H0u5vRg7Ws3UUBWG8R9GmWqqwvoHWNpVTjW
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(136003)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(55236004)(26005)(53546011)(7696005)(83380400001)(41300700001)(8936002)(8676002)(4326008)(52536014)(5660300002)(2906002)(316002)(9686003)(478600001)(76116006)(66946007)(66476007)(110136005)(66556008)(66446008)(64756008)(86362001)(54906003)(6506007)(33656002)(38100700002)(122000001)(38070700009)(71200400001)(66899024)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cEtwTnB5Ui9TWXZiZnBkYlRNSzhRUW1VUFlDYnhCWnRNOGJlcXZyWHFRbjVO?=
 =?utf-8?B?Tnl2dlE4KzdWZXlsR3NuL3c4RWZNNnlhczNDT3lBSVIzQW84SkpUYWdaN2pu?=
 =?utf-8?B?RnBzbHF2TTdJVW1Qandzd1hCQTkrWm5pZythbXNCazVnUUdsMVd6Lzc1Tlov?=
 =?utf-8?B?eE1hL1dQYUlwbVZvZGJiRUdYcExZZHE2WEc4NmJZTEw1V3JOL0RubG5YK29z?=
 =?utf-8?B?d0F4REFNbHdYemhHUFpLUWhmWkUzM3ZsZDdLTFIvMm5Kc1h6Q3ExNjI0NFB6?=
 =?utf-8?B?RWNMUUNWZWhab3dDaWNUOFU5Tkk5Z3UrdXcwZUw0UlcxbzE4SGdEZnRuZ1Rh?=
 =?utf-8?B?TGZoZDk2WmsvY2FpSWxQV1AwVzNPQmNqZi9mc2ZncTYxUG5vZUg5QjJORWVr?=
 =?utf-8?B?N1A4ZjZjcVd1MkJKUlRrOXlzRjdTTHpZOVJKUE40UCtSbmVaME5wNE9xQTBt?=
 =?utf-8?B?UnlXMmVnSStVN3diWG1iSkRRQ3kvUk5tZ0ZneG9VZjRPcG9ia0FGL2dNWHZw?=
 =?utf-8?B?YmRXdmhiOUFBSDRzTjlPZnFCL3FlYWF4UTVjZFZ3a2RScW5VYjA2anNXR1Qw?=
 =?utf-8?B?MkMyYUMrYlZFTlBkQTE5c3E4azlRNHNkT0NNeVlNUUtKM2NDOHU4eFl4OXlr?=
 =?utf-8?B?TjQxMnI0UFhrSTZ5R3R5eU5BMjBxelVjZGxuaEFJa2tOeElsUURpMVRBTk9X?=
 =?utf-8?B?RHpYYy8xQXZiNkxTUitValhEVWswWkFyVnFqaTlKK0I1SldscGVEbjkxSU1o?=
 =?utf-8?B?ZmlKZTVSVkNWQkt0c1A0eTh3Y3hVOW84ZTNTVWYvVlgyaUJOWk4zVWVlQmk2?=
 =?utf-8?B?b2lFQk4vTit4MlUwdlNGUzJFNWVHN0NRS3Npb0NKb0dNVHBsMkRnZUFob3Z2?=
 =?utf-8?B?ZTd3WWROT0FWV3hmNXJyM1JIcTEzYmZBVkROOVo2N2lvR0lSVUFtaUk5Y1BP?=
 =?utf-8?B?WG1LQy9NZEJCb3dLVER4OTBwUS9tMFdxS0huVkpmWHU3eU56T2VSYi92Q01O?=
 =?utf-8?B?dDdwOEJSVTdHTFM1SmNKUDhhRkZyVlZsQ1JDOUdISE9Eam5xMFdhUU9acy9J?=
 =?utf-8?B?cWhxa1J4ZmYyOTkzSmxuVEpudlZEQ1RhbDEvRWpjRXNqVUw4QTZyZzE2eUtq?=
 =?utf-8?B?d0tyRThzVG1CeGxRUTBGd3BTbWRoVmI1Q0lCc1ZWRWJBbW1aQ3AxU0NNa255?=
 =?utf-8?B?c0ZMMS9EeWxsWnFBbU9KWUdiM2pEZW9oTkFzZmFqZlZrZ3oydHorYVRrTlpx?=
 =?utf-8?B?OE1LbFJGOGZ0OWhXdWxxZGJRT0tkc0RPYU05OTYzMmpkb3VCNzNHaXJJYWh5?=
 =?utf-8?B?VjgzTjc3VE9SSkRDZ0J5MFFzQmpkTVd4NlQ4TjhQK2Zjbm1XZU13UnNiL2lj?=
 =?utf-8?B?V3pRQlFBWEdCWVlCNDZlMlpqOEg2amJiZ1c4QWdWTlNtSGZWMlMvM2p3M0Jl?=
 =?utf-8?B?U3JYRldpampiWmxnZ3hHZ0NYY25xbERaM3hnVlFRN0E3b0k5TDZlV3FUanYr?=
 =?utf-8?B?cWZnTnpxRmE5YjFuQllsdnQwYUVrQ0lXa2JhUlB1ekNTSWQ5UXhSRzVSOWVh?=
 =?utf-8?B?UWtOSG5hVCtra2U4aEVybUZtbXpQNVJDZTlDTkhCNG40TjErTkVUSmRzRjhq?=
 =?utf-8?B?Yk5NS2pkV0JSeTFuYVhDenB3eHJIQU40Snh2eVRmU2MzQVY3VG14aDd0c0ZM?=
 =?utf-8?B?TUt3SDE5RTRURG85enlXYUZYQXR2aGlKaTNHQjlCVUtaYWlqRW82d1c0S1Zh?=
 =?utf-8?B?RnBkQWJzeEEyL2FaTlAvOXNqWTczbGRKYjFrZmN3dzY5MExQY1FBSE92Y1BD?=
 =?utf-8?B?MlFFSmIwUDNINUszVFQxOXYyNDdIaGxkZzlYcmZQNzlOMEpIOFNLajVyS0cw?=
 =?utf-8?B?dHFadHh5UDZvU1VER3pzL3EwVGEvME1vV29FUGZsQmVZSVVXRkhDL0lPUENl?=
 =?utf-8?B?clQyYkVoWGRmeWlxVnVDOHZoWnR1SGRWUjludDQxenMwdlEySmhINTZjcWEx?=
 =?utf-8?B?Qnl0Sm1wRHc0QXFyLzhVQ01sTnd5ZmVES1d4RTZZQ0NpWXhiOVZnbkp2Si8r?=
 =?utf-8?B?a01kdTNMVXl4eU56bGE3am8xeEFlTmd3ZFN6Zlhnb05peUFXUXQwTUx6ZVZk?=
 =?utf-8?Q?7PlY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09756453-9fe2-43df-d03c-08dbe0ecd82f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 06:26:44.6370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /yINoz2nk+teQjHHy9pi7Qg7WmR3O/c15VHwu+DKzz3qbxHYuMtzbE7tz0oEQsfdmP4mT/KJOwI9ykA/7bUeAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4580
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTm92ZW1iZXIgOCwgMjAyMyA5OjU5IEFNDQo+IA0KPiBPbiBUdWUsIE5vdiA3LCAyMDIz
IGF0IDM6MDXigK9QTSBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPiB3cm90ZToN
Cj4gPg0KPiA+IE9uIFR1ZSwgTm92IDA3LCAyMDIzIGF0IDEyOjA0OjI5UE0gKzA4MDAsIEphc29u
IFdhbmcgd3JvdGU6DQo+ID4gPiA+ID4gPiBFYWNoIHZpcnRpbyBhbmQgbm9uIHZpcnRpbyBkZXZp
Y2VzIHdobyB3YW50cyB0byByZXBvcnQgdGhlaXINCj4gPiA+ID4gPiA+IGRpcnR5IHBhZ2UgcmVw
b3J0LA0KPiA+ID4gPiA+IHdpbGwgZG8gdGhlaXIgd2F5Lg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ID4gMykgaW52ZW50aW5nIGl0IGluIHRoZSB2aXJ0aW8gbGF5ZXIgd2lsbCBiZSBkZXByZWNh
dGVkIGluDQo+ID4gPiA+ID4gPiA+IHRoZSBmdXR1cmUgZm9yIHN1cmUsIGFzIHBsYXRmb3JtIHdp
bGwgcHJvdmlkZSBtdWNoIHJpY2gNCj4gPiA+ID4gPiA+ID4gZmVhdHVyZXMgZm9yIGxvZ2dpbmcg
ZS5nIGl0IGNhbiBkbyBpdCBwZXIgUEFTSUQgZXRjLCBJIGRvbid0DQo+ID4gPiA+ID4gPiA+IHNl
ZSBhbnkgcmVhc29uIHZpcnRpbyBuZWVkIHRvIGNvbXBldGUgd2l0aCB0aGUgZmVhdHVyZXMgdGhh
dA0KPiA+ID4gPiA+ID4gPiB3aWxsIGJlIHByb3ZpZGVkIGJ5IHRoZSBwbGF0Zm9ybQ0KPiA+ID4g
PiA+ID4gQ2FuIHlvdSBicmluZyB0aGUgY3B1IHZlbmRvcnMgYW5kIGNvbW1pdHRlbWVudCB0byB2
aXJ0aW8gdGMNCj4gPiA+ID4gPiA+IHdpdGggdGltZWxpbmVzDQo+ID4gPiA+ID4gc28gdGhhdCB2
aXJ0aW8gVEMgY2FuIG9taXQ/DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBXaHkgZG8gd2UgbmVlZCB0
byBicmluZyBDUFUgdmVuZG9ycyBpbiB0aGUgdmlydGlvIFRDPyBWaXJ0aW8NCj4gPiA+ID4gPiBu
ZWVkcyB0byBiZSBidWlsdCBvbiB0b3Agb2YgdHJhbnNwb3J0IG9yIHBsYXRmb3JtLiBUaGVyZSdz
IG5vIG5lZWQgdG8NCj4gZHVwbGljYXRlIHRoZWlyIGpvYi4NCj4gPiA+ID4gPiBFc3BlY2lhbGx5
IGNvbnNpZGVyaW5nIHRoYXQgdmlydGlvIGNhbid0IGRvIGJldHRlciB0aGFuIHRoZW0uDQo+ID4g
PiA+ID4NCj4gPiA+ID4gSSB3YW50ZWQgdG8gc2VlIGEgc3Ryb25nIGNvbW1pdG1lbnQgZm9yIHRo
ZSBjcHUgdmVuZG9ycyB0byBzdXBwb3J0IGRpcnR5DQo+IHBhZ2UgdHJhY2tpbmcuDQo+ID4gPg0K
PiA+ID4gVGhlIFJGQyBvZiBJT01NVUZEIHN1cHBvcnQgY2FuIGdvIGJhY2sgdG8gZWFybHkgMjAy
Mi4gSW50ZWwsIEFNRCBhbmQNCj4gPiA+IEFSTSBhcmUgYWxsIHN1cHBvcnRpbmcgdGhhdCBub3cu
DQo+ID4gPg0KPiA+ID4gPiBBbmQgdGhlIHdvcmsgc2VlbXMgdG8gaGF2ZSBzdGFydGVkIGZvciBz
b21lIHBsYXRmb3Jtcy4NCj4gPiA+DQo+ID4gPiBMZXQgbWUgcXVvdGUgZnJvbSB0aGUgYWJvdmUg
bGluazoNCj4gPiA+DQo+ID4gPiAiIiINCj4gPiA+IFRvZGF5LCBBTUQgTWlsYW4gKG9yIG1vcmUg
cmVjZW50KSBzdXBwb3J0cyBpdCB3aGlsZSBBUk0gU01NVXYzLjINCj4gPiA+IGFsb25nc2lkZSBW
VC1EIHJldjMueCBhbHNvIGRvIHN1cHBvcnQuDQo+ID4gPiAiIiINCj4gPiA+DQo+ID4gPiA+IFdp
dGhvdXQgc3VjaCBwbGF0Zm9ybSBjb21taXRtZW50LCB2aXJ0aW8gYWxzbyBza2lwcGluZyBpdCB3
b3VsZCBub3Qgd29yay4NCj4gPiA+DQo+ID4gPiBJcyB0aGUgYWJvdmUgc3VmZmljaWVudD8gSSdt
IGEgbGl0dGxlIGJpdCBtb3JlIGZhbWlsaWFyIHdpdGggdnRkLA0KPiA+ID4gdGhlIGh3IGZlYXR1
cmUgaGFzIGJlZW4gdGhlcmUgZm9yIHllYXJzLg0KPiA+DQo+ID4NCj4gPiBSZXBlYXRpbmcgbXlz
ZWxmIC0gSSdtIG5vdCBzdXJlIHRoYXQgd2lsbCB3b3JrIHdlbGwgZm9yIGFsbCB3b3JrbG9hZHMu
DQo+IA0KPiBJIHRoaW5rIHRoaXMgY29tbWVudCBhcHBsaWVzIHRvIHRoaXMgcHJvcG9zYWwgYXMg
d2VsbC4NCj4gDQo+ID4gRGVmaW5pdGVseSBLVk0gZGlkDQo+ID4gbm90IHNjYW4gUFRFcy4gSXQg
dXNlZCBwYWdlZmF1bHRzIHdpdGggYml0IHBlciBwYWdlIGFuZCBsYXRlciBhcyBWTQ0KPiA+IHNp
emUgZ3JldyBzd2l0Y2hlZCB0byBQTE0uICBUaGlzIGludGVyZmFjZSBpcyBhbmFsb2dvdXMgdG8g
UExNLA0KPiANCj4gSSB0aGluayB5b3UgbWVhbnQgUE1MIGFjdHVhbGx5LiBBbmQgaXQgZG9lc24n
dCB3b3JrIGxpa2UgUE1MLiBUbyBiZWhhdmUgbGlrZQ0KPiBQTUwgaXQgbmVlZHMgdG8NCj4gDQo+
IDEpIGxvZyBidWZmZXJzIHdlcmUgb3JnYW5pemVkIGFzIGEgcXVldWUgd2l0aCBpbmRpY2VzDQo+
IDIpIGRldmljZSBuZWVkcyB0byBzdXNwZW5kIChhcyBhICN2bWV4aXQgaW4gUE1MKSBpZiBpdCBy
dW5zIG91dCBvZiB0aGUgYnVmZmVycw0KPiAzKSBkZXZpY2UgbmVlZCB0byBzZW5kIGEgbm90aWZp
Y2F0aW9uIHRvIHRoZSBkcml2ZXIgaWYgaXQgcnVucyBvdXQgb2YgdGhlIGJ1ZmZlcg0KPiANCj4g
SSBkb24ndCBzZWUgYW55IG9mIHRoZSBhYm92ZSBpbiB0aGlzIHByb3Bvc2FsLiBJZiB3ZSBkbyB0
aGF0IGl0IHdvdWxkIGJlIGxlc3MNCj4gcHJvYmxlbWF0aWMgdGhhbiB3aGF0IGlzIGJlaW5nIHBy
b3Bvc2VkIGhlcmUuDQo+IA0KSW4gdGhpcyBwcm9wb3NhbCwgaXRzIHNsaWdodGx5IGRpZmZlcmVu
dCB0aGFuIFBNTC4NClRoZSBsb2cgYnVmZmVyIGlzIGEgd3JpdGUgcmVjb3JkIHdpdGggdGhlIGRl
dmljZS4gSXQga2VlcHMgcmVjb3JkaW5nIGl0Lg0KQW5kIG93bmVyIGRyaXZlciBxdWVyaWVzIHRo
ZSByZWNvcmRlZCBwYWdlcy4NClRoZSBkZXZpY2UgaW50ZXJuYWxseSBjYW4gZG8gUE1MIG9yIG90
aGVyIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbnMgYXMgaXQgZmluZHMgc3VpdGFibGUuDQoNCj4g
RXZlbiBpZiB3ZSBtYW5hZ2UgdG8gZG8gdGhhdCwgaXQgZG9lc24ndCBtZWFuIHdlIHdvbid0IGhh
dmUgaXNzdWVzLg0KPiANCj4gMSkgRm9yIG1hbnkgcmVhc29ucyBpdCBjYW4gbmVpdGhlciBzZWUg
bm9yIGxvZyB2aWEgR1BBLCBzbyB0aGlzIHJlcXVpcmVzIGENCj4gdHJhdmVyc2FsIG9mIHRoZSB2
SU9NTVUgbWFwcGluZyB0YWJsZXMgYnkgdGhlIGh5cGVydmlzb3IgYWZ0ZXJ3YXJkcywgaXQgd291
bGQNCj4gYmUgZXhwZW5zaXZlIGFuZCBuZWVkIHN5bmNocm9uaXphdGlvbiB3aXRoIHRoZSBndWVz
dCBtb2RpZmljYXRpb24gb2YgdGhlIElPDQo+IHBhZ2UgdGFibGUgd2hpY2ggbG9va3MgdmVyeSBo
YXJkLg0KPiAyKSBUaGVyZSBhcmUgYSBsb3Qgb2Ygc3BlY2lhbCBvciByZXNlcnZlZCBJT1ZBIHJh
bmdlcyAoZm9yIGV4YW1wbGUgdGhlIGludGVycnVwdA0KPiBhcmVhcyBpbiB4ODYpIHRoYXQgbmVl
ZCBzcGVjaWFsIGNhcmUgd2hpY2ggaXMgYXJjaGl0ZWN0dXJhbCBhbmQgd2hlcmUgaXQgaXMNCj4g
YmV5b25kIHRoZSBzY29wZSBvciBrbm93bGVkZ2Ugb2YgdGhlIHZpcnRpbyBkZXZpY2UgYnV0IHRo
ZSBwbGF0Zm9ybSBJT01NVS4NCj4gVGhpbmdzIHdvdWxkIGJlIG1vcmUgY29tcGxpY2F0ZWQgd2hl
biBTVkEgaXMgZW5hYmxlZC4gQW5kIHRoZXJlIGNvdWxkIGJlDQo+IG90aGVyIGFyY2hpdGVjdGUg
c3BlY2lmaWMga25vd2xlZGdlIChlLmcNCj4gUEFHRV9TSVpFKSB0aGF0IG1pZ2h0IGJlIG5lZWRl
ZC4gVGhlcmUncyBubyBlYXN5IHdheSB0byBkZWFsIHdpdGggdGhvc2UgY2FzZXMuDQo+IA0KDQpD
dXJyZW50IGFuZCBmdXR1cmUgaW9tbXVmZCBhbmQgT1MgaW50ZXJmYWNlIGxpa2VseSBjYW4gc3Vw
cG9ydCB0aGlzIGFscmVhZHkuDQpJbiBjdXJyZW50IHByb3Bvc2FsLCBtdWx0aXBsZSByYW5nZXMg
YXJlIHN1cHBsaWVkIHRvIHRoZSBkZXZpY2UsIHRoZSByZXNlcnZlZCByYW5nZXMgYXJlIG5vdCBw
YXJ0IG9mIGl0Lg0KDQo+IFdlIHdvdWxkbid0IG5lZWQgdG8gY2FyZSBhYm91dCBhbGwgb2YgdGhl
bSBpZiBpdCBpcyBkb25lIGF0IHBsYXRmb3JtIElPTU1VDQo+IGxldmVsLg0KPiANCkkgYWdyZWUg
dGhhdCB3aGVuIHBsYXRmb3JtIElPTU1VIGhhcyBzdXBwb3J0IGFuZCBpZiBpdHMgYmV0dGVyIGl0
IHNob3VsZCBiZSBmaXJzdCBwcmlvcml0eSB0byB1c2UgYnkgdGhlIGh5cGVydmlzb3IuDQpNYWlu
bHkgYmVjYXVzZSB0aGUgRCBiaXQgb2YgdGhlIHBhZ2UgYWxyZWFkeSB0aGVyZSwgYW5kIG5vdCBh
IHNwZWNpYWwgUE1MIHF1ZXVlIG9yIGEgcmFjeSBiaXRtYXAgbGlrZSB3aGF0IHdhcyBwcm9wb3Nl
ZCBpbiBvdGhlciBzZXJpZXMuDQo=

