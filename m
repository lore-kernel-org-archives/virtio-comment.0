Return-Path: <virtio-comment-return-8284-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7817AC4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 06:28:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E31D968470
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 06:28:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CFA2D986CC4
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 06:28:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C17E6986CC0; Thu,  9 Nov 2023 06:28:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B40BC986CC1
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 06:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=li9mOwzXuxL6VOP1161mF1f1K8wiwYT1tr7dMtNVVKA1QbSqK87q4q8xBmXy50lnZr8K+dc2TuzPSyo7mh9Y7GeKuodZ4gdLDDTo7S1gy4Sek1jgZC508fMhNUFNGVOv4rlALAeHTl52QCGmabwFkNvYc5fOTOz5pgAKZ9hWFSY4CoPfIJ23oVtI9g+i43ECJGqZwmAgdSy5OobM8eWEWA8fIOxRc+dk906xhyzAxtxjXM0zn2CoiMGpB2hGLr93Gn71VV/LjVn+IbLyvzwBusP83J20/HRVjkQEkCwwuFLZ9hrU1uNmpwzNITI9nDr+BUhr7v1UwEYNXwk39q6/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oqyUF0F1b2WjvweNacEzekWM7nVTW4ktDvGotzKnbQ=;
 b=W/tqsho33MmjYfdeOr5MMpe27eLhXFjAIb1R7UPK78Fm0ElDG1L/JgKHjhVpy5l5TOpEj8JFZlXMiY/w123n/chcFb0I9rPvSM+qie0JXEDJz3GguCrw/G4BrXewMQNGFDLEk0efRLvo0hEqlxApoTI6yStCQEs8AId2nYIWF8M44BvRYt+8CZHgb3F9T9XFEY4bRosPyhSjvGXb+0P61DK8v7mR/MFikMHfRJwxQKXYX2Pgfu8DT3PyWyTUQpetV7TxAR5TDaqnoZNg6CiR/UTddyVa8I4YjQ1TUnloOdv9tEXYJosxJUOMrG6aK1PrYX8lDWVVyjIIv8c80V1ivg==
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
Thread-Index:
 AQHaDkFl1Izi1X/8PEWVlDiafyu5VrBocsSwgAA8x4CAAA4dEIAD6TMAgAAKLuCAAFlegIAAFMUAgAF+uwCAAt3j8A==
Date: Thu, 9 Nov 2023 06:28:17 +0000
Message-ID:
 <DM8PR12MB54801250188E085F6D03869EDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-5-lingshan.zhu@intel.com>
 <PH0PR12MB5481085F6E84FD2786FCD60BDCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <705607e3-39c3-47da-a688-80bbee31c48d@intel.com>
 <PH0PR12MB54814F9EEDD69ED434BF7994DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b0506d9f-37de-43c9-b99d-b00bb88c0d36@intel.com>
 <PH0PR12MB548174AF58B6ADDDA215123DDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b8d51cd3-33fe-4167-a87b-ae662609c5d8@intel.com>
 <PH0PR12MB5481BCA941D86E1031D7A5D9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7a0e7cef-434c-4049-b72f-b8188ecedbaf@intel.com>
In-Reply-To: <7a0e7cef-434c-4049-b72f-b8188ecedbaf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|DM6PR12MB4580:EE_
x-ms-office365-filtering-correlation-id: ad206409-9b62-45a5-aa6e-08dbe0ed0f4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ifnxG/Bg3ewM0gSTmCiI5LDJ2UkfdA1rWu5uIYute7W9E4Au2ytmrm92pyTp2XOta/Cllk0JNgn+8II4ZE2ijkur2txEH4h1SSJezmCpMtaxagKDkrIRGMmHgg4LDjEovWA+oOTlZHVrIUrtvyin66USkrwYsE4hJGq/PqG2XIWe9cCTuDNRs8df9kstrjp5CdI1Rfwiu2Lwu/SG82x96+7vAnMBMbS3zWtA336+RpSxE29B4jo/64cIr+E49c9IG51MlGtN6u5Nl4AyzcnGa2RhALi3ZrgtbfK0hL266S1kX1ThbbBT+QWzTRIQVi6e3pCcuN3jyU09v5qUhY290STYNTn80eFbey83TaBUl3oTyN7wJEM8vXhxM2bUhLkc9MudDGHRm3EGjxQ+8B7p5HrfHn2dcobZ+Fcs59ewsYgKChIPLcyi7ImQncUsYHlYo5l9hYTNySX7h/TgoKNSmXlFIMBML+o2jEvRIxODrrpr5XGi88hrMrlz1euIM104MBA3escC2cwui/t2lidBD8r2SqW4gMympUS/Lgr8lpP2HfKnJdcc/o+p05c3/ECCdQVxtjcRytVOKQHh3XTE48ls+giGiXx3bIPhVvleRf47bNK8jHQTS4OZ9WVKP8hH
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(136003)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(55236004)(26005)(53546011)(7696005)(83380400001)(41300700001)(8936002)(8676002)(4326008)(52536014)(5660300002)(2906002)(316002)(9686003)(478600001)(76116006)(66946007)(66476007)(110136005)(66556008)(66446008)(64756008)(86362001)(6506007)(33656002)(38100700002)(122000001)(38070700009)(71200400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VEpneGlQNlR6cjkvNDJXNWJ4Ukh4Z2R0aDIyajROc3l0TWJ2TlNxZTdlbEFT?=
 =?utf-8?B?b2tnYzNFU294S2hZVmFhdktZRXRRZFJjVXEzNThvR1RpR2kvaDZXK0lMdENT?=
 =?utf-8?B?cnJyTnlONFBKN2ZCRmdWSXBzcXJKdFN2Y0tIVEh3U1prRGdER2gzeW0vM1Q4?=
 =?utf-8?B?d2d2KzlCazhvcWV6c2FtOStTWEt6bXBENW1UOHJOcGxTWGJGVkFhNFEvZTRm?=
 =?utf-8?B?WEhnVFk3WjVuOFREbldKZi9SN2g1UHRSaUJyM2lOZ3JuTWdVd3N2TURocHJ6?=
 =?utf-8?B?cnZ3Z0NORmllVEYyekxBZUs4MHpxb0l1RjdxRTMzWGhEeW5XbzY1RG1jeWtr?=
 =?utf-8?B?d20yR1FSaDJCQnFBN3RFeEVmNmxnSktaa1o3b2RBWVN1elpCaEJycHg1R0RS?=
 =?utf-8?B?Njd4OFlBbUszNjhwZnNrUDZxUDNTd3lhdjdmR1orN3ZKUTZ6SHR5bStUUTQr?=
 =?utf-8?B?T005SXloMklNV3JmWGFGYzRyenpMdzIxcWQyNWNOTC8zd3JwOGVIUnEzVWZN?=
 =?utf-8?B?Z0lPMXUyUzEvbWpWaTBxQWtyRkJuYjdlYzdBSm5Uc0RuUWxta3NpbkhHbm5X?=
 =?utf-8?B?TnpmVGxPOFZiemlVQTdmelpCSWp2MkNXZ20wRDJLdElWWFc4dmpHK1VoOW1Z?=
 =?utf-8?B?SjVRa1RSOVg3OHFqdlBYT0VRaVRSTDM4Y3F3YStwaEVRN1dXUUhFWXdnQjZm?=
 =?utf-8?B?akVmaWxwVmdkSjViR242d2d0TThTSFFhYU9qNmlnWUZPOXlLNS82QjFmTjcr?=
 =?utf-8?B?TVV6b3Vqb0I4WTFsREpNR3lDSFdHd1JuZ2pBRGpZWVdLZnN6QTNxN3gySlNK?=
 =?utf-8?B?L0ZHSldGSm4ydHE2ekpWRzlyMFA1MHhWQ3Rrb29sSDJ3T01Uc2ZHUURGTDJL?=
 =?utf-8?B?SjhHT0VKalIrWkNEL0RiRUhhd085M0c2YXdLQU9mRXFvczB0Z2kzQUJXOTFl?=
 =?utf-8?B?cGFTMzVPTTBDLzlzdTYwMkpRSXpOS1k3N21tbUtKeXBWc3l5UDlwMGNlQUFp?=
 =?utf-8?B?em0va1d1cjUrTU9aam92MG5xNUR2QlRnSlkrSlJNbll2QVBRcDU0Vitka1d4?=
 =?utf-8?B?UzBNQTF2VlhDeEFLVjRHRHcrYi9iTkIyeWZHS3c0WWE3elNmbXRHZWhvUG5R?=
 =?utf-8?B?VXNJcU1NRnVNdmpDcXdmQUVuRlRJQVVleXBTeGl2NlY2VUdwUForaU5YNTI0?=
 =?utf-8?B?Z1NNT3Q5MXlFaExIc1R1c2FrK0FzdlVDMzBNVmJJT3RZKzExeGk1RGFZZno4?=
 =?utf-8?B?K0FTby91TVlveWJLUXQ2b3ZFWmsrOVkwaW1tL3RWS21HU1RKMThYTGZQUS9t?=
 =?utf-8?B?eHJtb290bTl1R0NBMHowTUhtdjV0aWhrclNyMHovRjc0czN6TFRwUEJ2eC8x?=
 =?utf-8?B?clpwN0M2aWE1d1gxOVlyaHRheG9DY1MwTHlnTjFSSFRjZHdxK1htSFNnV3dt?=
 =?utf-8?B?OS9oMFhGTm9nR250eVRWaUE5Mmd3dlMrNFlsMUtBbWtaUHZNV3V6dlZrZGxI?=
 =?utf-8?B?dXgvNS9GbVNHQlIxYS94elpoRFgrVU1RUmN5ZW5XdE1vNktYdW1KdHFrclhO?=
 =?utf-8?B?VjNLV2laaGtvSTRST0dRaUlEY0xTY1U2d2JMbUhGYzgxQlBFdDRza0VNQkZ3?=
 =?utf-8?B?MFpaa1dWMzcyL0h3VWhqalVyK3dyeTJEQndmNzlvdGtXbGRxMGhMOU1vcUl5?=
 =?utf-8?B?aVZmd1BSeW5YWlZCWUlMV0ZMb3Z1K1VMOC9KTnUwSGlGNCt5UlhycURvV0J6?=
 =?utf-8?B?Vk9lOXlqNlFvdHZRdlMzdUpuMDRScm0wM1FkOFF3SGJ1eDZyYVVxRjlYMjJX?=
 =?utf-8?B?OG56N1oraTNpQnpBSXVFTzhvaTdNL0lvaFF2WVlReSs1NzBINWVXYW9wbEpw?=
 =?utf-8?B?QVlmUEplTDNaTnowZGxJVVhJcmVjQlkrM1pUd1BXTXVhOEdscXVqUXB5Rmp3?=
 =?utf-8?B?cllTS2o5bU9UaXd3UmNLSDI2QzM4VmVzQUU2TnlUNDcyWlV4bEM0ZEVicWNL?=
 =?utf-8?B?d2FDOGNOS1VxcFB6WHlnSWpHdXdVLytwa2R0R2pHS2lyZTNlY2NtYmhJOC9O?=
 =?utf-8?B?L3loSjcyMEs1TUxjK1ZhWTBpOGt5L2VBb0ZmcmYvQkxFb0dNbldrQUZRYUNH?=
 =?utf-8?Q?THV4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad206409-9b62-45a5-aa6e-08dbe0ed0f4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 06:28:17.1204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uy/bNh2qpse19Pu9csgKCf5RFmGNlbscdP6yh7qJQZ6xrBk3RUa6WwWsqC4rngUm+xDB3Dbh0tlSdi3NnbwdHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4580
Subject: RE: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFR1ZXNkYXksIE5vdmVtYmVyIDcsIDIwMjMgMzowMiBQTQ0KPiANCj4gT24gMTEvNi8yMDIzIDY6
NTIgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGlu
Z3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciA2LCAyMDIz
IDI6NTcgUE0NCj4gPj4NCj4gPj4gT24gMTEvNi8yMDIzIDEyOjEyIFBNLCBQYXJhdiBQYW5kaXQg
d3JvdGU6DQo+ID4+Pj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNv
bT4NCj4gPj4+PiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDYsIDIwMjMgOTowMSBBTQ0KPiA+Pj4+
DQo+ID4+Pj4gT24gMTEvMy8yMDIzIDExOjUwIFBNLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+
Pj4+PiBGcm9tOiB2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy1vcGVuLm9yZw0KPiA+Pj4+Pj4g
PHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLSBvcGVuLm9yZz4gT24gQmVoYWxmIE9mIFpodSwg
TGluZ3NoYW4NCj4gPj4+Pj4+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMywgMjAyMyA4OjI3IFBN
DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gT24gMTEvMy8yMDIzIDc6MzUgUE0sIFBhcmF2IFBhbmRpdCB3
cm90ZToNCj4gPj4+Pj4+Pj4gRnJvbTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwu
Y29tPg0KPiA+Pj4+Pj4+PiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDMsIDIwMjMgNDowNSBQTQ0K
PiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBUaGlzIHBhdGNoIGFkZHMgdHdvIG5ldyBsZTE2IGZpZWxk
cyB0byBjb21tb24gY29uZmlndXJhdGlvbg0KPiA+Pj4+Pj4+PiBzdHJ1Y3R1cmUgdG8gc3VwcG9y
dCBWSVJUSU9fRl9RVUVVRV9TVEFURSBpbiBQQ0kgdHJhbnNwb3J0IGxheWVyLg0KPiA+Pj4+Pj4+
Pg0KPiA+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBp
bnRlbC5jb20+DQo+ID4+Pj4+Pj4+IC0tLQ0KPiA+Pj4+Pj4+PiAgICAgIHRyYW5zcG9ydC1wY2ku
dGV4IHwgMTggKysrKysrKysrKysrKysrKysrDQo+ID4+Pj4+Pj4+ICAgICAgMSBmaWxlIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKykNCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gZGlmZiAtLWdpdCBh
L3RyYW5zcG9ydC1wY2kudGV4IGIvdHJhbnNwb3J0LXBjaS50ZXggaW5kZXgNCj4gPj4+Pj4+Pj4g
YTVjNjcxOS4uMzE2MTUxOSAxMDA2NDQNCj4gPj4+Pj4+Pj4gLS0tIGEvdHJhbnNwb3J0LXBjaS50
ZXgNCj4gPj4+Pj4+Pj4gKysrIGIvdHJhbnNwb3J0LXBjaS50ZXgNCj4gPj4+Pj4+Pj4gQEAgLTMy
NSw2ICszMjUsMTAgQEAgXHN1YnN1YnNlY3Rpb257Q29tbW9uIGNvbmZpZ3VyYXRpb24NCj4gPj4+
PiBzdHJ1Y3R1cmUNCj4gPj4+Pj4+Pj4gbGF5b3V0fVxsYWJlbHtzZWM6VmlydGlvIFRyYW5zcG9y
dA0KPiA+Pj4+Pj4+PiAgICAgICAgICAgICAgLyogQWJvdXQgdGhlIGFkbWluaXN0cmF0aW9uIHZp
cnRxdWV1ZS4gKi8NCj4gPj4+Pj4+Pj4gICAgICAgICAgICAgIGxlMTYgYWRtaW5fcXVldWVfaW5k
ZXg7ICAgICAgICAgLyogcmVhZC1vbmx5IGZvciBkcml2ZXIgKi8NCj4gPj4+Pj4+Pj4gICAgICAg
ICAgICAgIGxlMTYgYWRtaW5fcXVldWVfbnVtOyAgICAgICAgIC8qIHJlYWQtb25seSBmb3IgZHJp
dmVyICovDQo+ID4+Pj4+Pj4+ICsNCj4gPj4+Pj4+Pj4gKwkvKiBWaXJ0cXVldWUgc3RhdGUgKi8N
Cj4gPj4+Pj4+Pj4gKyAgICAgICAgbGUxNiBxdWV1ZV9hdmFpbF9zdGF0ZTsgICAgICAgICAvKiBy
ZWFkLXdyaXRlICovDQo+ID4+Pj4+Pj4+ICsgICAgICAgIGxlMTYgcXVldWVfdXNlZF9zdGF0ZTsg
ICAgICAgICAgLyogcmVhZC13cml0ZSAqLw0KPiA+Pj4+Pj4+IFRoaXMgdGlueSBpbnRlcmZhY2Ug
Zm9yIDEyOCB2aXJ0aW8gbmV0IHF1ZXVlcyB0aHJvdWdoIHJlZ2lzdGVyDQo+ID4+Pj4+Pj4gcmVh
ZCB3cml0ZXMsIGRvZXMNCj4gPj4+Pj4+IG5vdCB3b3JrIGVmZmVjdGl2ZWx5Lg0KPiA+Pj4+Pj4+
IFRoZXJlIGFyZSBpbmZsaWdodCBvdXQgb2Ygb3JkZXIgZGVzY3JpcHRvcnMgZm9yIGJsb2NrIGFs
c28uDQo+ID4+Pj4+Pj4gSGVuY2UgdG95IHJlZ2lzdGVycyBsaWtlIHRoaXMgZG8gbm90IHdvcmsu
DQo+ID4+Pj4+PiBEbyB5b3Uga25vdyB0aGVyZSBpcyBhIHF1ZXVlX3NlbGVjdD8gV2h5IHRoaXMg
ZG9lcyBub3Qgd29yaz8gRG8NCj4gPj4+Pj4+IHlvdSBrbm93IGhvdyBvdGhlciBxdWV1ZSByZWxh
dGVkIGZpZWxkcyB3b3JrPw0KPiA+Pj4+PiA6KQ0KPiA+Pj4+PiBZZXMuIElmIHlvdSBub3RpY2Ug
cXVldWVfcmVzZXQgcmVsYXRlZCBjcml0aWNhbCBzcGVjIGJ1ZyBmaXggd2FzDQo+ID4+Pj4+IGRv
bmUgd2hlbiBpdA0KPiA+Pj4+IHdhcyBpbnRyb2R1Y2VkIHNvIHRoYXQgbGl2ZSBtaWdyYXRpb24g
Y2FuIF9hY3R1YWxseV8gd29yay4NCj4gPj4+Pj4gV2hlbiBxdWV1ZV9zZWxlY3QgaXMgZG9uZSBm
b3IgMTI4IHF1ZXVlcyBzZXJpYWxseSwgaXQgdGFrZSBhIGxvdA0KPiA+Pj4+PiBvZiB0aW1lIHRv
DQo+ID4+Pj4gcmVhZCB0aG9zZSBzbG93IHJlZ2lzdGVyIGludGVyZmFjZSBmb3IgdGhpcyArIGlu
ZmxpZ2h0IGRlc2NyaXB0b3JzICsgbW9yZS4NCj4gPj4+PiBpbnRlcmVzdGluZywgdmlydGlvIHdv
cmsgaW4gdGhpcyBwYXR0ZXJuIGZvciBtYW55IHllYXJzLCByaWdodD8NCj4gPj4+IEFsbCB0aGVz
ZSB5ZWFycyA0MDBHYnBzIGFuZCA4MDBHYnBzIHZpcnRpbyB3YXMgbm90IHByZXNlbnQsIG51bWJl
cg0KPiA+Pj4gb2YNCj4gPj4gcXVldWVzIHdlcmUgbm90IGluIGh3Lg0KPiA+PiBUaGUgcmVnaXN0
ZXJzIGFyZSBjb250cm9sIHBhdGggaW4gY29uZmlnIHNwYWNlLCBob3cgNDAwRyBvciA4MDBHIGFm
ZmVjdD8/DQo+ID4gQmVjYXVzZSB0aG9zZSBhcmUgdGhlIG9uZSBpbiBwcmFjdGljZSByZXF1aXJl
cyBsYXJnZSBudW1iZXIgb2YgVlFzLg0KPiA+DQo+ID4gWW91IGFyZSBhc2tpbmcgcGVyIFZRIHJl
Z2lzdGVyIGNvbW1hbmRzIHRvIG1vZGlmeSB0aGluZ3MgZHluYW1pY2FsbHkgdmlhDQo+IHRoaXMg
b25lIHZxIGF0IGEgdGltZSwgc2VyaWFsaXppbmcgYWxsIHRoZSBvcGVyYXRpb25zLg0KPiA+IEl0
IGRvZXMgbm90IHNjYWxlIHdlbGwgd2l0aCBoaWdoIHEgY291bnQuDQo+IFRoaXMgaXMgbm90IGR5
bmFtaWNhbGx5LCBpdCBvbmx5IGhhcHBlbnMgd2hlbiBTVVNQRU5EIGFuZCBSRVNVTUUuDQo+IFRo
aXMgaXMgdGhlIHNhbWUgbWVjaGFuaXNtIGhvdyB2aXJ0aW8gaW5pdGlhbGl6ZSBhIHZpcnRxdWV1
ZSwgd29ya2luZyBmb3IgbWFueQ0KPiB5ZWFycy4NCk5vLiB3aGVuIHZpcnRpbyBkcml2ZXIgaW5p
dGlhbGl6ZXMgaXQgZm9yIHRoZSBmaXJzdCB0aW1lLCB0aGVyZSBpcyBubyBhY3RpdmUgdHJhZmZp
YyB0aGF0IGdldHMgbG9zdC4NClRoaXMgaXMgYmVjYXVzZSB0aGUgaW50ZXJmYWNlIGlzIG5vdCB5
ZXQgdXAgYW5kIG5vdCBwYXJ0IG9mIHRoZSBuZXR3b3JrIHlldC4NCg0KVGhlIHJlc3VtZSBtdXN0
IGJlIGZhc3QgZW5vdWdoLCBiZWNhdXNlIHRoZSByZW1vdGUgbm9kZSBpcyBzZW5kaW5nIHBhY2tl
dHMuDQpIZW5jZSBpdCBpcyBkaWZmZXJlbnQgZnJvbSBkcml2ZXIgaW5pdCB0aW1lIHF1ZXVlIGVu
YWJsZS4NCg0KPiA+PiBTZWUgdGhlIHZpcnRpbyBjb21tb24gY2ZnLCB5b3Ugd2lsbCBmaW5kIHRo
ZSBtYXggbnVtYmVyIG9mIHZxcyBpcw0KPiA+PiB0aGVyZSwgbnVtX3F1ZXVlcy4NCj4gPiA6KQ0K
PiA+IFN1cmUuIHRob3NlIHZhbHVlcyBhdCBoaWdoIHEgY291bnQgYWZmZWN0cy4NCj4gdGhlIGRy
aXZlciBuZWVkIHRvIGluaXRpYWxpemUgdGhlbSBhbnl3YXkuDQpUaGF0IGlzIGJlZm9yZSB0aGUg
dHJhZmZpYyBzdGFydHMgZnJvbSByZW1vdGUgZW5kLg0KDQo+ID4NCj4gPj4+IERldmljZSBkaWRu
4oCZdCBzdXBwb3J0IExNLg0KPiA+Pj4gTWFueSBsaW1pdGF0aW9ucyBleGlzdGVkIGFsbCB0aGVz
ZSB5ZWFycyBhbmQgVEMgaXMgaW1wcm92aW5nIGFuZA0KPiA+Pj4gZXhwYW5kaW5nDQo+ID4+IHRo
ZW0uDQo+ID4+PiBTbyBhbGwgdGhlc2UgeWVhcnMgZG8gbm90IG1hdHRlci4NCj4gPj4gTm90IHN1
cmUgd2hhdCBhcmUgeW91IHRhbGtpbmcgYWJvdXQsIGhhdmVuJ3Qgd2UgaW5pdGlhbGl6ZSB0aGUg
ZGV2aWNlDQo+ID4+IGFuZCB2cXMgaW4gY29uZmlnIHNwYWNlIGZvciB5ZWFycz8/Pz8/PyBXaGF0
J3Mgd3Jvbmcgd2l0aCB0aGlzIG1lY2hhbmlzbT8NCj4gPj4gQXJlIHlvdSBxdWVzdGlvbmluZyB2
aXJpdG8tcGNpIGZ1bmRhbWVudGFscz8/Pw0KPiA+IERvbuKAmXQgcG9pbnQgdG8gaW4tZWZmaWNp
ZW50IHBhc3QgdG8gZXN0YWJsaXNoIHNpbWlsYXIgaW4tZWZmaWNpZW50IGZ1dHVyZS4NCj4gaW50
ZXJlc3RpbmcsIHlvdSBrbm93IHRoaXMgaXMgYSBvbmUtdGltZSB0aGluZywgcmlnaHQ/DQo+IGFu
ZCB5b3UgYXJlIGF3YXJlIG9mIHRoaXMgaGFzIGJlZW4gdGhlcmUgZm9yIHllYXJzLg0KPiA+DQo+
ID4+Pj4+PiBMaWtlIGhvdyB0byBzZXQgYSBxdWV1ZSBzaXplIGFuZCBlbmFibGUgaXQ/DQo+ID4+
Pj4+IFRob3NlIGFyZSBtZWFudCB0byBiZSB1c2VkIGJlZm9yZSBEUklWRVJfT0sgc3RhZ2UgYXMg
dGhleSBhcmUgaW5pdA0KPiA+Pj4+PiB0aW1lDQo+ID4+Pj4gcmVnaXN0ZXJzLg0KPiA+Pj4+PiBO
b3QgdG8ga2VlcCBhYnVzaW5nIHRoZW0uLg0KPiA+Pj4+IGRvbid0IHlvdSBuZWVkIHRvIHNldCBx
dWV1ZV9zaXplIGF0IHRoZSBkZXN0aW5hdGlvbiBzaWRlPw0KPiA+Pj4gTm8uDQo+ID4+PiBCdXQg
dGhlIHNyYy9kc3QgZG9lcyBub3QgbWF0dGVyLg0KPiA+Pj4gUXVldWVfc2l6ZSB0byBiZSBzZXQg
YmVmb3JlIERSSVZFUl9PSyBsaWtlIHJlc3Qgb2YgdGhlIHJlZ2lzdGVycywgYXMNCj4gPj4+IGFs
bA0KPiA+PiBxdWV1ZXMgbXVzdCBiZSBjcmVhdGVkIGJlZm9yZSB0aGUgZHJpdmVyX29rIHBoYXNl
Lg0KPiA+Pj4gUXVldWVfcmVzZXQgd2FzIGxhc3QgbW9tZW50IGV4Y2VwdGlvbi4NCj4gPj4gY3Jl
YXRlIGEgcXVldWU/IE52aWRpYSBzcGVjaWZpYz8NCj4gPj4NCj4gPiBIdWguIE5vLg0KPiA+IERv
IGdpdCBsb2cgYW5kIHJlYWxpemUgd2hhdCBoYXBwZW5lZCB3aXRoIHF1ZXVlX3Jlc2V0Lg0KPiBZ
b3UgZGlkbid0IGFuc3dlciB0aGUgcXVlc3Rpb24sIGRvZXMgdGhlIHNwZWMgZXZlbiBoYXMgZGVm
aW5lZCAiY3JlYXRlIGEgdnEiPw0KDQpFbmFibGVkL2NyZWF0ZWQgPSB0b21hdG8vdG9tYXRvIHdo
ZW4gZGlzY3Vzc2luZyB0aGUgc3BlYyBpbiBub24tbm9ybWF0aXZlIGVtYWlsIGNvbnZlcnNhdGlv
bi4NCkl0J3MgaXJyZWxldmFudC4NCg0KQWxsIEkgYW0gc2F5aW5nIGlzLCB3aGVuIHdlIGtub3cg
dGhlIGxpbWl0YXRpb25zIG9mIHRoZSB0cmFuc3BvcnQgYW5kIHdoZW4gaW5kdXN0cnkgaXMgZm9y
d2FyZGluZyB0byBub3QgaW50cm9kdWNlZCBtb3JlIGFuZCBtb3JlIG9uLWRpZSByZWdpc3RlciBm
b3Igb25jZSBpbiBsaWZldGltZSB3b3JrIG9mIGRldmljZSBtaWdyYXRpb24sDQp3ZSBqdXN0IHVz
ZSB0aGUgb3B0aW1hbCBjb21tYW5kIGFuZCBxdWV1ZSBpbnRlcmZhY2UgdGhhdCBpcyBuYXRpdmUg
dG8gdmlydGlvLg0KDQo=

