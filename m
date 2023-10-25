Return-Path: <virtio-comment-return-7956-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0739C0032E
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:20:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2348526A44
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:20:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BD4E9986A76
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:20:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4BA149869EB; Wed, 25 Oct 2023 10:20:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D1BF29869E5
	for <virtio-comment@lists.oasis-open.org>; Wed, 25 Oct 2023 10:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/UL+ZsvAs/iNHqfAdw/N9pmR3biZz3DztXL4sSKO0GRbYYo7tT/gxKCB29AYcoQJsyLJ5axdqFseZO1+e8Rz6GAqekFOzuro2awjLCuxxeBj3BA6Yg6e6xwFHmwPuwq97PXcZNG7PmdwbiowkCx1A/jUG412eHn/WGGTpQSMmKLBrdf629RfHSm45zxOuXzdmu8wkrBtUqOh+Tm7Q9E08lNWfB9pstvTDFcc13jGCl0k7Za/bWZnQyVVyXWMsFTRrmk3VevjwdUZqUzQkXOL9QKaKydkKzAzNxCuuLumpdDPErrm5lz4/HJnWWbxL/ZH8Fu7k6m8Mom/Z7fDhu6EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HigHqrPenHsJuNqveWxLzbIN38IFrK2a8w8MJUttb0g=;
 b=aXqwlksCx8XfmQNKOgsXLSk/DhSgsOk9kZRMLZzGJWdkjoJyvat4+k3xU+0fa37a3IRs+b1mrGF+Ly6o5CA5QX4+IIDwFDNJWuKJhHTK39r7Q6UKAVKZHvoyuLj1dPccutxfV7X1P8K7QLNB5PNQVkcxcMLa+c86TUZ2+I6sirxSrKg4rQtY3srDfZDSCAa6aul3g6SXK7wLKOAEbq6tX/kfwyO+t0dOW/hiMtOpk+YZLZ8sQb7yt66K5R5QOXfbcESRNr0+YS2DHDixyAwcPneSqXTLc6KKPAL4wg1qsK+UXe7doM51m1TZY/lgkeQxEOjLfQWGLSxhhN+j8k/jcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
Thread-Topic: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage
Thread-Index:
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0IABwd9wgAZBiUCAAAgxgIAAAJFwgAAH/ICAAAX5IIAAA0oAgAADzbCAAss+gIAABpsAgAAAKmA=
Date: Wed, 25 Oct 2023 10:20:02 +0000
Message-ID:
 <PH0PR12MB54818C307FCE4407C0C3222EDCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231002051601.6626-1-parav@nvidia.com>
 <20231002051601.6626-3-parav@nvidia.com> <871qdte8r6.fsf@redhat.com>
 <PH0PR12MB54812DF4DB53917D4895FFCADCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87sf68cjn0.fsf@redhat.com> <20231018062704-mutt-send-email-mst@kernel.org>
 <87pm1cchuq.fsf@redhat.com>
 <PH0PR12MB5481DB9D38E58522F0B15EEFDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548188345E2CF3B8AA5E2DEDDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB5481D21AD4CD4C649C4E023FDCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87zg09bfwg.fsf@redhat.com>
 <PH0PR12MB5481A3846046A484EFE20408DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87wmvdbehg.fsf@redhat.com>
 <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87ttqhbcy7.fsf@redhat.com>
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87r0ljatuf.fsf@redhat.com>
In-Reply-To: <87r0ljatuf.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB8600:EE_
x-ms-office365-filtering-correlation-id: 544ff806-802c-41fb-0b66-08dbd543f385
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 t6VYbanZ7zqy8J7z1yZPJAeJZLWfdQ2L/tr6p9ktuozUsZQDehE9jbMwTI9QB8hKyTeEqRhJ8qqGsnZEPy4Apyrjhq0bAOf1zwBOiNycqGrTbx/4g5yFys6+Gr+0t3ziLmik6v46mK7/HjwXFzEXn4SxottmmGfcyjsdIQ9baV78tgGPuDYEVAJE0+mJBiqbMS2ZBj7wL1qGyl+AmMs39MH4bbItC2yAtJLoz6xd5pl+3MNaAxsv3FSjgksMV2haJyF0Or0YNvrDbdOwd0p7QRgY5bOonWGqNalOwqNCga09mYnpi5w2DvPPIr6fpG0M0HMk4C5a9SXE4gUneVxgBdoEKaNHXu/6uUq082NEff8nBQDrGPkZpVppgl6PnVYA+y+25TMbjRyBWV5VLbPPtNw7Bky1u0pYgfA+XesLNDOtlZ2mUq95KIYWdAFsC02qic1WsuEvlVeLnRBf50TCciK07d8Xjjt2SXG2tIstDgWGBUn0bAMbpeq2ZaqE0k9RIfAAvCaT8giOj8RR/WCAXF+ux3jsj/s14EUQVqZA7gM7FWBXmkGLYZb2JQSaoeEDAQGbIcbACWWWMG/MaRnYj1vLNWXxm1LYSfz8oiOEukx9vM9vUIzPNl7FYxTmUBf1tl2Eu/iKvA6gF2XI1yQBwob6KNlwXzRsNbL4WchcA90zJVCD1I8IJqvt1W73lU6SqSxYPGWkB21Jd7QfLXPCXw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(396003)(366004)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(71200400001)(6506007)(53546011)(7696005)(5660300002)(8936002)(4326008)(52536014)(107886003)(478600001)(966005)(9686003)(83380400001)(26005)(66946007)(55016003)(66446008)(54906003)(38070700009)(41300700001)(110136005)(76116006)(64756008)(66476007)(122000001)(33656002)(86362001)(66556008)(38100700002)(316002)(8676002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y1NjQzdGZnRMU2xEa0k2M3RCSGhRTUl3VlJxQjFlWk9oR0t6MVlwVzJYVzJQ?=
 =?utf-8?B?R3grdWQrTHFXdzdJZ3lnWnQxV2k1WEZrNDdlNFM3czczZVVJeTZvYitkeUdV?=
 =?utf-8?B?cUVGcHpnbXRmSmc2b1pPN2ZrTXFFYlhTOHhWSWN4dGdTTnJTQ25MTWVNdWJG?=
 =?utf-8?B?dUVHR3FJWU9mU0VvbUFWTzE3T2xHK05kNHRreWtHTmtuVCs0d1lodHUyZmVJ?=
 =?utf-8?B?V3ZRa1RTRHM5VnNRVGNBQ1g3eC9YRWdDbXhadEw0V3BPNThma1BBOGpxUU9T?=
 =?utf-8?B?aEtWYUdKWEpWdiswZkhsaHhVZmxHTStNZ0tlZVg3cVJLMk83VkRwNW1hODUy?=
 =?utf-8?B?K0NFREhVWnlldGNwa2xNcWZ2Sk1MVStiZnZyY2J1R01LNXl6OEJtbUJzblRl?=
 =?utf-8?B?a0gwSXpINjlha1phR2Jqa3NYM0JCZnBDWUVyNUZSa2dSdVVvWEhtenZKYXZj?=
 =?utf-8?B?SkRHdGVyTzVvZFF6ditJOE9PQ0pmaURLdjhnSHN3Q1VwKy9KY2YvVkJua2c2?=
 =?utf-8?B?Z2tVRUtaTVdPSlptcjJ4U241MldTTEpxOGJoZVQvMnNUUENXTVJMTnpYYjFV?=
 =?utf-8?B?UFBucUQzbkJuYnNMSjlGbHpFaFd5L2J3dThGUGlPRGU0YlliRktPaXpyVnMr?=
 =?utf-8?B?Nk1TLzZLdGJVa01raE81cUNaWlVzbzNvRURBOEx6M0hoaExnM05ma0M2Z2xD?=
 =?utf-8?B?UTlFc2oyVkt0amRGSnVVYnJtZC9IamFCY2VEa1Myd21RYWUrRzdPakVKTWRJ?=
 =?utf-8?B?UWc5T0ZVWGV1YXB0bjF5dlNPZkdZMkhGbm9FOVQvVFY5U01jUEs5Mk1kNVhF?=
 =?utf-8?B?VmZxLzlaZWJXT2w1SXV5cWgwZnlSUVhtK05CdFZkN0wzWmwyL3NSOTdIa01T?=
 =?utf-8?B?Nmh5c3RySWNESjMwU0k1dlZxSzYxdWxFTSs5bnU4RkI0QVBsY2NYeXhtem5l?=
 =?utf-8?B?VGdlSjlFdGtSZzk1UkZQY214TDZqRWYrUWcxdVY4cFJLRnkrNDlsa2Ywekpq?=
 =?utf-8?B?OUhnQXFWTjJEV3d3OGIyWkc0WnRIOUJRZ09DVndBZmdMU1hicE5aOXg5Y3c4?=
 =?utf-8?B?MHRnckFXRXRINm84VTJYNkJZTERrWStPZFRrMFovZ2xUcUFnTFBTN0Fmd2la?=
 =?utf-8?B?RWtTWlZzU3NZb3VkQnFETDlzb3Zvak9UZE9MV0dnYTJRM2EyOGhZenMrRW9l?=
 =?utf-8?B?QjRYNFNkUXY0YXBVN1VpV3F4dy9TZjFLbVVpTmIySVh6M042d1ZtZFVWRkgx?=
 =?utf-8?B?aU5abjdGRE1SUTkvNDREY3FyRXlzbVlHSTVMRU1wanFoK2dneFVSYTNmZVlJ?=
 =?utf-8?B?Y2orWmd0ZklIQnhDVWZyUk8wZ2JBYnhSaW9pUVdPWGVrQ21FYkJKL29mWDVG?=
 =?utf-8?B?bTRpVEtSSFR1ZmxmbmZoamRvdVlGMERvZStCTG9vUGF0N2ZsSXJLV3dScU5Y?=
 =?utf-8?B?TFpOTWR3TWl6L2hFazI2K3EwNUY0SzkyM0JUVk9pZmZOWVg2eTdXT0ZVL21n?=
 =?utf-8?B?QjU1aEYxNGhWRUFYK2pUbTVvbkZWam4wamduZ0lQaWxWdTJUWFMzRDcrUE53?=
 =?utf-8?B?N3lNZ0JadS96clBQU1pBZ29FNnIyK1J3dnBCUHdqNXVXRXV3ZU93dFJkeGdW?=
 =?utf-8?B?akg4eWFEVUdWWERKaFNxTUJ0cm92cVNyakJXNTYraUxIS1hiNUhIL1IrZkR6?=
 =?utf-8?B?U0pPZ0RDYTM5RzZuUGhtdXA4aTRENWZ5YjFTSnNEVGFlc1NSVFIrOVdpSXkx?=
 =?utf-8?B?ZStML1hDYzBBN25udUZGQkg5UGdHY0l3V0dFL2JPaEs3TjJSUTJpaEpvV3NT?=
 =?utf-8?B?V0RwNklldzk1M01ETmFaMXpEMUMrQ3NBNTVabnRqVitZbjdzd1N5dXZjVGlF?=
 =?utf-8?B?Q2o5ejZHSDV4STdCUU5XZHEva3dPYmIxTUhtMEdPYjkzT0RXN284bkhVT01W?=
 =?utf-8?B?N09PVFFnMnkwejVraktUSityLzlmUDA0enlQQ2kzQmZzdFQ5TG1Ea1grVS9a?=
 =?utf-8?B?SEpCdzNpekZLU25wWDNza1RjR1d6Q3AwVmJMUnlYRml0Q24vc1ZBV2tCOTdn?=
 =?utf-8?B?ZTlyM1dNNTUwTVM3aEdpL2tycS9GY3pYa2VHWUhxcXVaWGZSRmxSaXBUYnQ1?=
 =?utf-8?Q?riHo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544ff806-802c-41fb-0b66-08dbd543f385
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 10:20:02.8028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D/dD9Hz/A31Ub6hzshR7P15ynM1XzQjRVJ/xCVJG5hDuNlylSFguqjD/CKpFrfZQwUR7yseYftKVcggq0iBfhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8600
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

DQo+IEZyb206IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIE9jdG9iZXIgMjUsIDIwMjMgMzo0OCBQTQ0KPiANCj4gT24gV2VkLCBPY3QgMjUgMjAy
MywgUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+ID4gSGkgQ29y
bmVsaWEsDQo+ID4NCj4gPj4gRnJvbTogUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0K
PiA+PiBTZW50OiBNb25kYXksIE9jdG9iZXIgMjMsIDIwMjMgODo1MiBQTQ0KPiA+PiBUbzogQ29y
bmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+OyBNaWNoYWVsIFMuIFRzaXJraW4NCj4gPj4g
PG1zdEByZWRoYXQuY29tPg0KPiA+PiBDYzogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Bl
bi5vcmc7IGhlbmdxaUBsaW51eC5hbGliYWJhLmNvbTsNCj4gPj4geHVhbnpodW9AbGludXguYWxp
YmFiYS5jb207IFNoYWhhZiBTaHVsZXIgPHNoYWhhZnNAbnZpZGlhLmNvbT4NCj4gPj4gU3ViamVj
dDogUkU6IFt2aXJ0aW8tY29tbWVudF0gUkU6IFtQQVRDSCB2MyAyLzJdIGNvbnRlbnQ6IFN1cHBv
cnQNCj4gPj4gZW5hYmxpbmcgdmlydHF1ZXVlIGFmdGVyIERSSVZFUl9PSyBzdGFnZQ0KPiA+Pg0K
PiA+Pg0KPiA+PiA+IEZyb206IHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnDQo+
ID4+ID4gPHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLSBvcGVuLm9yZz4gT24gQmVoYWxmIE9m
IENvcm5lbGlhIEh1Y2sNCj4gPj4gPiBTZW50OiBNb25kYXksIE9jdG9iZXIgMjMsIDIwMjMgODoz
MSBQTQ0KPiA+PiA+DQo+ID4+ID4gT24gTW9uLCBPY3QgMjMgMjAyMywgUGFyYXYgUGFuZGl0IDxw
YXJhdkBudmlkaWEuY29tPiB3cm90ZToNCj4gPj4gPg0KPiA+PiA+ID4+IEZyb206IENvcm5lbGlh
IEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPg0KPiA+PiA+ID4+IFNlbnQ6IE1vbmRheSwgT2N0b2Jl
ciAyMywgMjAyMyA3OjU4IFBNDQo+ID4+ID4gPg0KPiA+PiA+ID4+IE9uIE1vbiwgT2N0IDIzIDIw
MjMsIFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4gd3JvdGU6DQo+ID4+ID4gPj4NCj4g
Pj4gPiA+PiA+PiBGcm9tOiB2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy1vcGVuLm9yZw0KPiA+
PiA+ID4+ID4+IDx2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy0gb3Blbi5vcmc+IE9uIEJlaGFs
ZiBPZiBDb3JuZWxpYQ0KPiA+PiA+ID4+ID4+IEh1Y2sNCj4gPj4gPiA+PiA+PiBTZW50OiBNb25k
YXksIE9jdG9iZXIgMjMsIDIwMjMgNzoyNyBQTQ0KPiA+PiA+ID4+ID4NCj4gPj4gPiA+PiA+PiBX
ZWxsLCB0aGVyZSBhcmUgIHN0aWxsIGNvbW1lbnRzIGZyb20gbWUgaGVyZSB0aGF0IHBvc3QtZGF0
ZQ0KPiA+PiA+ID4+ID4+IHY0IChwbGVhc2Ugd2FpdCBmb3IgYSBiaXQgYmVmb3JlIHBvc3Rpbmcg
YW5vdGhlciB2ZXJzaW9uISksDQo+ID4+ID4gPj4gPj4gc28gSSdsbCBjb250aW51ZSB3YWl0aW5n
IGZvciB0aGVtIHRvIGJlIGFkZHJlc3NlZCBmaXJzdC4NCj4gPj4gPiA+PiA+IFRoZSBsYXN0IG9u
ZSB3YXMgWzFdLg0KPiA+PiA+ID4+ID4gV2hpY2ggSSByZXBsaWVkIGZldyBkYXlzIGFnbyBhdCBb
Ml0uDQo+ID4+ID4gPj4gPg0KPiA+PiA+ID4+ID4gWzFdDQo+ID4+ID4gPj4gPiBodHRwczovL2xp
c3RzLm9hc2lzLW9wZW4ub3JnL2FyY2hpdmVzL3ZpcnRpby1jb21tZW50LzIwMjMxMC9tcw0KPiA+
PiA+ID4+ID4gZzAwDQo+ID4+ID4gPj4gPiAyNA0KPiA+PiA+ID4+ID4gMC5oDQo+ID4+ID4gPj4g
PiB0bWwgWzJdDQo+ID4+ID4gPj4gPiBodHRwczovL2xpc3RzLm9hc2lzLW9wZW4ub3JnL2FyY2hp
dmVzL3ZpcnRpby1jb21tZW50LzIwMjMxMC9tcw0KPiA+PiA+ID4+ID4gZzAwDQo+ID4+ID4gPj4g
PiAyNA0KPiA+PiA+ID4+ID4gMi5oDQo+ID4+ID4gPj4gPiB0bWwNCj4gPj4gPiA+Pg0KPiA+PiA+
ID4+IEkgc3RpbGwgaGF2ZSBzb21lIG9wZW4gcXVlc3Rpb25zIGZyb20NCj4gPj4gPiA+PiA8ODdz
ZjY4Y2puMC5mc2ZAcmVkaGF0LmNvbT4gKGZpcnN0IGFuZCBsYXN0IHBhcmFncmFwaC4pDQo+ID4+
ID4gPg0KPiA+PiA+ID4gQWJvdmUgbGluayBpcyBub3QgYWNjZXNzaWJsZSB0byBtZS4g4pi5DQo+
ID4+ID4NCj4gPj4gPiBUaGF0J3Mgbm90IGEgbGluaywgYnV0IGEgbWVzc2FnZSBpZC4uLiBtYW55
IG1haWwgY2xpZW50cyBzdXBwb3J0DQo+ID4+ID4gc2VhcmNoaW5nIGJ5IGl0LCBhbmQgeW91IGNh
biBhbHNvIGdldCBpdCBmcm9tIGxvcmU6DQo+ID4+ID4NCj4gPj4gPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvODdzZjY4Y2puMC5mc2ZAcmVkaGF0LmNvbS8NCj4gPj4gPg0KPiA+PiA+ID4g
SSBhZGRyZXNzZWQgeW91ciBjb21tZW50cy9xdWVzdGlvbnMgaW4gdjQuDQo+ID4+ID4gPiBDYW4g
eW91IHBsZWFzZSBjaGVjayB2NCBpZiB0aGV5IGFyZSBhZGRyZXNzZWQ/IEkgcmV3cm90ZSBhcyB5
b3UNCj4gPj4gPiA+IHN1Z2dlc3RlZCBpbg0KPiA+PiA+IHYzLg0KPiA+PiA+DQo+ID4+ID4gVGhp
cyB3YXMgZm9yIHBvaW50cyB5b3UgZGlkIG5vdCBhZ3JlZSB3aXRoLiAoQWdhaW4sIGl0IG1pZ2h0
IGJlDQo+ID4+ID4gaGVscGZ1bCB0byB3YWl0IHdpdGggcG9zdGluZyBhIG5ldyB2ZXJzaW9uIHVu
dGlsIGRpc2N1c3Npb24gaGFzDQo+ID4+ID4gc29tZXdoYXQNCj4gPj4gPiBjb25jbHVkZWQuKQ0K
PiA+PiBTdXJlLCB3aWxsIHdhaXQgbmV4dCB0aW1lLg0KPiA+Pg0KPiA+PiBZb3VyIGNvbW1lbnQg
d2FzLA0KPiA+PiA9PT09PQ0KPiA+PiBUaGlzIGlzIG5vdCByZWFsbHkgY2xlYXIgdG8gbWUganVz
dCBmcm9tIHRoaXMgdGV4dCwgZXNwZWNpYWxseSBpZiB5b3UNCj4gPj4ganVzdCB3cm90ZSBhYm92
ZSB0aGF0IGVuYWJsaW5nIG9yIHJlLWVuYWJsaW5nIGlzIHNvbWV0aGluZw0KPiA+PiBkaWZmZXJl
bnQuLi4gbXkgdW5kZXJzdGFuZGluZyB3b3VsZCBiZToNCj4gPj4NCj4gPj4gLSBpZiBuZWl0aGVy
IGR5bmFtaWMgdnFzIG5vciBxdWV1ZSByZXNldCBhcmUgc3VwcG9ydGVkIG9yIG5lZ290aWF0ZWQs
DQo+ID4+ICAgdGhlIG9ubHkgd2F5IHRvIGVuYWJsZSBhIHZxIGlzIGJlZm9yZSBEUklWRVJfT0ss
IGR1cmluZyBzZXR1cA0KPiA+PiAtIGJvdGggb2YgdGhlc2UgZmVhdHVyZXMgcmVseSBvbiB0aGUg
dHJhbnNwb3J0IHN1cHBvcnRpbmcgZW5hYmxpbmcNCj4gPj4gICBpbmRpdmlkdWFsIHF1ZXVlcyAo
ZWl0aGVyIGEgcXVldWUgdGhhdCBoYXMgbm90IGJlZW4gZW5hYmxlZCBiZWZvcmUsIG9yDQo+ID4+
ICAgYSBxdWV1ZSB0aGF0IGhhcyBiZWVuIHJlc2V0KQ0KPiA+PiAtIHRoZSB0cmFuc3BvcnQgaXMg
c3VwcG9zZWQgdG8gdXNlIHRoZSBzYW1lIG1lY2hhbmlzbSBmb3IgZWl0aGVyDQo+ID4+DQo+ID4+
IERpZCBJIGdldCBpdCByaWdodD8gSWYgc28sIEkgdGhpbmsgd2Ugc2hvdWxkIG1ha2UgaXQgYSBi
aXQgbW9yZSBjbGVhci4NCj4gPj4gPT09PT0NCj4gPj4NCj4gPj4gQWJvdmUgaXMgY2xhcmlmaWVk
IGluIGJlbG93IHdvcmRpbmcgd2l0aG91dCBjb21wbGljYXRpbmcgdGhlIHF1ZXVlX3Jlc2V0DQo+
IGhlcmUuDQo+ID4+DQo+ID4+IERvZXMgdGhhdCBsb29rIG9rIHRvIHlvdT8NCj4gPj4NCj4gPj4g
K1doZW4gVklSVElPX0ZfUklOR19EWU5BTUlDIGlzIG5vdCBuZWdvdGlhdGVkLCB0aGUgZHJpdmVy
IGVuYWJsZXMgdGhlDQo+ID4+ICt2aXJ0cXVldWVzIGR1cmluZyB0aGUgZGV2aWNlIGluaXRpYWxp
emF0aW9uIHNlcXVlbmNlLCBpLmUuIGFmdGVyIHRoZQ0KPiA+PiArZGV2aWNlIHNldHMgdGhlIEZF
QVRVUkVTX09LIHN0YXR1cyBiaXQgYW5kIGJlZm9yZSB0aGUgZHJpdmVyIHNldHRpbmcNCj4gPj4g
K3RoZQ0KPiA+PiBEUklWRVJfT0sgc3RhdHVzIGJpdC4NCj4gPj4gKw0KPiA+PiArV2hlbiBWSVJU
SU9fRl9SSU5HX0RZTkFNSUMgaXMgbmVnb3RpYXRlZCwgdGhlIGRyaXZlciBpcyBub3QgcmVxdWly
ZWQNCj4gPj4gK3RvIGVuYWJsZSBldmVyeSB2aXJ0cXVldWUgaXQgd2FudHMgdG8gdXNlIGJlZm9y
ZSBzZXR0aW5nIHRoZQ0KPiA+PiArRFJJVkVSX09LIHN0YXR1cyBiaXQ7IHRoZSBkcml2ZXIgY2Fu
IGNob29zZSB0byBlbmFibGUgYSB2aXJ0cXVldWUNCj4gPj4gK2V2ZW4gYWZ0ZXIgdGhlIGRyaXZl
ciBoYXMgc2V0IHRoZSBEUklWRVJfT0sgc3RhdHVzIGJpdC4gVGhlDQo+ID4+ICt2aXJ0cXVldWUg
ZW5hYmxlIG1lY2hhbmlzbSBpcw0KPiA+PiB0cmFuc3BvcnQgc3BlY2lmaWMuDQo+ID4+ICsNCj4g
Pg0KPiA+IENhbiB5b3UgcGxlYXNlIHJlc3BvbmQ/DQo+ID4gV2UgbXVzdCBtYWtlIHByb2dyZXNz
IHdpdGggdGhpcyBhbmQgdGhlIGZsb3cgZmlsdGVycyB3aGljaCBhcmUgZGVwZW5kaW5nIG9uDQo+
IHRoaXMgZm9yIGEgbG9uZyB0aW1lIG5vdy4NCj4gDQo+IEkgd2lsbCBub3QgYmUgYWJsZSB0byBs
b29rIGF0IHRoaXMgYmVmb3JlIEZyaWRheS4NCk9rLiBUaGFua3MgZm9yIHRoZSB1cGRhdGUuDQpX
aWxsIHNlZWsgZm9yIHlvdXIgcmVzcG9uc2Ugb24gRnJpZGF5Lg0K

