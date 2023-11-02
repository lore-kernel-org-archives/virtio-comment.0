Return-Path: <virtio-comment-return-8132-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3685BC4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 15:06:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 81BD82AC6B
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 15:06:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 615AD986C0B
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 15:06:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 46697986C04; Thu,  2 Nov 2023 15:06:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 36774986C05
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 15:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIhTvYEv0aLuB6E3bTFHMk+OBS3a4+5iNrFIxDabmbDaLOnMQDQEU1i0ML3JyNpQqfIZYV+OIfhoGYSdfRGn5xULYNNLqcxpteYzqcEMWKaUE8RRQUY37WpFzHFWu2u9bts8601NIWykrjer7PoQj5T3SFGAOjfRFGhvUMI6TNJr66k4crSHlekbEjATX6p36d7fMBADMvPD5Nx+gBvEyc7PyoLIZPv/iJ7rEgv58LmNlif9VIJxxzGF3zkLKx2opKC9Na1AQnKqLQN4h9/CFtZJVulLFBz643o7VDy1+ZQ/ujhk4Wcksic5NatKXNd31qlePQ/tofMamFKHUwNZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cS6b/O3SsoZvtphXHGsVxcrJlO3TpLDjzLxnSbeODyQ=;
 b=ajN/y5fGrSnz+wRGdBoRru5PQj81up5na3Zy8LYSnUxnvMty/vJEj0JDuhg6wslWc1tiWbyjhsd9d9XhyxEJT+LPADCLE+LawG4blpe0pGlhFPPIX1omyYllxuoO3TWjblAL0sD+NEBpj9sCdPim4VaQQ31rUDDGOKJyq08zk7TtELKosE8C5wKxsAy1JS1hI6lAgSGUgEnOemP353iDJXWPFR4KMRjSFno435Nyyp9vpGZwI/nrMjs578tp6AkE3pyoM9lUA3yklqeNfIygmOMUGKdf90LIMkUJyLPA5C2qqe5HFB6WujEpKLv2l6TosjLYbSS22iVejup7Xi3t5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [PATCH v1 3/8] device-context: Define the device context fields
 for device migration
Thread-Index: AQHZ+dpHSUrTyyDEA0quapQP8C0hdbBnPBgAgAAAWhCAAAiTgIAAAiyQ
Date: Thu, 2 Nov 2023 15:06:49 +0000
Message-ID:
 <PH0PR12MB5481E02C73180D7E4C1DC624DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
 <20231102101727-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481021BC87009ED7D8F5C6DDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231102104628-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231102104628-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB5246:EE_
x-ms-office365-filtering-correlation-id: a03eb473-096f-4a5d-0f30-08dbdbb556b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DInmZiS3CVzqZGNYKApABHpW08p80pvUvsijkOTVYHGY93K4bpiGCu5bu0EZ7vkp3zRG9/hN3cyGIe/4KUTlyq4x9Kwh/ne9Xyiy3Uw/kPye3wkxVGgXfa+3qBAGJW+BjseZo/81Ru6pLB/f7erL4mvVEZ3KtTCxjo2nJiEZull/bnbD5lpYJacUDolmfHnvWfTVDI2TwfpLjdC4GhCF5I8DQC4ZHaP+5mx3Zwct5vpI6wNRly0P81myKi/4aWieSsDCfgF49PfNq6YU9fvwqoO9dB6fdIR6SHEJcXY5KoEcMmk0QHCKjrczY2DkbH6XXZ9fZP+BIBnu6thygXWNlMSUO+YCt5jFA02i89HMoDkbE0/RNe0qSamk1qOP6dW3BpVO8e3i2I1CeVGLv0tkuN52Y7AelzyuLFRvoGyHDbBfVlcru3H+I7lszz07sPgkvZQC5raWCy4A16QdwBJ+GbC3GJETX5jOEnheHrKCmcq2N1mToZ/oV9QdIkY0SSm8irZwivV90Tku9StmdGvfotxJ5010d4ciEsUAldDwhqIe5PpQvf43STTqt+MW01/WGxRsxAhoaGZQLt3L3YRB85H5BVhSDGlhH4Zpuq+GmaDBiZFU+XLlcKImVfEZGmXp
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39860400002)(366004)(136003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(55016003)(9686003)(26005)(107886003)(478600001)(6506007)(7696005)(71200400001)(83380400001)(2906002)(5660300002)(41300700001)(66946007)(76116006)(66556008)(66476007)(8936002)(8676002)(52536014)(4326008)(316002)(6916009)(54906003)(64756008)(66446008)(38070700009)(38100700002)(122000001)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWFpclFTY2MzWXBZZVZza05zOGwyODUxdWUyUHM1UkRNVTB6S1RlV3Z4dHQz?=
 =?utf-8?B?L0xOdHZ6QmMwbUtXUDI4SzhvUU5JYlBXYS9zaEE0cWdhRjU1d0VGWEdiUkFL?=
 =?utf-8?B?MEU0UzU5MGdRTmdsTXBQL1ZyR1hHQjZwYkYyREhDYnFTTHM0dHlyUnZaT2ZY?=
 =?utf-8?B?KzlZV29BM052eHBtUHhFQlZ5c0FsYTZQK0RoU1J0VnNUN01UQ1FpU0w1VWhZ?=
 =?utf-8?B?OWxJWWI2YVZqQW40bVNLR2piWEpTQnhOdkNXSUNhd1gxZnlzcjFRYkNvcjht?=
 =?utf-8?B?M2Vta3FSSFloVXdZRHJJcTZEKzNhM0FZSmlUQndlQ2tPOEIyQWNSb05RVjRo?=
 =?utf-8?B?SmJYNHMxdE94bWpRZU9aL3ZlL25CN3VZVFU1bnNwMzVuTTBmb0syUFN3MEtZ?=
 =?utf-8?B?WVhWNjVsRmNIUFBoQ0hLR3FncFp4S0ZMN2dNL2c4Zzl1YzgxS2F0TUFUZTRN?=
 =?utf-8?B?aWVOS2pIeWJWc0NjTllMdE4vWC9PRm40ZTBKSEJIblYwYlhIQ2MrU2VNYmJP?=
 =?utf-8?B?bVFES2pDZGFFRUhKTmk4cXdrb2xWajNoNHozYU5vaXlKb2gvMWU1L1Vsdko2?=
 =?utf-8?B?Vkp1dkkzdndBcXd4bHZDeHNhRVljRFM5VHhCZ1RhUHgrdHNaUmJ3ZkZQVmc4?=
 =?utf-8?B?NlBpMHVFaDBMVXZkaWd6QkNoclFTUUlBN0NvaVhyN3o0T1Byb1oyd1ZuMHBn?=
 =?utf-8?B?aVh1RGliZDMvWDhBVzJ4dEd5UUZrOXJsRmlRMFQrSVBad2tDWkxxemF1c1Nj?=
 =?utf-8?B?N2pydSswdTJSekdpN2NOdjJERmxqU3c2Z3ZZeGhpenJRWHg5N2h1dllEK0Vn?=
 =?utf-8?B?OVNrZGRWbUE4bXpLZzE4Ny9adHprRFdGMHA3UFE2UHA2Uml5TGdZT01mUkNV?=
 =?utf-8?B?NXQ2ZE9wRVRaSlAxU2hwZ1hLNHZlbXQ3Mmc5dHBnenorY0YzUkVGOW5lUXpi?=
 =?utf-8?B?ZXhtRFBSY3BXS0tkZzJ5NGVueEtDT3BUaFduaWJvNVRtZU5DN1N1dTRoY1VY?=
 =?utf-8?B?N0Zxait2aDBjMWZjaEN0SG41Y0tYL2QrZ011ZWhiaCtlL2N2QTJGam8yakcy?=
 =?utf-8?B?YUpEcU04djYvTnVjVnlnaEVWd1lvaFVXZmpnWlNRVUpNVlVaWEY0ZlNZU2RM?=
 =?utf-8?B?MHdjQ1lXeEF0QVVYVjBnZldudHRBQ1VibG1KVnV6VmtTK3ZGR0VWRm9EUzVH?=
 =?utf-8?B?SFZsWjlLMEg1WHlJSFVlWi82MzFhOFlINHhXakdjcVB0bWcwUUh6Q2tLQS9C?=
 =?utf-8?B?QjVhclBPSENSY0FJaUI3NlV1VHI5N3VIcmlWQlBPT3lrRWZueFBGNnpFYzlC?=
 =?utf-8?B?cGdXd3M4T1lIU3BVaHI5SnlXVVY5eFRQRVYydU4yUHp6VzYxVmJhSDlRWG94?=
 =?utf-8?B?YWhRNjVNUXlYUGdFRE81V1dHQUdiaktCNmgyNEhmdENOUmI5eUpUUXRqMG1E?=
 =?utf-8?B?L3ZLbi9SdVJnV2VIZFZFOUdINFNEV3JCeXJ0K1hCeGxRYkl0T3kvblJwbWM3?=
 =?utf-8?B?TVEvb2VDOG5xT09hUzNJOTdCU0QxM2xkTUNJZFFtVURTekh6aWJQZ0p0T2k1?=
 =?utf-8?B?aHlLcmloS1h4Y1JucmMraXFjUi9yTHVTZ0tDWHNrQzJ4eGNXK0FsNHY4a3Zr?=
 =?utf-8?B?RGpudnQzN2FONk1qZjBKS0YxRzVaelJ4LzZqaHEzd1FETTZ1VEVpbG5jMWE0?=
 =?utf-8?B?MGVuK1FWalpJVmpJaGVOR0lXTWk5TjVMMTMzWkp6eE5uMWZIVSt3T0Q3Qys5?=
 =?utf-8?B?ZDl5Tzd5d2x6SDF0elV6Y004N29hWXZhRVlPdGd1U1NQNTA1NzB5STZBM0My?=
 =?utf-8?B?YnJvM1BYMnUyTTlKSjhSa0Y5eFloelE2Q1dkR3RwWmpubzQ0SUh2QkFvZ0h6?=
 =?utf-8?B?dXA4cWhJY0hYV3J6MXF4c2MxREJrMHBGM2J3ZkxnbzNKendGQ013ZmN3WnlH?=
 =?utf-8?B?N2pFY1l1UklJRFQwQUFzSzcyN0hHcFJad2ZuUmhLYjcvZW1paEorMzVRUVhi?=
 =?utf-8?B?bXQ3Nit6N1J4MXJpRXB0NE1BN0paYXNxaERadG9qaC9MRThLTzArSTBxQzBa?=
 =?utf-8?B?YlBGZFc0SC9hQTM5M2ZkWlQ5ZXM4dG1IQUhDWUxLaGZPZ01WTGR3UmtHcHFu?=
 =?utf-8?Q?e9bM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03eb473-096f-4a5d-0f30-08dbdbb556b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2023 15:06:49.3158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: txz6Yf09jeFItCHMYIAKSsP0fwex+h2cMOv8nQEz9YSGc+N4e9/t9qgB0fJ620T1qi9rmNnBHIpkFoD9bS2DtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5246
Subject: [virtio-comment] RE: [PATCH v1 3/8] device-context: Define the device context fields
 for device migration

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBOb3ZlbWJlciAyLCAyMDIzIDg6MjQgUE0NCj4gDQo+IE9uIFRodSwgTm92IDAyLCAy
MDIzIGF0IDAyOjQwOjU3UE0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPiA+IEZyb206
IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+ID4gPiBTZW50OiBUaHVyc2Rh
eSwgTm92ZW1iZXIgMiwgMjAyMyA3OjUyIFBNDQo+ID4gPg0KPiA+ID4gT24gU3VuLCBPY3QgMDgs
IDIwMjMgYXQgMDI6MjU6NTBQTSArMDMwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+ID4gPiAr
XGJlZ2lue2xzdGxpc3Rpbmd9DQo+ID4gPiA+ICtzdHJ1Y3QgdmlydGlvX2Rldl9jdHhfcGNpX3Zx
X2NmZyB7DQo+ID4gPiA+ICsgICAgICAgIGxlMTYgdnFfaW5kZXg7DQo+ID4gPiA+ICsgICAgICAg
IGxlMTYgcXVldWVfc2l6ZTsNCj4gPiA+ID4gKyAgICAgICAgbGUxNiBxdWV1ZV9tc2l4X3ZlY3Rv
cjsNCj4gPiA+ID4gKyAgICAgICAgbGU2NCBxdWV1ZV9kZXNjzb4NCj4gPiA+ID4gKyAgICAgICAg
bGU2NCBxdWV1ZV9kcml2ZXLNvg0KPiA+ID4gPiArICAgICAgICBsZTY0IHF1ZXVlX2RldmljZc2+
DQo+ID4gPiA+ICt9Ow0KPiA+ID4gPiArXGVuZHtsc3RsaXN0aW5nfQ0KPiA+ID4gPiArDQo+ID4g
PiA+ICtPbmUgb3IgbXVsdGlwbGUgZW50cmllcyBvZiBQQ0kgVmlydHF1ZXVlIENvbmZpZ3VyYXRp
b24gQ29udGV4dA0KPiA+ID4gPiArbWF5IGV4aXN0LCBlYWNoIHN1Y2ggZW50cnkgY29ycmVzcG9u
ZHMgdG8gYSB1bmlxdWUgdmlydHF1ZXVlDQo+ID4gPiA+ICtpZGVudGlmaWVkIGJ5IHRoZQ0KPiA+
ID4gXGZpZWxke3ZxX2luZGV4fS4NCj4gPiA+DQo+ID4gPiBTbyBjb25zaWRlciB0aGlzIGV4YW1w
bGUuIEluIHByYWN0aWNlIGl0IGlzIHF1aXRlIHBvc3NpYmxlIHRoYXQNCj4gPiA+IGRyaXZlciBp
cyBpbiB0aGUgcHJvY2VzcyBvZiBzcGVjaWZ5aW5nIGUuZy4gcXVldWVfZGVzYywgYW5kIGl0IHNl
dA0KPiA+ID4gcXVldWVfZGVzY19oaSBidXQgbm90IHF1ZXVlX2Rlc2NfbG8uIFRoZW4gd2hhdCBp
cyBxdWV1ZV9kZXNjPw0KPiA+ID4gSnVzdCBhIGNvbWJpbmF0aW9uIG9mIGEgbGVnYWwgdmFsdWUg
b2YgcXVldWVfZGVzY19oaSBhbmQgaWxsZWdhbCBvbmUNCj4gPiA+IG9mIHF1ZXVlX2Rlc2NfbG8/
IFRoaXMgbWFrZXMgbm8gc2Vuc2UuDQo+ID4gPiBxdWV1ZV9kZXNjIGlzIGZ1bmRhbWVudGFsbHkg
dW5kZWZpbmVkIHVudGlsIHF1ZXVlIGlzIGVuYWJsZWQuDQo+ID4NCj4gPiBTdXJlLCBpbiBuZXh0
IHJlYWQgb2YgdGhlIGRldmljZSBjb250ZXh0IHRoZSB1cGRhdGVkIHZhbHVlIHdpbGwgcmVmbGVj
dC4NCj4gPiBUaGUgZGVzdGluYXRpb24gd2lsbCBub3Qgd29yayBvbiB0aGlzIHZxIGFueXdheSBh
cyB0aGUgZGV2aWNlIG1vZGUgaXMgZnJlZXplLg0KPiA+IFRoZSB3aG9sZSBkZXZpY2UgY29udGV4
dCBpcyBub3QgYXRvbWljLCBzbyBoYXZpbmcgb25lIGZpZWxkIGxpa2UgdGhpcyBhcw0KPiBub25h
dG9taWMgc2ltaWxhciB0byBvdGhlcnMgaXMgb2suDQo+ID4NCj4gPiBJbiB0aGlzIGV4YW1wbGUg
cXVldWVfZW5hYmxlZCB3aXRoIHRoZSBwYXJ0aWFsIHdyaXRlIHNob3VsZCBiZSBzdGlsbCBzZXQg
dG8gMC4NCj4gPg0KPiA+ID4NCj4gPiA+IFRoaXMgaXMgd2h5IEkgc3VnZ2VzdCB0aGF0IHdlIGhh
dmUgcmVjb3JkcyB0aGF0IG1hdGNoIHRoZSB0cmFuc3BvcnQuDQo+ID4gPiBPZmZzZXQgaW4gc3Ry
dWN0dXJlIGNhbiB0aGVuIHdlIHVzZWQgYXMgYSB0YWcgYW5kIHNvIHdlIGRvIG5vdCBuZWVkDQo+
ID4gPiB0byBjb21lIHVwIHdpdGggbmV3IGRlZmluaXRpb25zIGZvciBlYWNoIHNpbmdsZSB0aGlu
Zy4NCj4gPiA+DQo+ID4gSWYgSSB1bmRlcnN0b29kIHlvdSBjb3JyZWN0bHksIHlvdSBwcmVmZXIg
dG8gdHJhbnNmZXIgdmlydGlvIGNvbmZpZyBzcGFjZSBhcyBvZmZzZXQNCj4gYW5kIHZhbHVlIGFz
IHRhZz8NCj4gPiBJZiBzbywgaG93IHRhZyBoZWxwcyBpZiBpdCBzdGlsbCB0cmFuc2ZlcnMgcGFy
dGlhbCB2YWx1ZT8NCj4gDQo+IEZvciBleGFtcGxlOg0KPiANCj4gc3RydWN0IHZpcnRpb19wY2lf
Y29tbW9uX2NmZyB7DQo+ICAgICAgICAgLyogQWJvdXQgdGhlIHdob2xlIGRldmljZS4gKi8NCj4g
ICAgICAgICBfX2xlMzIgZGV2aWNlX2ZlYXR1cmVfc2VsZWN0OyAgIC8qIHJlYWQtd3JpdGUgKi8N
Cj4gICAgICAgICBfX2xlMzIgZGV2aWNlX2ZlYXR1cmU7ICAgICAgICAgIC8qIHJlYWQtb25seSAq
Lw0KPiAgICAgICAgIF9fbGUzMiBndWVzdF9mZWF0dXJlX3NlbGVjdDsgICAgLyogcmVhZC13cml0
ZSAqLw0KPiAgICAgICAgIF9fbGUzMiBndWVzdF9mZWF0dXJlOyAgICAgICAgICAgLyogcmVhZC13
cml0ZSAqLw0KPiAgICAgICAgIF9fbGUxNiBtc2l4X2NvbmZpZzsgICAgICAgICAgICAgLyogcmVh
ZC13cml0ZSAqLw0KPiAgICAgICAgIF9fbGUxNiBudW1fcXVldWVzOyAgICAgICAgICAgICAgLyog
cmVhZC1vbmx5ICovDQo+ICAgICAgICAgX191OCBkZXZpY2Vfc3RhdHVzOyAgICAgICAgICAgICAv
KiByZWFkLXdyaXRlICovDQo+ICAgICAgICAgX191OCBjb25maWdfZ2VuZXJhdGlvbjsgICAgICAg
ICAvKiByZWFkLW9ubHkgKi8NCj4gDQo+ICAgICAgICAgLyogQWJvdXQgYSBzcGVjaWZpYyB2aXJ0
cXVldWUuICovDQo+ICAgICAgICAgX19sZTE2IHF1ZXVlX3NlbGVjdDsgICAgICAgICAgICAvKiBy
ZWFkLXdyaXRlICovDQo+IA0KPiAgICAgICAgIF9fbGUxNiBxdWV1ZV9zaXplOyAgICAgICAgICAg
ICAgLyogcmVhZC13cml0ZSwgcG93ZXIgb2YgMi4gKi8NCj4gICAgICAgICBfX2xlMTYgcXVldWVf
bXNpeF92ZWN0b3I7ICAgICAgIC8qIHJlYWQtd3JpdGUgKi8NCj4gICAgICAgICBfX2xlMTYgcXVl
dWVfZW5hYmxlOyAgICAgICAgICAgIC8qIHJlYWQtd3JpdGUgKi8NCj4gICAgICAgICBfX2xlMTYg
cXVldWVfbm90aWZ5X29mZjsgICAgICAgIC8qIHJlYWQtb25seSAqLw0KPiAgICAgICAgIF9fbGUz
MiBxdWV1ZV9kZXNjX2xvOyAgICAgICAgICAgLyogcmVhZC13cml0ZSAqLw0KPiAgICAgICAgIF9f
bGUzMiBxdWV1ZV9kZXNjX2hpOyAgICAgICAgICAgLyogcmVhZC13cml0ZSAqLw0KPiAgICAgICAg
IF9fbGUzMiBxdWV1ZV9hdmFpbF9sbzsgICAgICAgICAgLyogcmVhZC13cml0ZSAqLw0KPiAgICAg
ICAgIF9fbGUzMiBxdWV1ZV9hdmFpbF9oaTsgICAgICAgICAgLyogcmVhZC13cml0ZSAqLw0KPiAg
ICAgICAgIF9fbGUzMiBxdWV1ZV91c2VkX2xvOyAgICAgICAgICAgLyogcmVhZC13cml0ZSAqLw0K
PiAgICAgICAgIF9fbGUzMiBxdWV1ZV91c2VkX2hpOyAgICAgICAgICAgLyogcmVhZC13cml0ZSAq
Lw0KPiB9Ow0KPiANCj4gV2Ugd291bGQgaGF2ZToNCj4gICAgIHRhZzogMzIgKHF1ZXVlX2Rlc2Nf
bG8pLCBsZW46IDQNCj4gICAgIHRhZzogMzQgKHF1ZXVlX2Rlc2NfaGkpLCBsZW46IDQNCj4gDQpT
byB0YWcgaXMgb2Zmc2V0LiBPay4NCj4gDQo+IFRoZSBwb2ludCBpcyB0aGF0IHRoZSB2YWx1ZXMg
cHJvZ3JhbW1lZCBqdXN0IG1hcCAxOjEgdG8gd2hhdCBpcyBleHBvc2VkIGluIHRoZQ0KPiB0cmFu
c3BvcnQuDQo+IA0KRm9yIHF1ZXVlIGFkZHJlc3NlcywgDQo+IFRoaXMgbWVhbnMgdGhhdCB0aGUg
c3RydWN0dXJlIGlzIGRpZmZlcmVudCBmb3IgZGlmZmVyZW50IHRyYW5zcG9ydHMgYnR3Lg0KPiAN
Cj4gDQo+IA0KPiANCj4gDQo+IA0KPiA+ID4gQW5kLCB0aGlzIGlzIG9ubHkgYW4gaW5zdGFuY2Ug
b2YgdGhlIGdlbmVyYWwgcHJpbmNpcGxlOiBkbyBub3QgaGF2ZQ0KPiA+ID4gdHdvIGRlZmluaXRp
b25zIG9mIHRoZSBzYW1lIHRoaW5nLiBJbiBmYWN0IEknZCBhcmd1ZSBvdXIgdHJhbnNwb3J0DQo+
ID4gPiBzdHJ1Y3R1cmVzIGFyZSBhbiBleGFtcGxlIG9mIGEgYmFkIGRlc2lnbiBhbmQgdGhlIGNv
c3QgaXMgdGhhdCBsZXNzDQo+ID4gPiB1c2VkIG9uZXMgbGlrZSBtbWlvIGFuZCBjY3cgc29tZXRp
bWVzIGxhZyBiZWhpbmQgb24gZmVhdHVyZXMuDQo+ID4NCj4gPiBJIHRvdGFsbHkgYWdyZWUgb24g
bm90IGR1cGxpY2F0aW5nIGl0Lg0KPiA+DQo+ID4gRm9yIDY0IFZRcyB0aGVpciBjb250ZW50IG9m
IHN0cnVjdCB2aXJ0aW9fZGV2X2N0eF9wY2lfdnFfY2ZnIGlzIGJlaGluZCA4DQo+IHJlZ2lzdGVy
cy4NCj4gPiBTbyBmb3IgdGhlbSB0aGVyZSBoYXMgY29udGFpbmVkIGluIHRoZWlyIG93biBzdHJ1
Y3Qgc3VjaCBhcyBzdHJ1Y3QNCj4gdmlydGlvX2Rldl9jdHhfcGNpX3ZxX2NmZywgcmlnaHQ/DQo+
ID4NCj4gPiBBbmQgY3VycmVudCBzdHJ1Y3QgdmlydGlvX3BjaV9jb21tb25fY2ZnIGlzIGdpdmlu
ZyB0aGUgY3VycmVudCBzbmFwIHNob3Qgb2YNCj4gcmVnaXN0ZXIgZmlsZS4NCj4gPg0KPiA+IFRo
aXMgaXMgd2h5IHRoZXJlIGlzIHNvbWUgZHVwbGljYXRpb24uDQo+ID4gVG8gYXZvaWQgZHVwbGlj
YXRpb24gb2YgdGhpcyByZWdpc3RlcnMsIHdlIHdpbGwgaGF2ZSB0byBiaXNlY3QgZWFjaCBmaWVs
ZCBvZiBpdCBhbmQNCj4gb21pdCB0aGVzZSAzIGFkZHJlc3MgcmVnaXN0ZXJzLg0KPiA+DQo+ID4g
Tm90IGFibGUgdG8gc2VlIHRoZSBnYWluIG9mIHRoYXQgb3ZlcmhlYWQuIERvIHlvdT8NCj4gDQo+
IE5vdCBiaXNlY3QuIE15IGlkZWEgaXMgdG8ganVzdCBoYXZlIGVhY2ggcmVnaXN0ZXIgaW4gaXRz
IG93biB0YWcrbGVuZ3RoIGZpZWxkLiBBbmQNCj4gdGhlIGdhaW4gaXMgdGhhdCB3ZSBlYXNpbHkg
YWRkIGZpZWxkcyB3aXRob3V0IGFueSBwYWluIGFuZCBhbnkgZHVwbGljYXRpb24gYW5kDQo+IHNw
ZWNpYWwgZG9jdW1lbnRhdGlvbiBlZmZvcnQuDQpXZSBoYXZlIHRvIHRyYW5zcG9ydCBhbGwgdGhl
IHZxIGZpZWxkcyBsb2NhdGVkIGJlaGluZCB0aGUgY29tbW9uIGNvbmZpZyByZWdpc3RlcnMgYXMg
c3RydWN0IGFueXdheSwgaXNu4oCZdCBpdD8NCkFuZCBpZiB3ZSB1c2UgdGFnIGZvciB2aXJ0aW8g
Y29tbW9uIGNvbmZpZyBzcGFjZSAoaW5zdGVhZCBvZiBzdHJ1Y3QpLCB3aHkgdGhlcmUgd29uJ3Qg
YmUgZHVwbGljYXRpb24/IFRoaXMgaXMgdGhlIHBhcnQgSSBzdGlsbCBtaXNzLg0KDQo=

