Return-Path: <virtio-comment-return-8054-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B51C4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 03:27:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6FCDF2AEE8
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 03:27:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 51E93986B5F
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 03:27:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3D7EE986B5B; Tue, 31 Oct 2023 03:27:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2A424986B5D
	for <virtio-comment@lists.oasis-open.org>; Tue, 31 Oct 2023 03:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXH9VJx2dvyXr/Rb6rhkf8rw+OYZtoR5W1ac6q8Dzwy3iAIV6wmFBnqz7NLqjzPkUFL+VtD0aBqstHHrWIoIoVpFMKriOKpHWLeNbwmWMC28jkAGhcVUjeQ44dotIZbE66jeDmxAXRz9t1CtfZx2JPK8qbC5KcKbNqGWgUzOlTJkEylQoLHfmpf2616IJCu4toQ3VXj0UwulY0GMF94xIbNVwv8XUxDlmTQsGgXPnibhRBNkpOW5U0bX5YVZ8OkisBK+kpBUZz5yVClnKDfTbN03LOEaSx8XJh/k8TgS6CurK9pgpGGvutcrzqi1fVWw6lk7zUC3GpPdykboZ1bz6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrQR8vJ+IAl8UMuIN+uToJMyPc8U3iHaZ7u0TkkwTHg=;
 b=fdqXfbnCFYEGZ2fI+Od+Ev6s+FQtPFVigmGbiDRcx2YqTab9TNg71YpgW0aVqefPABdCTj7cODdeyl6/SLg/sceGXhSKi5bsj89ax787EFkEviCXCi62fXT7rhezbSUVn9bAnIM6L77hSHEoD7vZLFzRFR5R5/nzHAmT53g7nbvzDLpgdh8pI3R8h6QThc4NBxGx/rnUOOO4boaWzKFVKvXmTsMhay5kvWoVTeTGY9RMEuokphOpHO9xilh1XBky+73JUi9IXLcgElw0eW0PAgdpIH67WthDcET5CiyJCJIcFmodlGOcP42PSiz4Yp+iwdpIrXXWwlhrhGZ/obtpSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com"
	<sburla@marvell.com>, Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb
	<maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands
Thread-Index: AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4A=
Date: Tue, 31 Oct 2023 03:27:12 +0000
Message-ID:
 <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231030131959.1386107-1-parav@nvidia.com>
 <20231030131959.1386107-7-parav@nvidia.com>
 <CACGkMEuHBRwH9LqC+_jBX5OFrzhJw88AZeAQBou+G_hZK1F2Ug@mail.gmail.com>
In-Reply-To:
 <CACGkMEuHBRwH9LqC+_jBX5OFrzhJw88AZeAQBou+G_hZK1F2Ug@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA3PR12MB9160:EE_
x-ms-office365-filtering-correlation-id: d8c9afac-eb22-446d-0c91-08dbd9c1458e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 TrF2h+KXRT3LFvmsj/DQ4pRSZHFDBIs4zVjt3yBWklTMsKy3W26c9LnCpzA3mDyrHd4BDXwmWMS6PGYCwHa+OUWiTE9upkEHD0EiquKaozM/q4wJhpaOAhuemF9CgAzD8nTAY5ju7/IYTju+SawSVnw1O3hI8c+zOQBE8GbS9a3jF7Qhuw/BQCT+J+dzyfU4iM0xCfaxSENFUXfGMR8hEzvjc+iF+zfE2O9y+iQ1d0JkE1uwGd3aPOOcXqZ0eoommpjczeGT8+uC4+O8K696YApab0AmO418WyV2maTvd+ybjihoacf6pmj4bEEgp1UZ9kSnKsk302Mr9W8EjONszbgO6/M7q6KaIaInRWxatl0UH/3hXHUnMXWIov8y5LKeazhijjTjUewSeHsVB7UQNlNMDy3pHI9jkAIi0XvjKrVKcYbSc5zYgc9wcnNrteRhoAzNT3WTFn5R4V8xL2jRI17Iaqevyu8o8DtZADwry0aUa9Tyh+9JvneEOShmCySAHFG4zNl++hu4hla+kesVCRegxGiOk1WFbXOfn34v/DaYDfBoqIS9rst2HlzPdVlJg/n+7YXR3z4aSz4daxkmGAKuNmXOib/lsNaIZz36xppTexA9+rSBoXUJf4ovVWR7jsnRjuuAocZZx/4HU1or54uCjgn6m92ayRa5+1IiCDA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(346002)(396003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(55016003)(9686003)(26005)(53546011)(7696005)(478600001)(6506007)(71200400001)(83380400001)(2906002)(41300700001)(66556008)(5660300002)(66946007)(76116006)(6916009)(66476007)(8676002)(64756008)(8936002)(66446008)(966005)(52536014)(4326008)(316002)(54906003)(38100700002)(122000001)(86362001)(33656002)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N1dTLytnQ1BuQ1o2TTlqem9LdzBORzN0WHVDRXFrNTgyYkEwaXpuVEh6UDl2?=
 =?utf-8?B?b1hhOFB2TkdZNE5FV1F0ekxyWUhPMzhxWEI5YWlucVovYVgyUkd3aGN4bVND?=
 =?utf-8?B?VWllam9mSk1ISDBYUUlQTFpTSmdmNGFqanVJTFVCbW95RktuNTQ3c2EyazBx?=
 =?utf-8?B?cTJwNHJ5YkhCdVg0dU02T0k1dTM2djcyRVRyaUM1eU9UU0tTbVUrTGlva2xC?=
 =?utf-8?B?a2tiRTE1bk5qV2hxd0lSNUNFZG1mT1RibTJjTEkxS1IyYzg2QWJlc1ozSDBE?=
 =?utf-8?B?K1JOckhldW4xdlZ5MGVjWFl3aURKZ2EvYlF6WFNHK3c2MXJZbVcxVmxYM2oz?=
 =?utf-8?B?VERZcUJrOFJPYmt1djZkeFhVOUVJZFBIVTl6cE9QVTFPaVpaSTFEV004OXVU?=
 =?utf-8?B?QllxbXExMjVEem5ZMUtoQ20zSzNMM1hZTEpCVUM1enpFamtwY1FwRG5EWGl1?=
 =?utf-8?B?NjB2Sk9Qd3MremxLUG05LzY0dnhOenBpV1JiSzRqZENmenZGakVIUzVtYXhh?=
 =?utf-8?B?ZmliNkN3aElEK3FHSldNaHMyR0YrTk41NmtEWXh2MTJtVXBmNVA0TjhLdzdn?=
 =?utf-8?B?Q0xmTmx5MEpsT2VTcWppRkV3WFljVlpKdkVYUW9YL3c5anZ4cytldUtFNW1E?=
 =?utf-8?B?V1RpY0gvRU9Tb0RGRWgybU0xQTJvVEFkUENtd2NYYTdKWmFDaXFZZFdLcmVP?=
 =?utf-8?B?aGdjWENYUldlK2MxdUdpY3k1Q0JwVDc4Mk84bjZZcUVuUDMxaUpnZ2tBRzBp?=
 =?utf-8?B?ZS91RnB4WEdXQ2RhcUxlSU54V3FFY25Wd1M5RWFVZHFoMDdBNXZodHFqcWVM?=
 =?utf-8?B?dWZTelRDeStRUk56ZUFmNW1KK09oV3QvZVdmWVoycHp3bEh2RW1ockZhQWY4?=
 =?utf-8?B?TjRMSVVTdFFKOUlyR1dmYjlwVE1VclVXSzY1dmVpMjZtcEdxTk1KYWljc0JG?=
 =?utf-8?B?Y3lMS1poU2lFNm0rbGNyM1RIQ2tSek9BTUVnYlJtUUthdVZ2Q2NxbFRObUdl?=
 =?utf-8?B?WDBRWVpQUkV0YjdzUFFoK2ttZ1RZejNjbjEwMG8rSnJ4QlM3MThNeUJYVld6?=
 =?utf-8?B?R2JYeDBROGpsTFBEQW1Xbjk3aUU1Q1JvM1Z3Sy9MNzFaUUgrbDZsYWh4VnZS?=
 =?utf-8?B?L2RUdDhSbUVFSllZcW1UY2pzd1E5Nmx6RVdIVXZWc1ZibXFYdGtDS0NJQWxl?=
 =?utf-8?B?ZHdDNEpDN2x5emc3ZVI2ME91bHVlUWVIS1cwRkFnM3A1eE1qSzk0bXlISW5O?=
 =?utf-8?B?L3ZCamNpZmxUTTJwZ0NyeFdueWQzMUEwTzJaL3ViUUFKYjFoN01SeUhOL2hl?=
 =?utf-8?B?QzE3MTc2RjRyaG1qOGtUQmQwV1R3bkVaZDJYM1NMeHBnMVFzNTExeWRiTTBu?=
 =?utf-8?B?RHYxZlNTdldOUkNRaHBlUkREQjJvNHZIVDE4N3VORHVpMllndkVVamFhZlgy?=
 =?utf-8?B?NCtKazBwb3pYUWRQeDVFNGNBTjFSRGRmQ1JQYzBiWTI4TGxrcmVlRjNkdzRa?=
 =?utf-8?B?VHV5YW1qQTFtOTU0MTh5UGpndlVTS0VmdDBsajFhVk9MMUVMeSt6alc1Uzda?=
 =?utf-8?B?VmdWZFhlYTY3eGhEY3BZNFEzbXFUU3FjYzUvTTRjK3hVYUoyeWJUeVhSNVhE?=
 =?utf-8?B?MUpUTUhNcGk3bVR3cjI0WG03RFdiQzRCRVY2OElUcC9tenVkbWN4UTV6WXF1?=
 =?utf-8?B?cGIvTEowQnM2M3V4b3p2ZEZ5UUNPTjFTVDN0Y01RNDl4TGtLK2FaS0c3VEhM?=
 =?utf-8?B?WVc1Zmt4YXZsV0NjVWU1OHdNbysxUjR1c0wwZGQxY1pRdTlrMklHaDNOazZx?=
 =?utf-8?B?OWhCV3ZVWUViSmkwcUZsQkJuNk81N1JsOVliT3hjMWVtT1NlbVBMK0VGRWFa?=
 =?utf-8?B?akt1Sm5pTFlEbUZCNERkbzlLU3BPVVR1Qk5VUmpxRmF6cmNmOG5NTExkbnZN?=
 =?utf-8?B?Zjg5OUlrYXdyQ2VULzI0bytrR050UVNMZEl0eGMxUjJPemtSRktRVU9TbE9Z?=
 =?utf-8?B?V3BmMFpCbVAyTnQ2U09zUUhKd0NROVE2cFRvNzljODN4ZVlLbW43SURxUnE0?=
 =?utf-8?B?RnpOSWdLTGdjd0dtYXljUVRxbXhGWFRFM3EwQXBOaDEwRmdnWG16L2llbk9O?=
 =?utf-8?Q?yV+Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c9afac-eb22-446d-0c91-08dbd9c1458e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 03:27:12.1368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r/0g2nrlLEf9YAaWgfIIP3ApEweGaGVCVp4G7Zx2p6ge/c+X9npdbM9NZKfkkTlnmJLEe9mcYC/oVN+z4e7m8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9160
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVl
c2RheSwgT2N0b2JlciAzMSwgMjAyMyA3OjEzIEFNDQo+IA0KPiBPbiBNb24sIE9jdCAzMCwgMjAy
MyBhdCA5OjIx4oCvUE0gUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPiB3cm90ZToNCj4g
Pg0KPiA+IER1cmluZyBhIGRldmljZSBtaWdyYXRpb24gZmxvdyAodHlwaWNhbGx5IGluIGEgcHJl
Y29weSBwaGFzZSBvZiB0aGUNCj4gPiBsaXZlIG1pZ3JhdGlvbiksIGEgZGV2aWNlIG1heSB3cml0
ZSB0byB0aGUgZ3Vlc3QgbWVtb3J5LiBTb21lDQo+ID4gaW9tbXUvaHlwZXJ2aXNvciBtYXkgbm90
IGJlIGFibGUgdG8gdHJhY2sgdGhlc2Ugd3JpdHRlbiBwYWdlcy4NCj4gPiBUaGVzZSBwYWdlcyB0
byBiZSBtaWdyYXRlZCBmcm9tIHNvdXJjZSB0byBkZXN0aW5hdGlvbiBoeXBlcnZpc29yLg0KPiA+
DQo+ID4gQSBkZXZpY2Ugd2hpY2ggd3JpdGVzIHRvIHRoZXNlIHBhZ2VzLCBwcm92aWRlcyB0aGUg
cGFnZSBhZGRyZXNzIHJlY29yZA0KPiA+IG9mIHRoZSB0byB0aGUgb3duZXIgZGV2aWNlLiBUaGUg
b3duZXIgZGV2aWNlIHN0YXJ0cyB3cml0ZSByZWNvcmRpbmcNCj4gPiBmb3IgdGhlIGRldmljZSBh
bmQgcXVlcmllcyBhbGwgdGhlIHBhZ2UgYWRkcmVzc2VzIHdyaXR0ZW4gYnkgdGhlDQo+ID4gZGV2
aWNlLg0KPiA+DQo+ID4gRml4ZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9vYXNpcy10Y3MvdmlydGlv
LXNwZWMvaXNzdWVzLzE3Ng0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhcmF2IFBhbmRpdCA8cGFyYXZA
bnZpZGlhLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYXRhbmFuZGEgQnVybGEgPHNidXJsYUBt
YXJ2ZWxsLmNvbT4NCj4gPiAtLS0NCj4gPiBjaGFuZ2Vsb2c6DQo+ID4gdjEtPnYyOg0KPiA+IC0g
YWRkcmVzc2VkIGNvbW1lbnRzIGZyb20gTWljaGFlbA0KPiA+IC0gcmVwbGFjZWQgaW92YSB3aXRo
IHBoeXNpY2FsIGFkZHJlc3MNCj4gPiAtLS0NCj4gPiAgYWRtaW4tY21kcy1kZXZpY2UtbWlncmF0
aW9uLnRleCB8IDE1ICsrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5z
ZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2FkbWluLWNtZHMtZGV2aWNlLW1pZ3Jh
dGlvbi50ZXgNCj4gPiBiL2FkbWluLWNtZHMtZGV2aWNlLW1pZ3JhdGlvbi50ZXggaW5kZXggZWQ5
MTFlNC4uMmUzMmYyYyAxMDA2NDQNCj4gPiAtLS0gYS9hZG1pbi1jbWRzLWRldmljZS1taWdyYXRp
b24udGV4DQo+ID4gKysrIGIvYWRtaW4tY21kcy1kZXZpY2UtbWlncmF0aW9uLnRleA0KPiA+IEBA
IC05NSw2ICs5NSwyMSBAQCBcc3Vic3Vic2VjdGlvbntEZXZpY2UgTWlncmF0aW9ufVxsYWJlbHtz
ZWM6QmFzaWMNCj4gPiBGYWNpbGl0aWVzIG9mIGEgVmlydGlvIERldmljZSAvICBUaGUgb3duZXIg
ZHJpdmVyIGNhbiBkaXNjYXJkIGFueQ0KPiA+IHBhcnRpYWxseSByZWFkIG9yIHdyaXR0ZW4gZGV2
aWNlIGNvbnRleHQgd2hlbiAgYW55IG9mIHRoZSBkZXZpY2UgbWlncmF0aW9uIGZsb3cNCj4gc2hv
dWxkIGJlIGFib3J0ZWQuDQo+ID4NCj4gPiArRHVyaW5nIHRoZSBkZXZpY2UgbWlncmF0aW9uIGZs
b3csIGEgcGFzc3Rocm91Z2ggZGV2aWNlIG1heSB3cml0ZSBkYXRhDQo+ID4gK3RvIHRoZSBndWVz
dCB2aXJ0dWFsIG1hY2hpbmUncyBtZW1vcnksIGEgc291cmNlIGh5cGVydmlzb3IgbmVlZHMgdG8N
Cj4gPiAra2VlcCB0cmFjayBvZiB0aGVzZSB3cml0dGVuIG1lbW9yeSB0byBtaWdyYXRlIHN1Y2gg
bWVtb3J5IHRvIGRlc3RpbmF0aW9uDQo+IGh5cGVydmlzb3IuDQo+ID4gK1NvbWUgc3lzdGVtcyBt
YXkgbm90IGJlIGFibGUgdG8ga2VlcCB0cmFjayBvZiBzdWNoIG1lbW9yeSB3cml0ZQ0KPiA+ICth
ZGRyZXNzZXMgYXQgaHlwZXJ2aXNvciBsZXZlbC4gSW4gc3VjaCBhIHNjZW5hcmlvLCBhIGRldmlj
ZSByZWNvcmRzDQo+ID4gK2FuZCByZXBvcnRzIHRoZXNlIHdyaXR0ZW4gbWVtb3J5IGFkZHJlc3Nl
cyB0byB0aGUgb3duZXIgZGV2aWNlLiBUaGUNCj4gPiArb3duZXIgZHJpdmVyIGVuYWJsZXMgd3Jp
dGUgcmVjb3JkaW5nIGZvciBvbmUgb3IgbW9yZSBwaHlzaWNhbCBhZGRyZXNzDQo+ID4gK3Jhbmdl
cyBwZXIgZGV2aWNlIGR1cmluZyBkZXZpY2UgbWlncmF0aW9uIGZsb3cuIFRoZSBvd25lciBkcml2
ZXINCj4gPiArcGVyaW9kaWNhbGx5IHF1ZXJpZXMgdGhlc2Ugd3JpdHRlbiBwaHlzaWNhbCBhZGRy
ZXNzIHJlY29yZHMgZnJvbSB0aGUgZGV2aWNlLg0KPiANCj4gSSB3b25kZXIgaG93IFBBIHdvcmtz
IGluIHRoaXMgY2FzZS4gRGV2aWNlIHVzZXMgdW50cmFuc2xhdGVkIHJlcXVlc3RzIHNvIGl0IGNh
bg0KPiBvbmx5IHNlZSBJT1ZBLiBXZSBjYW4ndCBtYW5kYXRlIEFUUyBhbnlob3cuDQpNaWNoYWVs
IHN1Z2dlc3RlZCB0byBrZWVwIHRoZSBsYW5ndWFnZSB1bmlmb3JtIGFzIFBBIGFzIHRoaXMgaXMg
dWx0aW1hdGVseSB3aGF0IHRoZSBndWVzdCBkcml2ZXIgaXMgc3VwcGx5aW5nIGR1cmluZyB2cSBj
cmVhdGlvbiBhbmQgaW4gcG9zdGluZyBidWZmZXJzIGFzIHBoeXNpY2FsIGFkZHJlc3MuDQo=

