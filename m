Return-Path: <virtio-comment-return-7206-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316D6EE49A0
	for <virtio-comment@archiver.kernel.org>; Mon, 21 Aug 2023 05:14:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7F94026A33
	for <virtio-comment@archiver.kernel.org>; Mon, 21 Aug 2023 05:14:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7603C986283
	for <virtio-comment@archiver.kernel.org>; Mon, 21 Aug 2023 05:14:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6B2DC983FE9; Mon, 21 Aug 2023 05:14:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5571C98622C;
	Mon, 21 Aug 2023 05:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVY9xBwy6dpJRmcc63Hgv3UbmYFhVpN8bhxPQEshZK0H6GCxTY1BOVMs/JWtP5nTR8M2BxEqyAhlFQ5uybaYcK+FsPvfJRQOHIS0FWQr0OhzD2ab6sVpiufy3WlhMTEcNHMlSUj6ctiIjP4fsa705k33fLbSAPsrzoIpmEfMOD5v3QMsUBCmFHancOFYRvL1DbptXfAZhpWyBkQxjcG2doW2eDzAnAyCWcedRipMGeEITPG3uG+XvniZvyFFZ1RERBD5Tt9ubDGDZK0m5KZd7K9AE+iqj5PQTrYDCT4luR/glvf8A6utDYxhlwl9R6G+lpzA8swv8aMlk/3vjZfZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSGW64YqdKP4YLqdX56Nis0R05+fD1u9IV8exWSTR84=;
 b=U4HR89WGf29eCZspjIADtTqnzs2LVFLhYfefvR+4Iy0HAOBC44pfoM+pmvcEi5iuKNRrRFbwMYGMw6spIxX/9xx+wrSbA4zLI2p/KmB1TIA62W+Wpky69iY3d7oCNKe32xnOJzzjHcf9r1kVf3J73ZyxM2jNsqfqtxCWRW72XfJj7QL5mVHeDQSsaJKLVu9Q3mhocaorukTIrzp9YvLpYjd2Ja3diw/3w8j6+sp63AKakYCcdL1ThexfSY4CuB3w0z86QvSyL6JmaTUr4qXKZY+5XKZTkyFvYhQgFqJfCUuwJ97jhbC5TZNwelN3+Vminf5f4Z8ki+P2dBkEj4xoLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "david.edmondson@oracle.com"
	<david.edmondson@oracle.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "sburla@marvell.com" <sburla@marvell.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [PATCH requirements v5 5/7] net-features: Add n-tuple receive
 flow filters requirements
Thread-Index: AQHZ0Y2Q89x8De6abk+ghYyGBDRkkq/0N0oAgAABUPA=
Date: Mon, 21 Aug 2023 05:14:12 +0000
Message-ID:
 <DM8PR12MB54808AE0E58C3E7E4580C7CFDC1EA@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20230818043557.496964-1-parav@nvidia.com>
 <20230818043557.496964-6-parav@nvidia.com>
 <7ff1c342-ea48-496e-907b-fae0fc18dec5@linux.alibaba.com>
In-Reply-To: <7ff1c342-ea48-496e-907b-fae0fc18dec5@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|IA1PR12MB8224:EE_
x-ms-office365-filtering-correlation-id: b1f388c5-505a-4107-721e-08dba20574f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 a/l2P4AFGvZxXfsUMTu06ygHi+PYyNZvkTm2QO+kTWSwKFbnH9tbKeW5U/rYTSWONlmUZdLLpvc5zImD2iBmOyFtenH5SpBk6BBJK938zOCe695Upa8iYcJn9OqjkA/FhtLaIrlHws0EcPloX7vY65/lp60FsPYZ0GrH03tBSN9zC1Y0S57eLKVoqGr2/cUcSaiCOozdl70yxe6dlZecrBBQriXhAUxyOPEJrFj4X30SvjaKLL7BwI4th3fqBGgpnYY30JvMzBLsMRR5KJDfDKr/bVrcagPAEaPXkLdvvIklvN703ET17fkexQgP8fEA4NRMMlIH0nCL5C8sGJTaEzGV8G8251xg56FlHoYl8M59Ny85Eg+plMVkgKQBuHTREQXPC/wtyWl2ozKjaqwhri+Hi+GYiABa3AhI2J6uOubI62ySwqKkt8i4vyKuNQuKgg00wCyjomWzw5U6kZziwz2klQf15pRWd7dPMZPnH7gsK0qJgWLDZ7uo1Rc2f/xczVzUeJ7dfg+jS5zJ2TJKoSADo0MlRxseWvOuUw/FqQhFwG1xDE9uMmTSnGDX8kyi4YMyLy+aRa2TLQRFd5rCYFre3V1rc4pJ9Hby20NRW7JoX5hdPFFm+TFyThH7aprk
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(396003)(376002)(39860400002)(1800799009)(186009)(451199024)(71200400001)(6506007)(7696005)(38070700005)(38100700002)(122000001)(9686003)(55016003)(26005)(33656002)(66556008)(316002)(2906002)(66946007)(66476007)(54906003)(66446008)(41300700001)(4744005)(110136005)(86362001)(76116006)(5660300002)(64756008)(4326008)(52536014)(8676002)(478600001)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QUZJUUtFVnpFcDV4MmMxMVFQTVV5TmxRaUFYNkgwSW1GYm5sQkE1aEc0SDI5?=
 =?utf-8?B?VWVVSXUrNzNKTWxHWE9RNUdvbjcyUmQ1eXhvWms0SmNjN0gxY2JzeHpNZWVX?=
 =?utf-8?B?Uk51SVlxaHovOUwxcU9WTng4Q1YrODBuY1N4TnFqbk5hY3d6bUxZZEhBVGdL?=
 =?utf-8?B?U3RhY3NuaFdpZ2Z1cXhIaVFkbGlha2hGejJBeHpWVWpFOU9GOWZpZWRpOFBZ?=
 =?utf-8?B?bXcwbzVXKytTb1F6R2w1SlFaUTBseXZMZVFmck9jVGxVZk10TWNpRmVYcTdp?=
 =?utf-8?B?U3VjeEtzdzYxWVMreDE3OHJYeklGVkxLQlIwcEJIMm90Y29hUHkyb3VreEdX?=
 =?utf-8?B?cDE5cjRLN0RsVUJSSi9TS28zZnQ4cXJBbFplb0QreTFqYkVVNUc1b3R1cTRF?=
 =?utf-8?B?ZExnaE43TzlUdUF2bVBXOVBMOWc0VnVaK3o5ZnBoMTFUMUhIMjIwYk5aNG9U?=
 =?utf-8?B?K2M5bFgxM0h3eDc4UVd0TWIzVkxxU3hIaGwrMnkvd1ljbTBLZVNJOWpHTkox?=
 =?utf-8?B?UldUa2twWHRMRk5mb3ZPSGlMY2pSWnlBM0p3Y2NDZktEWWxhUGY1V21uNEU5?=
 =?utf-8?B?VVZ6Mys5WWZPand3M1NwVExvRmNRR2dwQWkyZDFoNk1laU1mbDNyaTZMWGNT?=
 =?utf-8?B?NStpYjAyRDdlOTdPRXBic3RUS2RBYlh5eHNkcE9rLzlwb1FEYzZTbHc0Zjkw?=
 =?utf-8?B?MjhOQjJtUGIxK3ROem1BQVBDK2NPZGxNSG1GNitTZHI4YUtxRzJYelNPdFJk?=
 =?utf-8?B?d2hSS1JSMFVqek1rb0NtYjJnaXZQbzIzR2g3aWxFbkN2OTFPNHkvZVliVFl0?=
 =?utf-8?B?TVhqTm9YRW5iNUZuTi9yRkpSZjZJTHowZCtlUFZYTWh2eEttMkdqV2ZDcTFu?=
 =?utf-8?B?QzBjWHlEbEg2OUlCMW03N0R2eW1Bdm9Sc3hvczV0ZStYd3NPQk9TLytGc0tG?=
 =?utf-8?B?d1JYVis4bkw0bUs2QS9Gc1orcjhXRWM4ZGkwTE4xVUF0aEsvMFFkSGt6SElS?=
 =?utf-8?B?YlYrTTNUeWNidmFubWtVQUxiaUcxTHljVnh5dzBLV3BoM3pzUFR0cTFTUGRC?=
 =?utf-8?B?UXUxWFVURUYydDJ3ek00QmpLK3JadXZXMWI4cWlzYWVRZUpReWNOWDFHdU9H?=
 =?utf-8?B?aVA4azVkQXNSYUN6bzFpYk14cGFnajVVcnZSTTdWWVA5MDBmRzhUWjNkQlVT?=
 =?utf-8?B?V0RybWorWkJhbGNVb3Z0L2hvS1g2UzdOOXpYNjZVM3U0OUdjd2tkaW5mVFBT?=
 =?utf-8?B?TXZvTXppU3JObExPUTIyVHJ6MThWL056SnlZSWZhdDR5T3pkZGVickhRcXE1?=
 =?utf-8?B?UUxuVnBqWFJmU0ZaOFc0eTBNYWFkcjhpZnUrcnJLek1WRkYzenpFSU9QNGtW?=
 =?utf-8?B?cDd3cWdwNEhJZDlxcXJKcTFYYUNXVGoyMGtFSVEzYzlqWXA4MUJ1WVhIcnlR?=
 =?utf-8?B?WFUwdTZPZmNOMjBjZDJPN3NLc1VFQ3I0T1EyRmxycU83UVUwM2xiM0VlSmdi?=
 =?utf-8?B?bU5KSEVlV3hneHRyaG8vVDFZMU5nQnEwQmF3d2RId1d3dUZoL0ZBY2tSamtP?=
 =?utf-8?B?Q3RjQ0ZtNlJhLzNDWXMzemxNTDJ2V2pOY2xBczdKMFlMbis5eEl5WDNNUmcr?=
 =?utf-8?B?OTJ6bysxQkQ4UXRNRFF0bUYvcDdxalVPSklmTm56Q0RZdzVYb1BPUWNGeEpo?=
 =?utf-8?B?dEFsdTZrdmp1Nzc3VFZNOVBlTHlRaWRQODBDdHJiQ1RVR2psSlo2enA3aSti?=
 =?utf-8?B?T0tHQkFyNEN5bXh5SHBEckVteDg2bWtmTFBKOTl5OVJ6WjAwaVRjdjZDMkE4?=
 =?utf-8?B?SHpWZUlkQ29kM0MyQ1hDM0RUMnJoZDhtUnZSMzJDOXl6NUFObEhMQWtPend5?=
 =?utf-8?B?bGtlMXBWaFRCK2t6WDJWL2hDcHRkbjVwZ1NkenduK0w5TjhuRnN2NE5oVFh1?=
 =?utf-8?B?L2RiQTZycGExSW4wbnk3RDNMU1M2dnF3YkFzQWJKMkc5aHNuM0hxRzI4TDRX?=
 =?utf-8?B?RHlzcHJnUnp3RGlMRFdiMzJqYjFDb1BZQlNYc3RteHg4MWQ0QWpkTGozbW9x?=
 =?utf-8?B?QkFtd0IxWjhYS2lVTEhDaU5PbnpNWE4xZ2grR2NVNm9ZRVRnK25ESXFLVm90?=
 =?utf-8?Q?/yOk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f388c5-505a-4107-721e-08dba20574f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 05:14:12.3545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZzQl1OOrewGZAMBzFIhxYtHf64VCkifH4mRN+ffDXFViwRQ3VrQWDPykART9IjgCSIHmOPpCSytO7YH4CkEKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8224
Subject: [virtio-comment] RE: [PATCH requirements v5 5/7] net-features: Add n-tuple receive
 flow filters requirements

DQoNCj4gRnJvbTogSGVuZyBRaSA8aGVuZ3FpQGxpbnV4LmFsaWJhYmEuY29tPg0KPiBTZW50OiBN
b25kYXksIEF1Z3VzdCAyMSwgMjAyMyAxMDozNiBBTQ0KDQo+ID4gKzQuIFNpbmNlIGZsb3cgZmls
dGVycyBhcmUgZW5hYmxlZCBtdWNoIGxhdGVyIGluIHRoZSBkcml2ZXIgbGlmZSBjeWNsZSwgZHJp
dmVyDQo+ID4gKyAgIHdpbGwgbGlrZWx5IGNyZWF0ZSB0aGVzZSBxdWV1ZXMgd2hlbiBmbG93IGZp
bHRlcnMgYXJlIGVuYWJsZWQuDQo+IA0KPiBJIHJlbWVtYmVyIGhlcmUgdGhhdCB0aGUgY3JlYXRp
b24gcGhhc2Ugb2YgZmxvdyB2cSBpcyBpbiB0aGUgcHJvYmUgcGhhc2UsIGFuZCBhDQo+IGZlYXR1
cmUgaXMgdXNlZCB0byBpbmRpY2F0ZSBkeW5hbWljIGNyZWF0aW9uLg0KDQo+IE9yIGRvIHdlIHdh
bnQgdG8gcmV2ZXJ0IHRvIGEgd29ya2Fyb3VuZCBzaW1pbGFyIHRvIHZxIHJlc2V0IGhlcmU/DQoN
CkFzIHdlIGRpc2N1c3NlZCBkdXJpbmcgdjQsIGR5bmFtaWMgY3JlYXRpb24gdXNpbmcgYSBuZXcg
ZmVhdHVyZSBiaXQuDQpTYXkgRl9WUV9EWU5BTUlDX0NSRUFURS4NCldpbGwgaW50cm9kdWNlIGl0
IGFzIHBhcnQgb2YgdGhpcyBzZXJpZXMuDQpMZXRzIG5vdCBidWlsZCBuZXcgZmVhdHVyZXMgdXNp
bmcgd29ya2Fyb3VuZHMuDQo=

