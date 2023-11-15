Return-Path: <virtio-comment-return-8365-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43601C072A2
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 17:35:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 86C3B2AC4B
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 17:35:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 637DF986DBE
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 17:35:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 461F5986DB5; Wed, 15 Nov 2023 17:35:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 03E3A986DB6
	for <virtio-comment@lists.oasis-open.org>; Wed, 15 Nov 2023 17:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BThFyqYLtjaTIq1MVSKzOxO+Wjx6X+qq1ikRQ8lw2pgHAWdMyoxPtaLnpRTKhnnvkGJu5ZcknvGPZm480s8l0yEKR3MPeMoh5Py9Vzq6kgGRoy7YMjmdOiOtuhvRv7EbaoZadiZsSG8C7x673pK4O74CPCOLvYk3sNtm9BrWYTGFaXh4NibCPaf62pUh0TIKzs2D/dKEzb3c9VgVBm8W63I1gPzXKFMvPNvqd3egVdYRj4VX2D/wiF+UfILfKwOE3Bvi8HzbEgYRAMEoWLnqt5iANvEhVByssDeNVSUmwewd8UKW0ZWlNlh3uQBA4fahZHNI47xG56lX8atjFS2AeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agC9+mMs6JFXtgy/0nRAotDTcOz8BkgQJgM07ZdivmU=;
 b=Mto+AHuRewFnIvUrH+8FEs6far8dSEQsTrW0jfwPgfgJXsNteQvi5hkx8i5n6c0NWVXlhCtODUQk6CALU8c+xC+tXTjz++UHpnr/IdN9JMZyIZT2CdaUlGDKoWjPhzitgg/Uua3C3Glwh2VFnIFUMlRFmQkgXRtr45i2BfMUQD/0O1FwZj06vvtS0dQpuV7UtyxbExOaxvv1sZOAJuYZA6DGb7p3LFzvEa2RSXY4cUQ85mophJF6XPw04wG8CImTfpZf4e/iv1KSd/Dj4QUoNLRR+AqUGOadHIr3z97bkAfehwVrtb2IpNjy0dp3cNAp3yD5LVKuCNMDEMe0RDJC/Q==
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
 AQHaDkFl1Izi1X/8PEWVlDiafyu5VrBocsSwgAA8x4CAAA4dEIAD6TMAgAAKLuCAAFlegIAAFMUAgAF+uwCAAt3j8IAAUVeAgAACYaCAAWmSAIAAKc6ggASnTQCAA6yHIA==
Date: Wed, 15 Nov 2023 17:35:06 +0000
Message-ID:
 <PH0PR12MB54810113B095063A5B875A03DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
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
 <PH0PR12MB54815431B823C54E3231EC5EDCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bb66298e-9ee5-4370-8532-13110f392f41@intel.com>
 <PH0PR12MB548189E49C97E91374B3F514DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <4201d1df-100d-495c-97ba-7efbe73d9137@intel.com>
In-Reply-To: <4201d1df-100d-495c-97ba-7efbe73d9137@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW5PR12MB5597:EE_
x-ms-office365-filtering-correlation-id: 9929b187-50d7-4c41-f1e8-08dbe60134f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qOuJdsCh+IK3zj25XGvoiVen0SZEH3LcYvhZ5F4xS2kliXI1Xuu7usRdFBo7M022byMQY6wRNA1qW3SzlxpYbD1Xrvuv8CbsEwgeSlpguHHWMEaWHFhfY0/vZk/BulOtra8gGjcRwRBPUiPZPLc/TVddpl//kOUZupkELhMiHjtzuJmjgnHB2NKvEIG3BDIo3rItcyn0NaT/vkHUqB0e2oi59R1y+M/mfSUon7MfobpL4tMkOtLgWXwu1I2m+/enyvHvjlB2wkq7V8RGk5c371BcuZzNVwrgEK5zNg6oQ9ZfxjcSmL/VDOfraFBEskErE3bVC21WqqtXoPsUS37N7JybeNSDNZ4AqvSzwHvmb/1s1w1/ESD04X1YWnVtvAIZSgrHrM3UggH3lrN/h7BvR+HnABqbK8C3gnV3QsWv86SjrMJocQ5Ytv0je5mm6hvf7j5qMKdDeY8gPNJMhZYC64OWW8QNFV4GmtZDKLiaI/Tpf/hnyxrYlEb0N4bYdk4FTEiBlG/npAtEYSTXEwvVs3HQZsADm4X4x/GDtxLml/6bCc6Jck4G/fVehAb2zl0LRoH2aT6LcGwKWDfCvlrxXfaxRm04/37F0HFsNPPM/1hft8qjw1CUDJL4dQulWoX3TRRvkelSyC8bs4PQjZLIP2w00xz4LaOuxjLH9YqxHs0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(76116006)(66476007)(66556008)(9686003)(316002)(55016003)(83380400001)(66946007)(38100700002)(64756008)(66446008)(110136005)(8676002)(8936002)(4326008)(122000001)(478600001)(966005)(6506007)(53546011)(7696005)(52536014)(86362001)(5660300002)(71200400001)(38070700009)(2906002)(26005)(33656002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHNkSUZlQ25Od2x2WXhZTHAydFFUN2ozRHlhOUFlVVdiTUJQQjFXTnk0aEM3?=
 =?utf-8?B?bDFnZFBCcm9FU2xPUXNLOTJzMDh3TTRMb1FrT2t4RjhndGo3a3gwWkI4K2dF?=
 =?utf-8?B?eXFDc3dTdWYxN1JEalh4SzJuN2xjL1lrZkdQNm1nbkUzaitPYThPbkxsTFNB?=
 =?utf-8?B?QW0xaHBBdG1tRkVFS1puSnJJTnp6VFVmRWtKdEtHdGpzaHJ1U0plejNkUVI1?=
 =?utf-8?B?SmpBWmhXSXRMaytEOXFrQlo2RVhLdWQ2Z240UkpobEY0QjZHdkg1RHJ5Q3c4?=
 =?utf-8?B?U1hRdUNReDBKVEtxRlFQdzlWNW1IY3ZOam9uckkvMEYzVkM0d1JWVCtYVXIz?=
 =?utf-8?B?SnpPdmNubUNGOEorUUlIZ0N0R05hdnl5YUkxSEpQMUlUQTVvcGZmVm9pR0RT?=
 =?utf-8?B?NzM1TlI1WlluSzQwS0xyOEltUzNleDJ5SnFSbDBpMkliWWxvRjhlemFOeDRq?=
 =?utf-8?B?Q01vZUl1UHVtS3NoQU9LYmdMeTFicmZTZWZGTkNtV1lDRVczMVE5TjBVOGFO?=
 =?utf-8?B?TUx0bDFKZU5PQi9RMWg2Y00wdXlsVFNXeW5pUVBwTlNSNEV6Ylk5T0swNHk2?=
 =?utf-8?B?d01ldGRiOXdaaHF2WmdJWDRZT0trUWVHVjhCcWFaaUMrcVJXZTd6N0RrajBL?=
 =?utf-8?B?MXpjL29KQWdyTFVVUEF1MEFYaTZ0OExZZUxuMWhlRllNZmV3Zjl0ZGJ2V2Q5?=
 =?utf-8?B?aUpBR2R4V2RSUFY5OVBHWlJiLy9kZ1l3THQvMVJvYnNDUUpSS3h6SGlQNnlM?=
 =?utf-8?B?U3FWUDhGbjF5NFFOTzJsZ3RWRGdYOWJ4ZDNOZDVRSFFIdmtHbGxZTm84alNN?=
 =?utf-8?B?Y1FHMFdQK05HcnAzaVVkOUwwbVhTTnRJd0MzRUovdmVxRFR1bzZhS1lodWwv?=
 =?utf-8?B?MEtFMlhkQmE3RTRZdk1oMDhKQ0FkU3lXZmhoQlRxMkdHSlQrdmpob25BVzRV?=
 =?utf-8?B?MURkaVMwb010a0JFQnJaaExSS3pZMGgzWm5RNmsvY3YzNXd6NEtUTWp2VVhv?=
 =?utf-8?B?Mno1SlNlRUczVnZodC80bE4rejZtWmNXTlc0NW93ZUFVd0NQMVhWaldVRzli?=
 =?utf-8?B?QzRwTFFUa2xRcTlTNEZpRXEvOUNTaDJ4WGs3OUgrd1d0NzVkd0FLbFk3eVVL?=
 =?utf-8?B?QmRodEFhN1Z1em5VOHdyVkowMnc5T1EraWQ2V2JieUcybmw4OFFCS055VmxE?=
 =?utf-8?B?WjdSV0w5aFF4YXZ1SFVtNVFWTnFIQXdSMHpkQmVLUkN3bFNHOHp5TE4wZmFE?=
 =?utf-8?B?YjZjTFdKdmMvWTRkR2NDc2tOd3A1aTRZRzZOZnc3SkJjSmN0SFVJQU8ySEhR?=
 =?utf-8?B?ckkxeDFmUU1qWkFDdzZIYStvTkxKTjRIaWJLeUJWUVBrZlZXamFoUElaa1BR?=
 =?utf-8?B?MzRhVExNNXorWGtWNS80cDhmUlFMVFBhZ2pHVFZWa1NObWh2OGlCbGZTMC9u?=
 =?utf-8?B?S2RpUU9zYTRsUy85TGFxd3NFbVNnTHhYTU8rRjdib0Y0MHptVENYakZ0cWJr?=
 =?utf-8?B?Q1RmcmROSnZ3cXV0SHVhMHhnUXFLcDVBZDUvbFFOdlpoa0J3QTVjTmZYV3lJ?=
 =?utf-8?B?KzBrNWY5NTBQQlBvdUtkSnNRN1BEaXV3aEZNOHRuUXBvT0ZMMzVPSGpaaTdO?=
 =?utf-8?B?U1FxUXVyb1hNMjJCdGRDVkJiMW8yQjBBcGFoRkd4aDFTWS9PRC96ZUgyQmRO?=
 =?utf-8?B?UXg3LzBOT0ZxT0tpL25GQlJyeitVOVRaRTJrSk5kT29ZWVNSTytCN2w4NDdG?=
 =?utf-8?B?MUpXNXIzb2NjVTBqUGdmWkI4RTllU1k0c3l4Q0NxTW4vVDJYbzcrWllNTjls?=
 =?utf-8?B?ZHNFV2pJNzlTMWIxT2pYMTY0dDZ5T2F1YllpV3p4K3R6UmlPZmxIZVJaTkQv?=
 =?utf-8?B?bHNYV0R6K2NyQmNpTjhmZlZ3aEorc2YwS1JPMkMzUlZaV3k3bk9SVWUxbmk4?=
 =?utf-8?B?eDE2NXFWb2xTaStSMzQwc3FtOE5Cc2VjTFQ5a0tTcG1PUm5ZWWNzNllNVnJ0?=
 =?utf-8?B?SThlNzhZbnp2Q215MDZ0UU9DZk04S2xQSDkzZktCc3lBeHJuZEFabkRKSyt3?=
 =?utf-8?B?S1hmNmVuZTVaV3h4V1VMOVI3a0Q4VEVsZU0vMkF0VDljSVl4VnV1Tnh4blJu?=
 =?utf-8?Q?kvlE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9929b187-50d7-4c41-f1e8-08dbe60134f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 17:35:06.0330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7QVUgjKy53C/l2i4RcsffWJixG8zE1KnuVFNqeIVAePutLSYItUQoGwLPSmNkFETmgdhQ47yU/MQuVhJHIA4ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5597
Subject: RE: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

DQoNCj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gU2Vu
dDogTW9uZGF5LCBOb3ZlbWJlciAxMywgMjAyMyAyOjU2IFBNDQo+IA0KPiANCj4gDQo+IE9uIDEx
LzEwLzIwMjMgODozMSBQTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+PiBGcm9tOiBaaHUsIExp
bmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPg0KPiA+PiBTZW50OiBGcmlkYXksIE5vdmVt
YmVyIDEwLCAyMDIzIDE6MjIgUE0NCj4gPj4NCj4gPj4NCj4gPj4gT24gMTEvOS8yMDIzIDY6MjUg
UE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+PiBGcm9tOiBaaHUsIExpbmdzaGFuIDxsaW5n
c2hhbi56aHVAaW50ZWwuY29tPg0KPiA+Pj4+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciA5LCAy
MDIzIDM6MzkgUE0NCj4gPj4+Pg0KPiA+Pj4+DQo+ID4+Pj4gT24gMTEvOS8yMDIzIDI6MjggUE0s
IFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+Pj4+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdz
aGFuLnpodUBpbnRlbC5jb20+DQo+ID4+Pj4+PiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciA3LCAy
MDIzIDM6MDIgUE0NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBPbiAxMS82LzIwMjMgNjo1MiBQTSwgUGFy
YXYgUGFuZGl0IHdyb3RlOg0KPiA+Pj4+Pj4+PiBGcm9tOiBaaHUsIExpbmdzaGFuIDxsaW5nc2hh
bi56aHVAaW50ZWwuY29tPg0KPiA+Pj4+Pj4+PiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDYsIDIw
MjMgMjo1NyBQTQ0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBPbiAxMS82LzIwMjMgMTI6MTIgUE0s
IFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+Pj4+Pj4+PiBGcm9tOiBaaHUsIExpbmdzaGFuIDxs
aW5nc2hhbi56aHVAaW50ZWwuY29tPg0KPiA+Pj4+Pj4+Pj4+IFNlbnQ6IE1vbmRheSwgTm92ZW1i
ZXIgNiwgMjAyMyA5OjAxIEFNDQo+ID4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+PiBPbiAxMS8zLzIw
MjMgMTE6NTAgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+Pj4+Pj4+Pj4+IEZyb206IHZp
cnRpby1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnDQo+ID4+Pj4+Pj4+Pj4+PiA8dmlydGlv
LWNvbW1lbnRAbGlzdHMub2FzaXMtIG9wZW4ub3JnPiBPbiBCZWhhbGYgT2YgWmh1LA0KPiA+Pj4+
Pj4+Pj4+Pj4gTGluZ3NoYW4NCj4gPj4+Pj4+Pj4+Pj4+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIg
MywgMjAyMyA4OjI3IFBNDQo+ID4+Pj4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4+Pj4gT24gMTEvMy8y
MDIzIDc6MzUgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+Pj4+Pj4+Pj4+Pj4gRnJvbTog
Wmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPg0KPiA+Pj4+Pj4+Pj4+Pj4+PiBT
ZW50OiBGcmlkYXksIE5vdmVtYmVyIDMsIDIwMjMgNDowNSBQTQ0KPiA+Pj4+Pj4+Pj4+Pj4+Pg0K
PiA+Pj4+Pj4+Pj4+Pj4+PiBUaGlzIHBhdGNoIGFkZHMgdHdvIG5ldyBsZTE2IGZpZWxkcyB0byBj
b21tb24NCj4gPj4+Pj4+Pj4+Pj4+Pj4gY29uZmlndXJhdGlvbiBzdHJ1Y3R1cmUgdG8gc3VwcG9y
dCBWSVJUSU9fRl9RVUVVRV9TVEFURQ0KPiA+Pj4+Pj4+Pj4+Pj4+PiBpbiBQQ0kgdHJhbnNwb3J0
DQo+ID4+IGxheWVyLg0KPiA+Pj4+Pj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBaaHUgTGluZ3No
YW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+ID4+Pj4+Pj4+Pj4+Pj4+IC0tLQ0KPiA+Pj4+
Pj4+Pj4+Pj4+PiAgICAgICAgIHRyYW5zcG9ydC1wY2kudGV4IHwgMTggKysrKysrKysrKysrKysr
KysrDQo+ID4+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlv
bnMoKykNCj4gPj4+Pj4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL3Ry
YW5zcG9ydC1wY2kudGV4IGIvdHJhbnNwb3J0LXBjaS50ZXggaW5kZXgNCj4gPj4+Pj4+Pj4+Pj4+
Pj4gYTVjNjcxOS4uMzE2MTUxOSAxMDA2NDQNCj4gPj4+Pj4+Pj4+Pj4+Pj4gLS0tIGEvdHJhbnNw
b3J0LXBjaS50ZXgNCj4gPj4+Pj4+Pj4+Pj4+Pj4gKysrIGIvdHJhbnNwb3J0LXBjaS50ZXgNCj4g
Pj4+Pj4+Pj4+Pj4+Pj4gQEAgLTMyNSw2ICszMjUsMTAgQEAgXHN1YnN1YnNlY3Rpb257Q29tbW9u
DQo+IGNvbmZpZ3VyYXRpb24NCj4gPj4+Pj4+Pj4+PiBzdHJ1Y3R1cmUNCj4gPj4+Pj4+Pj4+Pj4+
Pj4gbGF5b3V0fVxsYWJlbHtzZWM6VmlydGlvIFRyYW5zcG9ydA0KPiA+Pj4+Pj4+Pj4+Pj4+PiAg
ICAgICAgICAgICAgICAgLyogQWJvdXQgdGhlIGFkbWluaXN0cmF0aW9uIHZpcnRxdWV1ZS4gKi8N
Cj4gPj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgIGxlMTYgYWRtaW5fcXVldWVfaW5kZXg7
ICAgICAgICAgLyogcmVhZC1vbmx5IGZvciBkcml2ZXINCj4gPj4gKi8NCj4gPj4+Pj4+Pj4+Pj4+
Pj4gICAgICAgICAgICAgICAgIGxlMTYgYWRtaW5fcXVldWVfbnVtOyAgICAgICAgIC8qIHJlYWQt
b25seSBmb3IgZHJpdmVyDQo+ID4+ICovDQo+ID4+Pj4+Pj4+Pj4+Pj4+ICsNCj4gPj4+Pj4+Pj4+
Pj4+Pj4gKwkvKiBWaXJ0cXVldWUgc3RhdGUgKi8NCj4gPj4+Pj4+Pj4+Pj4+Pj4gKyAgICAgICAg
bGUxNiBxdWV1ZV9hdmFpbF9zdGF0ZTsgICAgICAgICAvKiByZWFkLXdyaXRlICovDQo+ID4+Pj4+
Pj4+Pj4+Pj4+ICsgICAgICAgIGxlMTYgcXVldWVfdXNlZF9zdGF0ZTsgICAgICAgICAgLyogcmVh
ZC13cml0ZSAqLw0KPiA+Pj4+Pj4+Pj4+Pj4+IFRoaXMgdGlueSBpbnRlcmZhY2UgZm9yIDEyOCB2
aXJ0aW8gbmV0IHF1ZXVlcyB0aHJvdWdoDQo+ID4+Pj4+Pj4+Pj4+Pj4gcmVnaXN0ZXIgcmVhZCB3
cml0ZXMsIGRvZXMNCj4gPj4+Pj4+Pj4+Pj4+IG5vdCB3b3JrIGVmZmVjdGl2ZWx5Lg0KPiA+Pj4+
Pj4+Pj4+Pj4+IFRoZXJlIGFyZSBpbmZsaWdodCBvdXQgb2Ygb3JkZXIgZGVzY3JpcHRvcnMgZm9y
IGJsb2NrIGFsc28uDQo+ID4+Pj4+Pj4+Pj4+Pj4gSGVuY2UgdG95IHJlZ2lzdGVycyBsaWtlIHRo
aXMgZG8gbm90IHdvcmsuDQo+ID4+Pj4+Pj4+Pj4+PiBEbyB5b3Uga25vdyB0aGVyZSBpcyBhIHF1
ZXVlX3NlbGVjdD8gV2h5IHRoaXMgZG9lcyBub3Qgd29yaz8NCj4gPj4+Pj4+Pj4+Pj4+IERvIHlv
dSBrbm93IGhvdyBvdGhlciBxdWV1ZSByZWxhdGVkIGZpZWxkcyB3b3JrPw0KPiA+Pj4+Pj4+Pj4+
PiA6KQ0KPiA+Pj4+Pj4+Pj4+PiBZZXMuIElmIHlvdSBub3RpY2UgcXVldWVfcmVzZXQgcmVsYXRl
ZCBjcml0aWNhbCBzcGVjIGJ1ZyBmaXgNCj4gPj4+Pj4+Pj4+Pj4gd2FzIGRvbmUgd2hlbiBpdA0K
PiA+Pj4+Pj4+Pj4+IHdhcyBpbnRyb2R1Y2VkIHNvIHRoYXQgbGl2ZSBtaWdyYXRpb24gY2FuIF9h
Y3R1YWxseV8gd29yay4NCj4gPj4+Pj4+Pj4+Pj4gV2hlbiBxdWV1ZV9zZWxlY3QgaXMgZG9uZSBm
b3IgMTI4IHF1ZXVlcyBzZXJpYWxseSwgaXQgdGFrZSBhDQo+ID4+Pj4+Pj4+Pj4+IGxvdCBvZiB0
aW1lIHRvDQo+ID4+Pj4+Pj4+Pj4gcmVhZCB0aG9zZSBzbG93IHJlZ2lzdGVyIGludGVyZmFjZSBm
b3IgdGhpcyArIGluZmxpZ2h0DQo+ID4+Pj4+Pj4+Pj4gZGVzY3JpcHRvcnMgKw0KPiA+PiBtb3Jl
Lg0KPiA+Pj4+Pj4+Pj4+IGludGVyZXN0aW5nLCB2aXJ0aW8gd29yayBpbiB0aGlzIHBhdHRlcm4g
Zm9yIG1hbnkgeWVhcnMsIHJpZ2h0Pw0KPiA+Pj4+Pj4+Pj4gQWxsIHRoZXNlIHllYXJzIDQwMEdi
cHMgYW5kIDgwMEdicHMgdmlydGlvIHdhcyBub3QgcHJlc2VudCwNCj4gPj4+Pj4+Pj4+IG51bWJl
ciBvZg0KPiA+Pj4+Pj4+PiBxdWV1ZXMgd2VyZSBub3QgaW4gaHcuDQo+ID4+Pj4+Pj4+IFRoZSBy
ZWdpc3RlcnMgYXJlIGNvbnRyb2wgcGF0aCBpbiBjb25maWcgc3BhY2UsIGhvdyA0MDBHIG9yDQo+
ID4+Pj4+Pj4+IDgwMEcNCj4gPj4gYWZmZWN0Pz8NCj4gPj4+Pj4+PiBCZWNhdXNlIHRob3NlIGFy
ZSB0aGUgb25lIGluIHByYWN0aWNlIHJlcXVpcmVzIGxhcmdlIG51bWJlciBvZiBWUXMuDQo+ID4+
Pj4+Pj4NCj4gPj4+Pj4+PiBZb3UgYXJlIGFza2luZyBwZXIgVlEgcmVnaXN0ZXIgY29tbWFuZHMg
dG8gbW9kaWZ5IHRoaW5ncw0KPiA+Pj4+Pj4+IGR5bmFtaWNhbGx5IHZpYQ0KPiA+Pj4+Pj4gdGhp
cyBvbmUgdnEgYXQgYSB0aW1lLCBzZXJpYWxpemluZyBhbGwgdGhlIG9wZXJhdGlvbnMuDQo+ID4+
Pj4+Pj4gSXQgZG9lcyBub3Qgc2NhbGUgd2VsbCB3aXRoIGhpZ2ggcSBjb3VudC4NCj4gPj4+Pj4+
IFRoaXMgaXMgbm90IGR5bmFtaWNhbGx5LCBpdCBvbmx5IGhhcHBlbnMgd2hlbiBTVVNQRU5EIGFu
ZCBSRVNVTUUuDQo+ID4+Pj4+PiBUaGlzIGlzIHRoZSBzYW1lIG1lY2hhbmlzbSBob3cgdmlydGlv
IGluaXRpYWxpemUgYSB2aXJ0cXVldWUsDQo+ID4+Pj4+PiB3b3JraW5nIGZvciBtYW55IHllYXJz
Lg0KPiA+Pj4+PiBOby4gd2hlbiB2aXJ0aW8gZHJpdmVyIGluaXRpYWxpemVzIGl0IGZvciB0aGUg
Zmlyc3QgdGltZSwgdGhlcmUgaXMNCj4gPj4+Pj4gbm8gYWN0aXZlIHRyYWZmaWMNCj4gPj4+PiB0
aGF0IGdldHMgbG9zdC4NCj4gPj4+Pj4gVGhpcyBpcyBiZWNhdXNlIHRoZSBpbnRlcmZhY2UgaXMg
bm90IHlldCB1cCBhbmQgbm90IHBhcnQgb2YgdGhlIG5ldHdvcmsNCj4geWV0Lg0KPiA+Pj4+Pg0K
PiA+Pj4+PiBUaGUgcmVzdW1lIG11c3QgYmUgZmFzdCBlbm91Z2gsIGJlY2F1c2UgdGhlIHJlbW90
ZSBub2RlIGlzIHNlbmRpbmcNCj4gPj4+PiBwYWNrZXRzLg0KPiA+Pj4+PiBIZW5jZSBpdCBpcyBk
aWZmZXJlbnQgZnJvbSBkcml2ZXIgaW5pdCB0aW1lIHF1ZXVlIGVuYWJsZS4NCj4gPj4+PiBJIGFt
IG5vdCBzdXJlIGFueSBwYWNrZXRzIGFycml2ZSBiZWZvcmUgYSBsaW5rIGFubm91bmNlIGF0IHRo
ZQ0KPiA+Pj4+IGRlc3RpbmF0aW9uDQo+ID4+IHNpZGUuDQo+ID4+PiBJIHRoaW5rIGl0IGNhbi4N
Cj4gPj4+IEJlY2F1c2UgdGhlcmUgaXMgbm8gbm90aWZpY2F0aW9uIG9mIG1lbWJlciBkZXZpY2Ug
bGluayBkb3duDQo+ID4+PiBpbnRpbWF0aW9uIHRvDQo+ID4+IHJlbW90ZSBzaWRlLg0KPiA+Pj4g
VGhlIEw0IGFuZCBMNSBwcm90b2NvbHMgaGF2ZSBubyBrbm93bGVkZ2UgdGhhdCBub2RlIHdoaWNo
IHRoZXkgYXJlDQo+ID4+IGludGVyYWN0aW5nIGlzIGJlaGluZCBzb21lIGxheWVycyBvZiBzd2l0
Y2hlcy4NCj4gPj4+IFNvIGtlZXBpbmcgdGhpcyB0aW1lIGxvdyBpcyBkZXNpcmVkLg0KPiA+PiBU
aGUgTklDIHNob3VsZCBicm9hZCBjYXN0IGl0c2VsZiBmaXJzdCwgc28gdGhhdCBvdGhlciBwZWVy
cyBpbiB0aGUNCj4gPj4gbmV0d29yayBrbm93KGZvciBleGFtcGxlIGl0cyBtYWMgdG8gcm91dGUg
aXQpIGhvdyB0byBzZW5kIGEgbWVzc2FnZSB0byBpdC4NCj4gPj4NCj4gPj4gVGhpcyBpcyBuZWNl
c3NhcnksIGZvciBleGFtcGxlIFZJUlRJT19ORVRfRl9HVUVTVF9BTk5PVU5DRSwgc2ltaWxhcg0K
PiA+PiBtZWNoYW5pc20gd29yayBmb3IgaW4tbWFya2V0aW5nIHByb2R1Y3Rpb25zIGZvciB5ZWFy
cy4NCj4gPj4NCj4gPj4gVGhpcyBpcyBvdXQgb2YgdGhlIHRvcGljIGFueXdheS4NCj4gPj4+Pj4+
Pj4gU2VlIHRoZSB2aXJ0aW8gY29tbW9uIGNmZywgeW91IHdpbGwgZmluZCB0aGUgbWF4IG51bWJl
ciBvZiB2cXMNCj4gPj4+Pj4+Pj4gaXMgdGhlcmUsIG51bV9xdWV1ZXMuDQo+ID4+Pj4+Pj4gOikN
Cj4gPj4+Pj4+PiBTdXJlLiB0aG9zZSB2YWx1ZXMgYXQgaGlnaCBxIGNvdW50IGFmZmVjdHMuDQo+
ID4+Pj4+PiB0aGUgZHJpdmVyIG5lZWQgdG8gaW5pdGlhbGl6ZSB0aGVtIGFueXdheS4NCj4gPj4+
Pj4gVGhhdCBpcyBiZWZvcmUgdGhlIHRyYWZmaWMgc3RhcnRzIGZyb20gcmVtb3RlIGVuZC4NCj4g
Pj4+PiBzZWUgYWJvdmUsIHRoYXQgbmVlZHMgYSBsaW5rIGFubm91bmNlIGFuZCB0aGlzIGlzIGFm
dGVyDQo+ID4+Pj4gcmUtaW5pdGlhbGl6YXRpb24NCj4gPj4+Pj4+Pj4+IERldmljZSBkaWRu4oCZ
dCBzdXBwb3J0IExNLg0KPiA+Pj4+Pj4+Pj4gTWFueSBsaW1pdGF0aW9ucyBleGlzdGVkIGFsbCB0
aGVzZSB5ZWFycyBhbmQgVEMgaXMgaW1wcm92aW5nDQo+ID4+Pj4+Pj4+PiBhbmQgZXhwYW5kaW5n
DQo+ID4+Pj4+Pj4+IHRoZW0uDQo+ID4+Pj4+Pj4+PiBTbyBhbGwgdGhlc2UgeWVhcnMgZG8gbm90
IG1hdHRlci4NCj4gPj4+Pj4+Pj4gTm90IHN1cmUgd2hhdCBhcmUgeW91IHRhbGtpbmcgYWJvdXQs
IGhhdmVuJ3Qgd2UgaW5pdGlhbGl6ZSB0aGUNCj4gPj4+Pj4+Pj4gZGV2aWNlIGFuZCB2cXMgaW4g
Y29uZmlnIHNwYWNlIGZvciB5ZWFycz8/Pz8/PyBXaGF0J3Mgd3JvbmcNCj4gPj4+Pj4+Pj4gd2l0
aCB0aGlzDQo+ID4+Pj4gbWVjaGFuaXNtPw0KPiA+Pj4+Pj4+PiBBcmUgeW91IHF1ZXN0aW9uaW5n
IHZpcml0by1wY2kgZnVuZGFtZW50YWxzPz8/DQo+ID4+Pj4+Pj4gRG9u4oCZdCBwb2ludCB0byBp
bi1lZmZpY2llbnQgcGFzdCB0byBlc3RhYmxpc2ggc2ltaWxhciBpbi1lZmZpY2llbnQgZnV0dXJl
Lg0KPiA+Pj4+Pj4gaW50ZXJlc3RpbmcsIHlvdSBrbm93IHRoaXMgaXMgYSBvbmUtdGltZSB0aGlu
ZywgcmlnaHQ/DQo+ID4+Pj4+PiBhbmQgeW91IGFyZSBhd2FyZSBvZiB0aGlzIGhhcyBiZWVuIHRo
ZXJlIGZvciB5ZWFycy4NCj4gPj4+Pj4+Pj4+Pj4+IExpa2UgaG93IHRvIHNldCBhIHF1ZXVlIHNp
emUgYW5kIGVuYWJsZSBpdD8NCj4gPj4+Pj4+Pj4+Pj4gVGhvc2UgYXJlIG1lYW50IHRvIGJlIHVz
ZWQgYmVmb3JlIERSSVZFUl9PSyBzdGFnZSBhcyB0aGV5DQo+ID4+Pj4+Pj4+Pj4+IGFyZSBpbml0
IHRpbWUNCj4gPj4+Pj4+Pj4+PiByZWdpc3RlcnMuDQo+ID4+Pj4+Pj4+Pj4+IE5vdCB0byBrZWVw
IGFidXNpbmcgdGhlbS4uDQo+ID4+Pj4+Pj4+Pj4gZG9uJ3QgeW91IG5lZWQgdG8gc2V0IHF1ZXVl
X3NpemUgYXQgdGhlIGRlc3RpbmF0aW9uIHNpZGU/DQo+ID4+Pj4+Pj4+PiBOby4NCj4gPj4+Pj4+
Pj4+IEJ1dCB0aGUgc3JjL2RzdCBkb2VzIG5vdCBtYXR0ZXIuDQo+ID4+Pj4+Pj4+PiBRdWV1ZV9z
aXplIHRvIGJlIHNldCBiZWZvcmUgRFJJVkVSX09LIGxpa2UgcmVzdCBvZiB0aGUNCj4gPj4+Pj4+
Pj4+IHJlZ2lzdGVycywgYXMgYWxsDQo+ID4+Pj4+Pj4+IHF1ZXVlcyBtdXN0IGJlIGNyZWF0ZWQg
YmVmb3JlIHRoZSBkcml2ZXJfb2sgcGhhc2UuDQo+ID4+Pj4+Pj4+PiBRdWV1ZV9yZXNldCB3YXMg
bGFzdCBtb21lbnQgZXhjZXB0aW9uLg0KPiA+Pj4+Pj4+PiBjcmVhdGUgYSBxdWV1ZT8gTnZpZGlh
IHNwZWNpZmljPw0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+IEh1aC4gTm8uDQo+ID4+Pj4+Pj4gRG8g
Z2l0IGxvZyBhbmQgcmVhbGl6ZSB3aGF0IGhhcHBlbmVkIHdpdGggcXVldWVfcmVzZXQuDQo+ID4+
Pj4+PiBZb3UgZGlkbid0IGFuc3dlciB0aGUgcXVlc3Rpb24sIGRvZXMgdGhlIHNwZWMgZXZlbiBo
YXMgZGVmaW5lZA0KPiA+Pj4+Pj4gImNyZWF0ZSBhDQo+ID4+Pj4gdnEiPw0KPiA+Pj4+PiBFbmFi
bGVkL2NyZWF0ZWQgPSB0b21hdG8vdG9tYXRvIHdoZW4gZGlzY3Vzc2luZyB0aGUgc3BlYyBpbg0K
PiA+Pj4+PiBub24tbm9ybWF0aXZlDQo+ID4+Pj4gZW1haWwgY29udmVyc2F0aW9uLg0KPiA+Pj4+
PiBJdCdzIGlycmVsZXZhbnQuDQo+ID4+Pj4gVGhlbiBsZXRzIG5vdCBkZWJhdGUgb24gdGhpcyBl
bmFibGUgYSB2cSBvciBjcmVhdGUgYSB2cSBhbnltb3JlDQo+ID4+Pj4+IEFsbCBJIGFtIHNheWlu
ZyBpcywgd2hlbiB3ZSBrbm93IHRoZSBsaW1pdGF0aW9ucyBvZiB0aGUgdHJhbnNwb3J0DQo+ID4+
Pj4+IGFuZCB3aGVuIGluZHVzdHJ5IGlzIGZvcndhcmRpbmcgdG8gbm90IGludHJvZHVjZWQgbW9y
ZSBhbmQgbW9yZQ0KPiA+Pj4+PiBvbi1kaWUgcmVnaXN0ZXINCj4gPj4+PiBmb3Igb25jZSBpbiBs
aWZldGltZSB3b3JrIG9mIGRldmljZSBtaWdyYXRpb24sIHdlIGp1c3QgdXNlIHRoZQ0KPiA+Pj4+
IG9wdGltYWwgY29tbWFuZCBhbmQgcXVldWUgaW50ZXJmYWNlIHRoYXQgaXMgbmF0aXZlIHRvIHZp
cnRpby4NCj4gPj4+PiBQQ0kgY29uZmlnIHNwYWNlIGhhcyBpdHMgb3duIGxpbWl0YXRpb25zLCBh
bmQgYWRtaW4gdnEgaGFzIGl0cw0KPiA+Pj4+IGFkdmFudGFnZXMsIGJ1dCB0aGF0IGRvZXMgbm90
IGFwcGx5IHRvIGFsbCB1c2UgY2FzZXMuDQo+ID4+Pj4NCj4gPj4+IFRoZXJlIHdhcyBhIHJlY2Vu
dCB3b3JrIGRvbmUgZW11bGF0aW5nIHRoZSBTUi1JT1YgY2FwIGFuZCBhbGxvd2luZw0KPiA+Pj4g
Vk0gdG8NCj4gPj4gZW5hYmxlIFNSLUlPViBpbiBbMV0uDQo+ID4+PiBUaGlzIGlzIHRoZSBvcHRp
b24gSSBtZW50aW9uZWQgZmV3IHdlZWtzIGFnby4NCj4gPj4+DQo+ID4+PiBTbyB3aXRoIGFkbWlu
IGNvbW1hbmRzIGFuZCBhZG1pbiB2aXJ0cXVldWVzLCBldmVuIG5lc3RlZCBtb2RlbCB3aWxsDQo+
ID4+PiB3b3JrDQo+ID4+IHVzaW5nIFsxXS4NCj4gPj4+IFsxXQ0KPiA+Pj4gaHR0cHM6Ly9uZXRk
ZXZjb25mLmluZm8vMHgxNy9zZXNzaW9ucy90YWxrL3VubGVhc2hpbmctc3ItaW92LW9mZmxvYWQN
Cj4gPj4+IC1vDQo+ID4+PiBuLXZpcnR1YWwtbWFjaGluZXMuaHRtbA0KPiA+PiBXZSBzaG91bGQg
dGFrZSB0aGlzIGludG8gY29uc2lkZXJhdGlvbiBvbmNlIGl0IGlzIHN0YW5kYXJkaXplZCBpbiB0
aGUNCj4gPj4gc3BlYywgbWF5YmUgbm90IG5vdywgdGhlcmUgY2FuIGFsd2F5cyBiZSBtYW55IHdv
cmthcm91bmRzIHRvIHNvbHZlIG9uZQ0KPiBwcm9ibGVtLg0KPiA+IFN1cmUsIHVudGlsIHRoYXQg
cG9pbnQgdGhlIGFkbWluIGNvbW1hbmRzIGFyZSBhYmxlIHRvIHN1ZmZpY2UgdGhlIG5lZWQgd2Vs
bC4NCj4gPiBBbmQgd2hlbiB0aGUgc3BlYyBjaGFuZ2VzIGluIHRyYW5zcG9ydCBvY2N1cnMgKGlm
IG5lZWRlZCksIGN1cnJlbnQgYWRtaW4NCj4gY29tbWFuZCBhbmQgYWRtaW4gdnEgYWxzbyBmaXRz
IHZlcnkgd2VsbCB0aGF0IHdpbGwgZm9sbG93IGFib3ZlIFsxXS4NCj4gd2UgaGF2ZSBwb2ludGVk
IGxvdHMgb2YgcHJvYmxlbXMgZm9yIGFkbWluIHZxIGJhc2VkIGxpdmUgbWlncmF0aW9uIHByb3Bv
c2FsLCBJDQo+IHdvbid0IHJlcGVhdCB0aGVtIGhlcmUNCkkgZG9u4oCZdCBzZWUgYW55Lg0KTmVz
dGVkIGlzIGFscmVhZHkgc29sdmVkIHVzaW5nIGFib3ZlLg0KTG9uZyB0aW1lIGFnbywgeW91IG1l
bnRpb25lZCBzb21lIFFvUyBpc3N1ZSwgd2hpY2ggYW55d2F5IGV4aXN0cyBpbiB0aGUgZGV2aWNl
IHJlZ2lzdGVyIG1ldGhvZCB0b28uDQpDYW4geW91IHBsZWFzZSBsaXN0IHRoZW0gaWYgYW55dGhp
bmcgb3RoZXIgdGhhbiBRb1MgYW5kIG5lc3Q/DQo=

