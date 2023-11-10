Return-Path: <virtio-comment-return-8313-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B19C4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:31:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4E66460D49
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:31:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3725F986D05
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:31:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2C981986D03; Fri, 10 Nov 2023 12:31:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1F8A4986D04
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIRwUpAMRMEFsj/vOmkJRXfG/ti1mamqJJM76E4/AHJ3ze2b9U5BO6irfP+wAKptDnO4ufo2ValFQ7L7PWYB4dR/AtzZLOaVCoF3dTovQQS1bP5VlvsZQN9Hf4TtFVyDcCspAg6Imy1rmosCJyiTYPGlSnCA/vMCVnHV4uudylrExAyAI/ELTlc3paLee4lkc9bNvLRMU/0Wsj6jLQT/cyAdaNsAluiizTldMMh6FGaRKOAHwVRxbwUOnqogp+iucCoqPHMjEJ1BNYGBzE7dy68vabdXVV6BO476PExLb7HFjBvJOf8ESjtpe2nBAtl6JGX76FYlIEG/lhzypI8bjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKsCFUyLcPFm0ZniZ0bdg4s+VFfH7OazNm2kGji/KTk=;
 b=m2LDCV+JkVJTMBdDs3Da4ptguKlO7V3WHbId5602mUSi6f9Wsvjlug3nyNjbEtRQO39HswOSi30Oal0KuYTsR6fe6uqfB/FjSrFu4QwX7M6QJF0tT8xzbQC6V8YcOdVCyUDkpF2ZllWKZvZDHGyigmqYHn5sTCBDpGxvM3rKEKzSlc0GvcLraEY7lKR8p/0xnQTdeBVPn8WaX7c6m8ovnQmQs5HARO+uQ8xNdfJeLnKQO9ZhU28Ep2C8E6TOgHdiRvlHErukku06u/VdvBbMPXgn9Q7VxOLtTsIcevgSD4rO49o/JH18Jhbb97Dstf1SuNKTTp/4LUGM1jiOl6Uh4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "eperezma@redhat.com"
	<eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE
Thread-Index:
 AQHaDkFl1Izi1X/8PEWVlDiafyu5VrBocsSwgAA8x4CAAA4dEIAD6TMAgAAKLuCAAFlegIAAFMUAgAF+uwCAAhwigIABEJWAgAAAkYCAAV1GgIAAOMgQ
Date: Fri, 10 Nov 2023 12:31:51 +0000
Message-ID:
 <PH0PR12MB5481647369D7DEB73989C14BDCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481085F6E84FD2786FCD60BDCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <705607e3-39c3-47da-a688-80bbee31c48d@intel.com>
 <PH0PR12MB54814F9EEDD69ED434BF7994DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b0506d9f-37de-43c9-b99d-b00bb88c0d36@intel.com>
 <PH0PR12MB548174AF58B6ADDDA215123DDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b8d51cd3-33fe-4167-a87b-ae662609c5d8@intel.com>
 <PH0PR12MB5481BCA941D86E1031D7A5D9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7a0e7cef-434c-4049-b72f-b8188ecedbaf@intel.com>
 <20231108124402-mutt-send-email-mst@kernel.org>
 <b3ac6cd9-a04e-4cf4-9fce-a9d687191522@intel.com>
 <20231109050151-mutt-send-email-mst@kernel.org>
 <d477d03f-9c6c-4afe-ac1a-e3dc9e9d8fb4@intel.com>
In-Reply-To: <d477d03f-9c6c-4afe-ac1a-e3dc9e9d8fb4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BY5PR12MB4082:EE_
x-ms-office365-filtering-correlation-id: f2881aaa-523b-4e7c-c55c-08dbe1e90461
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cS/vDJ/HWIhKCIb6YwL7fYFX7Td6DtoB3TO3NHacPHGDhFdWbszu5b+nwM/Q6YNaO+OFMQJfQx4z+6ftVT4Ufb+k/+3ztTnGi4Xjiyyuo1uaGRLKEfHyRs7/UHu40ulK6/fq5Thav5QzQyUyFF9tn6cdIiDnvq45EKVFPW31aNWnj3fxguVYvmdczyH1Z7vWZpA9nRe/r8Yf1L6xTW9k9lXkh+y07ayo1kCRmHkzhue591q9/8siulkvA0xLKO7tSMY1dn19d5gmjSjUkiwJXa0sCWB7OtEyr7bI1nrNV+awoGFDKCQ8+VbnYxrX6rOkJVHCcRaybLlCZWduoKmNjdt8Gvx9i8/MP3JoUoX/n3F+jYAzBM7lixlNdCXxug96H2FmvX+Nlm0Ob7fFPJadu45yEMk+eOYACHvh7Y3Ozma/N6AktZld7xDvIw4mbbg6csix4rxRXJOxNoUgqgKSzf/EsVrf8GVE88WvltcELLlnSgF8BT+1L3CoWUJhbxXrz17T9wlt5qH5FsRuaF0lHAmhgxkJxznNpcAGEsabQIoG40BxZmifHmnAIJvWe+nOvnmeAV8OzWYf9ty7ANCMryc0XgMo5cHel4Bgx6tYPJ3DN1MwTtN1wklyd9t0adqb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(66899024)(26005)(38070700009)(110136005)(54906003)(66446008)(66946007)(66476007)(76116006)(64756008)(71200400001)(9686003)(53546011)(7696005)(6506007)(478600001)(83380400001)(33656002)(38100700002)(86362001)(122000001)(316002)(66556008)(41300700001)(2906002)(52536014)(55016003)(8936002)(8676002)(4326008)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1M2SFRWNVRUM0c5Q1dGbEN3d0FIbEI2UkVmK1VVeURHTTNaYTZCUmFFUUtm?=
 =?utf-8?B?SXl1eVh3R0lMTTNKcG55dzhzRnBNMjl3S3c2UnV6bkpiQTU3b2xOd3BpWkZD?=
 =?utf-8?B?eGpYZC9lb2tIWEVUZGhyTnZSVTNLYWk0RjZxRm01QWE0OEJLWUo0eEJ6WnM1?=
 =?utf-8?B?aW9ZV2xXbHFzaElsblg5MGp2a2VDTWpOSG5YSmtyYkdDQzVUYlJ4VlF1ekR2?=
 =?utf-8?B?eWZESndKOFRhcndwZ3N6RmJrY0hDU0RFdHJZTU02SDUzR2ljcVBzOFZiUkpO?=
 =?utf-8?B?WE9pTnJqcmYyYUNvcS9pS3RBNFc2QkZEM1c0am5TSjJvODNHT1Jod1BlSlRj?=
 =?utf-8?B?K3JBRTFLc05vZTdVd1AzWkFMUVVjejluV09EaHlmQUNQOTVmZDBiSDVTbGJp?=
 =?utf-8?B?QWhON3FvZzVORnNoQnRIY1htU0tRYThoYXczT1ZJTWp4aGRaUVJGVmduV2hk?=
 =?utf-8?B?Q1JDb1RGOHVvYmI0cnFzdExzdVdpa01hRHFjdVFid0lHZlgwQVhGNDBXTk1I?=
 =?utf-8?B?RGtLaG54blNWZi9pVXB5SThVL1doaW12WXV0SWZYdGw4a1Y1OWo3ajZLMGZG?=
 =?utf-8?B?R3BkV2pvMmFVbXQ2VDBVYTEwYmUvVEx2dDI0S3N0dXFtOHNnM200bDlXcFZ1?=
 =?utf-8?B?QXBLSnA1SUY2OFI5YlF4K1Y5enlXalIwTHhKYUxIdUdVUEkzNUx4TWk5RzlE?=
 =?utf-8?B?QTkyajBXK0dLS1Y1bWpxVkxmSWUwTFZ2S1lnbUg5Q1lvN052NmY5bWxvSTRP?=
 =?utf-8?B?YU83azZDZW1pSlhNR1lCaEFHVnhkc0ZFZEVyY09zbjlZZ2lLRzgyT2RWN0Yx?=
 =?utf-8?B?TGU5aGJHUzlPM0hLZ0RnYzFiRWFsajVhZzdHYWplNHR0UWVnZjZiSjlZSVor?=
 =?utf-8?B?OTh4c1FveGNIbHNrUnZ0T1pEN2tab3VKY09jb1FQbVU2dEZtL3l0aGlaTnhY?=
 =?utf-8?B?RDdub0Rab1Nhem1uSHVQTStNVnVnMHJ1djhNY1dpQm9WMERDMTc4QjY3eWdj?=
 =?utf-8?B?ZUVqMWJkQWRrVG9hVkRkcHpQWStjMW9xcVVodUdsTTd3Lzh2eGY3Wi9UWUpK?=
 =?utf-8?B?aDFFczRKL3B5K1J5UDRoRVlRNDhjSWlkalFxMUZHOGZGUkVhLzNiT0RMS3U0?=
 =?utf-8?B?dGNXWnNzNTBrWW00b3BhUk0wc1JmaGE0aFk4dElHa0llZUFFQjlDdnVBZHRK?=
 =?utf-8?B?VVp0MHZ6SmJ4YS85TGNoQjJ6azc3aVNudTcvL2tzcmRPZ1Z5eVRFdnFHVXcv?=
 =?utf-8?B?VC9BWk5IVkJDMnF1WW1xcjZIb3lXL0FuVTlXTDFUMUxsekV0VjlUOFdRdFhY?=
 =?utf-8?B?YU9qVFpnYUljN2xXMXIva2lHK2h4ZlhETWtoSFl4M2RWZ2wya0dVd0NTOE1E?=
 =?utf-8?B?WDZ6KzRxVE1qYTdmR1ZwWGlyZEtyWlVtazJjaWxxNUtMR0NWT1MrcElzd2FZ?=
 =?utf-8?B?WWxKWnZYR2xRbkVLemkwYXovSDJ3M0x3VUs3NXA4VmV6OHVneXZoTlE3eU5C?=
 =?utf-8?B?c1Q3U3RSK2FFOXlBeFQrM3BadllxSE5HaDV6VUtWaEh0czZnanQ1QkNwanRF?=
 =?utf-8?B?MnlSY3BrQk1xQXNmaGlQcXpTUHN5UXFnWjNHbU1MRisyTG5hZVN6aTNiN25L?=
 =?utf-8?B?Y2pyTm9DKzhHcTVQdXZMSFBNWXdjRHVWakhvZ05BYlNCZUpDWnJ5SndHYktm?=
 =?utf-8?B?SXJXcHgvelFLbWlDUkphODlGVE4vdGZvS3JhMWsvUFBueG15WExWSndIRTdJ?=
 =?utf-8?B?ZHpEQjFwR0p4TUpMSG03SzdXNXRkanpiMVJzekdHQ3dwOWkwdUYzRDcxckZP?=
 =?utf-8?B?b3U0RStId3NJSUxqNGI3UHBSNEFUVVZ3ZWQxU1lRaGJ4NlFnZllwckpKRmNu?=
 =?utf-8?B?b3JGMmpsZlBXVDNEcUt2SHNDV2I3am16d1VIMDMyL0I4S3Q2b3BuWFM5Wmd2?=
 =?utf-8?B?ejBsdFo2K05Xb2xGTlJaam51VGdXLzRGODZuZmFpb0dDcng0M1ZJRFc1QUd4?=
 =?utf-8?B?c2QzN0JLV2diK2Z4TE5vQldJc1BVTE0wMXBnOXJ4L3ZXRllrRFFvZmNzU1F4?=
 =?utf-8?B?T0hUOGxiMEVqbUR5UEZUQWwyc3dvcHh6RXAwT2lkL2U0cnY0OE9ZQmgrVUNy?=
 =?utf-8?Q?Su2g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2881aaa-523b-4e7c-c55c-08dbe1e90461
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:31:51.9959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PuOeig5FRlRHuTg6aatp8UEcB1ekjAaWrTpTodsG86RTcUg7tyuB1newp57de39jIbpmTmn3tJazvPAqEJPC+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4082
Subject: RE: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IEZyaWRheSwgTm92ZW1iZXIgMTAsIDIwMjMgMTI6MjMgUE0NCj4gDQo+IA0KPiBPbiAxMS85LzIw
MjMgNjowMiBQTSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOg0KPiA+IE9uIFRodSwgTm92IDA5
LCAyMDIzIGF0IDA2OjAwOjI3UE0gKzA4MDAsIFpodSwgTGluZ3NoYW4gd3JvdGU6DQo+ID4+DQo+
ID4+IE9uIDExLzkvMjAyMyAxOjQ0IEFNLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6DQo+ID4+
PiBPbiBUdWUsIE5vdiAwNywgMjAyMyBhdCAwNTozMTozOFBNICswODAwLCBaaHUsIExpbmdzaGFu
IHdyb3RlOg0KPiA+Pj4+IE9uIDExLzYvMjAyMyA2OjUyIFBNLCBQYXJhdiBQYW5kaXQgd3JvdGU6
DQo+ID4+Pj4+PiBGcm9tOiBaaHUsIExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPg0K
PiA+Pj4+Pj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciA2LCAyMDIzIDI6NTcgUE0NCj4gPj4+Pj4+
DQo+ID4+Pj4+PiBPbiAxMS82LzIwMjMgMTI6MTIgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4g
Pj4+Pj4+Pj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4g
Pj4+Pj4+Pj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciA2LCAyMDIzIDk6MDEgQU0NCj4gPj4+Pj4+
Pj4NCj4gPj4+Pj4+Pj4gT24gMTEvMy8yMDIzIDExOjUwIFBNLCBQYXJhdiBQYW5kaXQgd3JvdGU6
DQo+ID4+Pj4+Pj4+Pj4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmcN
Cj4gPj4+Pj4+Pj4+PiA8dmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtIG9wZW4ub3JnPiBPbiBC
ZWhhbGYgT2YgWmh1LA0KPiA+Pj4+Pj4+Pj4+IExpbmdzaGFuDQo+ID4+Pj4+Pj4+Pj4gU2VudDog
RnJpZGF5LCBOb3ZlbWJlciAzLCAyMDIzIDg6MjcgUE0NCj4gPj4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+
Pj4+IE9uIDExLzMvMjAyMyA3OjM1IFBNLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+Pj4+Pj4+
Pj4+PiBGcm9tOiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+ID4+Pj4+
Pj4+Pj4+PiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDMsIDIwMjMgNDowNSBQTQ0KPiA+Pj4+Pj4+
Pj4+Pj4NCj4gPj4+Pj4+Pj4+Pj4+IFRoaXMgcGF0Y2ggYWRkcyB0d28gbmV3IGxlMTYgZmllbGRz
IHRvIGNvbW1vbiBjb25maWd1cmF0aW9uDQo+ID4+Pj4+Pj4+Pj4+PiBzdHJ1Y3R1cmUgdG8gc3Vw
cG9ydCBWSVJUSU9fRl9RVUVVRV9TVEFURSBpbiBQQ0kgdHJhbnNwb3J0DQo+IGxheWVyLg0KPiA+
Pj4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8
bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4+Pj4+Pj4+Pj4+IC0tLQ0KPiA+Pj4+Pj4+Pj4+
Pj4gICAgICAgIHRyYW5zcG9ydC1wY2kudGV4IHwgMTggKysrKysrKysrKysrKysrKysrDQo+ID4+
Pj4+Pj4+Pj4+PiAgICAgICAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykNCj4gPj4+
Pj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvdHJhbnNwb3J0LXBjaS50ZXgg
Yi90cmFuc3BvcnQtcGNpLnRleCBpbmRleA0KPiA+Pj4+Pj4+Pj4+Pj4gYTVjNjcxOS4uMzE2MTUx
OSAxMDA2NDQNCj4gPj4+Pj4+Pj4+Pj4+IC0tLSBhL3RyYW5zcG9ydC1wY2kudGV4DQo+ID4+Pj4+
Pj4+Pj4+PiArKysgYi90cmFuc3BvcnQtcGNpLnRleA0KPiA+Pj4+Pj4+Pj4+Pj4gQEAgLTMyNSw2
ICszMjUsMTAgQEAgXHN1YnN1YnNlY3Rpb257Q29tbW9uIGNvbmZpZ3VyYXRpb24NCj4gPj4+Pj4+
Pj4gc3RydWN0dXJlDQo+ID4+Pj4+Pj4+Pj4+PiBsYXlvdXR9XGxhYmVse3NlYzpWaXJ0aW8gVHJh
bnNwb3J0DQo+ID4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAvKiBBYm91dCB0aGUgYWRtaW5p
c3RyYXRpb24gdmlydHF1ZXVlLiAqLw0KPiA+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgbGUx
NiBhZG1pbl9xdWV1ZV9pbmRleDsgICAgICAgICAvKiByZWFkLW9ubHkgZm9yIGRyaXZlcg0KPiAq
Lw0KPiA+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgbGUxNiBhZG1pbl9xdWV1ZV9udW07ICAg
ICAgICAgLyogcmVhZC1vbmx5IGZvciBkcml2ZXINCj4gKi8NCj4gPj4+Pj4+Pj4+Pj4+ICsNCj4g
Pj4+Pj4+Pj4+Pj4+ICsJLyogVmlydHF1ZXVlIHN0YXRlICovDQo+ID4+Pj4+Pj4+Pj4+PiArICAg
ICAgICBsZTE2IHF1ZXVlX2F2YWlsX3N0YXRlOyAgICAgICAgIC8qIHJlYWQtd3JpdGUgKi8NCj4g
Pj4+Pj4+Pj4+Pj4+ICsgICAgICAgIGxlMTYgcXVldWVfdXNlZF9zdGF0ZTsgICAgICAgICAgLyog
cmVhZC13cml0ZSAqLw0KPiA+Pj4+Pj4+Pj4+PiBUaGlzIHRpbnkgaW50ZXJmYWNlIGZvciAxMjgg
dmlydGlvIG5ldCBxdWV1ZXMgdGhyb3VnaA0KPiA+Pj4+Pj4+Pj4+PiByZWdpc3RlciByZWFkIHdy
aXRlcywgZG9lcw0KPiA+Pj4+Pj4+Pj4+IG5vdCB3b3JrIGVmZmVjdGl2ZWx5Lg0KPiA+Pj4+Pj4+
Pj4+PiBUaGVyZSBhcmUgaW5mbGlnaHQgb3V0IG9mIG9yZGVyIGRlc2NyaXB0b3JzIGZvciBibG9j
ayBhbHNvLg0KPiA+Pj4+Pj4+Pj4+PiBIZW5jZSB0b3kgcmVnaXN0ZXJzIGxpa2UgdGhpcyBkbyBu
b3Qgd29yay4NCj4gPj4+Pj4+Pj4+PiBEbyB5b3Uga25vdyB0aGVyZSBpcyBhIHF1ZXVlX3NlbGVj
dD8gV2h5IHRoaXMgZG9lcyBub3Qgd29yaz8NCj4gPj4+Pj4+Pj4+PiBEbyB5b3Uga25vdyBob3cg
b3RoZXIgcXVldWUgcmVsYXRlZCBmaWVsZHMgd29yaz8NCj4gPj4+Pj4+Pj4+IDopDQo+ID4+Pj4+
Pj4+PiBZZXMuIElmIHlvdSBub3RpY2UgcXVldWVfcmVzZXQgcmVsYXRlZCBjcml0aWNhbCBzcGVj
IGJ1ZyBmaXgNCj4gPj4+Pj4+Pj4+IHdhcyBkb25lIHdoZW4gaXQNCj4gPj4+Pj4+Pj4gd2FzIGlu
dHJvZHVjZWQgc28gdGhhdCBsaXZlIG1pZ3JhdGlvbiBjYW4gX2FjdHVhbGx5XyB3b3JrLg0KPiA+
Pj4+Pj4+Pj4gV2hlbiBxdWV1ZV9zZWxlY3QgaXMgZG9uZSBmb3IgMTI4IHF1ZXVlcyBzZXJpYWxs
eSwgaXQgdGFrZSBhDQo+ID4+Pj4+Pj4+PiBsb3Qgb2YgdGltZSB0bw0KPiA+Pj4+Pj4+PiByZWFk
IHRob3NlIHNsb3cgcmVnaXN0ZXIgaW50ZXJmYWNlIGZvciB0aGlzICsgaW5mbGlnaHQgZGVzY3Jp
cHRvcnMgKw0KPiBtb3JlLg0KPiA+Pj4+Pj4+PiBpbnRlcmVzdGluZywgdmlydGlvIHdvcmsgaW4g
dGhpcyBwYXR0ZXJuIGZvciBtYW55IHllYXJzLCByaWdodD8NCj4gPj4+Pj4+PiBBbGwgdGhlc2Ug
eWVhcnMgNDAwR2JwcyBhbmQgODAwR2JwcyB2aXJ0aW8gd2FzIG5vdCBwcmVzZW50LA0KPiA+Pj4+
Pj4+IG51bWJlciBvZg0KPiA+Pj4+Pj4gcXVldWVzIHdlcmUgbm90IGluIGh3Lg0KPiA+Pj4+Pj4g
VGhlIHJlZ2lzdGVycyBhcmUgY29udHJvbCBwYXRoIGluIGNvbmZpZyBzcGFjZSwgaG93IDQwMEcg
b3IgODAwRw0KPiBhZmZlY3Q/Pw0KPiA+Pj4+PiBCZWNhdXNlIHRob3NlIGFyZSB0aGUgb25lIGlu
IHByYWN0aWNlIHJlcXVpcmVzIGxhcmdlIG51bWJlciBvZiBWUXMuDQo+ID4+Pj4+DQo+ID4+Pj4+
IFlvdSBhcmUgYXNraW5nIHBlciBWUSByZWdpc3RlciBjb21tYW5kcyB0byBtb2RpZnkgdGhpbmdz
IGR5bmFtaWNhbGx5DQo+IHZpYSB0aGlzIG9uZSB2cSBhdCBhIHRpbWUsIHNlcmlhbGl6aW5nIGFs
bCB0aGUgb3BlcmF0aW9ucy4NCj4gPj4+Pj4gSXQgZG9lcyBub3Qgc2NhbGUgd2VsbCB3aXRoIGhp
Z2ggcSBjb3VudC4NCj4gPj4+PiBUaGlzIGlzIG5vdCBkeW5hbWljYWxseSwgaXQgb25seSBoYXBw
ZW5zIHdoZW4gU1VTUEVORCBhbmQgUkVTVU1FLg0KPiA+Pj4+IFRoaXMgaXMgdGhlIHNhbWUgbWVj
aGFuaXNtIGhvdyB2aXJ0aW8gaW5pdGlhbGl6ZSBhIHZpcnRxdWV1ZSwNCj4gPj4+PiB3b3JraW5n
IGZvciBtYW55IHllYXJzLg0KPiA+Pj4gSSB3aXNoIHdlIGp1c3QgaGFkIGEgdHJhbnNwb3J0IHZx
IGFscmVhZHkuIFRoYXQncyB0aGUgd2F5IHRvIHNvbHZlDQo+ID4+PiB0aGlzIG5vdCBmaWdodGlu
ZyBpbmRpdmlkdWFsIGJpdHMuDQo+ID4+IFllYWgsIEkgYWdyZWUsIHRyYW5zcG9ydCBpcyBhIHF1
ZXVlZCB0YXNrKHNlbnQgb3V0IFY0IG1vbnRocyBhZ28uLi4pLA0KPiA+PiBvbmUgYnkgb25lLi4u
IGhhcmQgYW5kIHRvdWdoIHdvcmsuLi4NCj4gPiBGcmFua2x5IEkgdGhpbmsgdGhhdCBzaG91bGQg
dGFrZSBwcmVjZWRlbmNlLCB0aGVuIFBhcmF2IHdpbGwgbm90IGdldA0KPiA+IGFubm95ZWQgZWFj
aCB0aW1lIGFkZCBhIGNvdXBsZSBvZiByZWdpc3RlcnMuDQo+IEkgYWdyZWUsIHRoaW5ncyBjYW4g
aGFwcGVuIGFuZCB3ZSBhcmUgYWxyZWFkeSBoZXJlLi4NClVuZm9ydHVuYXRlbHkgdHJhbnNwb3J0
IHZxIGlzIG9mIG5vdCBtdWNoIGhlbHAgZm9yIGJlbG93IGZ1bmRhbWVudGFsIHJlYXNvbnMuDQoN
CjEuMSBhcyBpdCBpbnZvbHZlcyBtYW55IFZNRVhJVFMgb2YgYWNjZXNzaW5nIHJ1bnRpbWUgY29u
ZmlnIHNwYWNlZCBvbiBzbG93IHJlZ2lzdGVycy4NCjEuMiBvciBhbHRlcm5hdGl2ZWx5IGh5cGVy
dmlzb3IgZW5kIHVwIHBvbGxpbmcgbWF5IHRob3VzYW5kcyBvZiByZWdpc3RlcnMgd2FzdGluZyBj
cHUgcmVzb3VyY2VzLg0KMi4gSXQgZG9lcyBub3QgaGVscCBvZiBmdXR1cmUgQ0MgdXNlIGNhc2Ug
d2hlcmUgaHlwZXJ2aXNvciBtdXN0IG5vdCBiZSBpbnZvbHZlZCBpbiBkeW5hbWljIGNvbmZpZw0K
My4gQ29tcGxleCBkZXZpY2UgbGlrZSB2bmV0IGhhcyBhbHJlYWR5IHN0b3BwZWQgdXNpbmcgZXZl
cnkgZ3Jvd2luZyBjb25maWcgc3BhY2UgYW5kIHVzaW5nIGN2cSwgbGFyZ2UgcGFydCBvZiB3b3Jr
IGluIDEuMyBoYXMgc2hvd24gdGhhdCBhbHJlYWR5DQo0LiBQRnMgYWxzbyBjYW5ub3QgaW5maW5p
dGVseSBncm93IHJlZ2lzdGVycywgdGhleSBhbHNvIG5lZWQgbGVzcyBvbi1kaWUgcmVnaXN0ZXJz
LiANCg0KQW5kIHdobyBrbm93cyB0aGUgYmFja3dhcmQgY29tcGF0aWJsZSBTSU9WIGRldmljZXMg
bWF5IG9mZmVyIHNhbWUgYmFyIGFzIFZGcy4NCg0KdmlydG8gc3BlYyBoYXMgYWxyZWFkeSBvdXRs
aW5lZCB0aGlzIGVmZmljaWVudCBjb25jZXB0IGluIHRoZSBzcGVjIGFuZCBUQyBtZW1iZXJzIGFy
ZSBhbHJlYWR5IGZvbGxvd2luZyBpdC4NCg0KU0lPViBmb3Igbm9uLWJhY2t3YXJkIGNvbXBhdGli
bGUgbW9kZSwgYW55d2F5LCBuZWVkIG5ldyBpbnRlcmZhY2UgYW5kIHZxIGlzIGluaGVyZW50bHkg
YWxyZWFkeSB0aGVyZSB3aGljaCBmdWxmaWxsaW5nIHRoZSBuZWVkcy4NCg0KPiA+DQo+ID4+Pj4+
PiBTZWUgdGhlIHZpcnRpbyBjb21tb24gY2ZnLCB5b3Ugd2lsbCBmaW5kIHRoZSBtYXggbnVtYmVy
IG9mIHZxcyBpcw0KPiA+Pj4+Pj4gdGhlcmUsIG51bV9xdWV1ZXMuDQo+ID4+Pj4+IDopDQo+ID4+
Pj4+IFN1cmUuIHRob3NlIHZhbHVlcyBhdCBoaWdoIHEgY291bnQgYWZmZWN0cy4NCj4gPj4+PiB0
aGUgZHJpdmVyIG5lZWQgdG8gaW5pdGlhbGl6ZSB0aGVtIGFueXdheS4NCj4gPj4+Pj4+PiBEZXZp
Y2UgZGlkbuKAmXQgc3VwcG9ydCBMTS4NCj4gPj4+Pj4+PiBNYW55IGxpbWl0YXRpb25zIGV4aXN0
ZWQgYWxsIHRoZXNlIHllYXJzIGFuZCBUQyBpcyBpbXByb3ZpbmcgYW5kDQo+ID4+Pj4+Pj4gZXhw
YW5kaW5nDQo+ID4+Pj4+PiB0aGVtLg0KPiA+Pj4+Pj4+IFNvIGFsbCB0aGVzZSB5ZWFycyBkbyBu
b3QgbWF0dGVyLg0KPiA+Pj4+Pj4gTm90IHN1cmUgd2hhdCBhcmUgeW91IHRhbGtpbmcgYWJvdXQs
IGhhdmVuJ3Qgd2UgaW5pdGlhbGl6ZSB0aGUNCj4gPj4+Pj4+IGRldmljZSBhbmQgdnFzIGluIGNv
bmZpZyBzcGFjZSBmb3IgeWVhcnM/Pz8/Pz8gV2hhdCdzIHdyb25nIHdpdGggdGhpcw0KPiBtZWNo
YW5pc20/DQo+ID4+Pj4+PiBBcmUgeW91IHF1ZXN0aW9uaW5nIHZpcml0by1wY2kgZnVuZGFtZW50
YWxzPz8/DQo+ID4+Pj4+IERvbuKAmXQgcG9pbnQgdG8gaW4tZWZmaWNpZW50IHBhc3QgdG8gZXN0
YWJsaXNoIHNpbWlsYXIgaW4tZWZmaWNpZW50IGZ1dHVyZS4NCj4gPj4+PiBpbnRlcmVzdGluZywg
eW91IGtub3cgdGhpcyBpcyBhIG9uZS10aW1lIHRoaW5nLCByaWdodD8NCj4gPj4+PiBhbmQgeW91
IGFyZSBhd2FyZSBvZiB0aGlzIGhhcyBiZWVuIHRoZXJlIGZvciB5ZWFycy4NCj4gPj4+Pj4+Pj4+
PiBMaWtlIGhvdyB0byBzZXQgYSBxdWV1ZSBzaXplIGFuZCBlbmFibGUgaXQ/DQo+ID4+Pj4+Pj4+
PiBUaG9zZSBhcmUgbWVhbnQgdG8gYmUgdXNlZCBiZWZvcmUgRFJJVkVSX09LIHN0YWdlIGFzIHRo
ZXkgYXJlDQo+ID4+Pj4+Pj4+PiBpbml0IHRpbWUNCj4gPj4+Pj4+Pj4gcmVnaXN0ZXJzLg0KPiA+
Pj4+Pj4+Pj4gTm90IHRvIGtlZXAgYWJ1c2luZyB0aGVtLi4NCj4gPj4+Pj4+Pj4gZG9uJ3QgeW91
IG5lZWQgdG8gc2V0IHF1ZXVlX3NpemUgYXQgdGhlIGRlc3RpbmF0aW9uIHNpZGU/DQo+ID4+Pj4+
Pj4gTm8uDQo+ID4+Pj4+Pj4gQnV0IHRoZSBzcmMvZHN0IGRvZXMgbm90IG1hdHRlci4NCj4gPj4+
Pj4+PiBRdWV1ZV9zaXplIHRvIGJlIHNldCBiZWZvcmUgRFJJVkVSX09LIGxpa2UgcmVzdCBvZiB0
aGUNCj4gPj4+Pj4+PiByZWdpc3RlcnMsIGFzIGFsbA0KPiA+Pj4+Pj4gcXVldWVzIG11c3QgYmUg
Y3JlYXRlZCBiZWZvcmUgdGhlIGRyaXZlcl9vayBwaGFzZS4NCj4gPj4+Pj4+PiBRdWV1ZV9yZXNl
dCB3YXMgbGFzdCBtb21lbnQgZXhjZXB0aW9uLg0KPiA+Pj4+Pj4gY3JlYXRlIGEgcXVldWU/IE52
aWRpYSBzcGVjaWZpYz8NCj4gPj4+Pj4+DQo+ID4+Pj4+IEh1aC4gTm8uDQo+ID4+Pj4+IERvIGdp
dCBsb2cgYW5kIHJlYWxpemUgd2hhdCBoYXBwZW5lZCB3aXRoIHF1ZXVlX3Jlc2V0Lg0KPiA+Pj4+
IFlvdSBkaWRuJ3QgYW5zd2VyIHRoZSBxdWVzdGlvbiwgZG9lcyB0aGUgc3BlYyBldmVuIGhhcyBk
ZWZpbmVkDQo+ID4+Pj4gImNyZWF0ZSBhIHZxIj8NCj4gPj4+Pj4+IEZvciBzdGFuZGFyZCB2aXJ0
aW8sIHlvdSBuZWVkIHRvIHJlYWQgdGhlIG51bWJlciBvZiBlbmFibGVkIHZxcw0KPiA+Pj4+Pj4g
YXQgdGhlIHNvdXJjZSBzaWRlLCB0aGVuIGVuYWJsZSB0aGVtIGF0IHRoZSBkc3QsIHNvIHF1ZXVl
X3NpemUgbWF0dGVycywNCj4gbm90IHRvIGNyZWF0ZS4NCj4gPj4+Pj4gQWxsIHRoYXQgaGFwcGVu
cyBpbiB0aGUgcHJlLWNvcHkgcGhhc2UuDQo+ID4+Pj4gWWVzIGFuZCBob3cgeW91ciBhbnN3ZXIg
cmVsYXRlZCB0byB0aGlzIGRpc2N1c3Npb24/DQoNCg==

