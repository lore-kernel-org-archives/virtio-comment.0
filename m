Return-Path: <virtio-comment-return-6572-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDE4EB64DA
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 13:10:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 51349335C2
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 13:10:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3F613986590
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 13:10:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2EBD3986573; Wed, 28 Jun 2023 13:10:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1B530986585;
	Wed, 28 Jun 2023 13:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrEEsAgS0goqdjgMAvSRmU3vOvt7eCqyG7phMoRHZNlj9+Exp+Eb0zzDM/iDyAW6lHGTQcOtBbmk7Spw0FsVMuM+b+HHAEaskd4Rd8aDztM96r9sVXL2wuSu2x5IZeHshPPUSgOtxjUnzMOhG3t8hnE+fJiw7KTJL2lfXO4RBYREdb3dLpoDE3VntixH/dWfAqOcyfi25JSLjHz8+aOmUkMP5kPlw8C7wCNqeOEiNi3FOkPSIoYoTphZdfwIF8iIKcNuP8xFv3q4gvYalN8qvgnteAefKNaz9s5KEHBgjonbA9BSF0xnuI0XFKoGsDb9E71T/T8CGrY6A3s7UYLB/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TErnPHsAz+9tScXUp3BKy5Cc7r3YNPgH1bkbb7R4lKk=;
 b=g9NsSnfBVpliNTG8iAgbFbXiPhwS4pJ9+SehKzPnQouXvhvQqHWwR88b1kb12yrwGwiXp3v2UOU+qRT0S5lhdccWLS3Q/1EdcQYVh+c8JN/+Zr5dmHF7CefgZXXM51KJia+UGpUjfhUwshq2GjAMzlDr3njwZRG8LyF4iXjwi3g8+dg9eLjUsYaY0Kc/LG3lGB0y4+mzsTsS2S9JLJWDqZVl940H0YsqVK2iX/55xur6O0opvxezQ8kM7ru6se9TwxvpaM7l+ZpIfiB8fmDRmGq8qqRN85eJmusBV1p5La+EX5upoAmHLiNzU8PR5dsYouMue7UO416iaVQ4L3tBzQ==
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
Thread-Index: AdmpVpzpKKBUbqM4Qgq425cUop3WcQAO9SoAAAusrWA=
Date: Wed, 28 Jun 2023 13:10:43 +0000
Message-ID:
 <PH0PR12MB54818AEB1A85069B42B97158DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481821452DA2A9572714BB9DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6b95e5ec-37e7-7150-9926-6bb02ee13cf3@intel.com>
In-Reply-To: <6b95e5ec-37e7-7150-9926-6bb02ee13cf3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB7996:EE_
x-ms-office365-filtering-correlation-id: 3815b550-7a88-456c-97a3-08db77d91432
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 IA7O19sZTahZERfOcq2Gnl043GSn378M4+5bWTv/f3+o9/VT/BrU6PSCcJE5EyQevQocSH/N4ezLAxOGYEZwiwlXnzzRyEzxjb24b7SZyZWJVd6vKsY6P+ezRwPOmHuNjUxzJ2+aWrAcDu/pYP6QVMGQ/G27snK685SANI+mTx1dHpHPZpJ41x/ILDfuv+5n075LFtVgKNfkmXMYkOc4+n3puYxtmzIz1nZ7y/47doWL/j8sJ5C4bD7u77gWaZhOFH+R83Wfvu5UwiZRPoxHtgve/EsDFvrR89xICIAOV+MlNydJH3p7Td/VW8aKi9dHziv88N+KqXA9+KDQ7TwLoQydKoHnW0+5/6J3sq46zLrK5mDubEPyZjnloby9mGooE4R3bZkuuVQxohGJkHJh+do8Url/CjmlTEXgh/PIOlssso1kmwoK37GdrgdE/3S8qGDw6LrRvHYagKvn8EUWBRgwhSidiz9n+cWxjoC543oHp0vood+3c6FzfsV1oZVD/27X3fCEgqKIuLp99MqWLF78A76oX9MJCXv74qqkJu3IWqsAI+EUVyujy8e+jwhux5jR1CywA8pkPBFjcfPucfBIGebSq0GCtExw+r/BzXw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199021)(26005)(186003)(6506007)(9686003)(53546011)(83380400001)(52536014)(8676002)(8936002)(41300700001)(38100700002)(5660300002)(86362001)(38070700005)(33656002)(122000001)(55016003)(6916009)(66476007)(2906002)(316002)(4326008)(7696005)(54906003)(478600001)(66946007)(76116006)(66556008)(66446008)(64756008)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGphYnc1RGYrRGpncFA4UHlQSjRmd3BXL01RR1JWN0R0d2FaT1psdkpKc2JS?=
 =?utf-8?B?c0Y0OGdxUWJFRm4yQjVUaGgyRTZDTGEwSzN1bnlhSXhRd3NaVEVwMzVoek5y?=
 =?utf-8?B?TkZFalJtdzdOTjY1WWEveDM5Z09wampxd1JEMzhRS20rdGtKNDNaaWIvQ0JM?=
 =?utf-8?B?Y3Z4dWh4bFROZVFVTkZuMG9nSC9tcU5mOUJVbnR0Y0lveEd3M0hHbjhIWUpG?=
 =?utf-8?B?RG5kT2d1UWRIb1J4aW9ZRW1maFJpdXZFbFBjQ1RNbzdlR3huY2EwVHRpb1k4?=
 =?utf-8?B?cVgyeVNZTTN2RzdqK0JGTjNoNjJ3bHgyODRQSkZMUXJYNVFhTXlJeDZINXdR?=
 =?utf-8?B?RVRENkc1TGo5UTJRNHZDOE56bEs0eUVzb2E2dEtUbTRyd2ZPcmFvVjVsWGRv?=
 =?utf-8?B?T0FYZVpQR3JGWVJVdXpqVVVsam9vTi85RnpiTUdwZXhFSlNKeGZQN1NVSkdn?=
 =?utf-8?B?SVpoZWtETHRWNHlpN0F0eWF4UUF6c05MT2pDVEdLMkYvZHo0YU5iYlZZNzBV?=
 =?utf-8?B?S0ZmN3V4bFhnQ0NqU29lMm5yclFjeW0xa1JHbGFieFBEd0R2cVdtSWxxbWhV?=
 =?utf-8?B?TmhIOUJ5ZG5kektPekVGc2JaajF1UTlKRm53NVpyZ1NFdjc2STRvY0s3ODlT?=
 =?utf-8?B?YVhnTXRWRmxTM2UvK1k5Z2xrMERYYitvZ1V3aUtHTjIrdnorRC81NWh5Mkgy?=
 =?utf-8?B?V3RCdGV3ZFBHZTVwTXhvRC81RDV5emNLNEpaZVJHZkMrS2tRMlZKU1Q2b3Ay?=
 =?utf-8?B?enlQSFNBMVIxdHNSUlgyOU9HRUF6V1FlYi9RZFY3eHNXQTdmN0dYQXNOaHNv?=
 =?utf-8?B?S1FENjQ5eGR2NzFXelBUdEQvL0YxZElmRmxNcy9aUEtKL0pZdFFYMEFZQlE4?=
 =?utf-8?B?MjhJajRhSndyUmpZV1lHRlh1MEhhc29OYVRqckY4MWExMTJUVVBlT3l6VkNp?=
 =?utf-8?B?L2xvRTJQTEhIekY1Z3B0R2VzelFZRW5xU2p0UmlPNUdnQ2k5UGRBak55akty?=
 =?utf-8?B?YjVLWnVBRHp3N1g1aHg2UVVCRHVqOTdRL3ZSYnp0Y1J3d3ZYRHZZWkNrSUJ2?=
 =?utf-8?B?V3lHN0dEWkJOd0pKSXV2L3BmVC9WYjNISHdXK09BeDRsQW9zZm1yK0tSd01X?=
 =?utf-8?B?bU5SZUEvcGZqUTlYOHIwNTdidjlsaDhqZzdVMktLYkZVdGYyZlNWeWtJTmk4?=
 =?utf-8?B?bzNwSTRTenFua0k3WnpYWW1rd2pXN3B5UHRwQzd2cFRvbC9iYzlyaDg1ZE5R?=
 =?utf-8?B?d29MR0tFS3l3ODFtVWQ1WS85RUUwYzNyM1VVUjJYNnU2UGxKV0FLY0NBaGV2?=
 =?utf-8?B?YktzNU5jaEszSCtQSmlvck1ScGdWZ1MrQmRwMWRIaUhJRWd2Um5pSjh0YUVK?=
 =?utf-8?B?ZVM4ZGZreHplUDNCbFFCTHg3eU5oTDdxaHMvSzl4U0xkSzJ6R3ZZSkI0R21w?=
 =?utf-8?B?TzJxWWliVmhpQ0xxYnF0OGhnOWoxZEVKenhka01pRWV4WW8zb1pBSWVwNmhx?=
 =?utf-8?B?RXhYZkp0R3VxbmpHOHB5aEExUXE0eUlwbmFaRE5CNkJwbTVTNXluNHhhNXlt?=
 =?utf-8?B?ZU95Wnk4MlpiMFk3QzQzenZpRGdZRk15a25YRWJKNjR5VW8rUlRMS0hYdXNl?=
 =?utf-8?B?ZWl1eU1rMUJKU3BOd0RWM0NlbHNjMUpkSWx5Q050bXlkS3RhYmtCa0JDZUtq?=
 =?utf-8?B?cFlZQlRvRnh3RUZMMXBtaEdyT0dzWDZtUkhndUtvWmxEMXE4d01nUXpJbjRr?=
 =?utf-8?B?c0h3SWNGTGpHMDh5M2VNOGtqeE9YUU8ralJoNUU4dENxa0xxN3NKSDN3WEVN?=
 =?utf-8?B?dWd0bVhKeno1Ym5PSlJKcnBhVk1ZN2ZoTWxxaGtqdkdyRzZjVFVtMW9tTUpW?=
 =?utf-8?B?a3AzcFc0N1E4SGo5ZnZPN2lURHNFZHF4NGR2MzEwR0ZOMkVicDRVZG55enM0?=
 =?utf-8?B?ZDhGNHJHV0NyY3BmcklHbVRVZXpVVVBGQUVnZDRwOEc5dEpNSEZ5OVpnTlUz?=
 =?utf-8?B?L3VvNDVjbS9XOFlwM3hiaGNvbHVoZXE0aE5QUm9tc0VhK0drdkxKbGU0aVNR?=
 =?utf-8?B?QWJOTUNvYlFRRjdlVXJlaHBSWndpSTRHVkFlWlZPazdzRTliRUd0czZsVzRD?=
 =?utf-8?Q?afFA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3815b550-7a88-456c-97a3-08db77d91432
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 13:10:43.2971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ccMc5l2pY+g1QIew/eKUHSZVAwPrVeqDHb/4UmdLye3lPBMUMYPs1uVU28FxFmjmaWFp7O+HhwYQF9sIJwXVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7996
Subject: RE: [virtio-comment] Re: virtio member device provisioning get/set
 and virtio child device life cycle mixing not needed

DQoNCj4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmcgPHZpcnRpby1j
b21tZW50QGxpc3RzLm9hc2lzLQ0KPiBvcGVuLm9yZz4gT24gQmVoYWxmIE9mIFpodSwgTGluZ3No
YW4NCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDI4LCAyMDIzIDM6MzEgQU0NCj4gDQo+IE9uIDYv
MjgvMjAyMyA4OjIyIEFNLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4gSGkgTGluZ3NoYW4gWmh1
LA0KPiA+DQo+ID4gSSBoYXZlIHJldmlld2VkIHY0IHZlcnNpb24gdHJhbnNwb3J0IFZRIGEgd2hp
bGUgYmFjayB0aGF0IGNvbnNpc3Qgb2YgdHdvIG1haW4NCj4gcGllY2VzLg0KPiA+DQo+ID4gMS4g
c29tZSB2aXJ0aW8gZGV2aWNlIGNyZWF0aW9uL2Rlc3Ryb3kgY29tbWFuZHMgMi4gdmlydGlvIGRl
dmljZQ0KPiA+IGZlYXR1cmUgYW5kIGNvbmZpZyBzcGFjZSBwcm92aXNpb25pbmcgY29tbWFuZHMu
DQo+ID4NCj4gPiBNYW55IG9mIHVzIGFyZSBzZWVpbmcgdGhlIHZhbHVlIG9mIGRldmljZSBwcm92
aXNpb25pbmcgY29tbWFuZHMNCj4gd2l0aC93aXRob3V0IGxpdmUgbWlncmF0aW9uLg0KPiA+DQo+
ID4gTmV3IHZpcnRpbyBkZXZpY2VzIGRvIG5vdCBuZWVkIHRvIGZvbGxvdyBhbnkgZXhpc3Rpbmcg
b2YgY29uZmlnIHNwYWNlIGV0YyBwZXINCj4gc2F5IGZvciByZWFsIGh3Lg0KPiA+IFRoZXJlIGlz
IHNvbWUgdmFsdWUgaW4gcmV1c2luZyBzb2Z0d2FyZSBidXQgaXQgbWF5IG5vdCBiZSB0aGUgcHJp
bWUgZHJpdmluZw0KPiBmYWN0b3IgZm9yIGJyYW5kIG5ldyBkZXZpY2VzLg0KPiA+IFRoaXMgbmVl
ZHMgbW9yZSBkaXNjdXNzaW9uIGFuZCBub3QgYXNfaXMgZG9uZSBpbiB0aGUgdjQuDQo+ID4NCj4g
PiBTbywgaWYgeW91IGFyZSBwbGFubmluZyB0byByZXZpc2UgeW91ciB0cmFuc3BvcnQgdnEgcGF0
Y2hlcyBhcyBhZG1pbg0KPiBjb21tYW5kcywgcGxlYXNlIHNwbGl0IHRoZSBzZXJpZXMgaW50byB0
d28uDQo+ID4NCj4gPiBhLiBkZXZpY2UgYW5kIGNvbmZpZyBzcGFjZSBwcm92aXNpb25pbmcgU0VU
L0dFVCBwYXJ0Lg0KPiBIaSBQYXJhdg0KPiANCj4gSSBhZ3JlZSBpdCBpcyBnb29kIHRvIHVuaWZ5
IHRoZSBpbnRlcmZhY2UgZm9yIFNSSU9WIGFuZCBTSU9WLiBIb3dldmVyIG1vcmUNCj4gZGlzY3Vz
c2lvbiBpcyByZXF1aXJlZCwgZS5nLiwgZm9yIGEgVkYsIHdpbGwgY29uZmlnIGl0cyBNU0lYIGJ5
IGFkbWluIHZxKG93bmVkIGJ5DQo+IGhvc3QpIGNvbmZsaWN0IHdpdGggdGhlIE1TSVggY2FwLg0K
PiANCk5vLCBpdCBkb2Vzbid0IGNvbmZsaWN0Lg0KU1ItUENJTSBpbnRlcmZhY2UgaXMgb3V0c2lk
ZSB0aGUgc2NvcGUgb2YgUENJZSBzcGVjLg0KSSBjb21wbGV0ZWQgdGhlIHdvcmsgaW4gUENJIHNw
ZWMgdG8gY2xhcmlmeSB0aGlzIGFscmVhZHksIGl0cyBjb21pbmcgaW4gdGhlIDYuMSBlcnJhdGEg
c3BlYy4NCg0KTm9uIHZpcnRpbyBkZXZpY2UgYW5kIExpbnV4IGtlcm5lbCBib3RoIGFscmVhZHkg
aGFzIHNpbWlsYXIgaW1wbGVtZW50YXRpb24gaW4gcGxhY2UgYW5kIGluIHVzZSBmb3IgbW9yZSB0
aGFuIGEgeWVhci4gDQpTbyBtc2l4IHByb3Zpc2lvbmluZyB2aWEgQVEgaXMgZmluZS4gVkYgY2Fu
IGV4cG9zZSBuZXcgTVNJWCBjYXBhYmlsaXR5IHBvc3QgcmVjb25maWd1cmF0aW9uIHZpYSBBUS4N
Cg0KV2Ugd2lsbCBiZSBhYmxlIHRvIHVuaWZ5IHRoZW0gYWNyb3NzIFNSSU9WIGFuZCBTSU9WLg0K
U0lPViBhbnl3YXkgaGFzIHRvIHdhaXQgYXMgaXRzIHVuZGVyZ29pbmcgc2lnbmlmaWNhbnQgY2hh
bmdlcyBjdXJyZW50bHkuDQo=

