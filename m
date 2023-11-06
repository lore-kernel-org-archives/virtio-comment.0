Return-Path: <virtio-comment-return-8182-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10596C4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 04:13:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5E3AB750A9
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 04:13:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 39222986703
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 04:13:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 254249866FC; Mon,  6 Nov 2023 04:13:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 147869866FE
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 04:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnYx7Xru06eRCWMTAYa2dVdBsuFm4Z+HNYZUiCdXxGPcR20f8i3ovr/i8f+EqxhDYbnv8LEvXgZs2aCI5VUl4HPbFV7XkWWRHHlSshGiGA9Azz2h17sfIFplC2dHTqgeHfneT7OigN+gb3KQWNCwS5vVNqrau2s0GPaThwpLttldvI8z3Nw22qeo4D3XtFuTArjUPdbhUh8lap5hi8ifK+hAJLpUzEg3PS29DyICpEyeuXFDKxaHTAsM7/+LfL1sxQWFw91qp+pa6t80WiEDL54r9IJUVbfaID46GmDvN0tMJ4C4ZZSimERymnlyI1DYWNHfWFycMx+uS9DW0zWazA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfGlNM0hRMv6exDO/cfN6iPXzRm5AaHEQfnT4form0M=;
 b=I8eoKYmeYXCfmx4C7vXQM+AAx+TtYip9Z+2mgXXEBVOgen5fgRwAbUVjR1kCtVyNIYyWuqOLNBEhQtlryU2g24j2JxGs+0sGhWEkqThAhOUMuSa0rtjBEyqIDDAwTkj6QTE/AvLVb5vgOPOMhK+AGGq/NqJfNbRAz5HJ2edrqAuJhFYrwR+pXFpMOmx24d7I+L3v75oUMZUoxvllGNlW9iMghY0aKUSiEWPY9o55jcYv5WzhhD1J46bRGHVvnKEVUtUIfRlYsRQGU5M+adcrtYOyrsTxTpSFYNUExdyUk7M2z4sOS2KYGHTgCgwTmMAwdVpLkkkIAJWcpyRqEZ3YUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE
Thread-Index: AQHaDkFl1Izi1X/8PEWVlDiafyu5VrBocsSwgAA8x4CAAA4dEIAD6TMAgAAKLuA=
Date: Mon, 6 Nov 2023 04:12:56 +0000
Message-ID:
 <PH0PR12MB548174AF58B6ADDDA215123DDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-5-lingshan.zhu@intel.com>
 <PH0PR12MB5481085F6E84FD2786FCD60BDCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <705607e3-39c3-47da-a688-80bbee31c48d@intel.com>
 <PH0PR12MB54814F9EEDD69ED434BF7994DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b0506d9f-37de-43c9-b99d-b00bb88c0d36@intel.com>
In-Reply-To: <b0506d9f-37de-43c9-b99d-b00bb88c0d36@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB8659:EE_
x-ms-office365-filtering-correlation-id: 1bc1fa21-eebd-4a29-b7ed-08dbde7ea7ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zYWFZ8/WwMoSD00M3b0IuXcJZiKxDAOyHsiVgEp08ladOh+O5ydq3vfK7LRkR8XMrb5iY63+dui5tcFnZoGnXZnMNmlBoZbwBgUCljTES0/DpwxQNU4mvkXw1fusfd2MVyrA2a9rXnHstv6EvUw48rjRv2vgBm3sYbUUs7YoldvS34qRNEZaKfquPTd5+/C/OKI8wpyWb1XmajWv1nIFiin8+FIEfbni7X6dECf7fM/hhyph4Ad28uiKNCtw50a+OPp8bERU00T6X9C0SpGBy19+h2ALxVryXyyn5eLty8+RBjkErb1q5xaiNyRSoc4pt8NxDCNvd7jENkU4kasrCJWPqxiBjTq6B9J1kwyu4yerWtYJVCCuU7fdfCBRwn+V9IgKzXSs3BVTlUMOS2FAZ3eB0hijxIDB3FY9Rl3ZtBTF4NX6xD4hWcSCl9ojqeXCve2BoUF/dmByjx+sdhLOgUKiVtm0rC/QMsE7lvDy9KACRTw38pVwj0OFSwRcm9QvUgjVQ8xS6Ak1hDJEWK8Sre2khuSPQ0j7MnVsBwP4JVwhrB8HWMeNgfVd5I5oVc/iuJOTIe0pjKVPRKYVuNcgwphiK/qLEq9MHCXMBCFaqA5TZjR+L1nSH7mKLOWPCAAF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(346002)(39860400002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(55016003)(83380400001)(33656002)(4326008)(52536014)(8936002)(38070700009)(41300700001)(86362001)(8676002)(2906002)(53546011)(478600001)(110136005)(6506007)(7696005)(71200400001)(38100700002)(316002)(122000001)(5660300002)(66446008)(64756008)(66476007)(66556008)(66946007)(26005)(9686003)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cll3U3BONU5yQWVnWXpLZWd1N3ROdHdQNVU4dVkzZHFUdkhkWHpNWGcxbGVn?=
 =?utf-8?B?SkJSVmJ4bHlRR0xURjdZcUs5alNJWHdETXZMMGdlY2szYjV2SmZ0OWJxYTh0?=
 =?utf-8?B?d2xidnNpVVdsQ2lHUllyMnJ6NkgyeFZZVGVIY1ZZU3YrMWc3M3pjalVsdktW?=
 =?utf-8?B?VlhEREszTjNQN2UxQ0VZU3pqOVEzM2RtcDI3ZVZ0bnl4Nk9ZTVBYdHl1djFu?=
 =?utf-8?B?R3VpZ0JCckppZEZoQkxIOXRlWldaRUtKUFRqZ09USHNUeEE0TDFtTWJSTFRy?=
 =?utf-8?B?RmpPVG9tS2dFcGxkcS9mSjY4ejM3VVlWbmRKUnJLQXU2dnRDRXRURG9pWXN5?=
 =?utf-8?B?Z2dJYmJyd1dKS2d4NUtjeU82Y2RVeW85MGVtZnpaZVlDY243UXFJRzE0QzVF?=
 =?utf-8?B?Vmlsb0xGZFhHNnkxV3dpUmdDbHB6ZGQrenpmSGhmT2VueHdPSDR4RXBsdERo?=
 =?utf-8?B?cXJMa3dCRGs4b0hvWTUxWXpuR1FoK0hsU05XU0dFVERINXYrclpaanhmVUZu?=
 =?utf-8?B?U0VDSWQvZVBOQjJoU3FFY3VNT0RUSy9nYkdLNTFpeDVseFppZU1HbWdMS1hv?=
 =?utf-8?B?N1gwNFBOc01HTkN1dURXNVBUSGZqcnllM3lISXl3ZVIwS3lEQmsreFFoaGVw?=
 =?utf-8?B?UnprRnZzOG93Zlc2aVdodTVjekZTTm5mdHhhY3lrb2luVkU3NGo3bVhGbEky?=
 =?utf-8?B?UWFEcTlXcUtqbHYyWFB6OVdPNllGd1poY0lzQURRU2VQRm5BdlV0ZkpDUlpp?=
 =?utf-8?B?MjJFdUVhY0E0UWtidXVjeXo2bFpQMi80MzArZ3BBK2kzbjhrckY4ekc1TXp6?=
 =?utf-8?B?VjNldUxIVDV5ZDRoRUlBOWNwUC9LcTdaeWhERGt0c0NIS2hDYWV3dVdGNUpX?=
 =?utf-8?B?MXJjLzNGREpNVnVteXlxMFhTUXdTa29SaFpnWWVCek9aMk0wRUxzMUpzbUtw?=
 =?utf-8?B?Uk41SjlFd0VHY1BFUi9ndG9VUERiblN5Tzdxb2RQb285QWVaQkVSY2craDM2?=
 =?utf-8?B?aS9UQUZIM0J4a09ndi9MVVdDUjRCNG9XOGhSZGRVbnVSTUcxaGtmRitGZ0k0?=
 =?utf-8?B?SWEvNnZVUmhOYUZuVDlFRU9ST1ZTaFZRSVpYanAzdCtmWVJIa2NNZFlTSHJE?=
 =?utf-8?B?amtpRHNPQTRGSDgxY0daQUN1Y09HTnJpNEJlT0tMTWdxMzVBd2cxU1YwNHhi?=
 =?utf-8?B?cjd6UjZUMmZCSVIwOTU4WUVsaHBWSHlpeGF1MS91VTdmSVErbUo5Qm4zdXpq?=
 =?utf-8?B?bTBzbzR1U1VINnVKclpkWVhYTGhwREluQkxVYXJ6cjBnNmVWVHN1azF3SlVE?=
 =?utf-8?B?MU43Tm1MakFiQ3lmYURxblc3MjdJTnlTaXZzUFl1K0pMZzgzTSsvVkNGRy9R?=
 =?utf-8?B?K2ZWdzVuN2cvdWZwQWJzcTFuUjBiOGZaV1hSdnlRc0VRYWZvbWV5Q0F2bGRP?=
 =?utf-8?B?eUdNS2kxSDNTZER5WDltWC93S1o5aW1Mc0huOHJKYnlLdS8wMVdhU0tTYTl2?=
 =?utf-8?B?a0tRTnJrUzM0TWpDMEVJMVlwZXhzWFhYVzBRZDVEVlpnRllEeEVjb3lRYkV3?=
 =?utf-8?B?Z2dhT2lMWVVWWVlRWW1pcHdSSmFqT2txRkRhdzdxd3FweW1oTmQzRE85emx4?=
 =?utf-8?B?ZmhMS0JOZ25MMHZsWlJPb0RiM1Q2MzdNaHhzczJ4ZWFHbENXOW9lZ0wvMXdq?=
 =?utf-8?B?MnpEdCs1eTdmd24vbDYzQ3MxNTFiamFkQjJXUjNIUTFOaTM2N1N1aHo4ZUNZ?=
 =?utf-8?B?emZrczYxeEsxbTJSRmJhZkR2b3FkL2JHYjRPWS9jazdnaDJRQ0kxczg5cUJM?=
 =?utf-8?B?RDBsT0U0bEtLWC84Q2tvR3ZkQWJ4WGhNZ2ZJbDlqZ3JRQ1BIdXR1dndTMnE5?=
 =?utf-8?B?RS9UenFEYWpOaENQUFVjbU5lRWNHcnlHaE5FeEFwbnBKL3M3UlBXcXpHSm1X?=
 =?utf-8?B?NkJBSG1xRHl3SFpQL0ZBVEdKcjI4c3NrQXB2Q2pMYkEyY1JKdXk1WGR3M3la?=
 =?utf-8?B?ZW1DUVpCMDRXR2tXdmtmV29HR2tqMmtNU2dlOVJLQzNpMDRjWWMwa3lqSkg3?=
 =?utf-8?B?SjllTlpRSjFIekIrbW00ZXo5d1JucDVURm5tdjZyOGlhRmc5RlJ5dGpkUCtv?=
 =?utf-8?Q?nnCg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc1fa21-eebd-4a29-b7ed-08dbde7ea7ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 04:12:56.7164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wWvb1/YdUkNT+RYIZYYfhZ2Zk+X8ji8PlQcSZpbd6efvP3HO4JNzuAsf8hvgJ8t03joBaMXZeqB9s+t3GK56uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8659
Subject: RE: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgTm92ZW1iZXIgNiwgMjAyMyA5OjAxIEFNDQo+IA0KPiBPbiAxMS8zLzIwMjMgMTE6
NTAgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlz
dHMub2FzaXMtb3Blbi5vcmcNCj4gPj4gPHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLSBvcGVu
Lm9yZz4gT24gQmVoYWxmIE9mIFpodSwgTGluZ3NoYW4NCj4gPj4gU2VudDogRnJpZGF5LCBOb3Zl
bWJlciAzLCAyMDIzIDg6MjcgUE0NCj4gPj4NCj4gPj4gT24gMTEvMy8yMDIzIDc6MzUgUE0sIFBh
cmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+PiBGcm9tOiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpo
dUBpbnRlbC5jb20+DQo+ID4+Pj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciAzLCAyMDIzIDQ6MDUg
UE0NCj4gPj4+Pg0KPiA+Pj4+IFRoaXMgcGF0Y2ggYWRkcyB0d28gbmV3IGxlMTYgZmllbGRzIHRv
IGNvbW1vbiBjb25maWd1cmF0aW9uDQo+ID4+Pj4gc3RydWN0dXJlIHRvIHN1cHBvcnQgVklSVElP
X0ZfUVVFVUVfU1RBVEUgaW4gUENJIHRyYW5zcG9ydCBsYXllci4NCj4gPj4+Pg0KPiA+Pj4+IFNp
Z25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4+
PiAtLS0NCj4gPj4+PiAgICB0cmFuc3BvcnQtcGNpLnRleCB8IDE4ICsrKysrKysrKysrKysrKysr
Kw0KPiA+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspDQo+ID4+Pj4NCj4g
Pj4+PiBkaWZmIC0tZ2l0IGEvdHJhbnNwb3J0LXBjaS50ZXggYi90cmFuc3BvcnQtcGNpLnRleCBp
bmRleA0KPiA+Pj4+IGE1YzY3MTkuLjMxNjE1MTkgMTAwNjQ0DQo+ID4+Pj4gLS0tIGEvdHJhbnNw
b3J0LXBjaS50ZXgNCj4gPj4+PiArKysgYi90cmFuc3BvcnQtcGNpLnRleA0KPiA+Pj4+IEBAIC0z
MjUsNiArMzI1LDEwIEBAIFxzdWJzdWJzZWN0aW9ue0NvbW1vbiBjb25maWd1cmF0aW9uDQo+IHN0
cnVjdHVyZQ0KPiA+Pj4+IGxheW91dH1cbGFiZWx7c2VjOlZpcnRpbyBUcmFuc3BvcnQNCj4gPj4+
PiAgICAgICAgICAgIC8qIEFib3V0IHRoZSBhZG1pbmlzdHJhdGlvbiB2aXJ0cXVldWUuICovDQo+
ID4+Pj4gICAgICAgICAgICBsZTE2IGFkbWluX3F1ZXVlX2luZGV4OyAgICAgICAgIC8qIHJlYWQt
b25seSBmb3IgZHJpdmVyICovDQo+ID4+Pj4gICAgICAgICAgICBsZTE2IGFkbWluX3F1ZXVlX251
bTsgICAgICAgICAvKiByZWFkLW9ubHkgZm9yIGRyaXZlciAqLw0KPiA+Pj4+ICsNCj4gPj4+PiAr
CS8qIFZpcnRxdWV1ZSBzdGF0ZSAqLw0KPiA+Pj4+ICsgICAgICAgIGxlMTYgcXVldWVfYXZhaWxf
c3RhdGU7ICAgICAgICAgLyogcmVhZC13cml0ZSAqLw0KPiA+Pj4+ICsgICAgICAgIGxlMTYgcXVl
dWVfdXNlZF9zdGF0ZTsgICAgICAgICAgLyogcmVhZC13cml0ZSAqLw0KPiA+Pj4gVGhpcyB0aW55
IGludGVyZmFjZSBmb3IgMTI4IHZpcnRpbyBuZXQgcXVldWVzIHRocm91Z2ggcmVnaXN0ZXIgcmVh
ZA0KPiA+Pj4gd3JpdGVzLCBkb2VzDQo+ID4+IG5vdCB3b3JrIGVmZmVjdGl2ZWx5Lg0KPiA+Pj4g
VGhlcmUgYXJlIGluZmxpZ2h0IG91dCBvZiBvcmRlciBkZXNjcmlwdG9ycyBmb3IgYmxvY2sgYWxz
by4NCj4gPj4+IEhlbmNlIHRveSByZWdpc3RlcnMgbGlrZSB0aGlzIGRvIG5vdCB3b3JrLg0KPiA+
PiBEbyB5b3Uga25vdyB0aGVyZSBpcyBhIHF1ZXVlX3NlbGVjdD8gV2h5IHRoaXMgZG9lcyBub3Qg
d29yaz8gRG8geW91DQo+ID4+IGtub3cgaG93IG90aGVyIHF1ZXVlIHJlbGF0ZWQgZmllbGRzIHdv
cms/DQo+ID4gOikNCj4gPiBZZXMuIElmIHlvdSBub3RpY2UgcXVldWVfcmVzZXQgcmVsYXRlZCBj
cml0aWNhbCBzcGVjIGJ1ZyBmaXggd2FzIGRvbmUgd2hlbiBpdA0KPiB3YXMgaW50cm9kdWNlZCBz
byB0aGF0IGxpdmUgbWlncmF0aW9uIGNhbiBfYWN0dWFsbHlfIHdvcmsuDQo+ID4NCj4gPiBXaGVu
IHF1ZXVlX3NlbGVjdCBpcyBkb25lIGZvciAxMjggcXVldWVzIHNlcmlhbGx5LCBpdCB0YWtlIGEg
bG90IG9mIHRpbWUgdG8NCj4gcmVhZCB0aG9zZSBzbG93IHJlZ2lzdGVyIGludGVyZmFjZSBmb3Ig
dGhpcyArIGluZmxpZ2h0IGRlc2NyaXB0b3JzICsgbW9yZS4NCj4gaW50ZXJlc3RpbmcsIHZpcnRp
byB3b3JrIGluIHRoaXMgcGF0dGVybiBmb3IgbWFueSB5ZWFycywgcmlnaHQ/DQpBbGwgdGhlc2Ug
eWVhcnMgNDAwR2JwcyBhbmQgODAwR2JwcyB2aXJ0aW8gd2FzIG5vdCBwcmVzZW50LCBudW1iZXIg
b2YgcXVldWVzIHdlcmUgbm90IGluIGh3Lg0KRGV2aWNlIGRpZG7igJl0IHN1cHBvcnQgTE0uDQpN
YW55IGxpbWl0YXRpb25zIGV4aXN0ZWQgYWxsIHRoZXNlIHllYXJzIGFuZCBUQyBpcyBpbXByb3Zp
bmcgYW5kIGV4cGFuZGluZyB0aGVtLg0KU28gYWxsIHRoZXNlIHllYXJzIGRvIG5vdCBtYXR0ZXIu
DQoNCj4gPg0KPiA+PiBMaWtlIGhvdyB0byBzZXQgYSBxdWV1ZSBzaXplIGFuZCBlbmFibGUgaXQ/
DQo+ID4gVGhvc2UgYXJlIG1lYW50IHRvIGJlIHVzZWQgYmVmb3JlIERSSVZFUl9PSyBzdGFnZSBh
cyB0aGV5IGFyZSBpbml0IHRpbWUNCj4gcmVnaXN0ZXJzLg0KPiA+IE5vdCB0byBrZWVwIGFidXNp
bmcgdGhlbS4uDQo+IGRvbid0IHlvdSBuZWVkIHRvIHNldCBxdWV1ZV9zaXplIGF0IHRoZSBkZXN0
aW5hdGlvbiBzaWRlPw0KTm8uDQpCdXQgdGhlIHNyYy9kc3QgZG9lcyBub3QgbWF0dGVyLg0KUXVl
dWVfc2l6ZSB0byBiZSBzZXQgYmVmb3JlIERSSVZFUl9PSyBsaWtlIHJlc3Qgb2YgdGhlIHJlZ2lz
dGVycywgYXMgYWxsIHF1ZXVlcyBtdXN0IGJlIGNyZWF0ZWQgYmVmb3JlIHRoZSBkcml2ZXJfb2sg
cGhhc2UuDQpRdWV1ZV9yZXNldCB3YXMgbGFzdCBtb21lbnQgZXhjZXB0aW9uLg0KDQo=

