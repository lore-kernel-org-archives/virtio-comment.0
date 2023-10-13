Return-Path: <virtio-comment-return-7719-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16FECDB482
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:54:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5A5052A829
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:54:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 33827986840
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:54:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 19719986836; Fri, 13 Oct 2023 11:54:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0A16F986837
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 11:54:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1ieE9IUY4kg6IJLdSMXX7TrbEoRDtJc0i+KVtnWCOfC6LzDtOzULxV+4I51ppcXvFN5rqN6U1UsbDnFvZfOMVh08bhDpsrSYKTr/DotqXVErWFv+AyOLe7VSsS+EU3qMtqq3DlYB9oCua3hK9FTTbTOT17VeyXH2/h2osJcu56FEfJcWaRnZdc/pcxzCRrpSmayddJtkHCAfz28aZM6EFq+OzkR2OjvrLp87wiGnPcF2OuYeL4+UpEhwVsvqO58GaH78VQAN7NsHkGeHQ4zA6kf4N61OwvgkO4mnCKkjWHTXHPUM1Eb/uSWbclz0U8d5pvgE0FoVGC5jgAmUjx8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJGqvgizZPSPnwBP06FMyUqBTyuRapnG/ybrlF0cxzI=;
 b=RUkQT/FlGW7uREu2gf0G0e/6ZFUi8ueK8NsSzqE9yAPnZxY1LSAjSLsTEAECzT4QLQ/Nl7h6hl2f4YaM+B9O6z3oPE4+YSrDQo6hrCmCUu7hVoj6nW6dTAV4GqBL97nqVer54MvK8HYYt047s4YAiGS8YTNETgp4B04M7S32k7+8k+B8/JyLRTIIlae85u0ZJ8Z2FlWb98Y2gyExpjzvdaLp1xU0Id0vxbVKK+MQNn3y8Ws/VGcPCmLKNDDqf2Q5ZijPGrNhagxj/yuQigQ2+yeYbvxFT/jp6ck/bfKEKjCAW8/qGMS6eK5O3HoiBltQskLtNwWduae6FZB0+ThiIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLA
Date: Fri, 13 Oct 2023 11:54:14 +0000
Message-ID:
 <PH0PR12MB548139B50AD2D1B86AC9A127DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org>
 <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
 <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
 <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
 <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6fc4af28-67d9-781b-a243-a6c2ebf0244c@intel.com>
 <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
In-Reply-To: <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH2PR12MB4248:EE_
x-ms-office365-filtering-correlation-id: ccd274ca-26ff-4b6e-ce58-08dbcbe31f83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 WL2xoBIsDVd1pupzqTtRl7F8LdVnH755h2vfEPbQygC0/RlcSLVjAMCLJA9BuyT8hMTq7yiMhF1eatrY3nd4AxNkYTZnYVzTE+kn6XoXZYHb75qSF/kdzNNiqoAE05efl/Yk47JSybbMsWQ9iSnUWOCluw25KFL7EYdZ42k9jXgh8zX3ziC1P8tB7sIGVQC9G4VkVTH9vV8x8vJLpTb9nC7tBOpLwhNSJvK0KHz7OFYLmW9d00IivPgfKj2zW0km2+N6QNGgU6/Gcl4Wv5asOd/w1mDJVBjSpU/23sjj/5VJWkxiE4ZRLNx5t23aNEus8Sos6NIPSJNxEjKuZ9pNMVSzZKbTpErCWJoAQRYaMAm7e3+7TjKQjTz5CvoYf1ax3+IvlvcdGLvvVQ7PqSVRxJ8tWQhX6udhk0/b/nk7hTa2ZnXObx+A+YIg7lgWnm80rmxG5hrG0SDw6+nMMLcZaBe9gYF2DY30P2wFVydUw7z11GyIVcqSF/bF2dupUXknhreQZCC5uqpqN5cYRun88d0P7qLsK98oyydnJx+hnf1/lYzsEGbfcWhMIUxws1Jb0X+fFPFj+bzT08wEVVoM9GeCt6JXWB2197y3AX8tBqDAxmCayfzh/grdCtw3/CoHxL/+Ei2yvOIiCbvYei0fjA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(366004)(346002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(26005)(71200400001)(38070700005)(122000001)(38100700002)(55016003)(33656002)(86362001)(9686003)(66556008)(66446008)(4326008)(8936002)(478600001)(2906002)(8676002)(41300700001)(107886003)(64756008)(7696005)(316002)(5660300002)(54906003)(966005)(110136005)(66476007)(6506007)(76116006)(66946007)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnlqRDQ5NWJXOVVPK2dQVHVaQ0ZGR2IvMW5IMEczaGF6TWx0ZGYvbStrNVEr?=
 =?utf-8?B?U3A4NEVsTFhkUDQvMnRzWTJMZit6TFhxVzM5TFZzY050eUFEQVNRWnh3L2xq?=
 =?utf-8?B?cEp0b3U5bXI4SWFVUzByNS9DYVBlNWpCdExKYjVBY0FVeXFjL3ZWVW04R0Rx?=
 =?utf-8?B?bkk0T0dnSEJ5MFVhMlJYVk9YUHNlcmk0anpHQlF6NW1iY2MwdDZFaFNVTVQv?=
 =?utf-8?B?OGdkNWVOZ05FV3lFaGY4QXg0bHV3NzlUYytNZTE0elNkNjFmRExodmMzNUJ0?=
 =?utf-8?B?L0xuSDhGdnpVNDJIelB2ay9teUxvMHR6WFBVYWdZSHZXcmtHWmd1M1hvUk1K?=
 =?utf-8?B?VVM3S01qS0s2ZS9UWVN0T0dPVXJyMFcxUmQrWUJwM0w4WHJCb3paTWptU0ll?=
 =?utf-8?B?dlFGbzBuSWdYNFZSVDJJZTNZT2p3dlhaaHRzYXBGNjc4bnRVdzFmcld6NWlS?=
 =?utf-8?B?Z3JzSzU3QjhLVittaUJmd0hHUFRzY1JtTWROa1VPMFpoQUxtV2tpTWNMTmZQ?=
 =?utf-8?B?Tm9DckQ1amV3S3ZZaytpQ0lQK3VvVjFKeWJNM1UxRHJVemFPNU9QeUFqaUlP?=
 =?utf-8?B?L3VIMHNkVzVnTFdkUUtQeDM1RnpSZklseFJLVit1cXVCUFdNSm9ucWxKVjZm?=
 =?utf-8?B?Q1N1Mnp5Q0tTcjlFUE9QNDlvYS9TM3d4eHFoUk9zamk1TUsrbG9rbjMyMmpD?=
 =?utf-8?B?MzZBOHdacDNpMDRKbEdyd1owYUd5WmU2MFFlNFZYUlowc2xoekMzUmZwc0x0?=
 =?utf-8?B?RXhueFhhNmpodWhPNGM0SW9LYzZKUjB2cjJZdmRIeTBEK01pYkFnU3FodFpa?=
 =?utf-8?B?TWhvZ2cxcXhSYkFJUDJ0V242YWkxMzhVK0MycE9KVWg0RVdsVVNPQ2EvRDFw?=
 =?utf-8?B?bnIrYktnWno0dDhvbVJ2RjRPdUE5bFRlVUFZOSttUmNQUnhySHdGamFFTXlY?=
 =?utf-8?B?TjNoZ1kvdnNSeWgzb3ZlWStYeGwybUhkUmNtckF4NzF2S1MyZC9mTFdGK1Fy?=
 =?utf-8?B?Ti9YUVB3WVBrOFVydG0vUzM4TXM3bHRVYzd3WWhybG9NZkwzM3ZKZURhVHo3?=
 =?utf-8?B?bmhaVlpha0VXdWs4RzlDdlFlTTlTTXZjdnBXTTlWWDlaNDZ4aHlEb1Q1T1Fl?=
 =?utf-8?B?TTMwaE9kT3NBLzRZRTgrTk4wb0p2Z3VZc01ydm10aVhLRVFtTWxEc0VTcHE2?=
 =?utf-8?B?UCtiVnJydmtXOXU5UE5ocERvTzNKejVjZ1JPZThnNUZpSEFINkVnV2JrUlNV?=
 =?utf-8?B?RkhNaVMxUEpHM3luY3ZDVUlURG5DaUprNkVGS2FhSGt4akNMdWVVUXpYa0hs?=
 =?utf-8?B?VlgwQk9nRGxuYkVRNUlVNEUrbFFzZGZGM1gxUVZRY0hrbzNoVW9VRE51dnJv?=
 =?utf-8?B?MTBQSkhNQ0FQY1hhMXJhMTgzaEFTa0dXNjhlWkY2cHZQYUhzOFZ2TVFSL1kv?=
 =?utf-8?B?VTVvOXVmUUpzRzFyQm1ZSE9jRTNkNEs0akVVUGFoT0J1VFJQdDBGOHF5Ly9T?=
 =?utf-8?B?NlJsZG9vNUdKZUQ0ZUFnRjJ0QXpRcEJIMUZUWkQ2Z2t3SnpFZk55YjZQYlkr?=
 =?utf-8?B?VUVwRDFBSlZXL0tncXdoR0tiVW5TN1Y0RGJiZklPZVlpdUF6aitlQ1lMVDVH?=
 =?utf-8?B?bDJCY0tVbmJ6MW5WdzZlSTF5TmVVejdDSHpFQVUxbm5KaGk5MHAyczk0U3Ry?=
 =?utf-8?B?V1BtWnVUT3MwZkFuUStENVJvK05ITFh6VFpnQm1XbG9XT1A3NFZ1dzk1cTFk?=
 =?utf-8?B?N3lPVEdxd3gxdzQ1N2VFSnlqdVZ6OXkwTU42VUVZT2krU2RGRS95aGxubWRz?=
 =?utf-8?B?L3ZYMVZiSHBQKzMybDk5RU4vOCtYN0R5NDRkK3NrTjdYb0dyK1g5c0QxN2Nx?=
 =?utf-8?B?NXdUSE95dHFocGlneW1HVHk3dm8xbzhoMDhINnBrcVdEKzZWSVZJVk9zZFRv?=
 =?utf-8?B?NXJSbHZ1cnk0eWNPR3NydDdyK0R0UFROR3Z3NnNRbzllbDhnRGtiN25hbmNT?=
 =?utf-8?B?RWVNTnNOWmhqcFl5SXRvb09pNUhvcWt5MVk2NURLUTVHc0pCb2MxVUZEQTFH?=
 =?utf-8?B?TC8vN3VxT0dvNHRYVTVJT2dES0g5SmVTbUQxdWtzZ3V5a09oN3FlUDFGcGZT?=
 =?utf-8?Q?X+zk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd274ca-26ff-4b6e-ce58-08dbcbe31f83
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 11:54:14.9431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cLirbKf6ntXqVwxVQVyWvFn7ve9/ZihmJQ5m3LP3LUuMdqy27uW14Zy0g/k9AbcP/JLMkhd98jgwJA/OWgHuiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4248
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IEZyaWRheSwgT2N0b2JlciAxMywgMjAyMyAzOjE0IFBNDQoNCj4gPj4+PiBIb3cgZG8geW91IHRy
YW5zZmVyIHRoZSBvd25lcnNoaXA/DQo+ID4+PiBBbiBhZGRpdGlvbmFsIG93bmVyc2hpcCBkZWxl
dGdhdGlvbiBieSBhIG5ldyBhZG1pbiBjb21tYW5kLg0KPiA+PiBpZiB5b3UgdGhpbmsgdGhpcyBj
YW4gd29yaywgZG8geW91IHdhbnQgdG8gY29vayBhIHBhdGNoIHRvIGltcGxlbWVudA0KPiA+PiB0
aGlzIGJlZm9yZSB5b3Ugc3VibWl0dGluZyB0aGlzIGxpdmUgbWlncmF0aW9uIHNlcmllcz8NCj4g
PiBJIGFuc3dlcmVkIHRoaXMgYWxyZWFkeSBhYm92ZS4NCj4gdGFsayBpcyBjaGVhcCwgc2hvdyBt
ZSB5b3VyIHBhdGNoDQoNCkh1aC4gV2UgcHJlc2VudGVkIHRoZSBpbmZyYXN0cnVjdHVyZSB0aGF0
IG1pZ3JhdGVzLCAzMCsgZGV2aWNlIHR5cGVzLCBjb3ZlcmluZyBkZXZpY2UgY29udGV4dCBpZGVh
cyBmcm9tIE9yYWNsZS4NCkNvdmVyaW5nIFAyUCwgc3VwcG9ydGluZyBkZXZpY2VfcmVzZXQsIEZM
UiwgZGlydHkgcGFnZSB0cmFja2luZy4NCg0KUGxlYXNlIGhhdmUgc29tZSByZXNwZWN0IGZvciBv
dGhlciBtZW1iZXJzIHdobyBjb3ZlcmVkIG1vcmUgZ3JvdW5kIHRoYW4geW91ciBzZXJpZXMuDQoN
CldoYXQgbW9yZT8gQXBwbHkgdGhlIHNhbWUgbmVzdGVkIGNvbmNlcHQgb24gdGhlIG1lbWJlciBk
ZXZpY2UgYXMgTWljaGFlbCBzdWdnZXN0ZWQsIGl0IGlzIG5lc3RlZCB2aXJ0dWFsaXphdGlvbiBt
YWludGFpbiBleGFjdCBzYW1lIHNlbWFudGljcy4NClNvIGEgVkYgaXMgbWFwcGVkIGFzIFBGIHRv
IHRoZSBMMSBndWVzdC4NCkwxIGd1ZXN0IGNhbiBlbmFibGUgU1ItSU9WIG9uIGl0LCBhbmQgbWFw
IG9uZSBWRiB0byBMMiBndWVzdC4NCg0KVGhpcyBuZXN0ZWQgd29yayBjYW4gYmUgZXh0ZW5kZWQg
aW4gZnV0dXJlLCBvbmNlIGZpcnN0IGxldmVsIG5lc3RpbmcgaXMgY292ZXJlZC4NCg0KPiBBbnN3
ZXIgYWxsIHF1ZXN0aW9ucyBhYm92ZSwgaWYgeW91IHRoaW5rIGEgbWFuYWdlbWVudCBWRiBjYW4g
d29yaywgcGxlYXNlDQo+IHNob3cgbWUgeW91ciBwYXRjaC4NClRoZSBpZGVhIGV2b2x2ZXMgZnJv
bSB0ZWNobmljYWwgZGViYXRlIHRoZW4gcG9pbnRpbmcgZmluZ2VycyBsaWtlIHlvdXIgY29tbWVu
dC4NCg0KSSB0aGluayBhIHBvc2l0aXZlIGRpc2N1c3Npb24gd2l0aCBNaWNoYWVsIGFuZCBhIHBv
aW50ZXIgdG8gdGhlIHBhcGVyIGZyb20gSmFzb24gZ2F2ZSBhIGdvb2QgZGlyZWN0aW9uIG9mIGRv
aW5nIF9yaWdodF8gbmVzdGluZyB0aGF0IGZvbGxvd3MgdHdvIHByaW5jaXBsZXMuDQphLiBlZmZp
Y2llbmN5IHByb3BlcnR5DQpiLiBlcXVpdmFsZW5jZSBwcm9wZXJ0eQ0KDQooYy4gcmVzb3VyY2Ug
Y29udHJvbCBpcyBuYXR1cmFsIGFscmVhZHkpDQoNCkJvdGggYXBwbHkgYXQgVk1NIGFuZCBhdCBW
TSBsZXZlbCBlbmFibGluZyByZWN1cnNpdmUgdmlydHVhbGl6YXRpb24sIGJ5IGhhdmluZyBWRiB0
aGF0IGNhbiBhY3QgYXMgUEYgaW5zaWRlIHRoZSBndWVzdC4NCg0KWzFdIGh0dHBzOi8vZGwuYWNt
Lm9yZy9kb2kvcGRmLzEwLjExNDUvMzYxMDExLjM2MTA3Mw0K

