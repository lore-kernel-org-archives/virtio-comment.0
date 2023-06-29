Return-Path: <virtio-comment-return-6597-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F32EB64D9
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 04:11:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 609AB16DFC9
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 04:11:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 42EB69865AA
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 04:11:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3286F98658B; Thu, 29 Jun 2023 04:11:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1D69E98658E;
	Thu, 29 Jun 2023 04:11:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UafwbPovMc4pwxVtklYZcmSkhSbDiWQcDWDCa6CFTv994YdCIbHX5rcRGsm6vpt5jzySI59Kc03KCrLUEXw9IU1DBh2O1FirUJipVRffSmjRwAFVGxXvMtuhoc9fm5K/HDesISlkUy8y+KSESh0A/olLiysjj5TThtIK1tvliQoZogsYbeexu6Kxb0Gsb6e1QChB2eulcSVPkzJh2e4ES7SQe5Bqql4Qmtc8WQCRLi54/fu6lyGWTmQKLPAZhjIq/CTK8yVig1SR/1vRCLh/8cjykblbgnQA7mBBJlwgQ165deZKnqFHuv1CfijU4DOYgNl5ZL6v8jAG8nsMZk9eqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5aDBH0bEJcUl8vWc3auzD8SuFTzaSNpydZLKBLLFRY=;
 b=gAJSKwO1rJ8ZR2AtpQHQMPWPREmg6Bj26CiKY30WG4zexMyWDcZiJusFI+7Omm50sWIdYmY5kWOvcm8ip+f73IQtwomRu/nZRXUhqJXcGHNTlMV3VPb17rwDQ6awe0cN16aiBId3SpaDGOmVrPvAQYj+EiWYc8667EB3PmHh1JvJvqzeRAtgvpAXDnQDNPMAksMyz9R87dHKU5ChD18qmrAUu+zSZW2N+yzDnBuhGkeFrEdD+Lp+E2Lxx9B2twGXTBZQTBe35FO5jPRkNy6jc68S/S+gV2KJxjdq3Vo0JZoQL9Jj8dxXqKi3g0wPp0wViVJHoUvTwPW8XoqHSATE5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] Re: virtio member device provisioning get/set
 and virtio child device life cycle mixing not needed
Thread-Index:
 AdmpVpzpKKBUbqM4Qgq425cUop3WcQAO9SoAAAusrWAAG7XmgAAACPggAACt3gAAAAnhcAAC2RKAAAAs+0A=
Date: Thu, 29 Jun 2023 04:11:30 +0000
Message-ID:
 <PH0PR12MB5481D899B11168F30AACB572DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481821452DA2A9572714BB9DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6b95e5ec-37e7-7150-9926-6bb02ee13cf3@intel.com>
 <PH0PR12MB54818AEB1A85069B42B97158DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1bdd18c7-c4bd-8049-ee63-227fe25fb7a5@intel.com>
 <PH0PR12MB5481F5D8B77067A8CDCB5A9FDC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f558c9f4-ca06-ba68-67f6-49f649097b05@intel.com>
 <PH0PR12MB5481532D87D5606D90938B39DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <21362b40-9d40-8c56-30e1-1bc166d622be@intel.com>
In-Reply-To: <21362b40-9d40-8c56-30e1-1bc166d622be@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH2PR12MB5514:EE_
x-ms-office365-filtering-correlation-id: 2a4fd480-0c0d-4fd4-d661-08db7856eaa4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 e/x6T0lver9x/Fr2/rVXQozT7kBh/qnWQTNw7rGtWcFlb6qwaMgKEcjCzVMKbWY7HdNLPRJAG3s6Mdj+3hVXu2SBZWv5+8EeNtaXeSOdMVpwzsoQ9To2wzck0rAZmbynofAEkTqa+LLiuHrqgTfzCfAKazZjAImtHQeGhhd0dAAos4GL11oDngEld1+cJMe3RniNJxWG1pJWCpVt9+jPgOdyeyj9nMi1+cpPpbmL8d3AW9ZJndN8172kc4GyXbhcs2VTa/Huv5pPK3KEEaWpPRJAAIFwg689rgR9IRaFaOX6L4nqZEoll7pyQkox2+Mh4UysgR+C+zxW3Cxw2uL74lyG9ZHB/8jxhrg92Nnls6s9lwUkRiZIqBoxX0DpA8jflDE7NKl0Nde7XQ2G8eBP58Q4+fbVRCGuYxHfSKbGODuVDziSwl6YkzwaoqCu80TqSDPh8Q0x6p6GWycCtaxVzDoKTs7VrRizCeUZOXmUt3uK0P2Zf0lDIhIVNCcyaKgbdjLHRYaxI6Jp2wQCRiUnec4vwIbilOgJSLalKQPHJR71Lm22TNu+/MoZDVS1BCV8Xq3N37QHLJD1Ks31vfnXmmeH9Q+qxLS5Tb3fm1oVQBjLTydL7rji/Y2bwrEzoo9Y
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199021)(122000001)(38100700002)(38070700005)(83380400001)(33656002)(86362001)(478600001)(54906003)(9686003)(71200400001)(7696005)(4326008)(41300700001)(66556008)(316002)(8936002)(66946007)(55016003)(76116006)(66476007)(8676002)(66446008)(64756008)(6506007)(186003)(53546011)(6916009)(26005)(52536014)(5660300002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cXRRR1d5YVBGY2FHcWRSd05pSFVuTGtPelRsOTI4ZEtzUFUrazlYeWhDNW5E?=
 =?utf-8?B?by9LVUFoaW42MmJsZlcrdFcyK3N1Y0hzNGlOZXN1d0IvWnhSeE9iNmFaTFJO?=
 =?utf-8?B?NlNqSUorTkVCdnp0K2U3Z3VIMWsyUHdsNEExYnF0VzNIMzZYbDBVRUMwdTN2?=
 =?utf-8?B?TnFwMERLRnhiZUs3NlNNVnpFYmJ6VjRvUXg3K2MxaDZZRlRncEx0bitqeldt?=
 =?utf-8?B?K0lMaTJ5Kzl2dTJPdWZDN2xBaE5EdGNvcHI0MWd3NWoweEFrUGZpMjcrdUZW?=
 =?utf-8?B?WlJlbDNsL0FGZ3NIQzdOVU5MOVNsZTh6Y2ljenpvQ0JzbUYwb0FtcXp4aGZI?=
 =?utf-8?B?TjJvWFpjb1BkckdYdGRSVjhDb2ljVy83MGx2dVYwVm1YRzFlNjFpNmg5SG1I?=
 =?utf-8?B?RVY1em1ISHUyR0ZGaEEvUGVNM1B6NXVENWExVGFRdndqeWhXVmhOT29aY3BI?=
 =?utf-8?B?dXYvcGFxMk4rNm82Wm5DQTVKWmpXUzRvbWRhcjVCSGxvdXBObnZtNzIvdW9U?=
 =?utf-8?B?bFRRd0lQVFd3RFM0RE5ReG0wdTYvVXR5WVFVVURxNTRidVJuZW5RUW1aMWl5?=
 =?utf-8?B?NG1tTUJWN2hZb3pYT1IzZkZNY3lMUXByZWREWlI1QjJDbUFNMzdaM2w0d2xO?=
 =?utf-8?B?empOZnBhWTFlMFlqSXJxVmE2YzVQeUdRbHNDUzZBeG04RlJYK1J0QjVXa2VJ?=
 =?utf-8?B?R1Byc2s2OHA0MEJWUDBBYVVOMWZPaWszVDd2bGdKeDZzUGVjRzRCMjJFczBY?=
 =?utf-8?B?K2hGTlRxT0JJdTJmMXpqZWE5dVFTcE1LZnVlZGhIcEVQbmgvb2NTTFpuVWZC?=
 =?utf-8?B?WmFIY2dodFZ3R3pmV21CQU5mbkhNbDhhRGhKa0tKbXg3cnllbnVZZGdteWFM?=
 =?utf-8?B?NzViNzRKWW9OQ2h0TXI1VitoRi85ZkFTVnRNOWQyMjJBaTd1emVXcTBzQU1O?=
 =?utf-8?B?bytZeXlKMUxHcjNWWllSVnFjeHpRb3ZXQWhrWWlrbnBXMmNNQ2ZqRC84MmV1?=
 =?utf-8?B?SnJXVTFTNFRITU5qaTVWdEQ2M1E2cENDR3lMeEhOQmQ3NlJoak5ucjR0aHFB?=
 =?utf-8?B?czR1M3lVdnV3QnlxUHBEOU1vaFl2WmRPQjM2ZnBGS1pMcHpqS0lOa25CVWxR?=
 =?utf-8?B?aVc1STBaMVBhL0hHYkwrZlE0Y3gxa1I2NG0zNXhyV1NEeWZsTWxtbEd0ZnlD?=
 =?utf-8?B?bURpUU1RSVFOZXk2Z1ZDYTEydXhDc3JOaHd3aE1KYjVwL3ZPZDlhaUp6L3Y3?=
 =?utf-8?B?MXQxb291OU1iZTF3eFNhVzYxQW9tMnRaL1VoNVBjZmdZSWhpNSt5QVBlSndD?=
 =?utf-8?B?Z1RnQWRoanNaeStkYkU3bkd0dUsxQnJvd0t1VkJzYitKRy9XN0pqajBVMFR2?=
 =?utf-8?B?UURDcm5WS2xWc2JXaExnME0vTldHWG1OODQ1Z3NWWTM1R3NyNnBwVmpzbVZO?=
 =?utf-8?B?bUMyLzlyWFdUWFMvK2h6REdJTmR4T1FXaUNhMWo0WTl1b2NiOHZNQUlVdjNx?=
 =?utf-8?B?c2FyM0pPaTcxcWZ4KzdhMnE1bjIrdkp3OXlGemFjOHR5aTdhU0U4MkZoalVy?=
 =?utf-8?B?ZUVyQnV6c2Z3REtHQlB0ZnhsZ1FFNElyNlpyNUpWeFIwQWNFaFBGTkNtSnBm?=
 =?utf-8?B?WWVaUWxvZStHWUNmN0NyZVpncHkvRnhqb21qYWwyTTUrcW5IVC9OMDNTRENx?=
 =?utf-8?B?ZmhDNCtBYmhvZWpRaVMvOVhUaDliRDV2Mjh6OWNHTWtHaFJWaCtpY2NtSnJW?=
 =?utf-8?B?SEpxRVh0cnNpTDNvb0c0U1ZNWHM0WVQ1OUNVYXRmdkRESWJtL0JhaWQ3eHJr?=
 =?utf-8?B?Y2Uxb3NPOEZNZkR3WnRJK3g4Uk9MYS9HTmsxdVM3Qm9jeGcweG9iamg0Qm1I?=
 =?utf-8?B?ZDlBSHMrb3JxQ2pYUzY0Ly90NTBBbmJhbVlqYVRKU1ZKQzkveUp1NUZUdGZB?=
 =?utf-8?B?MXBna3ZRY213NUtWbmkzRmlSQVM4UTZ1OS9DZmpjMGN1ejZneXVzeXlLWFZL?=
 =?utf-8?B?cU1TcklXZ0hGaXAwVVVIKzZUZHh3MjVJblNpejF0KzFQYVRsVlBwampvd2J5?=
 =?utf-8?B?Q1Zzd1hUSHpSWE5LcTE3aVJKVXpzQTFTM0lHTzRoV0tnbzdjaEYyZGdLM29j?=
 =?utf-8?Q?oezI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4fd480-0c0d-4fd4-d661-08db7856eaa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 04:11:30.1770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fL1q49NPZ7sRFtBvgfcNunIXLzcnxTtw8Y+yN2gzgAMiaCyUl4432TAk5iBr1J2Thkc+R77VdzWhS//z9YecCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5514
Subject: RE: [virtio-comment] Re: virtio member device provisioning get/set
 and virtio child device life cycle mixing not needed

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFRodXJzZGF5LCBKdW5lIDI5LCAyMDIzIDEyOjAyIEFNDQo+IA0KPiBPbiA2LzI5LzIwMjMgMTA6
NDcgQU0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGlu
Z3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDI4LCAyMDIz
IDEwOjM5IFBNDQo+ID4+DQo+ID4+DQo+ID4+IE9uIDYvMjkvMjAyMyAxMDoyMyBBTSwgUGFyYXYg
UGFuZGl0IHdyb3RlOg0KPiA+Pj4+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBp
bnRlbC5jb20+DQo+ID4+Pj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDI4LCAyMDIzIDEwOjE4IFBN
DQo+ID4+Pj4+IFNvIG1zaXggcHJvdmlzaW9uaW5nIHZpYSBBUSBpcyBmaW5lLiBWRiBjYW4gZXhw
b3NlIG5ldyBNU0lYDQo+ID4+Pj4+IGNhcGFiaWxpdHkgcG9zdA0KPiA+Pj4+IHJlY29uZmlndXJh
dGlvbiB2aWEgQVEuDQo+ID4+Pj4gSXQgaXMgdGhlIGd1ZXN0IHRvIGNvbmZpZyBNU0lYIG9mIGFu
IGFzc2lnbmVkIFZGIGJ5IHdyaXRpbmcgdG8gTVNJWA0KPiBjYXBhYmlsaXR5Lg0KPiA+Pj4+IEhv
d2V2ZXIgaG9zdCBvd25zIHRoZSBBUSwgbWVhbnMgaG9zdCBjYW4gbW9kaWZ5IHRoZSBNU0lYIGNv
bmZpZw0KPiA+Pj4+IGV2ZW4gd2hlbiBndWVzdCBvcGVyYXRpb25hbCBydW5uaW5nLg0KPiA+Pj4g
SG9zdCBjYW4gZG8gbWFueSB0aGluZ3Mgbm90IGp1c3QgTVNJWCBjb25maWcuDQo+ID4+PiBIb3N0
IGlzIG5vdCBzdXBwb3NlZCBtb2RpZnkgdGhlIGNvbmZpZy4NCj4gPj4+DQo+ID4+PiBJbiBzb21l
IE9TIE1TSS1YIGFjdHVhbCB2YWx1ZXMgYXJlIG5vdCBldmVuIHdyaXR0ZW4gYnkgdGhlIGd1ZXN0
Li4uDQo+ID4+IHllc3QsIGN1cnJlbnQgaG9zdCBzdGFjayBpcyBub3QgcGVyZmVjdC4NCj4gPj4g
U28gbGV0cyByZXNvbHZlIHRoZXNlIGlzc3VlcyBmaXJzdCByYXRoZXIgdGhhbiBpbnRyb2R1Y2Ug
bmV3IGF0dGFjayBzdXJmYWNlLg0KPiA+Pj4+IEEgbmV3IHN5bmNocm9uaXphdGlvbiBtZWNoYW5p
c20/IFRyYXAgYWNjZXNzZXMgdG8gTVNJWCBjYXA/IEJhbg0KPiA+Pj4+IGFjY2VzcyBvZiBNU0lY
IHRocm91Z2ggQVEgYWZ0ZXIgRFJJVkVSX09LPw0KPiA+Pj4+IERvIHlvdSBoYXZlIGFueSBkZXRh
aWxlZCBpbmZvcm1hdGlvbiBhYm91dCBob3cgdG8gcHJldmVudCB0aGUNCj4gPj4+PiBjb25mbGlj
dHMgbGlrZSB0aGlzPw0KPiA+Pj4gQSBoeXBlcnZpc29yIGlzIGEgdHJ1c3RlZCBlbnRpdHkgdG8g
bm90IG1lc3Mgd2l0aCB0aGUgVkYuDQo+ID4+PiBBIGh5cGVydmlzb3IgY2FuIGdvIHRvIGFuIGV4
dHJlbWUgdG8gZXZlbiBkbyBQQ0kgRkxSIHdoaWxlIGd1ZXN0IGlzDQo+IHJ1bm5pbmcuLg0KPiA+
Pj4NCj4gPj4+IFNvIG5vIG5lZWQgdG8gZ28gdG8gdGhlIGV4dHJlbWUuDQo+ID4+Pg0KPiA+Pj4g
V2hlbiBoeXBlcnZpc29yIGlzIHVudHJ1c3RlZCBpbiByZWxhdGl2ZWx5IGZhciBmdXR1cmUsIHdo
ZW4gYSBWRiBpcw0KPiA+Pj4gcHV0IGluIHNvbWUNCj4gPj4gc2VjdXJlIGVuY2xhdmUgYW5kIGxv
Y2tlZCBoeXBlcnZpc29yIHdpbGwgbm90IHN1Y2ggYWNjZXNzLg0KPiA+Pj4gQXQgdGhhdCBwb2lu
dCBsYXJnZSBwYXJ0IHdpbGwgYmUgY292ZXJlZC4NCj4gPj4gVGhlcmUgY2FuIGJlIG90aGVyIG1h
bGljaW91cyBzb2Z0d2FyZSBhbmQgYSBoeXBlcnZpc29yIG1heSBjb21wcm9taXNlLg0KPiA+IElu
IGFueSBjYXNlIGl0IGlzIG5vdCB0aGUgcm9sZSBvZiB0aGUgQVEgZXRjIHRvIHByb3ZpZGUgc3Vj
aCBwcm90ZWN0aW9uIGV0Yy4NCj4gWWVzLCBpdCBpcyBub3QgQVEncyByZXNwb25zaWJpbGl0eS4g
SSB3aXNoIHdlIGRvbid0IGludHJvZHVjZSBtb3JlIHdlYWtuZXNzLg0KPiA+DQo+ID4gU2FmZWd1
YXJkaW5nIGZyb20gaHlwZXJ2aXNvciBpcyBjb21wbGV0ZWx5IGRpZmZlcmVudCB0b3BpYyB1c2lu
ZyBjb25maWRlbnRpYWwNCj4gY29tcHV0aW5nLCBURElTUCBhbmQgb3RoZXIgYWZmaWxpYXRlZCBz
dGFuZGFyZHMuDQo+ID4gSXQgaXMgZmFyIGJleW9uZCBtc2l4IGNvbmZpZyBwaWVjZSB0byB0YWNr
bGUuDQo+ID4NCj4gPiBCZWZvcmUgd2UgcmVhY2ggdGhlcmUsIHZpcnRpbyBzcGVjIGhhcyBjZXJ0
YWluIGZ1bmRhbWVudGFsIGNhdGNoIHVwIHRvIGJlDQo+IGRvbmUsIGF0IGxlYXN0IHRvIG1lLg0K
PiBTbyBsZXRzIHdvcmsgb24gdGhhdCBmaXJzdCB0aGFuIHJ1c2ggaW50byB0aGUgQVEvVkYgcHJv
dmlzaW9uaW5nIGNhc2UuDQo+ID4NCkkgbWVhbiBxdWVyeWluZyBhbmQgcHJvdmlzaW9uaW5nIGZl
YXR1cmUgYml0cyBhbmQgY29uZmlnIHNwYWNlIGZpZWxkcyBpcyB0aGUgYmFzaWMgZnVuY3Rpb25h
bGl0eSBiZWZvcmUgYXR0ZW1wdGluZyB0byBzZWN1cmluZyBpdC4NCkkgd2FzIHRvbGQgdGhhdCB5
b3UgYXJlIGdvaW5nIHRvIHJlYmFzZSB0aGUgdHZxIHNlcmllcyBvbiB0b3Agb2YgQVEsIGhlbmNl
IHRoZSBhc2sgdG8gc3BsaXQgdGhlIHNlcmllcyB0byB0d28uDQpJZiBJIG1pc3VuZGVyc3Rvb2Qs
IGl0cyBmaW5lLCBteSBiYWQuDQpTb21lb25lIGVsc2Ugd2lsbCBwaWNrIHVwIHRoZSBmZWF0dXJl
cy9jb25maWcgcHJvdmlzaW9uaW5nK3F1ZXJ5IHBhcnQuDQoNCj4gPj4gSSBzdGlsbCB0aGluayB3
ZSBzaG91bGQgcmVzb2x2ZSB0aGUgaXNzdWVzIGZpcnN0Lg0KPiA+IEkgZG9u4oCZdCB0aGluayB0
aGlzIGlzIHJlYWxseSBhbiBpc3N1ZS4NCj4gPiBQYXNzdGhyb3VnaCBWRiBkZXZpY2VzIGFyZSBh
bHJlYWR5IHRoZXJlIGZvciBtb3JlIHRoYW4gYSBkZWNhZGUgYW5kIG1zaXgNCj4gY29uZmlnIGlz
IGp1c3Qgb25lIHNtYWxsIHBpZWNlIG9mIGl0IHRvIHByb3Zpc2lvbiwgYW1vbmcgb3RoZXJzLg0K
PiBwYXNzdGhyb3VnaCwgbGlrZSB2ZmlvIHdoaWNoIGFzc2lnbiB0aGUgZGV2aWNlIGluY2x1ZGlu
ZyBpdHMgY29uZmlnIHNwYWNlIHRvIGENCj4gZ3Vlc3QsIHdvcmtzIHdlbGwuIFdoaWxlIEFRIGlz
IGEgc2lkZSBjaGFubmVsLg0KU3VyZS4gQVEgaXMgc2lkZSBjaGFubmVsIGJ1dCBoeXBlcnZpc29y
J3MgYWJpbGl0eSB0byBhY2Nlc3MgVkYgd2hpbGUgaW4gdXNlIGluY2x1ZGluZyBkb2luZyBGTFIg
YW5kIG1vcmUgaXMgYWxyZWFkeSBleGlzdC4NClNvIHN1Y2ggdGhpbmcgZG9lcyBub3QgbmVlZCBz
cGVjaWFsIHNwZWMgbGV2ZWwgcHJvdGVjdGlvbi4NCkFuIE9TIGRyaXZlciBjYW4gaGFuZGxlIGl0
IGludGVybmFsbHkuDQo=

