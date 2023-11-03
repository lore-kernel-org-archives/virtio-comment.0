Return-Path: <virtio-comment-return-8146-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A416C0018A
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 11:35:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7F7BE42A6A
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 11:35:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 279CC986C76
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 11:35:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0D27E986C95; Fri,  3 Nov 2023 11:35:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A3A69986C37
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 11:35:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBTnEg/v8ayICg6mhiSc8ZmIgu0ngt/22G7hTQIL2iHCoN+Ih/ZJbvT1LJCdEi8L/6lFwNeF8s5HGBWU9TSWNLGI0LB83MPppS8sxq6kcp990dUuO3zwabp9LKmRc6IVoCbCPjCt12jMHPUqGHnQXg9uqoMj8Cg1khB6K1l5kz3OzGAMnRkDSG6gLSOd8KnF7M28aJFR7wL1Lru5PfaiDEpn/Lh/O9f53dejJRYgcOhw1NDCgqVjm7ecCfq8tIw+La+WwthLcUrg1RZyHAGebsI5mUbSD9LmSsTk8UEJ0IF47jQfH8w9UBPoo6sn1sf3FWwJZhQlz4hi/uGERNiS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKz1nEOovr9B/86QjOJd4XSIq/J8kmPgBPx5gq+M4hw=;
 b=hSMo8y2ImD5VENNbvE7fuF+OsJI7Vk9QI8oGzwF8E1A79dZu6V+KJF335f15Bxb1LizFEjV+cdDwDdWGDhFthbw09EO9qALdTSZhQJGkuSnXbBJd7roP9AsS9+lbfB0oQsd59wqqCj0GVaR4PTtKSgB3LJ30dOczxPFdzZDWi/0D1GDse990u3PPstiB2GbE/ArbwZXirSXrfSHebWaZEWHIx05r1diNLDqxsN/T7eALOnnDvik1zIG0cqrJgzfYscPeS7AsbVBWbpoh3S56lN8Isq5bp7FWcQDVOMCWPmwu88015HyASOwu1/aDcW62BZvszAv5Gz7MtZLBViWOvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 1/6] virtio: introduce virtqueue state
Thread-Index: AQHaDkFgrSow40jWr023TbmqKvcBUbBobtCQ
Date: Fri, 3 Nov 2023 11:35:10 +0000
Message-ID:
 <PH0PR12MB5481D9B7E8E314D925EE58E3DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-2-lingshan.zhu@intel.com>
In-Reply-To: <20231103103437.72784-2-lingshan.zhu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5755:EE_
x-ms-office365-filtering-correlation-id: f69fc716-b798-4830-ddaf-08dbdc60eff2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 t6EJqZYcy+H0J7MTzoJvGu/02Zlev9SOyVemPQnpcbiWD2kp77+UAra8Z7oFfjSQEqYl67VEXQIjWjoxn/yR9vjRjJ/NgdPMX23Nsx5IsPLX8SJD0GVko52bwAR4eFxvilHClGu6L+opnL6yTcrWBFBCziSuPYBRsGU3sYc8DAp00kwJPXNq9G9igTBHXkkD7zxepqwcE6sXmhimJvEOmXFBxP5/kE5d6fdWht1BtoEzpfmT3FAuqaW1TGIvRCKD0NqXwflF26cN8/lgdbEy6AoaVeO10r8QxOn2LO3N96yveIJXfeSbeucyDRZi2lNDtSoN9wZ1C8XggRpaWXGWlpRorEV0xlF+eTNFH64b1SxXcIHXv9ujmDqNUzOn1wHG+adafR8UWC4dsgj0UbaNbxoIjSftDvwZ/9sB5mVV33M7IWJMMPfMiyDpcD6OCglrJfDC94BREMoIPyKFO6b9vBZDLqt67l3vBlULCCUGIepUdJIU/TiXlYrex9jNbxBUMd9tCGuJZEPEGZBtt8cCCe0UawWX67EYlM4uSYtss4595GQeHmUkIAEQfeg+aK6ugbtOyUfGeIsA6g/h5wJP3Kt/aflsMAFxmongIop/DaPn3KOwhF2s47hp5HYjWjyhPz+hvxHjnJiFgnMq7IkmGsI7Q/sBbl3Bdt2+aWYz5ng=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38070700009)(55016003)(66946007)(66476007)(76116006)(66556008)(66446008)(64756008)(316002)(110136005)(86362001)(38100700002)(33656002)(122000001)(9686003)(83380400001)(478600001)(26005)(6506007)(71200400001)(7696005)(4744005)(2906002)(966005)(41300700001)(4326008)(5660300002)(52536014)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RTVKTHVaWThyMTNuY3dCNmtuUU1hcDZRTVVuWE9YWFRxVHNRZjFvL2NMVXh1?=
 =?utf-8?B?ZmJXMEVOU1I3YXNDRnRrcjZESVoxRU1va0NLaWxTMmdLY1NRQXZmMFAvajFh?=
 =?utf-8?B?aGNvSXV0SjhQZ0p6alhJU0c3TmhSZnBhOHlDZG5sSUFaNXR2cTZZTk5XclU5?=
 =?utf-8?B?UFYzalBvby8yRURWdzhoVVByUmU0UzVraTM1Q0FxVTBhaGp5Um91Mko5MkJx?=
 =?utf-8?B?NTd2N0VoQ1hoRkVxSVU2a2JDT2hsU3VoVy9ReEF6T2RHTlVheWZnano1b1dR?=
 =?utf-8?B?bkRsckFnQzVwMGE2Y3RFUzk4NWxQWlN5dzJvK3NUL0FGQ1E1d3d6TEluUlBv?=
 =?utf-8?B?NmM1d0V6Q1pQRlVROUJObFdWVjdhdkt4ZndvSWY3Y0lqbnVGeFJnUEtTQkc3?=
 =?utf-8?B?S0pmMVhUYy90Si91VEFyY2VnTWtRZWhEeHZoM3NLeEx0RXVjWGRralIwWEhh?=
 =?utf-8?B?RklPUWFKS1liY2pmRUpnaHFVcklKQjBJQmlyWjJya3BXbU9rTTVGbG56K0gw?=
 =?utf-8?B?b0xyak9sVVhRUlFTV01CTWJ1K0RDNU5UZGVSRVJDdW5mWUFnazY5anhNZ013?=
 =?utf-8?B?ZWxGTGs5eDhUMlVNZXhnNDRycC85cXRlM3RKSDArak95a3lwV2ptN0NoSVZ5?=
 =?utf-8?B?UUZ0bjZSS1J4ZytCWG5IRjZnci9RcVBsYy9mVkxEMGFwZFZDdW5YdUZocWNS?=
 =?utf-8?B?UjV6bUlaZW9uLzhBcDFMVTVxRVlReGY4K1dEQWdRNW5YV2M0TmpVV0tubVZn?=
 =?utf-8?B?aWZiSXA0dmZ3MlVScXg5bnFLL0NEWk9hMmplUzYxWEF5QTZZenhBYWY0QmZZ?=
 =?utf-8?B?ZHNjdFVZVmcrSlVNc3Y3Z0dzVjQxNDJtRjRTY29iNGtaRi83U2VOaDB3bmYw?=
 =?utf-8?B?Tjh2RUc5QWluZ3NuZCt4LzFXUEs2QmlZRGpmWlg4TUlVSXBZZ2UxdVI0enlP?=
 =?utf-8?B?a0huU1FqaXpqSExSdHNubFNLWTM3SS8ySWorYkVsT09Vb3pxMGxUSFpPZzRC?=
 =?utf-8?B?U29Gc0RjQnpjMVN6OGR2a2xNWHM5VFEzTklnaW9hWWFybXYvZ1BHN2crL2pT?=
 =?utf-8?B?NE1IaHpyMHdlM240VWMrOVEzaGlxQ1Y1aElBZ3NYd3RjVFZVQU81U29CdXJO?=
 =?utf-8?B?WmlLUURoNFppRjR1UFpoR3BIMVlhZWR4bkRwSTFiUS9vbjZ4SDlQL0U2bmI4?=
 =?utf-8?B?Z0tQZWxpNExhVWhFV2VaOUtnVVVCZVpwb2xZUTE5THRnRG9hTmdGZkw1WFBJ?=
 =?utf-8?B?bHBJVzl1ZFhkSjMrS3RJUXhzdUJhbktZM0JkMHhCdnlyWE1EWG5zUVd4ejBG?=
 =?utf-8?B?dFFoallvaUx2SXArOGVKaCt3VFMxU0o5Wkl1ZnZ4ZFNPWFRlb3RhTytKcWVp?=
 =?utf-8?B?djhYZitwR0xxNnpDM0dpTGk3U0tKZ0RqNE9rWFhVVHRVRlVleUQ0MzJ6T1ND?=
 =?utf-8?B?NUVhclNCVHBCUEZwL3RQMFkyWE1CMUtEL3h2UXhNejZ0YmdKMjV5Q3huNlpS?=
 =?utf-8?B?SXRRbmQxcmlaY1BhL090WGF2ZGF1aW0yM0V3UmdnRWNlZUlQNG9icktxMlND?=
 =?utf-8?B?M0kvRUtZZUV4ZUR6TWhPei9vTGVGMkRqdGM2U1JlenFjeWpiUjVPQnpXOHJx?=
 =?utf-8?B?RDBjWjR3bk9OemNyd29kRTc2SVFFRDViV25ycnpUdmgyWU4xeStWdUVsTkx6?=
 =?utf-8?B?a3Y5WSsyMzBLU1QzNUM4cGJDUjRaMjlvcnkrZldVeXBkVW1mRVJOWWt4UzIx?=
 =?utf-8?B?cVNPL2xDOVFhRWxtUnhwU2pIUmZ1WHBTTXBQdFRSdFdlaU05TmxSMkcyKzZs?=
 =?utf-8?B?UW5xVFgyOE5YU2NjZW5IMWFha3NFcE50Smt1V2RiMGVhOWhZQ0Yxai92bGJW?=
 =?utf-8?B?dXEzYUZCTVJDSDE2QUZzOC9mT0xhR3N6TVAvdmxCOWlyWHlmckZZNTFEb21D?=
 =?utf-8?B?VXZLVTkwZDdtbG9MNTg5RWUxVkhFUjVVRHYvZUdJOXRqSVhCa3hPaFdJRmxQ?=
 =?utf-8?B?eWs0TnFjSG1GNW5qNllGS25WVnJjTjJOVWo4bmJyaU9lQzNCSzFyTmt1eEZ3?=
 =?utf-8?B?RmZMWHlCZjFUM2NReHJtczdpZVhmc2tyZVFlQWRiL0lUb1B3K1JFVmkva2Mv?=
 =?utf-8?Q?L04c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f69fc716-b798-4830-ddaf-08dbdc60eff2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2023 11:35:10.3414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FsNrlPdUaBgIxAEY1859fR2XbZmwyzJVS420UnvNGNrMZFm+AQyk4L2lZWZwc97qXsHRkHnonHk3Co9i2t/ivw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755
Subject: [virtio-comment] RE: [PATCH V2 1/6] virtio: introduce virtqueue state

PiBGcm9tOiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6IEZy
aWRheSwgTm92ZW1iZXIgMywgMjAyMyA0OjA1IFBNDQo+IA0KPiBUaGlzIHBhdGNoIGFkZHMgbmV3
IHZpcnRxdWV1ZSBmYWNpbGl0eSB0byBzYXZlIGFuZCByZXN0b3JlIHZpcnRxdWV1ZSBzdGF0ZS4g
VGhlDQo+IHZpcnRxdWV1ZSBzdGF0ZSBpcyBzcGxpdCBpbnRvIHR3byBwYXJ0czoNCj4gDQo+IC0g
VGhlIGF2YWlsYWJsZSBzdGF0ZTogVGhlIHN0YXRlIHRoYXQgaXMgdXNlZCBmb3IgcmVhZCB0aGUg
bmV4dA0KPiAgIGF2YWlsYWJsZSBidWZmZXIuDQo+IC0gVGhlIHVzZWQgc3RhdGU6IFRoZSBzdGF0
ZSB0aGF0IGlzIHVzZWQgZm9yIG1ha2UgYnVmZmVyIHVzZWQuDQo+IA0KPiBUaGlzIHdpbGwgc2lt
cGx5IHRoZSB0cmFuc3BvcnQgc3BlY2lmaWMgbWV0aG9kIGltcGxlbWVudGF0aW9uLiBFLmcgdHdv
DQo+IGxlMTYgY291bGQgYmUgdXNlZCBpbnN0ZWFkIG9mIGEgc2luZ2xlIGxlMzIpLiBGb3Igc3Bs
aXQgdmlydHF1ZXVlLCB3ZSBvbmx5IG5lZWQNCj4gdGhlIGF2YWlsYWJsZSBzdGF0ZSBzaW5jZSB0
aGUgdXNlZCBzdGF0ZSBpcyBpbXBsZW1lbnRlZCBpbiB0aGUgdmlydHF1ZXVlIGl0c2VsZg0KPiAo
dGhlIHVzZWQgaW5kZXgpLiANCg0KU29ycnksIHRoaXMgZG9lcyBub3Qgd29yay4NClJlZmVyIHRv
IG15IGxhdGVzdCBzZXJpZXMgYXQgWzJdIHRoYXQgY292ZXJzIHVzZWQgcmluZyBlbGVtZW50cyB0
b28uDQpDb21taXQgY2hhbmdlIGxvZyBjb3ZlcmVkIHRoZSByZWFzb25pbmcuDQoNClsyXSBodHRw
czovL2xpc3RzLm9hc2lzLW9wZW4ub3JnL2FyY2hpdmVzL3ZpcnRpby1jb21tZW50LzIwMjMxMC9t
c2cwMDQ3Mi5odG1sDQo=

