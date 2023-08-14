Return-Path: <virtio-comment-return-7094-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66819C001DB
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 13:28:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A679B2AC4A
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 13:28:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 83B1E98638E
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 13:28:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6B25B983F78; Mon, 14 Aug 2023 13:28:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5A78898633D;
	Mon, 14 Aug 2023 13:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etN8zuI6VlbOI/TDMOstwqW4e3USWbgiLAgXsj8MydzUVBWpoTSNJaEBAl93mfh48xhgB/9HY176zH0jQ0U9w26TQ8rURUt41CAkt2xNEV3HOibJRIlkegT2PUYTZi++OLDx2PFai2L/ns5+TY8uYRH+zfgZRXvjjezy49eaotXGIpB+qRljlgul3ySAaUB1B+P0r0EZKHNGpEKqpQUF5M479GpzKrBlZWO1JS9FwDgTJV1Qmm/6kHEv6+5xpW5XAg59Xb8byTjBHLd2TSLde9UQjAM+a6DMdevaGHwElWQmpBOv6dVVPXXu4rL6eOmFtX11n2LYUCU4TVC+FHdXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8F/ueAZl0laYu/gxPyskERGhX5G3SNHZi21sXIQaBo=;
 b=HnXMUb0LBJyNn90Ghcs9kd+7qAQ+D8MS+fKwfz8o/JMq0N/AaSUzW2GjwSJPXebURW2m57Eo80Kjjv2JuIR9O6/sgTWmHypmL4NH/R76eY2W+TlC6RX46G8sh+SmWDkBa8fFG4sxfIc2D/ZZAXkaZu5XjrH5LtAuOIbx8Gk+4HIz4ADZxlQyCjrtsu+2G44EQvJdm0LxcWrfMMJSq2WN74LWxAhAfNzCXKirKxnJnk2y4Mk24moHKURUZwby2y50rFGuHeLda48tXByLkqs3gPWAlcEECNch1WKrU2Z6q86AsHR8qfcNmJaW9DzFYAVgTkCamSg+LFOSsTxHrd+jjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: David Edmondson <david.edmondson@oracle.com>, Willem de Bruijn
	<willemb@google.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio] Re: [virtio-comment] [PATCH requirements 7/7]
 net-features: Add header data split requirements
Thread-Index: AQHZvd/RntDC4nfzo0e7zkzK6EVrvq/p0iMAgAAMKYCAAAcbgIAABRYg
Date: Mon, 14 Aug 2023 13:28:52 +0000
Message-ID:
 <PH0PR12MB54812CD4C02D5FA50A65D0FBDC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-8-parav@nvidia.com> <m2jztx7rzz.fsf@oracle.com>
 <CA+FuTSeguCKk4zxZ0=Ebr1phZhF9kssHeGPn2eZj6SRNv2ewsA@mail.gmail.com>
 <m2fs4l7ot0.fsf@oracle.com>
In-Reply-To: <m2fs4l7ot0.fsf@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA0PR12MB4463:EE_
x-ms-office365-filtering-correlation-id: f0124d24-bf9c-4d7a-4e30-08db9cca6704
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 RsC4ItdggKWqHhJ4u5FeI7SVYcR7cwwEVie73t2U6f0y0cnNL5ovAjP8YOSos+LedSV/a6w5Nl8T5sV4A/tmUYy77jF+EVbc+GUGBrZmdKb6M3n2mg6FDP8RPifFXy9JCz5qSI+n790clNcrh/tXWF8KkCIaxWMTr716jljHO8BX/4d211FepRPYqQsk4Uwe3mvLficrcipmLmcQtELtP3fgYtxt0pvPKOQM2ajoVLetxgqpQ5mLuYCgdI5LQZBiGr44beFD+Kg+mcPGCl7Eoz9OkVCCMuU0MXJfrWhtsztukmiQDtLgdcYuyKjOg7QhJlnmVKZ0mFyCQuAx3gFPXP5ro71n51Byt4hBJGsIUMyaCvXOHlrO+vdnKpykyeUHhe7tTkmX21NRCyA+ZfLLZ7PJ9lHd/lTIhqTx7z1Wb5r30TddXC0YPJhMsbr3AzsqUQHyqYQ2q0H9+t7EDGeIikg1ByrnszV+DmutBXXAaCY+T7iKmzvW/Gpcj9rgzgJYsfk6KJRSWj1wFaiDN+FpCKV6yPSDypmhgd+0kSJFT0UYYDW0kvMYcNUcaGgB8gqAG1q79zfEbGtWQX9JtDqUqcAwXijHFf98EQwALNhK+b/8xgUFtBKmvuGfo0+l6m7Y
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(346002)(396003)(39860400002)(1800799006)(186006)(451199021)(26005)(6506007)(54906003)(71200400001)(9686003)(7696005)(478600001)(38070700005)(110136005)(38100700002)(122000001)(33656002)(86362001)(5660300002)(66476007)(66556008)(66446008)(64756008)(316002)(41300700001)(76116006)(4326008)(66946007)(4744005)(2906002)(55016003)(8936002)(52536014)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmFPN3ZFVWdVZVA3UnVXNGZGMUJTK2V1bEVkSFd3aTFHNmxJY1ZQTzRkbU1l?=
 =?utf-8?B?Z0wyS1A4NHpsb0ROVU9jNndnK3NnSlZNbTBKT0paQ2Z4UitIMWdvUURvdEJh?=
 =?utf-8?B?OThzcFhUTVFKSEIzcXQ0YUYzRWpCTVZ2a0hBQW5PWFVGOGplVENTRDU4cUE4?=
 =?utf-8?B?ajhzSmxmZVowellLSHczSUpTZU13SVhwS3dIZmtUaDBWQmg0aFgwM21udldv?=
 =?utf-8?B?dThlQU1FMHA2Y0dPWFI2cW5kQ2tCTktyMzR0MnRJVklJaVlISFRrUngyT0Ez?=
 =?utf-8?B?aDJwS1hmRzRiZm96MU9RWWxRQjljK1FzWHViS2xvRExoVUJaSjNKVm1oVFFL?=
 =?utf-8?B?dUc3R1pLZUxHV1lkb01KTWVwdExUY1FGZjdpOHZvQk1wR0h5Zk51VTljQTY3?=
 =?utf-8?B?OFRvWHkvSWt2T0hMRWNuZlBXb2U5em1pT2crNk1YdnVUSlFCMVZYMUp5OG1h?=
 =?utf-8?B?bWxkVmNqbVp0bXRDKzJ3UngzbFVqUXQ1N0J2UGtTNGFLRjZNd1VadG9DOGxS?=
 =?utf-8?B?MExwbDJTWm5vN3cvRGl1cVFiLytsbUFKVkhKNEk5YXJSc0pTQ042dU91a3Fp?=
 =?utf-8?B?bFUzQTVEekIxMHpmNDRKQzN5VGExUFk4NS9hUmh2VUtDUzJKSFJjRXFpSE43?=
 =?utf-8?B?cE1zNXo0TkxVSG93N1hrQjBJUkdmenN1OHBTS0g3VHVYQXh0RXVHS0ZVdVNG?=
 =?utf-8?B?bnBWdkdvcnBwQWdINWpNZENMb1kremFzclV4VkZ2ZmJjd3NGMldRMlRsWlFn?=
 =?utf-8?B?TklSbzdNbVZCdFRPamwySy9MeVk4WC9UV0Z4eXl1aTdEdXEyM2hJcGYvVG1m?=
 =?utf-8?B?OWVkRlpvY3lOcHJuMm1YRkJteUZUMlZxT0hhRzBzdDBobmZQNnVVcU81cVVL?=
 =?utf-8?B?WUlpSTNLbFI3UVp2WTZwUE1lRFdGeVhHUFZYYklST2QvZHI1UWo3U1plMENo?=
 =?utf-8?B?OURhZ2o2c1dTUG9jT3IwZVNFNWRzYUp6RzJEVmRuYmFyM3RaZzNwM0xaZEVK?=
 =?utf-8?B?bFB0RUNFQ3h1SG9yQWtyR1hWSVMxa3VheXNUTjNUbXRYS0JYVXFvMC9wVHgr?=
 =?utf-8?B?WDBrc2ZZcVM4YVdkSzhNT25zdlp3UUd6VGRGbitUbzYvbUhlWU0waFRrYjN1?=
 =?utf-8?B?QVhyTmRwTi9vTkk3bUN5RzV4NDRjalc4MHFIRENRcUZ3bzFMS1NDK3YrYXJm?=
 =?utf-8?B?bG5veForQW8ybEVKbjhSdlpNWDFRZUIxUTZMSmlUaGE3ME0vVGZ4U2dCTHk0?=
 =?utf-8?B?MmtpSzhiTWJXNkdkZlFkZnl1Z2cwM0JHZWNqTzZhMjJmWGlQT2FVMWlVSklv?=
 =?utf-8?B?WEcwTkF2K0ZSS2o0OFBmaXA2cVJxY29lV0VDT2dmZW5UZkRmMDhnOHBSb3ho?=
 =?utf-8?B?TFgxVHBtdktDaGpWT1JxcWlKSDhoczJuOXRvOGUwVFJFWE82U1ZKUmhXQ0Fs?=
 =?utf-8?B?SUtudGU5VWVDbnpNTFpQKzAxb2RkMXpNWnI5b1hNWG5CaGxQNm96aHB1cnZJ?=
 =?utf-8?B?T21kNmhhdFlSSEROVXRpR2phS3N1UjhqcEJuaTJxeXZzNWR3dlpBTHpNR0xC?=
 =?utf-8?B?TmlKREU4cnhtRkxsMnlwMnBKM2pHUlpYWHlSSGZjdWh0anRWdlVtOG5vQmpy?=
 =?utf-8?B?NUJETFNPUndNTmJWcXJ1dHZLUjZpNG43dWd0MWUxZkxVc2RBUzhBWGRxaXdp?=
 =?utf-8?B?TERweWI4QkxzYkIxRm9YTmVsalBIdE4rTlhFU1J0ckJqcFJSTXBiRHhmd3BD?=
 =?utf-8?B?SUNIRVpGZ1l6bFhzV3hFSkpZK0s4UUVpV1U5ZTlyWDZGTFEwV1gwQjduaUVw?=
 =?utf-8?B?N0M5bjlSbjc4SHh6T1A2TGhQOHlNLzN2clgrVlNxRDBSK1ZLdkJnaDFYTU1V?=
 =?utf-8?B?RkhzS3p3eExhODZzOTF4aGp6Qm4wR1FwMVNPay83N3ZXeUNvU1NsbnpUWXFu?=
 =?utf-8?B?MURLS3hqa3hDMjZtY0I4bUY1cFBra2kzd3NKK0tYNWxua1pMSkNHbDJrVCt0?=
 =?utf-8?B?QW1UdlVZUjY0QU9mTS8xMGVvdjNNNEN4cllCU2hDaHlDMVYrTlJIaGhoSWp0?=
 =?utf-8?B?Z2QxbDYxdWF5S1RiL1N2akRUYU5ESUFXb0N1THRBVlJJUSsrdVlpeFpqNk52?=
 =?utf-8?Q?ztB0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0124d24-bf9c-4d7a-4e30-08db9cca6704
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 13:28:52.8256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9uqRA/JqTd/gg0BWnjKuDwYIuQ/ULLHA9Up+hwmHoT+2WJDH3R2kDNNz981WLvFqfUCcSzNqxEsoeHE2QR7aUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4463
Subject: [virtio-comment] RE: [virtio] Re: [virtio-comment] [PATCH requirements 7/7]
 net-features: Add header data split requirements

DQoNCj4gRnJvbTogRGF2aWQgRWRtb25kc29uIDxkYXZpZC5lZG1vbmRzb25Ab3JhY2xlLmNvbT4N
Cj4gU2VudDogTW9uZGF5LCBBdWd1c3QgMTQsIDIwMjMgNjo0MCBQTQ0KDQo+ID4+ID4gKzUuIFRo
ZSBkZXZpY2Ugc2hvdWxkIGJlIGFibGUgdG8gemVybyBwYWQgdGhlIGhlYWRlciBidWZmZXIgd2hl
biB0aGUNCj4gcmVjZWl2ZWQNCj4gPj4gPiArICAgaGVhZGVyIGlzIHNob3J0ZXIgdGhhbiBjcHUg
Y2FjaGUgbGluZSBzaXplLg0KPiA+Pg0KPiA+PiBXaGF0J3MgdGhlIHVzZSBjYXNlIGZvciB0aGlz
IChpdGVtIDUpPw0KPiA+DQo+ID4gV2l0aG91dCB6ZXJvIHBhZGRpbmcsIGVhY2ggaGVhZGVyIHdy
aXRlIHJlc3VsdHMgaW4gYQ0KPiA+IHJlYWQtbW9kaWZ5LXdyaXRlLCBwb3NzaWJseSBvdmVyIFBD
SWUuIFRoYXQgY2FuIHNpZ25pZmljYW50bHkgZGVwcmVzcw0KPiA+IHRocm91Z2hwdXQuDQo+IA0K
PiBVbmRlcnN0b29kLiBTbyBpdCBjb3VsZCBiZSBhbnl0aGluZyBwYWRkaW5nLCB3ZSBqdXN0IHdh
bnQgdG8gd3JpdGUgYSBmdWxsIGNhY2hlDQo+IGxpbmUuDQpZZXMuIGlmIHRoZSBkYXRhIGRlc2Ny
aXB0b3IgaXMgcGFydGlhbCwgbmVlZCB0byB6ZXJvIGZpbGwgdG9vLg0KSSB3aWxsIGRvdWJsZSBj
aGVjayBpZiBJIGNvdmVyZWQgYWxyZWFkeSBvciBub3QuDQoNCllldCBjYXRjaGluZyB1cCBhZnRl
ciBhIGJyZWFrLg0K

