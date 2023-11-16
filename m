Return-Path: <virtio-comment-return-8404-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267E9C47071
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 10:21:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 699E4CDE69
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 10:21:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5E634986DE7
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 10:21:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 53AC5986DDA; Thu, 16 Nov 2023 10:21:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4602F986DDB
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 10:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWBaLUI9Ag+9tmExFslvn9gI3dYwZ/QU+3ssla8JAVUv8ITZqP42xAAToH5Rr36K5POp9VdErDFr2uaFM7w9g0cRRCO1DyJAUF5UwPVOmt6+YU9fQ6JtWITFFRSTjfU5pmWZwE/M3+bQYO6kzp0AlPB8B6C28n9NZPL8s+LaL+Xcd1WOuZNB/8+CM0NtXCbk1aFASn4NEmTIpJD3JbYps1bB2c55aS0ak3/mRGSFO6RL914ULhiePPlFCSJVuqjHDUjMX9E8MClARmAz5zWnBiB5JCTJZz5VE55UD3HykVN2zZPSWIIlUJ192Awi9tq8Mhp7gqG1VNIGdD8aoEf65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h86hbjdjQiU/tnreVnc2Zgh/s3DYEubFKnheS1VnWX0=;
 b=aAqhFOWxqgdf+nO9kXxrLpBuFfATKXQU8DgMSiYQehLAiDdvBGRk9Ec8ZY5l3Y74NIObWka0LBIFd7oCVXUWnchz38SY6cTiYHwJZz1ClNoxFdAZlOHZp7jLD5HC0BDv/4iPzetE4LfcFzmW/r7iupMbmkriW84NV0Cf9V4t6KiwvUTKFsUxnVmf/VJ5pKb4+ykFG7TnKQUIvO1UJ8aP4pWlqD0uY6LaBRDdgw+YMfkAK4rgKLO07d+jFqW5i0AVhPGScJbaO1tc//gpU1OA+jt1PDuc23S4jFi/1PmFL+HtlBikfU+W5/jUnupgPjRBi1+X5qsfJColYgHd85VGAQ==
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
 AQHaDkFl1Izi1X/8PEWVlDiafyu5VrBocsSwgAA8x4CAAA4dEIAD6TMAgAAKLuCAAFlegIAAFMUAgAF+uwCAAt3j8IAAUVeAgAACYaCAAWmSAIAAKc6ggASnTQCAA6yHIIABGDaAgAABczA=
Date: Thu, 16 Nov 2023 10:21:08 +0000
Message-ID:
 <PH0PR12MB5481F872AE828217D6CC8FEEDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
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
 <PH0PR12MB54810113B095063A5B875A03DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <166b43a5-b301-486f-9cc4-01a1cc80eed4@intel.com>
In-Reply-To: <166b43a5-b301-486f-9cc4-01a1cc80eed4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB8794:EE_
x-ms-office365-filtering-correlation-id: 6c311eaf-44a4-4bf6-1e38-08dbe68dbff9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sccfD2OOz6ccBfVMiE69Z9gxXP048LPWBG4zcvOv1lO700Jhyghb0mMzQj8PpKaNE+UvwVMsEJlF4Zhy9Y4aH0Hn55bZY/Sj/oyMUSoGffhfDPafCwzwq7MysiYUSyj4IhBQvNFxhzPdIC8HjyeabvqS/7cbkMcGwF+4Z9KlPJ5If9C8XGgAjvs+ZUyeIEvM3FE8L4lpe29Wp6om+gHhjImEzXthi1CHHmkoaZGt5gXh+CwCxX4TCFlVWZ0PQ0WUeckknPF47tUTqWlXnHkIAeKN6C7lg7UcJNoKzxF9XJ4NeMZ+zjA1mGrqCree8I5/0gPHaiV5lwlAqZhL8xqwcMrauhsyFkJeMLKNsmerG3+tOo15kM2A7tuW1VeoR6IZZa3zlcLC4SpP3DM4IXnUdIoTDmtfs0TQfTWhkn+82s3mmgytaTyqGp9LjAnkexbMNdB69pb3ZZKUhvFBxdr26Le0wH1LLrhanTPSZMyaSgbbdI/+8wtYp7h0eKgMWiNTDuBb0n18wNCQqQwVtW2tAolnCww2QPObN+o+jSftp1nFoX+az0yqqx4/q5cUdWLlHgbpXeKfeUvFsiEog/SJn6CThpJv+7/nnqdg1wlW/kSacki8DwuaZdcrCv2GK90QrgMWXj8oGN1FtfuaerikaaodcZF259pOg3Mznsdg2ak=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(71200400001)(83380400001)(7696005)(53546011)(6506007)(122000001)(9686003)(26005)(38100700002)(66476007)(76116006)(66446008)(66556008)(64756008)(110136005)(66946007)(38070700009)(55016003)(8936002)(86362001)(5660300002)(33656002)(2906002)(41300700001)(316002)(52536014)(8676002)(4326008)(478600001)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RkN3YW1URXRuYkI1V1NjSEtRbC9QZFk0clJMd015MG81YWg4WW9WQnk3MnlS?=
 =?utf-8?B?TWNFelZBS080NzVIa0xnYWF5bVM3YUZsVlFhcE9XdURtNkJ4dWtJYmVHTHBM?=
 =?utf-8?B?UHhoNnJNNzJRZEJZb3Z2ZkRodVMrb2Vwa1lIU3dITjFFNnFFZVhmQm40UmJ0?=
 =?utf-8?B?Y1docUhXY2hra0FPdGk3UkFWVGtvMnRYNThhM0MrUzBuWW00K3V0eXZVbVN1?=
 =?utf-8?B?dkdPcWtjejd3S0p5Q1NpTlNVUGdxbWgwYkU3QVNGdnR6cWtETFBJRWp1SG9Q?=
 =?utf-8?B?dnpMZ3IwY01HV0d2M09tS1graXZMRVpDM2xVY3NrZXB0RG5oajk2enFCWEFM?=
 =?utf-8?B?cFkxdUkzOFlmcEtSaFZrTlRpUS9aWW52MkFzZHZqd2pvSi92MnNXZ3pqN1B1?=
 =?utf-8?B?Vi9VblpZWFNUVVZyWWRVV253SnJKV1Q2amVySXE1R3J0VEpXYkpEWVBCYU96?=
 =?utf-8?B?VXVXSUZ0QjQ3WkFxbWRCNE5BTDBLeE1yUkRhYUNKb1MxZTdGTURlNXNiamlR?=
 =?utf-8?B?T0FXa2psMnJKZmRlWThjZmR5M2dZSkVaN3hEdEtWMUVtclZGZGRtNmt1QXNO?=
 =?utf-8?B?MlIzWGxrd2VmK2RPdGZJN3owd1dONDdGZTR5akxOMGRVS2lqWldzajRacGls?=
 =?utf-8?B?ekhwOEJFL28yV2dqTEQxS3JEa3Zwd1FqT0pndlBXbS9qbE5pSE5FeVVxODJl?=
 =?utf-8?B?Rlh3KzdBOXpwYncvdGdRL2U5aVliVTFmclhHNVFHa01YTXA0Ty9QOEZISVpE?=
 =?utf-8?B?L1Bvdk50VmMyaFZrQ0ZRY1M1YTlwTERxdGRhRHhxdU5mQ3JDci93d0tHUFEz?=
 =?utf-8?B?cHV6YUxYS0U4V3dxMUhadUg2dm84aXI1UWNKMU9aRFFpMndHMEQwVmFDUlU1?=
 =?utf-8?B?WlJQdEJYdldlMVdtQytsQWI4MXlJYmxCK1pBQ2VCMWtFbnNWS3V4VGhoajY3?=
 =?utf-8?B?UUlzTWs1eWJpeWUyQnFoZ1FDbGlVZU9NTWJkY1pwRkttL05EV0RjRWJqMmRu?=
 =?utf-8?B?dkxxQXR2ZS8zSkJvQzBQOUtidGF2WGdLQ0NIeWRVYUowWmNrOUhwMlUwelZG?=
 =?utf-8?B?YVVTZzFvM1hOVGlETlpobnBCOXM1cEUya292aGorYVAyM3dPZzNkZkVkaGV2?=
 =?utf-8?B?L1k0c0NiMmxJdHlyRHlieThSSXRnbStRSmtZQTBPY3dtQTJlTGZXYkN1d1Jj?=
 =?utf-8?B?UG02TElmUERCY1R2SnJVY0FwOEVWMnRtbHRtZmltZW5kNmR6eEZSS3RaUER2?=
 =?utf-8?B?M2tUOW1UMER6TjVSZjlqUjNEbWsrTklRKytYTFZuVkxCVS9uc0RjMHFGSVRJ?=
 =?utf-8?B?c2NjMnE0dUxHNkVLQXZQd3NCNWtoQm1Dd2Yyc3hRakFITjg3WWo0SDN5Rkwv?=
 =?utf-8?B?OFIySnRqQXVLcDc2emE3ZW1mQTkya1JSOWwvQ2R2QjdYdnoxNk0yNzdtUkl4?=
 =?utf-8?B?SklqdyszbzNKYnF6SWczSEd5Q29mVEIxRENwRzREOW04VmtJTXJJeVJSZDhx?=
 =?utf-8?B?YmZNNGtNdUNkT1ZOM1VvMWZaK3FoYmxwelg1NUpUL0NYeldId1VvZVZ1cXNW?=
 =?utf-8?B?Y0ZIcDB3MzZ0RGFOZ3dOK0pIRGRpWUM2azdCeDNKTWtCNExZQTZoRTFTWFdT?=
 =?utf-8?B?cmhYRUl2SkVhclJic29sTlZmbU1DK0dTRXJlcGNXNk1lV0YwemJ0U00raUVE?=
 =?utf-8?B?UVIzS3Ztc0graHg5bnMwWlVOS2xlV3NPZkRSaHAzMkhUV0JvT3NBSzU0cGhK?=
 =?utf-8?B?SEdBVTZrRHRqNE9WdzRPeFNTSG5oUjcwYVYrdENpMkh6bHN2UGRQRWZIYkY0?=
 =?utf-8?B?VEVjZlJETEczYlpNY3h5S29oWVQ3V3l5YUd2S3YrbSt1Tll6azljczB3TkFX?=
 =?utf-8?B?TE9OTWQ5cXp2amdOWEd6Q0FqNmdMYTV2bUd5RE5FTUhzNzhySEk4V3ZYQXpW?=
 =?utf-8?B?bmlLdWZZOVg4RUhnMG5lWVF4VzZKQUhPanVFVXBrMnFiRDlURm02WS9QSVJy?=
 =?utf-8?B?YmV6STY1SDFnMFd2RUJVeEdJMStHOUpkRzRmaEZ2dmxqTU9aWjJiTlZVU1p2?=
 =?utf-8?B?Ry9lNEcxZ1RJQTAzRzdlTFhGeXhYUnBjSEFnVVRNNWJ2Qlh0WVI1TGdqRzNB?=
 =?utf-8?Q?FdHo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c311eaf-44a4-4bf6-1e38-08dbe68dbff9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 10:21:08.8062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Gv+uC/aEJIORuvU1Rcvtfq1NLZSufAxkvMsE63ODXSxPJjiLrFmM9DJ9cJuaEcleJlWvn1RSiOYPEWMDvHDkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8794
Subject: RE: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFRodXJzZGF5LCBOb3ZlbWJlciAxNiwgMjAyMyAzOjQ1IFBNDQo+IA0KPiBPbiAxMS8xNi8yMDIz
IDE6MzUgQU0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPg0KPiA+PiBGcm9tOiBaaHUsIExpbmdz
aGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPg0KPiA+PiBTZW50OiBNb25kYXksIE5vdmVtYmVy
IDEzLCAyMDIzIDI6NTYgUE0NCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4gT24gMTEvMTAvMjAyMyA4
OjMxIFBNLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+Pj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8
bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4+PiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDEw
LCAyMDIzIDE6MjIgUE0NCj4gPj4+Pg0KPiA+Pj4+DQo+ID4+Pj4gT24gMTEvOS8yMDIzIDY6MjUg
UE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+Pj4+IEZyb206IFpodSwgTGluZ3NoYW4gPGxp
bmdzaGFuLnpodUBpbnRlbC5jb20+DQo+ID4+Pj4+PiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIg
OSwgMjAyMyAzOjM5IFBNDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IE9uIDExLzkvMjAy
MyAyOjI4IFBNLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+Pj4+Pj4+IEZyb206IFpodSwgTGlu
Z3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+ID4+Pj4+Pj4+IFNlbnQ6IFR1ZXNkYXks
IE5vdmVtYmVyIDcsIDIwMjMgMzowMiBQTQ0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBPbiAxMS82
LzIwMjMgNjo1MiBQTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+Pj4+Pj4+Pj4+IEZyb206IFpo
dSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+ID4+Pj4+Pj4+Pj4gU2VudDog
TW9uZGF5LCBOb3ZlbWJlciA2LCAyMDIzIDI6NTcgUE0NCj4gPj4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+
Pj4+IE9uIDExLzYvMjAyMyAxMjoxMiBQTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+Pj4+Pj4+
Pj4+Pj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4+
Pj4+Pj4+Pj4+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgNiwgMjAyMyA5OjAxIEFNDQo+ID4+Pj4+
Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4+Pj4gT24gMTEvMy8yMDIzIDExOjUwIFBNLCBQYXJhdiBQYW5k
aXQgd3JvdGU6DQo+ID4+Pj4+Pj4+Pj4+Pj4+IEZyb206IHZpcnRpby1jb21tZW50QGxpc3RzLm9h
c2lzLW9wZW4ub3JnDQo+ID4+Pj4+Pj4+Pj4+Pj4+IDx2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNp
cy0gb3Blbi5vcmc+IE9uIEJlaGFsZiBPZiBaaHUsDQo+ID4+Pj4+Pj4+Pj4+Pj4+IExpbmdzaGFu
DQo+ID4+Pj4+Pj4+Pj4+Pj4+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMywgMjAyMyA4OjI3IFBN
DQo+ID4+Pj4+Pj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4+Pj4+IE9uIDExLzMvMjAyMyA3OjM1IFBN
LCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+Pj4+Pj4+Pj4+Pj4+Pj4gRnJvbTogWmh1IExpbmdz
aGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPg0KPiA+Pj4+Pj4+Pj4+Pj4+Pj4+IFNlbnQ6IEZy
aWRheSwgTm92ZW1iZXIgMywgMjAyMyA0OjA1IFBNDQo+ID4+Pj4+Pj4+Pj4+Pj4+Pj4NCj4gPj4+
Pj4+Pj4+Pj4+Pj4+PiBUaGlzIHBhdGNoIGFkZHMgdHdvIG5ldyBsZTE2IGZpZWxkcyB0byBjb21t
b24NCj4gPj4+Pj4+Pj4+Pj4+Pj4+PiBjb25maWd1cmF0aW9uIHN0cnVjdHVyZSB0byBzdXBwb3J0
IFZJUlRJT19GX1FVRVVFX1NUQVRFDQo+ID4+Pj4+Pj4+Pj4+Pj4+Pj4gaW4gUENJIHRyYW5zcG9y
dA0KPiA+Pj4+IGxheWVyLg0KPiA+Pj4+Pj4+Pj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFpodSBM
aW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4+Pj4+Pj4+Pj4+Pj4+PiAtLS0N
Cj4gPj4+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgICB0cmFuc3BvcnQtcGNpLnRleCB8IDE4ICsrKysr
KysrKysrKysrKysrKw0KPiA+Pj4+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgIDEgZmlsZSBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspDQo+ID4+Pj4+Pj4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+Pj4+Pj4+
PiBkaWZmIC0tZ2l0IGEvdHJhbnNwb3J0LXBjaS50ZXggYi90cmFuc3BvcnQtcGNpLnRleA0KPiA+
Pj4+Pj4+Pj4+Pj4+Pj4+IGluZGV4DQo+ID4+Pj4+Pj4+Pj4+Pj4+Pj4gYTVjNjcxOS4uMzE2MTUx
OSAxMDA2NDQNCj4gPj4+Pj4+Pj4+Pj4+Pj4+PiAtLS0gYS90cmFuc3BvcnQtcGNpLnRleA0KPiA+
Pj4+Pj4+Pj4+Pj4+Pj4+ICsrKyBiL3RyYW5zcG9ydC1wY2kudGV4DQo+ID4+Pj4+Pj4+Pj4+Pj4+
Pj4gQEAgLTMyNSw2ICszMjUsMTAgQEAgXHN1YnN1YnNlY3Rpb257Q29tbW9uDQo+ID4+IGNvbmZp
Z3VyYXRpb24NCj4gPj4+Pj4+Pj4+Pj4+IHN0cnVjdHVyZQ0KPiA+Pj4+Pj4+Pj4+Pj4+Pj4+IGxh
eW91dH1cbGFiZWx7c2VjOlZpcnRpbyBUcmFuc3BvcnQNCj4gPj4+Pj4+Pj4+Pj4+Pj4+PiAgICAg
ICAgICAgICAgICAgIC8qIEFib3V0IHRoZSBhZG1pbmlzdHJhdGlvbiB2aXJ0cXVldWUuICovDQo+
ID4+Pj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICBsZTE2IGFkbWluX3F1ZXVlX2luZGV4
OyAgICAgICAgIC8qIHJlYWQtb25seSBmb3INCj4gZHJpdmVyDQo+ID4+Pj4gKi8NCj4gPj4+Pj4+
Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgIGxlMTYgYWRtaW5fcXVldWVfbnVtOyAgICAgICAg
IC8qIHJlYWQtb25seSBmb3INCj4gZHJpdmVyDQo+ID4+Pj4gKi8NCj4gPj4+Pj4+Pj4+Pj4+Pj4+
PiArDQo+ID4+Pj4+Pj4+Pj4+Pj4+Pj4gKwkvKiBWaXJ0cXVldWUgc3RhdGUgKi8NCj4gPj4+Pj4+
Pj4+Pj4+Pj4+PiArICAgICAgICBsZTE2IHF1ZXVlX2F2YWlsX3N0YXRlOyAgICAgICAgIC8qIHJl
YWQtd3JpdGUgKi8NCj4gPj4+Pj4+Pj4+Pj4+Pj4+PiArICAgICAgICBsZTE2IHF1ZXVlX3VzZWRf
c3RhdGU7ICAgICAgICAgIC8qIHJlYWQtd3JpdGUgKi8NCj4gPj4+Pj4+Pj4+Pj4+Pj4+IFRoaXMg
dGlueSBpbnRlcmZhY2UgZm9yIDEyOCB2aXJ0aW8gbmV0IHF1ZXVlcyB0aHJvdWdoDQo+ID4+Pj4+
Pj4+Pj4+Pj4+PiByZWdpc3RlciByZWFkIHdyaXRlcywgZG9lcw0KPiA+Pj4+Pj4+Pj4+Pj4+PiBu
b3Qgd29yayBlZmZlY3RpdmVseS4NCj4gPj4+Pj4+Pj4+Pj4+Pj4+IFRoZXJlIGFyZSBpbmZsaWdo
dCBvdXQgb2Ygb3JkZXIgZGVzY3JpcHRvcnMgZm9yIGJsb2NrIGFsc28uDQo+ID4+Pj4+Pj4+Pj4+
Pj4+PiBIZW5jZSB0b3kgcmVnaXN0ZXJzIGxpa2UgdGhpcyBkbyBub3Qgd29yay4NCj4gPj4+Pj4+
Pj4+Pj4+Pj4gRG8geW91IGtub3cgdGhlcmUgaXMgYSBxdWV1ZV9zZWxlY3Q/IFdoeSB0aGlzIGRv
ZXMgbm90DQo+IHdvcms/DQo+ID4+Pj4+Pj4+Pj4+Pj4+IERvIHlvdSBrbm93IGhvdyBvdGhlciBx
dWV1ZSByZWxhdGVkIGZpZWxkcyB3b3JrPw0KPiA+Pj4+Pj4+Pj4+Pj4+IDopDQo+ID4+Pj4+Pj4+
Pj4+Pj4gWWVzLiBJZiB5b3Ugbm90aWNlIHF1ZXVlX3Jlc2V0IHJlbGF0ZWQgY3JpdGljYWwgc3Bl
YyBidWcNCj4gPj4+Pj4+Pj4+Pj4+PiBmaXggd2FzIGRvbmUgd2hlbiBpdA0KPiA+Pj4+Pj4+Pj4+
Pj4gd2FzIGludHJvZHVjZWQgc28gdGhhdCBsaXZlIG1pZ3JhdGlvbiBjYW4gX2FjdHVhbGx5XyB3
b3JrLg0KPiA+Pj4+Pj4+Pj4+Pj4+IFdoZW4gcXVldWVfc2VsZWN0IGlzIGRvbmUgZm9yIDEyOCBx
dWV1ZXMgc2VyaWFsbHksIGl0IHRha2UNCj4gPj4+Pj4+Pj4+Pj4+PiBhIGxvdCBvZiB0aW1lIHRv
DQo+ID4+Pj4+Pj4+Pj4+PiByZWFkIHRob3NlIHNsb3cgcmVnaXN0ZXIgaW50ZXJmYWNlIGZvciB0
aGlzICsgaW5mbGlnaHQNCj4gPj4+Pj4+Pj4+Pj4+IGRlc2NyaXB0b3JzICsNCj4gPj4+PiBtb3Jl
Lg0KPiA+Pj4+Pj4+Pj4+Pj4gaW50ZXJlc3RpbmcsIHZpcnRpbyB3b3JrIGluIHRoaXMgcGF0dGVy
biBmb3IgbWFueSB5ZWFycywgcmlnaHQ/DQo+ID4+Pj4+Pj4+Pj4+IEFsbCB0aGVzZSB5ZWFycyA0
MDBHYnBzIGFuZCA4MDBHYnBzIHZpcnRpbyB3YXMgbm90IHByZXNlbnQsDQo+ID4+Pj4+Pj4+Pj4+
IG51bWJlciBvZg0KPiA+Pj4+Pj4+Pj4+IHF1ZXVlcyB3ZXJlIG5vdCBpbiBody4NCj4gPj4+Pj4+
Pj4+PiBUaGUgcmVnaXN0ZXJzIGFyZSBjb250cm9sIHBhdGggaW4gY29uZmlnIHNwYWNlLCBob3cg
NDAwRyBvcg0KPiA+Pj4+Pj4+Pj4+IDgwMEcNCj4gPj4+PiBhZmZlY3Q/Pw0KPiA+Pj4+Pj4+Pj4g
QmVjYXVzZSB0aG9zZSBhcmUgdGhlIG9uZSBpbiBwcmFjdGljZSByZXF1aXJlcyBsYXJnZSBudW1i
ZXIgb2YgVlFzLg0KPiA+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+IFlvdSBhcmUgYXNraW5nIHBlciBW
USByZWdpc3RlciBjb21tYW5kcyB0byBtb2RpZnkgdGhpbmdzDQo+ID4+Pj4+Pj4+PiBkeW5hbWlj
YWxseSB2aWENCj4gPj4+Pj4+Pj4gdGhpcyBvbmUgdnEgYXQgYSB0aW1lLCBzZXJpYWxpemluZyBh
bGwgdGhlIG9wZXJhdGlvbnMuDQo+ID4+Pj4+Pj4+PiBJdCBkb2VzIG5vdCBzY2FsZSB3ZWxsIHdp
dGggaGlnaCBxIGNvdW50Lg0KPiA+Pj4+Pj4+PiBUaGlzIGlzIG5vdCBkeW5hbWljYWxseSwgaXQg
b25seSBoYXBwZW5zIHdoZW4gU1VTUEVORCBhbmQgUkVTVU1FLg0KPiA+Pj4+Pj4+PiBUaGlzIGlz
IHRoZSBzYW1lIG1lY2hhbmlzbSBob3cgdmlydGlvIGluaXRpYWxpemUgYSB2aXJ0cXVldWUsDQo+
ID4+Pj4+Pj4+IHdvcmtpbmcgZm9yIG1hbnkgeWVhcnMuDQo+ID4+Pj4+Pj4gTm8uIHdoZW4gdmly
dGlvIGRyaXZlciBpbml0aWFsaXplcyBpdCBmb3IgdGhlIGZpcnN0IHRpbWUsIHRoZXJlDQo+ID4+
Pj4+Pj4gaXMgbm8gYWN0aXZlIHRyYWZmaWMNCj4gPj4+Pj4+IHRoYXQgZ2V0cyBsb3N0Lg0KPiA+
Pj4+Pj4+IFRoaXMgaXMgYmVjYXVzZSB0aGUgaW50ZXJmYWNlIGlzIG5vdCB5ZXQgdXAgYW5kIG5v
dCBwYXJ0IG9mIHRoZQ0KPiA+Pj4+Pj4+IG5ldHdvcmsNCj4gPj4geWV0Lg0KPiA+Pj4+Pj4+IFRo
ZSByZXN1bWUgbXVzdCBiZSBmYXN0IGVub3VnaCwgYmVjYXVzZSB0aGUgcmVtb3RlIG5vZGUgaXMN
Cj4gPj4+Pj4+PiBzZW5kaW5nDQo+ID4+Pj4+PiBwYWNrZXRzLg0KPiA+Pj4+Pj4+IEhlbmNlIGl0
IGlzIGRpZmZlcmVudCBmcm9tIGRyaXZlciBpbml0IHRpbWUgcXVldWUgZW5hYmxlLg0KPiA+Pj4+
Pj4gSSBhbSBub3Qgc3VyZSBhbnkgcGFja2V0cyBhcnJpdmUgYmVmb3JlIGEgbGluayBhbm5vdW5j
ZSBhdCB0aGUNCj4gPj4+Pj4+IGRlc3RpbmF0aW9uDQo+ID4+Pj4gc2lkZS4NCj4gPj4+Pj4gSSB0
aGluayBpdCBjYW4uDQo+ID4+Pj4+IEJlY2F1c2UgdGhlcmUgaXMgbm8gbm90aWZpY2F0aW9uIG9m
IG1lbWJlciBkZXZpY2UgbGluayBkb3duDQo+ID4+Pj4+IGludGltYXRpb24gdG8NCj4gPj4+PiBy
ZW1vdGUgc2lkZS4NCj4gPj4+Pj4gVGhlIEw0IGFuZCBMNSBwcm90b2NvbHMgaGF2ZSBubyBrbm93
bGVkZ2UgdGhhdCBub2RlIHdoaWNoIHRoZXkgYXJlDQo+ID4+Pj4gaW50ZXJhY3RpbmcgaXMgYmVo
aW5kIHNvbWUgbGF5ZXJzIG9mIHN3aXRjaGVzLg0KPiA+Pj4+PiBTbyBrZWVwaW5nIHRoaXMgdGlt
ZSBsb3cgaXMgZGVzaXJlZC4NCj4gPj4+PiBUaGUgTklDIHNob3VsZCBicm9hZCBjYXN0IGl0c2Vs
ZiBmaXJzdCwgc28gdGhhdCBvdGhlciBwZWVycyBpbiB0aGUNCj4gPj4+PiBuZXR3b3JrIGtub3co
Zm9yIGV4YW1wbGUgaXRzIG1hYyB0byByb3V0ZSBpdCkgaG93IHRvIHNlbmQgYSBtZXNzYWdlIHRv
DQo+IGl0Lg0KPiA+Pj4+DQo+ID4+Pj4gVGhpcyBpcyBuZWNlc3NhcnksIGZvciBleGFtcGxlIFZJ
UlRJT19ORVRfRl9HVUVTVF9BTk5PVU5DRSwgc2ltaWxhcg0KPiA+Pj4+IG1lY2hhbmlzbSB3b3Jr
IGZvciBpbi1tYXJrZXRpbmcgcHJvZHVjdGlvbnMgZm9yIHllYXJzLg0KPiA+Pj4+DQo+ID4+Pj4g
VGhpcyBpcyBvdXQgb2YgdGhlIHRvcGljIGFueXdheS4NCj4gPj4+Pj4+Pj4+PiBTZWUgdGhlIHZp
cnRpbyBjb21tb24gY2ZnLCB5b3Ugd2lsbCBmaW5kIHRoZSBtYXggbnVtYmVyIG9mDQo+ID4+Pj4+
Pj4+Pj4gdnFzIGlzIHRoZXJlLCBudW1fcXVldWVzLg0KPiA+Pj4+Pj4+Pj4gOikNCj4gPj4+Pj4+
Pj4+IFN1cmUuIHRob3NlIHZhbHVlcyBhdCBoaWdoIHEgY291bnQgYWZmZWN0cy4NCj4gPj4+Pj4+
Pj4gdGhlIGRyaXZlciBuZWVkIHRvIGluaXRpYWxpemUgdGhlbSBhbnl3YXkuDQo+ID4+Pj4+Pj4g
VGhhdCBpcyBiZWZvcmUgdGhlIHRyYWZmaWMgc3RhcnRzIGZyb20gcmVtb3RlIGVuZC4NCj4gPj4+
Pj4+IHNlZSBhYm92ZSwgdGhhdCBuZWVkcyBhIGxpbmsgYW5ub3VuY2UgYW5kIHRoaXMgaXMgYWZ0
ZXINCj4gPj4+Pj4+IHJlLWluaXRpYWxpemF0aW9uDQo+ID4+Pj4+Pj4+Pj4+IERldmljZSBkaWRu
4oCZdCBzdXBwb3J0IExNLg0KPiA+Pj4+Pj4+Pj4+PiBNYW55IGxpbWl0YXRpb25zIGV4aXN0ZWQg
YWxsIHRoZXNlIHllYXJzIGFuZCBUQyBpcyBpbXByb3ZpbmcNCj4gPj4+Pj4+Pj4+Pj4gYW5kIGV4
cGFuZGluZw0KPiA+Pj4+Pj4+Pj4+IHRoZW0uDQo+ID4+Pj4+Pj4+Pj4+IFNvIGFsbCB0aGVzZSB5
ZWFycyBkbyBub3QgbWF0dGVyLg0KPiA+Pj4+Pj4+Pj4+IE5vdCBzdXJlIHdoYXQgYXJlIHlvdSB0
YWxraW5nIGFib3V0LCBoYXZlbid0IHdlIGluaXRpYWxpemUNCj4gPj4+Pj4+Pj4+PiB0aGUgZGV2
aWNlIGFuZCB2cXMgaW4gY29uZmlnIHNwYWNlIGZvciB5ZWFycz8/Pz8/PyBXaGF0J3MNCj4gPj4+
Pj4+Pj4+PiB3cm9uZyB3aXRoIHRoaXMNCj4gPj4+Pj4+IG1lY2hhbmlzbT8NCj4gPj4+Pj4+Pj4+
PiBBcmUgeW91IHF1ZXN0aW9uaW5nIHZpcml0by1wY2kgZnVuZGFtZW50YWxzPz8/DQo+ID4+Pj4+
Pj4+PiBEb27igJl0IHBvaW50IHRvIGluLWVmZmljaWVudCBwYXN0IHRvIGVzdGFibGlzaCBzaW1p
bGFyIGluLWVmZmljaWVudCBmdXR1cmUuDQo+ID4+Pj4+Pj4+IGludGVyZXN0aW5nLCB5b3Uga25v
dyB0aGlzIGlzIGEgb25lLXRpbWUgdGhpbmcsIHJpZ2h0Pw0KPiA+Pj4+Pj4+PiBhbmQgeW91IGFy
ZSBhd2FyZSBvZiB0aGlzIGhhcyBiZWVuIHRoZXJlIGZvciB5ZWFycy4NCj4gPj4+Pj4+Pj4+Pj4+
Pj4gTGlrZSBob3cgdG8gc2V0IGEgcXVldWUgc2l6ZSBhbmQgZW5hYmxlIGl0Pw0KPiA+Pj4+Pj4+
Pj4+Pj4+IFRob3NlIGFyZSBtZWFudCB0byBiZSB1c2VkIGJlZm9yZSBEUklWRVJfT0sgc3RhZ2Ug
YXMgdGhleQ0KPiA+Pj4+Pj4+Pj4+Pj4+IGFyZSBpbml0IHRpbWUNCj4gPj4+Pj4+Pj4+Pj4+IHJl
Z2lzdGVycy4NCj4gPj4+Pj4+Pj4+Pj4+PiBOb3QgdG8ga2VlcCBhYnVzaW5nIHRoZW0uLg0KPiA+
Pj4+Pj4+Pj4+Pj4gZG9uJ3QgeW91IG5lZWQgdG8gc2V0IHF1ZXVlX3NpemUgYXQgdGhlIGRlc3Rp
bmF0aW9uIHNpZGU/DQo+ID4+Pj4+Pj4+Pj4+IE5vLg0KPiA+Pj4+Pj4+Pj4+PiBCdXQgdGhlIHNy
Yy9kc3QgZG9lcyBub3QgbWF0dGVyLg0KPiA+Pj4+Pj4+Pj4+PiBRdWV1ZV9zaXplIHRvIGJlIHNl
dCBiZWZvcmUgRFJJVkVSX09LIGxpa2UgcmVzdCBvZiB0aGUNCj4gPj4+Pj4+Pj4+Pj4gcmVnaXN0
ZXJzLCBhcyBhbGwNCj4gPj4+Pj4+Pj4+PiBxdWV1ZXMgbXVzdCBiZSBjcmVhdGVkIGJlZm9yZSB0
aGUgZHJpdmVyX29rIHBoYXNlLg0KPiA+Pj4+Pj4+Pj4+PiBRdWV1ZV9yZXNldCB3YXMgbGFzdCBt
b21lbnQgZXhjZXB0aW9uLg0KPiA+Pj4+Pj4+Pj4+IGNyZWF0ZSBhIHF1ZXVlPyBOdmlkaWEgc3Bl
Y2lmaWM/DQo+ID4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+IEh1aC4gTm8uDQo+ID4+Pj4+Pj4+PiBE
byBnaXQgbG9nIGFuZCByZWFsaXplIHdoYXQgaGFwcGVuZWQgd2l0aCBxdWV1ZV9yZXNldC4NCj4g
Pj4+Pj4+Pj4gWW91IGRpZG4ndCBhbnN3ZXIgdGhlIHF1ZXN0aW9uLCBkb2VzIHRoZSBzcGVjIGV2
ZW4gaGFzIGRlZmluZWQNCj4gPj4+Pj4+Pj4gImNyZWF0ZSBhDQo+ID4+Pj4+PiB2cSI/DQo+ID4+
Pj4+Pj4gRW5hYmxlZC9jcmVhdGVkID0gdG9tYXRvL3RvbWF0byB3aGVuIGRpc2N1c3NpbmcgdGhl
IHNwZWMgaW4NCj4gPj4+Pj4+PiBub24tbm9ybWF0aXZlDQo+ID4+Pj4+PiBlbWFpbCBjb252ZXJz
YXRpb24uDQo+ID4+Pj4+Pj4gSXQncyBpcnJlbGV2YW50Lg0KPiA+Pj4+Pj4gVGhlbiBsZXRzIG5v
dCBkZWJhdGUgb24gdGhpcyBlbmFibGUgYSB2cSBvciBjcmVhdGUgYSB2cSBhbnltb3JlDQo+ID4+
Pj4+Pj4gQWxsIEkgYW0gc2F5aW5nIGlzLCB3aGVuIHdlIGtub3cgdGhlIGxpbWl0YXRpb25zIG9m
IHRoZQ0KPiA+Pj4+Pj4+IHRyYW5zcG9ydCBhbmQgd2hlbiBpbmR1c3RyeSBpcyBmb3J3YXJkaW5n
IHRvIG5vdCBpbnRyb2R1Y2VkIG1vcmUNCj4gPj4+Pj4+PiBhbmQgbW9yZSBvbi1kaWUgcmVnaXN0
ZXINCj4gPj4+Pj4+IGZvciBvbmNlIGluIGxpZmV0aW1lIHdvcmsgb2YgZGV2aWNlIG1pZ3JhdGlv
biwgd2UganVzdCB1c2UgdGhlDQo+ID4+Pj4+PiBvcHRpbWFsIGNvbW1hbmQgYW5kIHF1ZXVlIGlu
dGVyZmFjZSB0aGF0IGlzIG5hdGl2ZSB0byB2aXJ0aW8uDQo+ID4+Pj4+PiBQQ0kgY29uZmlnIHNw
YWNlIGhhcyBpdHMgb3duIGxpbWl0YXRpb25zLCBhbmQgYWRtaW4gdnEgaGFzIGl0cw0KPiA+Pj4+
Pj4gYWR2YW50YWdlcywgYnV0IHRoYXQgZG9lcyBub3QgYXBwbHkgdG8gYWxsIHVzZSBjYXNlcy4N
Cj4gPj4+Pj4+DQo+ID4+Pj4+IFRoZXJlIHdhcyBhIHJlY2VudCB3b3JrIGRvbmUgZW11bGF0aW5n
IHRoZSBTUi1JT1YgY2FwIGFuZCBhbGxvd2luZw0KPiA+Pj4+PiBWTSB0bw0KPiA+Pj4+IGVuYWJs
ZSBTUi1JT1YgaW4gWzFdLg0KPiA+Pj4+PiBUaGlzIGlzIHRoZSBvcHRpb24gSSBtZW50aW9uZWQg
ZmV3IHdlZWtzIGFnby4NCj4gPj4+Pj4NCj4gPj4+Pj4gU28gd2l0aCBhZG1pbiBjb21tYW5kcyBh
bmQgYWRtaW4gdmlydHF1ZXVlcywgZXZlbiBuZXN0ZWQgbW9kZWwNCj4gPj4+Pj4gd2lsbCB3b3Jr
DQo+ID4+Pj4gdXNpbmcgWzFdLg0KPiA+Pj4+PiBbMV0NCj4gPj4+Pj4gaHR0cHM6Ly9uZXRkZXZj
b25mLmluZm8vMHgxNy9zZXNzaW9ucy90YWxrL3VubGVhc2hpbmctc3ItaW92LW9mZmxvDQo+ID4+
Pj4+IGFkDQo+ID4+Pj4+IC1vDQo+ID4+Pj4+IG4tdmlydHVhbC1tYWNoaW5lcy5odG1sDQo+ID4+
Pj4gV2Ugc2hvdWxkIHRha2UgdGhpcyBpbnRvIGNvbnNpZGVyYXRpb24gb25jZSBpdCBpcyBzdGFu
ZGFyZGl6ZWQgaW4NCj4gPj4+PiB0aGUgc3BlYywgbWF5YmUgbm90IG5vdywgdGhlcmUgY2FuIGFs
d2F5cyBiZSBtYW55IHdvcmthcm91bmRzIHRvDQo+ID4+Pj4gc29sdmUgb25lDQo+ID4+IHByb2Js
ZW0uDQo+ID4+PiBTdXJlLCB1bnRpbCB0aGF0IHBvaW50IHRoZSBhZG1pbiBjb21tYW5kcyBhcmUg
YWJsZSB0byBzdWZmaWNlIHRoZSBuZWVkDQo+IHdlbGwuDQo+ID4+PiBBbmQgd2hlbiB0aGUgc3Bl
YyBjaGFuZ2VzIGluIHRyYW5zcG9ydCBvY2N1cnMgKGlmIG5lZWRlZCksIGN1cnJlbnQNCj4gPj4+
IGFkbWluDQo+ID4+IGNvbW1hbmQgYW5kIGFkbWluIHZxIGFsc28gZml0cyB2ZXJ5IHdlbGwgdGhh
dCB3aWxsIGZvbGxvdyBhYm92ZSBbMV0uDQo+ID4+IHdlIGhhdmUgcG9pbnRlZCBsb3RzIG9mIHBy
b2JsZW1zIGZvciBhZG1pbiB2cSBiYXNlZCBsaXZlIG1pZ3JhdGlvbg0KPiA+PiBwcm9wb3NhbCwg
SSB3b24ndCByZXBlYXQgdGhlbSBoZXJlDQo+ID4gSSBkb27igJl0IHNlZSBhbnkuDQo+ID4gTmVz
dGVkIGlzIGFscmVhZHkgc29sdmVkIHVzaW5nIGFib3ZlLg0KPiBJIGRvbid0IHNlZSBob3csIGRv
IHlvdSBtaW5kIHRvIHdvcmsgb3V0IHRoZSBwYXRjaGVzPw0KT25jZSB0aGUgYmFzZSBzZXJpZXMg
aXMgY29tcGxldGVkLCBuZXN0ZWQgY2FzZXMgY2FuIGJlIGFkZHJlc3NlZC4NCkkgd29udCBiZSBh
YmxlIHRvIHdvcmsgb24gdGhlIHBhdGNoZXMgZm9yIGl0IHVudGlsIHdlIGZpbmlzaCBmb3IgdGhl
IGZpcnN0IGxldmVsIHZpcnR1YWxpemF0aW9uLg0KDQo+ID4gTG9uZyB0aW1lIGFnbywgeW91IG1l
bnRpb25lZCBzb21lIFFvUyBpc3N1ZSwgd2hpY2ggYW55d2F5IGV4aXN0cyBpbiB0aGUNCj4gZGV2
aWNlIHJlZ2lzdGVyIG1ldGhvZCB0b28uDQo+ID4gQ2FuIHlvdSBwbGVhc2UgbGlzdCB0aGVtIGlm
IGFueXRoaW5nIG90aGVyIHRoYW4gUW9TIGFuZCBuZXN0Pw0KDQo=

