Return-Path: <virtio-comment-return-7747-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23130CDB465
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 03:20:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 61AB5941EC
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 03:20:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3C09198684D
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 03:20:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1F6CD9863B5; Tue, 17 Oct 2023 03:20:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 69BF5986843
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 03:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElE60Ywx9H5aBYaMeYJmVssHb7oHtlfHidJnrnbXpP7nD+AEla60+sB6wlFb563nZT0zzey8NSIvd4FZhnWNxa8ioUchqs/xLCxrpsaosdQQwX2UzFEi2cIHdxXP8BOsTj9xdO5LRHG3Dibvv4dwHixyoxts54IOjhHzcluGGII8ZwtvsP5gwkLReFlAdTeCRtA5urrdQGQ5foEZ+ZIJYC3TSSXb8BbPwbUBsgEeN6STrcNFMZruVVZzM3s6ifOpoKAj61MZkwRIoymnws8PuoNhL56LUFSoY3ylZPdIZtlg7IYSvsqp86W25F8qZH/f0YXeG5hLvoSh+bvwxqGYYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLupU5BWMIDD8GyUN2kYf9Wr65WTELS0L/IaxYyY/Yw=;
 b=GDo/TNtH2HxmyRJax5u2rcgntJQXITwEOXpEIxn8aimRSKcNIP/K5OgGPq/ZGoUifLDacCKWuvJGx5EHUDzuo+BMvCICPSqmAQPWO00Uv2HVeXo5GrH8j9hDPIp58Zhcy3T01O/s9PzhDp6jaJAPjW8gUB7rAQ0ups5UOYkRsU0yfSv2dxR+XHXAG7eEnVvUCezeMrk1i3eY8NP3qmuGdXpdQMqKgXu7Z0q6hlsN7ESm0DTwX4wYVEVdr3JTcAd78r2cisggatU36Ms6AhP+nxEJpowSOWjle3n0S8p8KO5eJxTRnATpoW4ZYDV8KEg2AbDyv9CCmfaTK9m1oNEjpw==
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
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAACpwCAABTB0A==
Date: Tue, 17 Oct 2023 03:19:16 +0000
Message-ID:
 <PH0PR12MB548186EF837972BE1C15EBD1DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
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
 <CACGkMEu2RdhUeeG-WNcrPqbQpHaeU06t32516ihv72uN99=mfQ@mail.gmail.com>
In-Reply-To:
 <CACGkMEu2RdhUeeG-WNcrPqbQpHaeU06t32516ihv72uN99=mfQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB6833:EE_
x-ms-office365-filtering-correlation-id: edbf6d75-ce83-4a29-eabf-08dbcebfd826
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bXdU8F93sd936Aq05O0vnoJ4ta0xsfPca28TL61elRPou11sM+fy/EGDInCeA6cW1XL6r0pdMJlcx6y1VTU4n8c5zmYjWW7lHI5Bx8jf1oZRmKhaZGGzA4qDsmukpzQ3G6HDM6rY94KQMGGLKWzcQKMa+gAXwREBSW9rswaAaVUjD0HYm9du42NVHFzO5I0g+htuRe3Tm8/NS4mbn8G/Trz71tTh2sDU7i6WvlAg8s7lJIPaqdiWTmF9ztUitRSBGTD8G6wciWaU5Kbzyz6DTGHbKvC6xDvDwr0TBuQmaCUPXugrUpNqFdkxOH0dON0dPUGTdQA8EAOuth8nvH0CquPPQoz9fsiwwKaAHRZIjqNJVpepMkAMm9uu4TATcqm9akfXOSvtODXZM3+i5vifmMK3PssAGhxcpa+SvfnR7biURFeAdkdF2ME9l7v6iZl1Sv0KArFoofIYGSCKvuSs6WFq8M7L+vaLSkNykk6ccNNkXfI3jRrPWB2jL8eDMxtMwLgUCw5kJp5Xc+2Fz4DY7Jf8IdpOqbsTikPU5v2XW0NtMvTVAf6q1XbuwlNHfr/Vp4/gnKo61b1MjCj31GP/XUAV1koITNCJNls3oEOtHT4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(55016003)(86362001)(4744005)(2906002)(41300700001)(4326008)(8676002)(54906003)(64756008)(66446008)(66476007)(66556008)(316002)(8936002)(6916009)(76116006)(66946007)(52536014)(5660300002)(33656002)(107886003)(122000001)(26005)(9686003)(71200400001)(38100700002)(38070700005)(7696005)(6506007)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Sm9oN3dUUVdsSVpmS1RHSk82bkdNS3lEWm85Nk03NUxwVGlWaE0vcWIyMmRa?=
 =?utf-8?B?WTY3NXFGR0QzNnpVdXh3cG5GOHdkekRKQ2dlUDNWM0x1QW9Wb09ETXVPYk1R?=
 =?utf-8?B?bHFNeVhGbS9xVUtOU3c4NEp4cnE0dzc2ekV5VlBVZ0VLSlVmSGl4VnU5Wm1I?=
 =?utf-8?B?QVJvbXFlR25jTFU4TG83NTJOK04xSGttVzRoUFRRbFJ3dGlsc2VrbzFCM3dh?=
 =?utf-8?B?cG5abUpkQXViTVhsK1lxVDZNOHZHRkFxcDhvZ0lZWEZUZDVMczI1dzAyQVhS?=
 =?utf-8?B?OG1qb0h3Q2NGRzVWb05uWXhJK3F4ZTk5TmlJby9qNmxEc25Gc25lNmRoUHJo?=
 =?utf-8?B?NjdYNG9KcU5RenoydmpFSXJIbU9GOFBxNmJGY2pwM2tKZjdYSmNzYmJ6RU44?=
 =?utf-8?B?ekh5dmVsRUczcHFuaWxBbmZPeThGWUhpMThvdTJVclU3empIazRpSnlsMGZ4?=
 =?utf-8?B?NHFpQUFRbjRXV1hRREptTXM0MlRZeHdZZ3EvTnNhRU5ueW5mQVdRNmZjWmRr?=
 =?utf-8?B?ZDNnTjlMZDhDaTBTY0lHMWxMWnZudERuUEg0bWlmT0JYL21FVmJVbmdiTGNU?=
 =?utf-8?B?RXVLZFJPQnczYkJ4b21wd3RsVlE1NHEycnp0SnRzMk8yRnhYZXA2NktJdjFJ?=
 =?utf-8?B?V2ZRRDJjaG1FWHpQUVJSYUNFeXQ5VmFXRVBhVC80cGtvR1AyVENHQStJR05j?=
 =?utf-8?B?emRnMUFjNG1OZ2tNeE1ZbkNDRUdYUWdkcDdmYWlKNDB1WThLa2V2NkNSakow?=
 =?utf-8?B?VmxxNzRJRGMrb2pzMU03SnlLbWswT01uR0I5bHBTN0hLTWVEc3VDZnNFUkp5?=
 =?utf-8?B?S2N0TXRlNlFld0lHdWptNmx2M3g2NnJhRmxQZjNENnVhWEJFbjlrQVFoZHVi?=
 =?utf-8?B?VWJJcjcrYkpVUUVJT3hhT3htQWJmOEo0MHNsTEMwVUVQaXUybjdZV0dHVnph?=
 =?utf-8?B?dTFYT2ZmOVViZGJCYmFod3c1dXdPd25YSzVicFFOdEtDM2lYZTFrZDlzbGtU?=
 =?utf-8?B?ZXRScHVOY01DNmFBSFJ5RzRDRmlWYTRrZnF6cmlGY2JNSDBOWm51aGRYT09I?=
 =?utf-8?B?OXZRUUczRjBLQU81WnZJeU4rZ0ZlLyticTMrdkM1U2hpeXJTSUhJalFDcFVS?=
 =?utf-8?B?cENwTmFBSEdEd0lSZmhQaHlpT09ObEZXVVhCTjdMM2NVa3p1SjlJZmM0WmpF?=
 =?utf-8?B?eWc1dmpEVDREaER1clZTemlwbG93TlpEVmluQjNQdUU2cTl3Y2pkU1pnOUhu?=
 =?utf-8?B?R3VSWVhjNUpTYWFPKzJCMGlXbndTc2ZvcnN5dGNwNHIvRWNvN2dOd1ZwODJ1?=
 =?utf-8?B?bWEyRWs2OGhtZTJPcVVnVVFMOU8yVjlNcHc1d2JNdWoxY0Z3dHFBMjVEa3BO?=
 =?utf-8?B?RnN0ZG0yc0RpU1JHZnA1UGJJd0MyQkRySC9qNy84WFIzcHNWM3hOcHkzSERo?=
 =?utf-8?B?V0UzbnBUQnZPOEMxS0JacjZRNmdkaXRwWUxWSHdoUCtONm1DVi83bFR5aWYr?=
 =?utf-8?B?dm1MZjhNdG1BOG1aeVpINFRQNnJ3c1hWVEFhR21JUVR5WFpCWC9CSm0rbjZO?=
 =?utf-8?B?YVBTZGQ1MDFvTFRPd0F4SWhJWkxONDJyeDdDQWZNczdkbElJS1ZtSncySjBp?=
 =?utf-8?B?NzlzR1pLOTRYZ0pLZ2hDYW9GSTBXMWdyVHJDSkt0U0piNDlPWmJoZHJmelVV?=
 =?utf-8?B?RWZ2dEtBWUlZZHFjNWdCK1cwb2Jaa3NqSUU5VGFsS2ZiQ0ZpN2UwVWs4d2t2?=
 =?utf-8?B?aFZBb2ZmaXEzWVllZDJaZXNOaVhhazd6MHRXeTJmcHNXRTVGQzFlek0wZ2g1?=
 =?utf-8?B?SEVKSkxQcXBmdnkvUTYrcTlZSCsrcnRWNncwWVlhUytBZkNCTGVDV0VOVzc5?=
 =?utf-8?B?TUd3NktjK3FBOTYrMjRxV2wyV0h1QVBtZnpxZUpkbzFaZVpGWkFJTk9XRTFO?=
 =?utf-8?B?TGdoS1RYQnYzWXk1clRnWUF5eU5VSGkyeHp6STNqeEdQbkcrVFJRMklWRktX?=
 =?utf-8?B?YkUwNTFqdFlqNUE1ODQwQ3ZDaXpsdUxveVlMUkJJNnUxbmpCM1E5NTVaTklH?=
 =?utf-8?B?OHFUUkNmWFo0VGZ2RGEwbERKd0k1U0FLaDdpY1duUm8vM3FnU0x1aWM0b3BK?=
 =?utf-8?Q?pXXM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edbf6d75-ce83-4a29-eabf-08dbcebfd826
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 03:19:16.2943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sxvVRR5+2Om4DIGvaGiEhwt2D6E3fiLmEbGA2tCRTscFy9keDmqBGJJY7KnQQ7vnKNQ4w5gO6/7doFqpaIh9EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6833
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQo+IEZyb206IHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnIDx2aXJ0aW8tY29t
bWVudEBsaXN0cy5vYXNpcy0NCj4gb3Blbi5vcmc+IE9uIEJlaGFsZiBPZiBKYXNvbiBXYW5nDQo+
IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMTcsIDIwMjMgNzozMyBBTQ0KDQo+IEkgZG9uJ3QgdW5k
ZXJzdGFuZCwgd2UgdHJhcCBSU1MgY29tbWFuZHMgYWxyZWFkeS4NClRoZSBkZWZpbml0aW9uIG9m
ICJ3ZSIgaXMgc3ViamVjdGl2ZSBkZXBlbmRpbmcgb24gd2hpY2ggc3RhY2sgeW91IHNlZS4gU28g
bGV0cyBzdGF5IGF3YXkgZnJvbSB0aGF0LiA6KQ0KDQpGb3IgcGFzc3Rocm91Z2ggbWVtYmVyIGRl
dmljZXMgUlNTIGNvbW1hbmRzIGFyZSBub3QgdHJhcHBlZC4NCkFuZCBkbyBub3Qgd2FudCB0byB0
cmFwIG1vcmUgY29tbWFuZHMgb2YgZGlmZmVyZW50IHR5cGUgb2YgdnFzLg0KQW5kIHRoZSB1c2Vy
IGRvIG5vdCB3YW50IHRvIGtlZXAgYWRkaW5nIG5ldyB0eXBlIG9mIHNvZnR3YXJlIGZvciBuZXcg
ZGV2aWNlIHR5cGUgaW4gaHlwZXJ2aXNvciBmb3IgdHJhcHBpbmcuDQoNCg==

