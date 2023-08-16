Return-Path: <virtio-comment-return-7166-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70393EB64DD
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 04:10:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8F68C157EEA
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 04:10:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6A3969863FE
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 04:10:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5273498633B; Wed, 16 Aug 2023 04:10:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3B4229863D1;
	Wed, 16 Aug 2023 04:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JARVMtXZ7+Qwy+C7f5bA/pwkqfFZhik2nBUp/9jKifHa1vzW4I0nJ/lsQdMcOghZXgp8+adbgl3MGbhxlZs49YILhQ8YgJ0KvSGwsr/yyumwhZWJUlHRq1IMGWYJ6tdpRik9ExawTAsPvLAjRLEGio1rr44U8SgXqLqzaOV7dNWrN3ujxUnbY2Z3yvAtLyuXfgV8FH5jVlcabXeqwr7gBTYDcYlROwo8a0Jj/tsj3R2tl8ndjwdW7yEQy1bklMrzGV2iJFa8PjGbV9vZp7POPq8nvfZDJUJjYG5INkQbq1ueg0XmfesA8+yv3+6tKF6B+GilSZdxRnS3xL9JBMlX4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0my6yYGPYDGOFneXgrps3SsUyI5z6lIvrwnCscazlRI=;
 b=Z3OsMzSSZ5QpujX5aBrmwv7C1EuFoYhUpvgBaRyWGmx33W5Dz1Wh12nnpo5+EkRjrvM8hPDIna/Bvp+61JvQBVmKA/dXuMiegKNBr2t9S0YCKkviCBcNajdN+8aHGMgmqAabW28PgKrqE8wa1Dg+Lun5/3/10vJ14Pvj5OKcl72DgNhtyMY6rtOiPp1gUadoQR1VAUpHUOe/iAY3GV0hr5piGD0FqtvSUPgGsn19t/1uDjTwO6nY2QSlwEzs/9Cql4OS+QOdn1ynwPbKlWBuUIdQAwR99zD6BuWmemTFiQHQfjzsSWj4z9gn8I2shJdZPaDicE1O3nIllAWFVoKjcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
CC: Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Shahaf Shuler <shahafs@nvidia.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Willem de Bruijn <willemb@google.com>,
	Stanislav Fomichev <sdf@google.com>
Thread-Topic: [virtio-comment] Re: [virtio] [PATCH requirements 6/7]
 net-features: Add packet timestamp requirements
Thread-Index:
 AQHZvd/P0UZ+85qNOEywdrF+BteiUK/hvTGAgAF2gACAAPOIAIAG3dyQgACPDQCAAN4b4A==
Date: Wed, 16 Aug 2023 04:10:21 +0000
Message-ID:
 <PH0PR12MB54810B9363ACD3E13FE328C5DC15A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-7-parav@nvidia.com>
 <1691570137.0487022-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEs-d-zPLByDNuDNda7UPDsm6hgZKw-3A1aNA4npUsWy7g@mail.gmail.com>
 <CAF=yD-+LMY3yE3qtd4vHc8CGOz6UAf4njM2QiZcajrQgL=KZRQ@mail.gmail.com>
 <PH0PR12MB548121B3CDF46BBCA4E0D07CDC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAF=yD-LXtrQeW0GnTR0BeDuExN5aBLC4dGEfdWbjtxmhNY2G6g@mail.gmail.com>
In-Reply-To:
 <CAF=yD-LXtrQeW0GnTR0BeDuExN5aBLC4dGEfdWbjtxmhNY2G6g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB8547:EE_
x-ms-office365-filtering-correlation-id: 1d66df48-08b9-4d65-2bd5-08db9e0eb549
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 kuAeQrR+daXRcK4+Badgz9gVV/cmlQ1TyDo9Mm4bKnpZHFJ2IkXvYCb72InwTOapJDsSBFNtVDPjKVoHr2YcQzGLLaNFe/wddXJ4xSR/ZIt8KYgZnhdd4LX4jTgGFcrbe/HBXjMiLchk6Fq2i6EYTINa9ZZKXPeDbiPgXmrGTXlBZitT5HmHHWRYbx57mt4aK39l5DDxHl+xgpBgiF3zFssFaHd52rRvbmyBponu2pVbdQ72IiIPwlTX+PUMLd4H4UlHFbGep4gJF1kKBvtVeQzIRun0N0klvU/+ekbxC6NWRd/nWx8B8x7PK5DminHiYX3nk+bB1+w4pSvZmIjxeGhtx5ILySdQLGkKMzknYyOzIQaFf10wXeWk+w08AsbmJJT/wySP8Izn/IchhteSK0/WshKkxeVy98YBIGFlPgjBFzJYjCX9KvtTnuBjs8ItXu0NXkWT9wJelH6LdyrRQ75MCNkHoR9+jEwNPsMRPrY5DM6abixqaC0TtPOwcDOJdGGtUcLQLAuEO94BCAgZ+TQQvqsdQIFHHTC4cGu2YgcknxHMzbT9a5htV+gRyLXjF1KPff7GVB8o8Dpx3gA1HiTPHXfnJ/ZDeA505MAnK6YOgYzB1Qxp5kT03Ev+s29Q
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(1800799009)(451199024)(186009)(71200400001)(64756008)(54906003)(66446008)(76116006)(66476007)(66556008)(66946007)(7696005)(6506007)(2906002)(478600001)(9686003)(26005)(6916009)(5660300002)(83380400001)(52536014)(41300700001)(316002)(8936002)(4326008)(8676002)(122000001)(38100700002)(38070700005)(33656002)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TDFVeWt0VWdkWkZaSHk4QjdQL1MxMlBQOVlsVFd4aUc5U0VabmlWd1VVemdy?=
 =?utf-8?B?UkVvQkpvRkk3RmdYbWpFMTk0T1M2VkRhU2tFcm9EMlFNNThwbW0wekg0RVdQ?=
 =?utf-8?B?WlVMQk9VTktHM3BKNUcwaVlaUjAvbDR6SWJqOUNYeGhiOEJpSldiZS81cnRo?=
 =?utf-8?B?MHlid2NMNWFacFN6QjRITVc2OVZrd2FySG5ZRzd1N2I5V0hHY1Ryb0xqZGtl?=
 =?utf-8?B?QWFLWEdYZzZPaDVmeGF6dWRyQUxWbnhCUVk3bHNRWENSWnBXYWNUa1hEU2FJ?=
 =?utf-8?B?K3NuaWR5aFViaUU3VnNrYVliYXEvUkg5a1dQcGVmZ2VENGUrMTJOQUlzUFJs?=
 =?utf-8?B?Y0h5SzNoYjByVjQ0Lzh6RmhqWnV5ZHhNQjh2K1BUT2dqU3FxdnBGdHUvS3VT?=
 =?utf-8?B?MThQSFFvZm1GL1l1N29nUnowZ2hEVnNBSHd5Tm0wK0p4U25vclg2QlFTaEti?=
 =?utf-8?B?Vk5nRGgrYlNrY2NVYnoweHFoTCtBK3J5M3g3enBxby80eVd4WU5kZFhKUGNh?=
 =?utf-8?B?aVQwN1hGRTBMQ0prYy83RTNSc1ZhUkpielBHdkxobHd2ditPV2xXSTUxV1pH?=
 =?utf-8?B?YjMvS2VLbGJoUHRCd0syZUZySXdiM0FjQVBCM0FtTVNMbXRQTHZaUFY2NS9q?=
 =?utf-8?B?UHVRZ2lYMENQZHlCK0FjZ0FQLzdkNzV4d3hBVktqTnY2UU05VFhabVlzUzRZ?=
 =?utf-8?B?YVhEZWFwZFdNN0luRkM4Rk1vVnEwRytENXZiY0Q4eTFmU2I4QmFlSjVpL3BG?=
 =?utf-8?B?bmcxTWxnbExQTUhZYWpOZ3ZLNlhCSzlUN0F3anFsOGRWTUJSWUxCdFFzckRN?=
 =?utf-8?B?N0lNNExMaGswT0RNQlJOWHZHL1FycFpyS2JQUDBLckkvUFhKUE5KQVpWaUFE?=
 =?utf-8?B?SjlrRVNMRVdQMmdlMjdmd0dONThWamZqWnlOZWU5WmY2ck0xV2MzYllTU25Y?=
 =?utf-8?B?c3NSNVUyYkRMVmhCc1pHL1B0MHRqekNHTVZVbWcybWlPNVJuT2pvL1NuRnk1?=
 =?utf-8?B?V1M5OVBwNWU3aVpuSkNXbmdReUhuaTVtdkxKbXZ6UytYZHcxV1EvRnc4QUVC?=
 =?utf-8?B?QXBLN1Mva0d6SUpvN2pOdXNqY2sxc1hydzhIOCtpbG1nUUZ0dFpBNCtwM1Vy?=
 =?utf-8?B?N0dsdnA0Z2dkNjRBTzdBeVdHQkhSZnB5UTRQZEZHOHhROWZBU0hiaVhlMkV1?=
 =?utf-8?B?b2l2SWdmQ05mRTA0TGh0Q09Mc2J1dVc3d2RJdk1wdUIyQjkwVmpjUjFXcHox?=
 =?utf-8?B?MzdqajhMa1ZYR3F5di94S0V5aUlUYytGbEdDQkVpdGloMWZaMDJ3WVRmNHUw?=
 =?utf-8?B?eFJpcllNczFZVy8yWEFkTHppcEFlUXNrKzM3NllQcENVcFdhL3N3d205MnFz?=
 =?utf-8?B?bzdGTlljVnhFbjdJSEtyWUZzajRYQ1FuNFNqWWlmQ2VoQTduNXhuWUdMdFdl?=
 =?utf-8?B?T2N5TXlremxhWW1lQ3BVWGszb016Z3NRdGplb2VxWkRxcFVWL3RnUlRTS3Za?=
 =?utf-8?B?K0gyOTdmK2kzajMwbE8yR1RTS0dOVU93OTl3dUFsK202Rm5NM3A3eG5QSCtH?=
 =?utf-8?B?WmJad1J3Qk14d0ZLRjIwTXNTTnlmTlNWREM3QVpPNEZ6QzljNXV2eUVGcWJ1?=
 =?utf-8?B?a0o3SzE4dnl5RzR5Skt6djNySWNjeXRlRDhiQ1NKTkZrZTdUa2VUOENhcU0x?=
 =?utf-8?B?eGhQWG9VWktmQ2tsRklQQlVpMVRadDZ4Y3JiQ1ZYUXpmZnZPTERuL3I4Rnds?=
 =?utf-8?B?U2dDdE1FaEJTNkQ0azRXL09mYnZtRkorS2hreWt0R01lUHFMWVY4eVRaNVhO?=
 =?utf-8?B?V2J6b2RibkMyQXI4d2NHcGxETDVCSlRmSEsvWG5UY0lMMDFBVzZZWGlZRUov?=
 =?utf-8?B?eVUvQW1WbXlYVWpiVHdmcGZnamZhZWV4V2tHUkFJRnpQTFZ6V2RQc0hOWVpw?=
 =?utf-8?B?cS81YVVrc2Z4ZGM1REZheGxXbUlxU3ZoRVNUYkZkeWNTZ0FFelhOWUxDZDBV?=
 =?utf-8?B?SXNxSXY2RjdsYmZEWmhCNkF5UGQ5WkVSNC8yUkg3d2s5VXN5cXYvMTFVUnlp?=
 =?utf-8?B?T2w3dEtXNXhNWlU1TlA0bkpPUWl4eGVKM3VRbDN6dXZnWjJmMDhzUlkwbDhO?=
 =?utf-8?Q?GbvI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d66df48-08b9-4d65-2bd5-08db9e0eb549
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 04:10:21.1207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R52IvAw04VN2b8f5he+cLhDVZzFSKELm5bfhHriWABsWU7UAYWmP5bVoCoYTzDWUYYuaj/fxXfjqPPE8u1PdTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8547
Subject: RE: [virtio-comment] Re: [virtio] [PATCH requirements 6/7]
 net-features: Add packet timestamp requirements

DQoNCj4gRnJvbTogV2lsbGVtIGRlIEJydWlqbiA8d2lsbGVtZGVicnVpam4ua2VybmVsQGdtYWls
LmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDE1LCAyMDIzIDg6MjEgUE0NCj4gPiBUaGFu
a3MgZm9yIHRoZSBhYm92ZSBwb2ludGVyIGFuZCB5b3VyIGlucHV0cywgd2UgYXJlIGNvbnNpZGVy
aW5nIG1hbnkgb2YNCj4gdGhlbSBpbiAxLjQgdGltZWZyYW1lLg0KPiA+IE1hbnkgYXJlIHBvc3Qg
MS40IHNvIHRoYXQgb25lIGNhbiBpbXBsZW1lbnQgYWxzbyBpbiBwcmFjdGljYWwgdGltZQ0KPiA+
IGZyYW1lIDopDQo+IA0KPiBKdXN0IGJlIGNhcmVmdWwgYWJvdXQgcHJlY2lzZSB1c2Ugb2YgdGVy
bWlub2xvZ3kgYXJvdW5kIHRoaXMgdG9waWM6DQo+IHVuY2VydGFpbnR5LCBwcmVjaXNpb24gYW5k
IHRoZSBsaWtlLg0KPiANCj4gRm9yIGV4YW1wbGUsICJhIHNpbmdsZSBNTUlPIHJlYWQgb2YgYSA2
NC1iaXQgcmVnaXN0ZXIgZ2l2ZXMgdGhlIGxvd2VzdCBsYXRlbmN5Ig0KPiBwZXJoYXBzIGNhbiB1
c2Ugc29tZSBjbGFyaWZpY2F0aW9uLg0KPg0KTG93ZXIgbGF0ZW5jeSBjb21wYXJlZCB0byBhY2Nl
c3NpbmcgaXQgdmlhIGN2cSBpbnRlcmZhY2UuDQogDQo+IEluIGNsb2NrIHN5bmNocm9uaXphdGlv
biwgZ29hbCBpcyBub3QgdG8gbWluaW1pemUgbGF0ZW5jeSBvZiB0aGUgc3luY2hyb25pemF0aW9u
DQo+IG9wZXJhdGlvbiBpdHNlbGYsIGJ1dCBvZiB0aGUgY2FwdHVyZSBvZiB0aGUgdHdvIHRpbWVz
dGFtcHMuDQo+IA0KUmlnaHQuDQo+IFdoaWNoIGlzIHdoeSBQQ0llIFBUTSBhbmQgb3RoZXJzIHVz
ZSBhIHNhbmR3aWNoIG9mIGhvc3RfdHMgLSBkZXZpY2VfdHMNCj4gLSBob3N0X3RzLiBUaGUgbGF0
ZW5jeSBiZXR3ZWVuIHRoZXNlIHRpbWVzdGFtcHMgaXMgd2hhdCBtYXR0ZXJzLg0KPiANCldpbGwg
dXBkYXRlIHRvIGZvbGxvdyB0aGlzIGFzIHdlbGwuIFdhcyBob3BpbmcgdG8gbWVyZ2Ugd2l0aCB0
aGUgcnRjIHdvcmsgb25nb2luZyBpbiB0aGUgdmlydGlvIHRvIGhhdmUgYXMgcGFydCBvZiB0aGUg
bmV0IGRldmljZS4NCg0KPiBBIHNpbmdsZSByZWdpc3RlciByZWFkIGlzIGNlcnRhaW5seSBzaW1w
bGVzdC4gQW5kIGl0IG1heSBiZSBjb3JyZWN0Lg0KPiBCdXQgYmUgY2FyZWZ1bCBpZiBpdCBpcyBz
dHJpY3RseSB3b3JzZSB0aGFuIHJldHVybmluZyBhIHBhaXIgb2YgdGltZXN0YW1wcywgbGlrZQ0K
PiBwdHBfY2xvY2tfaW5mby5nZXRjcm9zc3RzdGFtcC4gVGhlIGluaXRpYWwgcGFydGlhbCBpbXBs
ZW1lbnRhdGlvbiBzaG91bGQgbm90DQo+IGJlY29tZSBvYnNvbGV0ZSBhcyB3ZSBmaWxsIGluIHRo
ZSBkZXRhaWxzIGxhdGVyLg0KPg0KSSBndWVzcyBpdCB3b24ndCBiZSBiZWNhdXNlIHNhbmR3aWNo
IG1vZGUgaXMgc3RpbGwgcG9zc2libGUgd2l0aC93aXRob3V0IG1taW8uDQpXZSBjYW4gbW92ZSB0
byByZWFkIHZpYSB0aGUgcXVldWUgaXRzZWxmLg0KIA0KPiA+ID4gVmlydGlvIGRlZmluZXMgYm90
aCBhIHZpcnR1YWwgaW50ZXJmYWNlIGFuZCBvbmUgdGhhdCBjYW4gYmUNCj4gPiA+IHN1cHBvcnRl
ZCBieSBoYXJkd2FyZSwgc28gaXQncyBub3QgYSAxOjEgbWF0Y2gsIGJ1dCBtYW55IHN1YnRsZQ0K
PiA+ID4gcG9pbnRzIHByb2JhYmx5IGFwcGx5IHRvIGJvdGguDQo+ID4gPg0KPiA+IFllcywgaXQg
ZG9lcyBhbmQgdGhlIHByb3Bvc2FsIGhlcmUgaW4gZmlyc3QgcGhhc2UgaXMgdG8gc3VwcG9ydCBi
b3RoIHNvIHRoYXQNCj4gcHJlY2lzaW9uIG1heSBub3QgYmUgbnNlYyBsZXZlbCBidXQgYXQgdXNl
YyBmb3Igc2VtaSB2aXJ0dWFsIGludGVyZmFjZXMuDQo+ID4gQW5kIHByb2dyZXNzIHRvd2FyZHMg
c3VwcG9ydGluZyBQVE0gYWZ0ZXIgdGhhdC4NCj4gPg0KPiA+ID4NCj4gPiA+IEZvciB0aW1lc3Rh
bXBpbmcsIHRoZSBkaWZmaWN1bHQgcGFydCBpcyB0aGUgdHJhbnNtaXQgY29tcGxldGlvbg0KPiA+
ID4gc3RhbXAsIGFzeW5jaHJvbm91cyB3aXRoIGRhdGEgZmxvdy4gSWYgdGhpcyBpcyB0YWtlbiBv
biB0aGUgZGV2aWNlDQo+ID4gPiBiZWZvcmUgb3IgYXQgdGhlIHRpbWUgb2YgcXVldWluZyB0aGUg
Y29tcGxldGlvbiB0byB0aGUgaG9zdCwgdGhlbiBpdA0KPiA+ID4gY2FuIGJlIHN0b3JlZCBpblwg
dGhlIGNvbXBsZXRpb24gZGVzY3JpcHRvci4NCj4gPiBBdCB0aGlzIHBvaW50IHdlIGFyZSBjb25z
aWRlcmluZyBiZWZvcmUgdGhlIFBIWSBhbmQgYWZ0ZXIgdGhlIHF1ZXVpbmcgYXMNCj4gbGlzdGVk
IGluIHRoaXMgZG9jLg0KPiA+IFNvIHRoYXQgY29tcGxldGlvbiBjYW4gaG9sZCB0aGlzLg0KPiAN
Cj4gQWNrLiBTb3VuZHMgZ29vZC4NCj4gDQo+IFRoaXMgVHggdGltZXN0YW1wIGlzIHRoZSBvbmUg
d2hlcmUgeW91IHBvaW50ZWQgb3V0IHRoYXQgbXkgc2VyaWVzIHdhcyB3b3JzZQ0KPiBiZWNhdXNl
ICJNYWlubHkgaXQgaW5jdXJzIHlldCBhZGRpdGlvbmFsIERNQSBmb3IgdGltZXN0YW1wIHRoYXQg
bXVzdCBiZQ0KPiBhdm9pZGVkLiIsIHJpZ2h0Pw0KPiANClJpZ2h0Lg0KDQo+ID4NCj4gPiA+IEJ1
dCBpZiB0YWtlbiBhdCB0aGUgUEhZLCBzYXksIGl0IGlzIG5vdCB1bmNvbW1vbiBmb3IgdGhpcyB0
byBoYXBwZW4NCj4gPiA+IGFmdGVyIHRoZSBjb21wbGV0aW9uIGlzIHdyaXR0ZW4uIEFuZCBpbnN0
ZWFkIGEgYmxvY2sgb2YgZGVkaWNhdGVkDQo+ID4gPiByZWdpc3RlcnMgaXMgdXNlZCBhbmQgdGhl
IGhvc3QgbXVzdCBwb2xsIGEgcmVnaXN0ZXIuIFRoZXJlIGFyZQ0KPiA+ID4gZXhhbXBsZXMgb2Yg
dGhlc2UgaW4gdGhlIExpbnV4IGRldmljZSBkcml2ZXIgZGlyZWN0b3J5LiBGb3IgdmlydGlvLA0K
PiA+ID4gaXQgaXMgcHJvYmFibHkgc3VmZmljaWVudCB0byBvbmx5IHN1cHBvcnQgdGhlIGZpcnN0
IGtpbmQuDQo+ID4gPg0KPiA+IFdlIGRvIG5vdCBoYXZlIGdvb2QgYWJzdHJhY3Rpb24gb2YgdGhl
IFBIWSB5ZXQgYW5kIGl0IGlzIGJpdCBoYXJkIHRvIGFkb3B0IHRvDQo+IHBoeSB3aGVuIGl0cyBt
aXggb2YgdmlydHVhbCBhbmQgcGh5c2ljYWwuDQo+ID4gU28gY3VycmVudCBwbGFuIGlzIHRvIHBs
YWNlIHRoZW0gaW4gdGhlIGNvbXBsZXRpb25zIGZvciB0eCBhbmQgcnguDQo+IA0KPiBTYW1lIGFz
IGFib3ZlLiBTb3VuZHMgZW50aXJlbHkgcmVhc29uYWJsZSB0byBtZS4gSnVzdCB3YW50ZWQgdG8g
cG9pbnQgb3V0IHRoaXMNCj4gbGltaXRhdGlvbiAvIHBvc3NpYmxlIGZ1dHVyZSBleHRlbnNpb24u
DQoNClRydWUuDQo=

