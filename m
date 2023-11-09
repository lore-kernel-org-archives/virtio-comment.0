Return-Path: <virtio-comment-return-8299-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEEBC4167B
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 10:25:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 659656E6D2
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 10:25:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 49EBD986CD1
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 10:25:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 304BC986CCD; Thu,  9 Nov 2023 10:25:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 20236986CCE
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 10:25:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7m65AJw3i68uP9WkbPl/2tg4egraFx/QiXvc9JStCsU3OoVDT73NcWvSOpRpe/7PtvoAwkK2nGyRvM/BtPfMfWHEe3st+pxIO5wRIh710DY/T8TICoPW8GNGl6jcS/Gs/kbrDIgujGYdSjl45+P8hP5k2LfHVnvC3kc8aFU9hHLxspRtFgeJD0IsC3ouvFzSIysYo1vD8KcPjxrCmaO4N69BwdsxyRtNU/q6sBjcE+/hpUQG/T1V6tw5ydH7Kj9NaIXsrnhlbrXnWtVuk2fwXgnn+9VRVRK5iAFxDSdfDjBmtdKhiyV5FS9PT8YP+DCIuFPaSJkEVjpbee7iD+hJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+utKrDiky+Y8fZVjIruiR1CUzqqgyQRggfLnaFMdAs=;
 b=XbLav32AQ7faOIrcnjAtSby5VlUnlvGEt/bLcYawTN6V73PnA9cIoUVanA4eGDYw9BywOC2xzwRe9RQ2REIF59DaKaLBvZBahII70Begz+gnP0MMIZB6xhysPwDCXWIBq/2i2feACLKjvy/ksaqJdsCeE0gfkmQdKIG6E3tVw4ZWdfANZVatLVGotPQjcVImfS5BPXCVpsUu1lrfGQxJ8oQl6gF/oD209HvvOMM1GksZYBtcRtlJDlG9TWhZxWEZSpc7D64SDVvuPQ5cLGDxLzH+lFxEHtKjzDhvS8sc5TEUD4G00HeQuiXopLIEWB9H5CA70b+VumZ8MzPqV2j0qg==
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
 AQHaDkFl1Izi1X/8PEWVlDiafyu5VrBocsSwgAA8x4CAAA4dEIAD6TMAgAAKLuCAAFlegIAAFMUAgAF+uwCAAt3j8IAAUVeAgAACYaA=
Date: Thu, 9 Nov 2023 10:25:40 +0000
Message-ID:
 <PH0PR12MB54815431B823C54E3231EC5EDCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
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
 <DM8PR12MB54801250188E085F6D03869EDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <5bdc33bb-4ad5-4274-9764-69e1887b0d17@intel.com>
In-Reply-To: <5bdc33bb-4ad5-4274-9764-69e1887b0d17@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB8557:EE_
x-ms-office365-filtering-correlation-id: eb59f365-97e9-406f-2fd2-08dbe10e38e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oWbkcriyU/o8N3H/ubQNj3SZ26YRT4eqiVn/nPwxhwZeqwh6SH8l5rJkxiUSsd4/LmjJZhgfOybbSM8LGdRZpNcjEOYhYFiDrAJFyY8XjANPI5KwqW+sjEd3ZgDCNTCz9rt3FTt38thWpDeLH51x6bcT3QdhU29yqo+hryRxCZKr4fXrwDdP0MDajhyLo3zQMPtI5+MTJW52OHoBncKB/sa87CB+xbQ9W5grAREDNvl/cydRnaP+yarmpF0VrSuK9brHnDS2XV1QzkuX0FXOaGQcYWIFwecygl8r+cBTQLMYyqt1aKQRd0wktB1kiiJi7fKhyRen14cKWY3QtH7zxVvf+If51e+JDqkSAxRpFvXAH3nifBmLVNHD48vxU9dxmA4xTfBJoU2wES5AifQBGpnU6KQNKHKjGBPi4vZv8v/ms2vED9giV/p7tZ3D6x6qElRkKnSM5yw2z30B5M8DjEwhMORoni49b/8Wy4p7nSrKS6Qr5OpMiyhYvtCKlh1vkta1yV4FO3mHGSaMi6Qg2jwmc2rqZHOB2QTllYV6Id8C4I7FJREEX7ogHpqFTtiTdY68TvTiOtKacTEkHyJX2/NxQq2A3QlL62U1hLbJly9TSMh1Nj5Lsh29Rkd8OEZpAQ3VqCCGSEjHpoYCnsne0m6l4OM0uxTKIVNYYdb8S9k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(396003)(39860400002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(83380400001)(53546011)(66946007)(76116006)(9686003)(110136005)(478600001)(55016003)(6506007)(71200400001)(52536014)(966005)(8936002)(4326008)(8676002)(316002)(66446008)(66556008)(64756008)(66476007)(7696005)(41300700001)(38100700002)(5660300002)(122000001)(86362001)(2906002)(33656002)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGQ2SERuTGU1TTk0bVlrYlJVSkwyOHkzd05CYW03alhlM25QZU5sRXA4ZW5x?=
 =?utf-8?B?SFFOV2Vzd0NYR1VDVll3dWQwcitNNGgwbnY3NHZxaXNSZ1FQM1RiTEgxcytJ?=
 =?utf-8?B?eXcxOG1zUHZqbUpzU1oxT1NGZFc5cG1KOENyMGFFa3J1QjZzNU9DNmJBeTM4?=
 =?utf-8?B?ZWk3K2UyQnQ3SmhsWlBZRExXeTYxOEpNa29JUEZjRUJnU0ZZSXBxVXRRYmVO?=
 =?utf-8?B?bVl6RFNaNVcyMGNJMFlzTUhzbWZ3Qzk4d0hRTHJXb1lGbUd2anV1VGRQOWVi?=
 =?utf-8?B?c0o4NUlWOUV3RUJEMHFKZExHMVp0TkFtRW5iNThaNjRxY1FUcVpvNXB4eThw?=
 =?utf-8?B?STJOS2lYUVlOYjNpK0ZPN2RhMkliVlJncC9Pc1h5N3BMc1VKN1ZvcUJDSlMv?=
 =?utf-8?B?engrZ0liUGNTYSs1SFhoZjd0M3BVa24zNS9aamwxeitPN1UzV1FXMFQzSmtL?=
 =?utf-8?B?dGlybWJrSjRUeDhmRVpTbWo4RFJnTk9OS1BNUSthUWlPbGh3N0NEN25XNmFw?=
 =?utf-8?B?MjBPeXVrd0YzbW5JQjNaZ05INTJKWjVGNXMydHc2eEpLcStweHF0dkRWd3pr?=
 =?utf-8?B?V1VkNXpFMnVXSzMxS1QxanZ2OEViSWdxYUFCL1g0QjVhTjR3ZUV3dVF1eFVa?=
 =?utf-8?B?RU5CelU3Mm9tWDhRV3cyQkU5ZHZkL0hoSTFkMzNvMStldWNJbUw5ZXNjRDI3?=
 =?utf-8?B?c25ydXcwbFJJbjVsd3FyTEtPT1V0a0ZvbEwvaVpxUzVoNlFsYVVRMm1oWm50?=
 =?utf-8?B?MjJJQk1QTzY2Z05rbmZUMjhpU3R3NmJQT0t2cWxERGVvdTVBTkJsRVZXUEx3?=
 =?utf-8?B?WG42bC9aRlZRRFRNRjE4THhyRFMvSkMrYlRHSTBvcXRtUVNxTE0yTDFDSVF2?=
 =?utf-8?B?Tm5YaFlJdlpHeTY5UHdhZzN4SnhwMHNxSG5pZ203K2VyU21sT3BqbjRKTkwv?=
 =?utf-8?B?WWxjVGg3d0F2cG9uLzlBd0hoZ3NWRDE2NXVxVlBkdFB2dWorTUZkK0trNmFJ?=
 =?utf-8?B?WnBsMGorKzdMc09Pdmt0WlN0V3Q5SFQ0YkJwK3RWN1k5emoyMytZL2Mwelkv?=
 =?utf-8?B?elBodUhIMU5VVmFXQjBFRHhWaTNhZXlzNGYxd0RpS05CN1VYYjMrZDhsa0pn?=
 =?utf-8?B?MDc2bkhQdWg0UjRZUWd3UmRobnF2Ym1VKzdnVWhlZ1E1TzNoQkg5eUllb0ph?=
 =?utf-8?B?ekl0VkxZWWNFc1RJRVo1TWZVUHZid2VuRy8xVDFNVGRML3dkSUdMcytVM0tx?=
 =?utf-8?B?Y2pWVFRrRG81MXdHbDIvL2pyZGtWOTk0ZWRabldBMXhZVlh5SGpDaGRDNkpG?=
 =?utf-8?B?MUxNWm40amNBOStKOUQwcnRtSVJ1Q214QVZSQ1RtUk1wd1VxWlp4VnFWUTZV?=
 =?utf-8?B?UlVaNHRwS0xyLzdNT2hhM0lPR1BFV3lQZGp6dzZUVklDNlorMm9sTU1DRmhv?=
 =?utf-8?B?bkRyemxWcXluanVtR2VjM0FKT2FCQXBtejV5TmRZdWFPQ1I2OTB0ZTBqMEVD?=
 =?utf-8?B?OVY0VWlobjBHdnI0V3RjTVdHY0lGSzI5NW1DNXJaTjl5ZDZyTitFU1M4bmFr?=
 =?utf-8?B?dWJjVEpvRUFVNEowZ1ltMUxTbXNDNlVjbmdFcHF6TlpIUFZta3hMOGtiWC9W?=
 =?utf-8?B?QitaU0hPVVVCTnNvRm45U3FRaldRS0d4cUliL2o5d2ZJa0NTT3BMb1RpbEg2?=
 =?utf-8?B?bjhYbVJsNFNNVCtQY1U4azA3dDF2RUJjSktvTlpSOER6N3JmSlRVK09JY09k?=
 =?utf-8?B?YUdyRitpcG9YOGVmT2xjVFQ3MUFXVHN3ZmlMV2NRSWNrREthN0xQeHZhV3hr?=
 =?utf-8?B?eDZGYzh1N0xsamM3NlVJcDJQMEozZU5QQThjUnB0WUo0WEtzMFJUZ3pYTE9o?=
 =?utf-8?B?OVVDTk5temVmdG03WWtrQitGbmtQL2lqbGlOME1DcnBlRW9uS1pkTll2WVg2?=
 =?utf-8?B?aWVGZC9Qbmh4MVZGbHFMRllFbmtBNUlhT1BYTzgySXJnNElsWHFJUzZ0NmZw?=
 =?utf-8?B?dUJYMzVHdnhFeE8ySHVraWZCTk5lOXVTSmlFUElzQ3diR2ZlVmlEWGNSeGlq?=
 =?utf-8?B?YnRQZVBieDJhRUYxK1pyUWJCRTdzWEphNVB6UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb59f365-97e9-406f-2fd2-08dbe10e38e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 10:25:40.2988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U5vF3gnCDqWTSPY8YuIzuW3Irujklb1RRHa/twHY/mJ2HT9TjM5W5mzafrK7wVER4CIhBWJ+pnWhV+PfsjlBsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8557
Subject: RE: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

PiBGcm9tOiBaaHUsIExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPg0KPiBTZW50OiBU
aHVyc2RheSwgTm92ZW1iZXIgOSwgMjAyMyAzOjM5IFBNDQo+IA0KPiANCj4gT24gMTEvOS8yMDIz
IDI6MjggUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8
bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgNywg
MjAyMyAzOjAyIFBNDQo+ID4+DQo+ID4+IE9uIDExLzYvMjAyMyA2OjUyIFBNLCBQYXJhdiBQYW5k
aXQgd3JvdGU6DQo+ID4+Pj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVs
LmNvbT4NCj4gPj4+PiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDYsIDIwMjMgMjo1NyBQTQ0KPiA+
Pj4+DQo+ID4+Pj4gT24gMTEvNi8yMDIzIDEyOjEyIFBNLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+
ID4+Pj4+PiBGcm9tOiBaaHUsIExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPg0KPiA+
Pj4+Pj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciA2LCAyMDIzIDk6MDEgQU0NCj4gPj4+Pj4+DQo+
ID4+Pj4+PiBPbiAxMS8zLzIwMjMgMTE6NTAgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+
Pj4+Pj4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmcNCj4gPj4+Pj4+
Pj4gPHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLSBvcGVuLm9yZz4gT24gQmVoYWxmIE9mIFpo
dSwNCj4gPj4+Pj4+Pj4gTGluZ3NoYW4NCj4gPj4+Pj4+Pj4gU2VudDogRnJpZGF5LCBOb3ZlbWJl
ciAzLCAyMDIzIDg6MjcgUE0NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gT24gMTEvMy8yMDIzIDc6
MzUgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+Pj4+Pj4+PiBGcm9tOiBaaHUgTGluZ3No
YW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+ID4+Pj4+Pj4+Pj4gU2VudDogRnJpZGF5LCBO
b3ZlbWJlciAzLCAyMDIzIDQ6MDUgUE0NCj4gPj4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4+IFRoaXMg
cGF0Y2ggYWRkcyB0d28gbmV3IGxlMTYgZmllbGRzIHRvIGNvbW1vbiBjb25maWd1cmF0aW9uDQo+
ID4+Pj4+Pj4+Pj4gc3RydWN0dXJlIHRvIHN1cHBvcnQgVklSVElPX0ZfUVVFVUVfU1RBVEUgaW4g
UENJIHRyYW5zcG9ydCBsYXllci4NCj4gPj4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4+Pj4+Pj4+
PiAtLS0NCj4gPj4+Pj4+Pj4+PiAgICAgICB0cmFuc3BvcnQtcGNpLnRleCB8IDE4ICsrKysrKysr
KysrKysrKysrKw0KPiA+Pj4+Pj4+Pj4+ICAgICAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspDQo+ID4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvdHJhbnNwb3J0
LXBjaS50ZXggYi90cmFuc3BvcnQtcGNpLnRleCBpbmRleA0KPiA+Pj4+Pj4+Pj4+IGE1YzY3MTku
LjMxNjE1MTkgMTAwNjQ0DQo+ID4+Pj4+Pj4+Pj4gLS0tIGEvdHJhbnNwb3J0LXBjaS50ZXgNCj4g
Pj4+Pj4+Pj4+PiArKysgYi90cmFuc3BvcnQtcGNpLnRleA0KPiA+Pj4+Pj4+Pj4+IEBAIC0zMjUs
NiArMzI1LDEwIEBAIFxzdWJzdWJzZWN0aW9ue0NvbW1vbiBjb25maWd1cmF0aW9uDQo+ID4+Pj4+
PiBzdHJ1Y3R1cmUNCj4gPj4+Pj4+Pj4+PiBsYXlvdXR9XGxhYmVse3NlYzpWaXJ0aW8gVHJhbnNw
b3J0DQo+ID4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAvKiBBYm91dCB0aGUgYWRtaW5pc3RyYXRp
b24gdmlydHF1ZXVlLiAqLw0KPiA+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgbGUxNiBhZG1pbl9x
dWV1ZV9pbmRleDsgICAgICAgICAvKiByZWFkLW9ubHkgZm9yIGRyaXZlciAqLw0KPiA+Pj4+Pj4+
Pj4+ICAgICAgICAgICAgICAgbGUxNiBhZG1pbl9xdWV1ZV9udW07ICAgICAgICAgLyogcmVhZC1v
bmx5IGZvciBkcml2ZXIgKi8NCj4gPj4+Pj4+Pj4+PiArDQo+ID4+Pj4+Pj4+Pj4gKwkvKiBWaXJ0
cXVldWUgc3RhdGUgKi8NCj4gPj4+Pj4+Pj4+PiArICAgICAgICBsZTE2IHF1ZXVlX2F2YWlsX3N0
YXRlOyAgICAgICAgIC8qIHJlYWQtd3JpdGUgKi8NCj4gPj4+Pj4+Pj4+PiArICAgICAgICBsZTE2
IHF1ZXVlX3VzZWRfc3RhdGU7ICAgICAgICAgIC8qIHJlYWQtd3JpdGUgKi8NCj4gPj4+Pj4+Pj4+
IFRoaXMgdGlueSBpbnRlcmZhY2UgZm9yIDEyOCB2aXJ0aW8gbmV0IHF1ZXVlcyB0aHJvdWdoIHJl
Z2lzdGVyDQo+ID4+Pj4+Pj4+PiByZWFkIHdyaXRlcywgZG9lcw0KPiA+Pj4+Pj4+PiBub3Qgd29y
ayBlZmZlY3RpdmVseS4NCj4gPj4+Pj4+Pj4+IFRoZXJlIGFyZSBpbmZsaWdodCBvdXQgb2Ygb3Jk
ZXIgZGVzY3JpcHRvcnMgZm9yIGJsb2NrIGFsc28uDQo+ID4+Pj4+Pj4+PiBIZW5jZSB0b3kgcmVn
aXN0ZXJzIGxpa2UgdGhpcyBkbyBub3Qgd29yay4NCj4gPj4+Pj4+Pj4gRG8geW91IGtub3cgdGhl
cmUgaXMgYSBxdWV1ZV9zZWxlY3Q/IFdoeSB0aGlzIGRvZXMgbm90IHdvcms/IERvDQo+ID4+Pj4+
Pj4+IHlvdSBrbm93IGhvdyBvdGhlciBxdWV1ZSByZWxhdGVkIGZpZWxkcyB3b3JrPw0KPiA+Pj4+
Pj4+IDopDQo+ID4+Pj4+Pj4gWWVzLiBJZiB5b3Ugbm90aWNlIHF1ZXVlX3Jlc2V0IHJlbGF0ZWQg
Y3JpdGljYWwgc3BlYyBidWcgZml4IHdhcw0KPiA+Pj4+Pj4+IGRvbmUgd2hlbiBpdA0KPiA+Pj4+
Pj4gd2FzIGludHJvZHVjZWQgc28gdGhhdCBsaXZlIG1pZ3JhdGlvbiBjYW4gX2FjdHVhbGx5XyB3
b3JrLg0KPiA+Pj4+Pj4+IFdoZW4gcXVldWVfc2VsZWN0IGlzIGRvbmUgZm9yIDEyOCBxdWV1ZXMg
c2VyaWFsbHksIGl0IHRha2UgYSBsb3QNCj4gPj4+Pj4+PiBvZiB0aW1lIHRvDQo+ID4+Pj4+PiBy
ZWFkIHRob3NlIHNsb3cgcmVnaXN0ZXIgaW50ZXJmYWNlIGZvciB0aGlzICsgaW5mbGlnaHQgZGVz
Y3JpcHRvcnMgKyBtb3JlLg0KPiA+Pj4+Pj4gaW50ZXJlc3RpbmcsIHZpcnRpbyB3b3JrIGluIHRo
aXMgcGF0dGVybiBmb3IgbWFueSB5ZWFycywgcmlnaHQ/DQo+ID4+Pj4+IEFsbCB0aGVzZSB5ZWFy
cyA0MDBHYnBzIGFuZCA4MDBHYnBzIHZpcnRpbyB3YXMgbm90IHByZXNlbnQsIG51bWJlcg0KPiA+
Pj4+PiBvZg0KPiA+Pj4+IHF1ZXVlcyB3ZXJlIG5vdCBpbiBody4NCj4gPj4+PiBUaGUgcmVnaXN0
ZXJzIGFyZSBjb250cm9sIHBhdGggaW4gY29uZmlnIHNwYWNlLCBob3cgNDAwRyBvciA4MDBHIGFm
ZmVjdD8/DQo+ID4+PiBCZWNhdXNlIHRob3NlIGFyZSB0aGUgb25lIGluIHByYWN0aWNlIHJlcXVp
cmVzIGxhcmdlIG51bWJlciBvZiBWUXMuDQo+ID4+Pg0KPiA+Pj4gWW91IGFyZSBhc2tpbmcgcGVy
IFZRIHJlZ2lzdGVyIGNvbW1hbmRzIHRvIG1vZGlmeSB0aGluZ3MgZHluYW1pY2FsbHkNCj4gPj4+
IHZpYQ0KPiA+PiB0aGlzIG9uZSB2cSBhdCBhIHRpbWUsIHNlcmlhbGl6aW5nIGFsbCB0aGUgb3Bl
cmF0aW9ucy4NCj4gPj4+IEl0IGRvZXMgbm90IHNjYWxlIHdlbGwgd2l0aCBoaWdoIHEgY291bnQu
DQo+ID4+IFRoaXMgaXMgbm90IGR5bmFtaWNhbGx5LCBpdCBvbmx5IGhhcHBlbnMgd2hlbiBTVVNQ
RU5EIGFuZCBSRVNVTUUuDQo+ID4+IFRoaXMgaXMgdGhlIHNhbWUgbWVjaGFuaXNtIGhvdyB2aXJ0
aW8gaW5pdGlhbGl6ZSBhIHZpcnRxdWV1ZSwgd29ya2luZw0KPiA+PiBmb3IgbWFueSB5ZWFycy4N
Cj4gPiBOby4gd2hlbiB2aXJ0aW8gZHJpdmVyIGluaXRpYWxpemVzIGl0IGZvciB0aGUgZmlyc3Qg
dGltZSwgdGhlcmUgaXMgbm8gYWN0aXZlIHRyYWZmaWMNCj4gdGhhdCBnZXRzIGxvc3QuDQo+ID4g
VGhpcyBpcyBiZWNhdXNlIHRoZSBpbnRlcmZhY2UgaXMgbm90IHlldCB1cCBhbmQgbm90IHBhcnQg
b2YgdGhlIG5ldHdvcmsgeWV0Lg0KPiA+DQo+ID4gVGhlIHJlc3VtZSBtdXN0IGJlIGZhc3QgZW5v
dWdoLCBiZWNhdXNlIHRoZSByZW1vdGUgbm9kZSBpcyBzZW5kaW5nDQo+IHBhY2tldHMuDQo+ID4g
SGVuY2UgaXQgaXMgZGlmZmVyZW50IGZyb20gZHJpdmVyIGluaXQgdGltZSBxdWV1ZSBlbmFibGUu
DQo+IEkgYW0gbm90IHN1cmUgYW55IHBhY2tldHMgYXJyaXZlIGJlZm9yZSBhIGxpbmsgYW5ub3Vu
Y2UgYXQgdGhlIGRlc3RpbmF0aW9uIHNpZGUuDQpJIHRoaW5rIGl0IGNhbi4NCkJlY2F1c2UgdGhl
cmUgaXMgbm8gbm90aWZpY2F0aW9uIG9mIG1lbWJlciBkZXZpY2UgbGluayBkb3duIGludGltYXRp
b24gdG8gcmVtb3RlIHNpZGUuDQpUaGUgTDQgYW5kIEw1IHByb3RvY29scyBoYXZlIG5vIGtub3ds
ZWRnZSB0aGF0IG5vZGUgd2hpY2ggdGhleSBhcmUgaW50ZXJhY3RpbmcgaXMgYmVoaW5kIHNvbWUg
bGF5ZXJzIG9mIHN3aXRjaGVzLg0KDQpTbyBrZWVwaW5nIHRoaXMgdGltZSBsb3cgaXMgZGVzaXJl
ZC4NCg0KPiA+DQo+ID4+Pj4gU2VlIHRoZSB2aXJ0aW8gY29tbW9uIGNmZywgeW91IHdpbGwgZmlu
ZCB0aGUgbWF4IG51bWJlciBvZiB2cXMgaXMNCj4gPj4+PiB0aGVyZSwgbnVtX3F1ZXVlcy4NCj4g
Pj4+IDopDQo+ID4+PiBTdXJlLiB0aG9zZSB2YWx1ZXMgYXQgaGlnaCBxIGNvdW50IGFmZmVjdHMu
DQo+ID4+IHRoZSBkcml2ZXIgbmVlZCB0byBpbml0aWFsaXplIHRoZW0gYW55d2F5Lg0KPiA+IFRo
YXQgaXMgYmVmb3JlIHRoZSB0cmFmZmljIHN0YXJ0cyBmcm9tIHJlbW90ZSBlbmQuDQo+IHNlZSBh
Ym92ZSwgdGhhdCBuZWVkcyBhIGxpbmsgYW5ub3VuY2UgYW5kIHRoaXMgaXMgYWZ0ZXIgcmUtaW5p
dGlhbGl6YXRpb24NCj4gPg0KPiA+Pj4+PiBEZXZpY2UgZGlkbuKAmXQgc3VwcG9ydCBMTS4NCj4g
Pj4+Pj4gTWFueSBsaW1pdGF0aW9ucyBleGlzdGVkIGFsbCB0aGVzZSB5ZWFycyBhbmQgVEMgaXMg
aW1wcm92aW5nIGFuZA0KPiA+Pj4+PiBleHBhbmRpbmcNCj4gPj4+PiB0aGVtLg0KPiA+Pj4+PiBT
byBhbGwgdGhlc2UgeWVhcnMgZG8gbm90IG1hdHRlci4NCj4gPj4+PiBOb3Qgc3VyZSB3aGF0IGFy
ZSB5b3UgdGFsa2luZyBhYm91dCwgaGF2ZW4ndCB3ZSBpbml0aWFsaXplIHRoZQ0KPiA+Pj4+IGRl
dmljZSBhbmQgdnFzIGluIGNvbmZpZyBzcGFjZSBmb3IgeWVhcnM/Pz8/Pz8gV2hhdCdzIHdyb25n
IHdpdGggdGhpcw0KPiBtZWNoYW5pc20/DQo+ID4+Pj4gQXJlIHlvdSBxdWVzdGlvbmluZyB2aXJp
dG8tcGNpIGZ1bmRhbWVudGFscz8/Pw0KPiA+Pj4gRG9u4oCZdCBwb2ludCB0byBpbi1lZmZpY2ll
bnQgcGFzdCB0byBlc3RhYmxpc2ggc2ltaWxhciBpbi1lZmZpY2llbnQgZnV0dXJlLg0KPiA+PiBp
bnRlcmVzdGluZywgeW91IGtub3cgdGhpcyBpcyBhIG9uZS10aW1lIHRoaW5nLCByaWdodD8NCj4g
Pj4gYW5kIHlvdSBhcmUgYXdhcmUgb2YgdGhpcyBoYXMgYmVlbiB0aGVyZSBmb3IgeWVhcnMuDQo+
ID4+Pj4+Pj4+IExpa2UgaG93IHRvIHNldCBhIHF1ZXVlIHNpemUgYW5kIGVuYWJsZSBpdD8NCj4g
Pj4+Pj4+PiBUaG9zZSBhcmUgbWVhbnQgdG8gYmUgdXNlZCBiZWZvcmUgRFJJVkVSX09LIHN0YWdl
IGFzIHRoZXkgYXJlDQo+ID4+Pj4+Pj4gaW5pdCB0aW1lDQo+ID4+Pj4+PiByZWdpc3RlcnMuDQo+
ID4+Pj4+Pj4gTm90IHRvIGtlZXAgYWJ1c2luZyB0aGVtLi4NCj4gPj4+Pj4+IGRvbid0IHlvdSBu
ZWVkIHRvIHNldCBxdWV1ZV9zaXplIGF0IHRoZSBkZXN0aW5hdGlvbiBzaWRlPw0KPiA+Pj4+PiBO
by4NCj4gPj4+Pj4gQnV0IHRoZSBzcmMvZHN0IGRvZXMgbm90IG1hdHRlci4NCj4gPj4+Pj4gUXVl
dWVfc2l6ZSB0byBiZSBzZXQgYmVmb3JlIERSSVZFUl9PSyBsaWtlIHJlc3Qgb2YgdGhlIHJlZ2lz
dGVycywNCj4gPj4+Pj4gYXMgYWxsDQo+ID4+Pj4gcXVldWVzIG11c3QgYmUgY3JlYXRlZCBiZWZv
cmUgdGhlIGRyaXZlcl9vayBwaGFzZS4NCj4gPj4+Pj4gUXVldWVfcmVzZXQgd2FzIGxhc3QgbW9t
ZW50IGV4Y2VwdGlvbi4NCj4gPj4+PiBjcmVhdGUgYSBxdWV1ZT8gTnZpZGlhIHNwZWNpZmljPw0K
PiA+Pj4+DQo+ID4+PiBIdWguIE5vLg0KPiA+Pj4gRG8gZ2l0IGxvZyBhbmQgcmVhbGl6ZSB3aGF0
IGhhcHBlbmVkIHdpdGggcXVldWVfcmVzZXQuDQo+ID4+IFlvdSBkaWRuJ3QgYW5zd2VyIHRoZSBx
dWVzdGlvbiwgZG9lcyB0aGUgc3BlYyBldmVuIGhhcyBkZWZpbmVkICJjcmVhdGUgYQ0KPiB2cSI/
DQo+ID4gRW5hYmxlZC9jcmVhdGVkID0gdG9tYXRvL3RvbWF0byB3aGVuIGRpc2N1c3NpbmcgdGhl
IHNwZWMgaW4gbm9uLW5vcm1hdGl2ZQ0KPiBlbWFpbCBjb252ZXJzYXRpb24uDQo+ID4gSXQncyBp
cnJlbGV2YW50Lg0KPiBUaGVuIGxldHMgbm90IGRlYmF0ZSBvbiB0aGlzIGVuYWJsZSBhIHZxIG9y
IGNyZWF0ZSBhIHZxIGFueW1vcmUNCj4gPiBBbGwgSSBhbSBzYXlpbmcgaXMsIHdoZW4gd2Uga25v
dyB0aGUgbGltaXRhdGlvbnMgb2YgdGhlIHRyYW5zcG9ydCBhbmQNCj4gPiB3aGVuIGluZHVzdHJ5
IGlzIGZvcndhcmRpbmcgdG8gbm90IGludHJvZHVjZWQgbW9yZSBhbmQgbW9yZSBvbi1kaWUgcmVn
aXN0ZXINCj4gZm9yIG9uY2UgaW4gbGlmZXRpbWUgd29yayBvZiBkZXZpY2UgbWlncmF0aW9uLCB3
ZSBqdXN0IHVzZSB0aGUgb3B0aW1hbCBjb21tYW5kDQo+IGFuZCBxdWV1ZSBpbnRlcmZhY2UgdGhh
dCBpcyBuYXRpdmUgdG8gdmlydGlvLg0KPiBQQ0kgY29uZmlnIHNwYWNlIGhhcyBpdHMgb3duIGxp
bWl0YXRpb25zLCBhbmQgYWRtaW4gdnEgaGFzIGl0cyBhZHZhbnRhZ2VzLCBidXQNCj4gdGhhdCBk
b2VzIG5vdCBhcHBseSB0byBhbGwgdXNlIGNhc2VzLg0KPiANClRoZXJlIHdhcyBhIHJlY2VudCB3
b3JrIGRvbmUgZW11bGF0aW5nIHRoZSBTUi1JT1YgY2FwIGFuZCBhbGxvd2luZyBWTSB0byBlbmFi
bGUgU1ItSU9WIGluIFsxXS4NClRoaXMgaXMgdGhlIG9wdGlvbiBJIG1lbnRpb25lZCBmZXcgd2Vl
a3MgYWdvLg0KDQpTbyB3aXRoIGFkbWluIGNvbW1hbmRzIGFuZCBhZG1pbiB2aXJ0cXVldWVzLCBl
dmVuIG5lc3RlZCBtb2RlbCB3aWxsIHdvcmsgdXNpbmcgWzFdLg0KDQpbMV0gaHR0cHM6Ly9uZXRk
ZXZjb25mLmluZm8vMHgxNy9zZXNzaW9ucy90YWxrL3VubGVhc2hpbmctc3ItaW92LW9mZmxvYWQt
b24tdmlydHVhbC1tYWNoaW5lcy5odG1sDQoNCj4gSSBkb24ndCB3YW50IHRvIHJlcGVhdCB3aHkg
SSBkb24ndCB0aGluayBhZG1pbiB2cSBpcyBhIGdvb2QgaWRlYSBmb3IgbWlncmF0aW9uDQo+IGFn
YWluLCB3ZSBoYXZlIGFscmVhZHkgZGlzY3Vzc2VkIG9uIHRoYXQuDQo+ID4NCg0K

