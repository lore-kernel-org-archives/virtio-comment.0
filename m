Return-Path: <virtio-comment-return-7676-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EFECDB46E
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:09:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8AF10941E8
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:09:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 70E0B98680A
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:09:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5EA1B986474; Thu, 12 Oct 2023 10:09:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 517DF98660E
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 10:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGhzxtVJC+QPAEWa7ABBAAtbHEZI7VkMUdCP2urf8/kR9eKHn2ROOazHnTnAKaiNHQhlQWYtnOoVtC28VsK4NUwA02IJfpfV4KswIzquCUhmVeE9T62rCx7PuAgnAhRcGyWaIrydCozf4EBSHkEmpClHhNAiZ+Z9OlCwPRFKgdtyrMDFx3AtnXoZ9Hq35wbDKIC+y0DpgZOJsjhMFD5Nf7dCJd4F5uX+HS9tyRyh+QI5ahr+YJRqJGZ1VwRFhYbVxrOW+M0oDQ0PqunCh6hc2Qa7tuEyQkrFjcKSXRlggp7Hx+ou9AHh+OW9HVf70ZxnghYznJrMmpB53YSzEkUhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pU8VpoUXRR19ZpNhbweI0cvOd1+2bf4Q2yRbRHwiDM=;
 b=Tov41DV9HJCOehAxmRmCROlQ7SbelXgHfuI/vHM5M2r8Sx/SXZudEMGrIg5t6TMisA8jpY7Bw99mNoS49AKER8nRbY9jzaHIDjUlEVxfkEzsr2PkgbLL2Tis2MPteNfBy5b8bE63SxlgEN3tWkstUhnRz3tzUtqezEWvnB/FJRRgezNNO/kT8sWAMa7+O8laMRLZM6sB+bt73g7vFB5aWnMs5eFVBDHs9o/WIUGOAIcNrqIN8brcnFefI0ukCHtXEvNeOuZU6B23dDj9ysebn8lc+aGAJzSloIxLJlWiNOREWoHvnfXl4efZp4DjS3yIjkTW9rbcvmGs8wAiYq3uAA==
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
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkA==
Date: Thu, 12 Oct 2023 10:09:30 +0000
Message-ID:
 <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
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
In-Reply-To: <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5946:EE_
x-ms-office365-filtering-correlation-id: ea5842e6-52bd-40ed-af24-08dbcb0b537e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xKsHagYqDgMjcUTUilx44dlM6s50rP5RgNunyW1xXp3vX3n4ADT9xkSgAGvoXwAHBnO3N+VDiAw9D9ujVkOfOt0MdWKD39/Bqiwh311Ax+f2lElfgjNA4Xh1fFqTEwggUewi1lVTAAEF63GDgagmc4OgPT7FTat7lLRyKQkR4DDHPsoofYzYSx/7dZHk3oVGQTZdLReq59bLSOfqFb6bvumRP7HB8qoHCi1SYIsZABroEO8cZZfwBi6T586cBBKQLR/l3VWeeihcqsnMPfEA//0HVCPd9U29kLrYWkoEswTN3NopCTtpdRLpHG6M4gFuBQdNTsN3i5HKb2+7g6CiUdAck58fLZGkda277DQfhsb+s0YpOYvwTtIouDrBVq/KGVemaOsA+uwFnKw0q+eiSuaWcqE2EiyLQWfVWmhD3n4EbtFy99m3MrPdYHxrRUam1ArDK5+x6Hrp9ga+uuMafgw6wKm/6a0ShPNASi8h+O2P8cxXSh4s3TCthLpvYXLMThftKCNdhKWsdikFI6lC1VWAGFNFXEuGwSKfU9D+jc1a0hWTIj9if7+W2aMLIv61dt8QlhNsEGcM1fFPZeCnieFNf2GSxr2WRmQN/nH6jPkr7QpU2Fs4Sw0Z1Lh9gG9s
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(346002)(136003)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(55016003)(9686003)(53546011)(107886003)(7696005)(6506007)(478600001)(71200400001)(26005)(2906002)(83380400001)(41300700001)(66556008)(5660300002)(110136005)(66476007)(54906003)(64756008)(76116006)(66946007)(66446008)(8676002)(8936002)(4326008)(52536014)(316002)(38100700002)(38070700005)(122000001)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MjdmWE5MTko4NXZ1SjMzYkVDWTRMTHc2TmtVcm4vUGJtOUtiem1IMFkzSzlp?=
 =?utf-8?B?cWtIUUtKSVR5dis4aENGdDRvWm01Z3lNb252Ti95UlpRa09Gdk45ZS9YcWpI?=
 =?utf-8?B?UzVaY2Jua241MmVVaDkwSFlHSm5RWmx0M3BEWDV5eGhRbHhSREQ5ZWRqeDU4?=
 =?utf-8?B?N2wrYUpqcHNyZzVoZEVpdUxMc1I2S1NkMmlldDNtUFlvMjJBOTZzd3BLZjFN?=
 =?utf-8?B?REFjdlFuKzFhOGVFWWg0VzlnRUNlSnFHM2drY2xUbzJVMzZEYjlPcWpjQUta?=
 =?utf-8?B?QmZVQmJvQlRYTWwyTCt5c3lGUEtIUHl2MStMbDFqVllZMFd1UmM0MVV2MUVK?=
 =?utf-8?B?OU5CZUxIUlhJanY5WUFDOTlsbWVTM0ZOeTgwMGVvYlJXTnZkaXRBbGhocWp3?=
 =?utf-8?B?bWlodTFkL00yQ3EvMXFTWHJZdEJoKzM1N2lneHNBQk5MNlZFL29XOUMyVVlS?=
 =?utf-8?B?bE05b1dNdksrYXpyYS96QzRScENVdCtHQ2VaYzVrK25jVkVvbkdjYkhSMHE3?=
 =?utf-8?B?OGo5a2pZMnpyMHU5UXVJQ08rNVgwazdHbUo4cWloNGljTkpzdWxzRjFzanFN?=
 =?utf-8?B?c1BTTkJUMG1QbytwV21QUXBHQ2tESUNZQzVhenRNTFNtYTQ3MklYWHJiWlJw?=
 =?utf-8?B?amIwbXRtcGRrcGcveUszSmZpVldmd1hmWmx1TWE2RC9jRVpkenRLN3J4YW9t?=
 =?utf-8?B?K3c3eTRvK2RWanVDTUtDM1pmWFlLeWlmbHVWay9rM2s1NmZ4aitINFc5blVL?=
 =?utf-8?B?Y3ovQjNFakcxUkJBM0JML05WcDd6WHhQcXVmT1hSWlhYL3hQbmVMcU9SR2Zr?=
 =?utf-8?B?a2NKUXRKZ1VSNTlyQkZ5cWh1U1llZi95ZThKbkF6OUdFSlM4TFhLTTQzbCs5?=
 =?utf-8?B?MHczSDRwejU4bUs2VUhQS2FoWXZzbjE3Yk5nUTVnVU5qR2FWNWZIT3l1TmpR?=
 =?utf-8?B?dW9YOFlHb2xYdEF1ZU16VGd5VmpiMlNKb2FuNWM3d29keE8wMjJwUWREOHVS?=
 =?utf-8?B?Z2swVWh1NEc5dEZwdDBHUzRlZ2ZydXMwd2ZGcGY0cGpBN2VJZnlpVFlaVm5T?=
 =?utf-8?B?SXpFRnhkNzIzYUxubE1IRy9oSW1JV2M5cXpQWHZ2OVpRRnhXdlhaSGtIR3Nw?=
 =?utf-8?B?Q0p5ekd2S3ZlekRZMTJpWitOZ1pSd0EzclU2eFRzOUNzNnZLRVd1amducFJW?=
 =?utf-8?B?a0tZZVA0RGd2YkhadmRpZzBRV0dNb1VlSHhLVFRiVDdyK1J0SDVucUsyb1Ix?=
 =?utf-8?B?ckErNUQ3MlZNdEVmd1cyVGtmTThJdXJaTVRydXpXTTRnNy91RWNJdUpVdmRt?=
 =?utf-8?B?b2ZTL1ZBOFJKUWd4Z3Q5ZUNJR2d1b3NvTU5acnZMQWo5aVJOYmlnL1Fpclk5?=
 =?utf-8?B?V1BnRmc3NVRvM3FJeVRDd0hyME9HOUF6SnVYL1pjQUFmdUNIRGdOSk5KV25w?=
 =?utf-8?B?YWsrMEQ0VVgxcnA4Q0JjVTVudGZtSlVPNlpPQi83Tnp3N0U0TE8zcEVDUnRn?=
 =?utf-8?B?Y3NjZnJvTXhxNVJpcHVqdll1MFBjMVcxUWNCbDF1Zy9sOGE0RHNQdEtrYTRO?=
 =?utf-8?B?L1JkY0h5WFB4TU1vMGZjWkZRZkdmdHJzdzZLV0hIN2RrWmdVWVpTNC9Fa1ZM?=
 =?utf-8?B?dURoRy8yTG9BaGpXZkVxbk94ckQrWXZBRTFIYmthUERJNjFvajdqU2dsOWtj?=
 =?utf-8?B?L1oyWlhUOW9DeE81TUNFZ3hlM1NqQm5MRnRpSENvdkNJazA4dTBxQkZWbmNK?=
 =?utf-8?B?RmJ4UlNNcmZDRnlGZ1FFY3RVdkQwbUJ6ZjdiVmJaakNsYzdBZTcyY2FnNVcr?=
 =?utf-8?B?bmkzblBzOTY0S2lzK2hwTnltekZHc05HK0dtSStGK3VpS3N4M2pwR0x0YnNP?=
 =?utf-8?B?WEwzZVFsbTIwQkx5S2k0Ly9GMVEva2NZc2FaZHdQdmc2ZHl2OUlIY3VXNG9Z?=
 =?utf-8?B?UEtOdk4vck5SNWtlTmhpR3ZSSGorYWdyTkhKM05qSWJPQkhVb3QwNU1PM3FZ?=
 =?utf-8?B?ZFhjdlVNeHBvZnlnT1hDZzdadXJqekN2YTUvVFk1d2VSTi91WkZzd3hoZWZN?=
 =?utf-8?B?Q3ltRndteTh1U0hoU3BOL2pweDB0MW1jSGJrRjRXN0dLZ2NzbTRxUXhPbmw3?=
 =?utf-8?Q?PPDg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5842e6-52bd-40ed-af24-08dbcb0b537e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 10:09:30.8489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p3/IntXrqo59PP/JxwiqxHB1aGeql6mNPm1ZjZh/YzYk1hbx+cq/BqjSwV4TWaXvVglHu7CV2DkOlmZd/wHUlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5946
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFRodXJzZGF5LCBPY3RvYmVyIDEyLCAyMDIzIDM6MzAgUE0NCj4gDQo+IE9uIDEwLzExLzIwMjMg
Njo1NCBQTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+PiBGcm9tOiBaaHUsIExpbmdzaGFuIDxs
aW5nc2hhbi56aHVAaW50ZWwuY29tPg0KPiA+PiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMTEs
IDIwMjMgMzozOCBQTQ0KPiA+Pg0KPiA+Pj4+IFRoZSBzeXN0ZW0gYWRtaW4gY2FuIGNob29zZSBv
bmx5IHBhc3N0aHJvdWdoIHNvbWUgb2YgdGhlIGRldmljZXMNCj4gPj4+PiBmb3IgbmVzdGVkIGd1
ZXN0cywgc28gcGFzc3Rocm91Z2ggdGhlIFBGIHRvIEwxIGd1ZXN0IGlzIG5vdCBhIGdvb2QNCj4g
Pj4+PiBpZGVhLCBiZWNhdXNlIHRoZXJlIGNhbiBiZSBtYW55IGRldmljZXMgc3RpbGwgd29yayBm
b3IgdGhlIGhvc3Qgb3IgTDEuDQo+ID4+PiBQb3NzaWJsZS4gT25lIHNpemUgZG9lcyBub3QgZml0
IGFsbC4NCj4gPj4+IFdoYXQgSSBleHByZXNzZWQgaXMgbW9zdCBjb21tb24gc2NlbmFyaW9zIHRo
YXQgdXNlciBjYXJlIGFib3V0Lg0KPiA+PiBkb24ndCBibG9jayBleGlzdGluZyB1c2VjYXNlcywg
ZG9uJ3QgYnJlYWsgdGhlIHVzZXJzcGFjZSwgbmVzdGVkIGlzIGNvbW1vbi4NCj4gPiBOb3RoaW5n
IGlzIGJyb2tlbiBhcyB2aXJ0aW8gc3BlYyBkbyBub3QgaGF2ZSBhbnkgc2luZ2xlIGNvbnN0cnVj
dCB0byBzdXBwb3J0DQo+IG1pZ3JhdGlvbi4NCj4gPiBJZiBuZXN0ZWQgaXMgY29tbW9uLCBjYW4g
eW91IHNoYXJlIHRoZSBwZXJmb3JtYW5jZSBudW1iZXIgd2l0aCByZWFsIHZpcnRpbw0KPiBkZXZp
Y2Ugd2l0aC93aXRob3V0IDIgbGV2ZWwgbmVzdGluZz8NCj4gPiBJIGZyYW5rbHkgZG9u4oCZdCBr
bm93IGhvdyB0aGV5IGxvb2sgbGlrZS4NCj4gdmlydGlvIGRldmljZXMgc3VwcG9ydCBuZXN0ZWQs
IEkgbWVhbiBkb24ndCBicmVhayB0aGlzIHVzZWNhc2UgQW5kIGVuZCB1c2VyDQo+IGFjY2VwdCBw
ZXJmb3JtYW5jZSBvdmVyaGVhZCBpbiBuZXN0ZWQsIHRoaXMgaXMgbm90IHJlbGF0ZWQgdG8gdGhp
cyB0b3BpYy4NCj4gDQpDYW4geW91IHNob3cgYW4gZXhhbXBsZSBvZiB2aXJ0aW8gZGV2aWNlIG5l
c3RpbmcgYW5kIGxpdmUgbWlncmF0aW9uIGFscmVhZHkgc3VwcG9ydGVkIHdoZXJlIHRoZSBkZXZp
Y2UgaGFzIF9kb25lXyB0aGUgbGl2ZSBtaWdyYXRpb24uDQpEdWUgdG8gd2hpY2ggeW91IGNsYWlt
IHRoYXQgbmV3IGZlYXR1cmUgb2YgYWRtaW4gY29tbWFuZC1iYXNlZCBvd25lciBhbmQgbWVtYmVy
IGRldmljZSBicmVha3Mgc29tZXRoaW5nPw0KDQpQbGVhc2UgZG9u4oCZdCB1c2UgdGhlIHZlcmIg
ImJyZWFrIi4NCllvdXIgcHJvcG9zYWwgaXMgdGhlIGZpcnN0IG9mIGl0cyBraW5kIHRoYXQgc3Vw
cG9ydHMgbWlncmF0aW5nIG5lc3RlZCBkZXZpY2UuDQpUaGlzIGlzIHdoeSBuZXcgcGF0Y2hlcyBv
ZiBjb25maWcgcmVnaXN0ZXIgb3IgYWRtaW4gY29tbWFuZCBkb2VzIG5vdCBicmVhayBhbnl0aGlu
ZyBleGlzdGluZy4NCg0KPiA+DQo+ID4+Pj4+IEluIHNlY29uZCB1c2UgY2FzZSwgd2hlcmUgb25l
IHdhbnQgdG8gYmluZCBvbmx5IG9uZSBtZW1iZXIgZGV2aWNlDQo+ID4+Pj4+IHRvIG9uZSBWTSwg
SSB0aGluayBzYW1lIHBsdW1iaW5nIGNhbiBiZSBleHRlbmRlZCB0byBoYXZlIGFub3RoZXINCj4g
Pj4+Pj4gVkYsIHRvIHRha2UNCj4gPj4+PiB0aGUgcm9sZSBvZiBtaWdyYXRpb24gZGV2aWNlIGlu
c3RlYWQgb2Ygb3duZXIgZGV2aWNlLg0KPiA+Pj4+PiBJIGRvbuKAmXQgc2VlIGEgZ29vZCB3YXkg
dG8gcGFzc3Rocm91Z2ggYW5kIGFsc28gZG8gaW4tYmFuZA0KPiA+Pj4+PiBtaWdyYXRpb24gd2l0
aG91dA0KPiA+Pj4+IGxvdCBvZiBkZXZpY2Ugc3BlY2lmaWMgdHJhcCBhbmQgZW11bGF0aW9uLg0K
PiA+Pj4+PiBJIGFsc28gZG9u4oCZdCBrbm93IHRoZSBjcHUgcGVyZm9ybWFuY2UgbnVtYmVycyB3
aXRoIDMgbGV2ZWxzIG9mDQo+ID4+Pj4+IG5lc3RlZCBwYWdlDQo+ID4+Pj4gdGFibGUgdHJhbnNs
YXRpb24gd2hpY2ggdG8gbXkgdW5kZXJzdGFuZGluZyBjYW5ub3QgYmUgYWNjZWxlcmF0ZWQNCj4g
Pj4+PiBieSB0aGUgY3VycmVudCBjcHUuDQo+ID4+Pj4gaG9zdF9QQS0+TDFfUUVNVV9WQS0+TDFf
R3Vlc3RfUEEtPkwxX1FFTVVfVkEtPkwyX0d1ZXN0X1BBIGFuZA0KPiBzbw0KPiA+PiBvbiwNCj4g
Pj4+PiB0aGVyZSBjYW4gYmUgcGVyZm9ybWFuY2Ugb3ZlcmhlYWQsIGJ1dCBjYW4gYmUgZG9uZS4N
Cj4gPj4+Pg0KPiA+Pj4+IFNvIGFkbWluIHZxIG1pZ3JhdGlvbiBzdGlsbCBkb24ndCB3b3JrIGZv
ciBuZXN0ZWQsIHRoaXMgaXMgc3VyZWx5IGEgYmxvY2tlci4NCj4gPj4+IEluIHNwZWNpZmljIGNh
c2Ugb2YgbWVtYmVyIGRldmljZXMgYXJlIGxvY2F0ZWQgYXQgZGlmZmVyZW50IG5lc3QNCj4gPj4+
IGxldmVsLCBpdCBkb2VzDQo+ID4+IG5vdC4NCj4gPj4gc28geW91IGdvdCB0aGUgcG9pbnQsIHNv
IHRoaXMgc2VyaWVzIHNob3VsZCBub3QgYmUgbWVyZ2VkLg0KPiA+Pj4gV2h5IHByZXZlbnRzIHlv
dSBoYXZlIGEgcGVlciBWRiBkbyB0aGUgcm9sZSBvZiBtaWdyYXRpb24gZHJpdmVyPw0KPiA+Pj4g
QmFzaWNhbGx5LCB3aGF0IEkgYW0gcHJvcG9zaW5nIGlzLCBjb25uZWN0IHR3byBWRnMgdG8gdGhl
IEwxIGd1ZXN0Lg0KPiA+Pj4gT25lIFZGIGlzDQo+ID4+IG1pZ3JhdGlvbiBkcml2ZXIsIG9uZSBW
RiBpcyBwYXNzdGhyb3VnaCB0byBMMiBndWVzdC4NCj4gPj4+IEFuZCBzYW1lIHNjaGVtZSB3b3Jr
cy4NCj4gPj4gQSBwZWVyIFZGPyBBIG1hbmFnZW1lbnQgVkY/IHN0aWxsIGJyZWFrIHRoZSBleGlz
dGluZyB1c2VjYXNlLiBhbmQgaG93DQo+ID4+IGRvIHlvdSB0cmFuc2ZlciBvd25lcnNoaXAgb2Yg
TDIgVkYgZnJvbSBQRiB0byBMMSBWRj8NCj4gPiBBIHBlZXIgbWFuYWdlbWVudCBWRiB3aGljaCBz
ZXJ2aWNlcyBhZG1pbiBjb21tYW5kIChsaWtlIFBGKS4NCj4gPiBPd25lcnNoaXAgb2YgYWRtaW4g
Y29tbWFuZCBpcyBkZWxlZ2F0ZWQgdG8gdGhlIG1hbmFnZW1lbnQgVkYuDQo+IGludGVyZXN0aW5n
LCBkbyB5b3UgcGxhbiB0byBjb29rIGEgcGF0Y2ggaW1wbGVtZW50aW5nIHRoaXM/DQpOby4gSSBh
bSBob3BpbmcgdGhhdCB5b3UgY2FuIGhlbHAgdG8gZHJhZnQgdGhvc2UgcGF0Y2hlcyBmb3IgbmVz
dGVkIGNhc2UgdG8gd29yayB3aGVuIG9uZSB3YW50cyB0byBoYW5kIG9mIHNpbmdsZSBWTSB0byBz
aW5nbGUgbmVzdGVkIGd1ZXN0IFZNLg0KSSB3aWxsIG5vdCBiZSBhYmxlIHRvIHRlc3QgYW55IG9m
IG5lc3RlZCB0aGluZ3MgYW5kIHNob3cgaXRzIHBlcmZvcm1hbmNlIHZhbHVlIGVpdGhlciwgYXMg
SSBkb27igJl0IHNlZSBob3cgcmVzdCBvZiB0aGUgZWNvIHN5c3RlbSBjYW4gbWF0Y2ggdXAgZm9y
IHRoZSBuZXN0ZWQuDQpIZW5jZSwgeW91ciBleHBlcnRpc2UgaW4gZHJhZnRpbmcgZXh0ZW5zaW9u
IGZvciBuZXN0ZWQgaXMgZGVzaXJlZC4NCg0KPiBSZWFsbHkgbWFrZSBzZW5zZT8NCj4gDQo+IEhv
dyBkbyB5b3UgdHJhbnNmZXIgdGhlIG93bmVyc2hpcD8NCkFuIGFkZGl0aW9uYWwgb3duZXJzaGlw
IGRlbGV0Z2F0aW9uIGJ5IGEgbmV3IGFkbWluIGNvbW1hbmQuDQo+IEhvdyB0byB5b3UgbWFpbnRh
aW4gYSBkaWZmZXJlbnQgZ3JvdXA/DQpPbmUgdG8gb25lIGFzc2lnbm1lbnQuDQo+IEhvdyBkbyB5
b3UgaXNvbGF0ZSB0aGUgZ3JvdXBzPw0KTm90IHN1cmUsIHdoYXQgaXQgbWVhbnMuIFRoZSBleHBs
aWNpdCBncm91cCBpcyBjcmVhdGVkIGFuZCBWRnMgYXJlIHBsYWNlZCBpbiB0aGlzIGdyb3VwLg0K
PiBIb3cgdG8geW91IGtlZXAgdGhlIGd1ZXN0IG9yIGhvc3Qgc2VjdXJlPw0KUGxlYXNlIGJlIHNw
ZWNpZmljLiBJdHMgdmVyeSBicm9hZCBxdWVzdGlvbiB3aGVuIGl0IGNvbWVzIHRvIGRlZmluaW5n
IHRoZSBpbnRlcmZhY2UuDQo+IEhvdyBkbyB5b3UgbWFuYWdlIHRoZSBvdmVybGFwcz8NCk92ZXJs
YXBzIGJldHdlZW4/DQo+IEhvdyBkbyB5b3UgaW1wbGVtZW50IHRoZSBoYXJkd2FyZSBzdXBwb3J0
IHRoYXQ/DQpQbGVhc2UgY29uc3VsdCB5b3VyIGJvYXJkIGRlc2lnbmVycy4gSGFyZCB0byBzYXkg
aG93IHRvIGltcGxlbWVudCBzb21ldGhpbmcgaW4gZ2VuZXJpYy4NCj4gSG93IGRvIHlvdSBjaGFu
Z2UgdGhlIFBDSSByb3V0aW5nPw0KV2h5IGFueXRoaW5nIHRvIGJlIGNoYW5nZWQgaW4gUENJIHJv
dXRpbmc/DQoNCj4gPiBJdCBkb2VzIG5vdCBicmVhayBhbnkgZXhpc3RpbmcgZGVwbG95bWVudHMu
DQo+IHdlIGFyZSB0YWxraW5nIGFib3V0IG5lc3RlZCwgZG9uJ3QgYnJlYWsgbmVzdGVkDQpWaXJ0
aW8gc3BlYyBmb3IgbmVzdGVkIGlzIG5vdCBkZWZpbmVkIHlldC4gSGVuY2Ugbm90aGluZyBpcyBi
cm9rZW4uIFBsZWFzZSBhdm9pZCB1c2luZyB0aGUgdmVyYiwgX2JyZWFrXy4NCg==

