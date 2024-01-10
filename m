Return-Path: <virtio-comment-return-8900-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5DEC3DA6E
	for <virtio-comment@archiver.kernel.org>; Wed, 10 Jan 2024 04:42:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CE4362AFD9
	for <virtio-comment@archiver.kernel.org>; Wed, 10 Jan 2024 04:42:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ADD3B98667A
	for <virtio-comment@archiver.kernel.org>; Wed, 10 Jan 2024 04:42:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8D747984087; Wed, 10 Jan 2024 04:42:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 78CEB986670;
	Wed, 10 Jan 2024 04:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I24IJGHdVg1l0tKZBDdpiBEezieafZjN3CVxKRtI5nlnvUmzN1mQ0emHqfJAGVVXl8S3RSJH9mPmFpb3jaFUgcJvUcGM/vhBbpnpkRC3RQVFohHfW35JtOt2A0eTt5ZfWhcWNgOg6Pv+A8h6phLOx6cbOA+I5nCoWtbSttx/+IKp6oJ1PGpxl+632BtsB9U2JWI9GymzKSgXCOXAorwqPVcy8xVSvqtp3U20aFJWXXjCgfeVO5VQRLMtemC+MXGdVjYTkkptjLvtrlGnAUltTGBEMYe60uRh/KVHgqza8OIgmMaEMOGtH78vvBRY1RsudnWAccHamWogT7CYHKK4WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6VZYa6bWeDVX8mAsD1P8etDPCW70VgWxK9n3v8j7Ao=;
 b=EyP11PCvHIivrXghY5Zd2m0v0cVvKDKM9nd2DQT50K4aEYq5/oOnMQne2bsTvRnrltu6EsPLZ57PtlKAoavcmfSflH0x2I6ruQT1bV3/3HEdTU7GHfPZd8XxPBvtQLns5w9DdKJU/fI1t+v4IpGl+GkVT6rz+v11Ok9CAj533wMJ1ppPNcAZgHSXOF/pXMu2Hw1E8uXPeYqv0inqkDeWbG+k+1Bb30wqMesTq7oOUzsNzqR0ohof0IXdplEtGRbaK9il5phjyzQ5smST0ViTfNJkZhJZk8v5mvhG0uosP2nBxyNjXjFko7dm3MFAlcO5xtzbRwzkWEdvzYhk5L7qSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: virtio-net collaboration bi-weekly
Thread-Index: AQHaQ3eGfUzeVK28hESGtTiRF55xrrDSasSAgAAM3dA=
Date: Wed, 10 Jan 2024 04:42:34 +0000
Message-ID:
 <PH0PR12MB5481E125C27A45B5E38C534CDC692@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <calendar-f31007d9-6ee0-47ad-b2c2-86e16fbe73c4@google.com>
 <1704858929.6283097-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1704858929.6283097-1-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB5961:EE_
x-ms-office365-filtering-correlation-id: cc45a3ef-5214-4b0a-c3bd-08dc11969078
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aH/iE6tq6F2fXm6WSlXs0+b1TeyOolMynPLdFTbCdsakWTtTUV29CfmtrwzREJc0/zmVfTW78naRF2SFKZBiQI8r7Yc+IwVqUeQfajmLlAP+1FwI8E1LKVB9/09rxwsd68L6558ShoomtAoyxCqHTuYsSaLb0rP4CchQkToS6nOL1zhk9vBqcwVOQV+NDK4Yy1erAvXoUdWn8r1eR6rYbqrdviu+ryKWVhrQktCdOpgFs8/XdQ69fF/ZwXSCvHSeYsmguUsiIj8J9OzjkknTkbcAyUfwksAQVf0tSZ8vRcXQvVSdGVokVlsl1VcuccE1p1Z+5lAA9Ruf70IRd3FiKVKy+kackc5pDsflj7qdfgFjN85rTgMrbueYDn8/fNSuKqVdpXfp234luiqoYS7ShDFrYx1dyDGGN/ZLBiusp9Rgix7TTwVA9ObR/9tcCuR+0hQIyJARj8ty/zO82QuXFvYiP6K1kte2plOgP9ZO8yVal/nQVS0n2eM/7A6xa7kNGRsp33KmvC7xLO7lpLZb5u61HA0UcqSU70mjB7tYaDyME5azP1cfQhzvhuz0paF4ji6wnQU+TdxQO4i8SwjVXbvJ/VCTCTaLRXjPukAr8WJDgsme336hu7nnlIoHL75/a/DofpuSyXOAQkWQsozpu8D3BrQerZkghwAJuebWn93s7WXfGmqX4u2jWgk1wOGf
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(39860400002)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(83380400001)(966005)(6506007)(66476007)(26005)(3480700007)(122000001)(9686003)(53546011)(38100700002)(4326008)(8936002)(52536014)(64756008)(2906002)(478600001)(66446008)(7696005)(71200400001)(8676002)(54906003)(5660300002)(6916009)(66556008)(66946007)(316002)(76116006)(41300700001)(38070700009)(33656002)(40140700001)(86362001)(55016003)(5930299018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WjZaVHo0cFdiSk9TSktacnFHTjk2b1ZXT1d6aER2WklUUzRPTE9SeXRxRUpv?=
 =?utf-8?B?aGdDWFhxMGg4dXhORXJyTW1kU3V0VnJCUkJJNXZhNndEUENhTjA1Vjd5Y1JI?=
 =?utf-8?B?Z3RKQXcwa0xkNjlhQjJ2NzU5bmdiWkRzeTNabkNqbzA2dEdBVCtpYldEMTRv?=
 =?utf-8?B?WDI3RXNsRlpCb3owc0FpaVlDM0RRaGo5aytGUk1BdTFFZ3duRFZlZHR5bmRt?=
 =?utf-8?B?Y3BuZUptM25MSTRLb1ZOWFg2Y2FFNUphbk53NVZDWVI0MHdVSy8vVWNRTThq?=
 =?utf-8?B?U1RLRkl2WEJuMjRoVTlhajZleHJEMGp2a0VZZ1A2aExVY1VjY0RKTkM3QnNp?=
 =?utf-8?B?SEdRL0pXVUpMckU2dDdtV0RZRWlDY08vK0JDamIxUWhJVHNZTktCUzNQZytt?=
 =?utf-8?B?eTl5dGJHOW9lN3c0ZzFjYXUzUzdzTllsd2ZCVzNiWTlJWVBpakNpNVBCVm1l?=
 =?utf-8?B?RklTb3ZkdEJQcnlQMklPejNmK2daWjNWUUR5RDB1bklsVTdiVTUzRmx0NFZV?=
 =?utf-8?B?LzlRMTcySWtORkdkRGpwQmh4Y09CZzVmNGd2SVdKQ2QzWHg4SDg2SE1XRTZX?=
 =?utf-8?B?Q2NsNmJ5TkRlWDVheFAyT1ZtM0N1azhXcDNSZG9LZGFmcDZyTkJBa0xTdDd2?=
 =?utf-8?B?ZmM2cjhqQjRud1o1WWJ4WUZQck1OcEVwdkJEUXE5T0NZdlZKOEhxL2x2Y2xz?=
 =?utf-8?B?SXdkVGQwWXZ6a0FteWllRGJvWnAwR3RveDVleVdMcm5ndXdaeUhwb2hkZXQz?=
 =?utf-8?B?YUo3MVhqMnpjbW1JSzBVQ2VqWCtBY0JNR1NmLzVzNElsYnR5dDlQcTl2WExG?=
 =?utf-8?B?bnFjWk5LNzAzRG5KUW53emV0cTMvYnFUaGpNbTVzTEdKMGUvcDRqRE0xejVp?=
 =?utf-8?B?bzNDTFdwSE40bUFXcXNlSldEVUt1cm4reGt1QllyTGQ5RTFseTEya29mNlk3?=
 =?utf-8?B?V2sxd0xTTlFvWnZHcUd2VTFNZDdvRU96QjhTM1BuUTJCQUQvY0hlRjBPMkUr?=
 =?utf-8?B?RTRHdVZTSEJjRWVNNlZPUHg2RGZDalUrWGlwVmhBVytCSFBFbnQvN3dpRnFy?=
 =?utf-8?B?WG9pWXhJS3N4amFMeG8wc2MzMnhvL3FneXorTjFVVCs1aE5kSTRXeVN1Nm5E?=
 =?utf-8?B?djRSV2ZOeXhpWGJZTmhVVGcwcUhTN0lFd1pKU2VQbzRURkgyblR0U3lkdTAy?=
 =?utf-8?B?ZWlhVUhab3NYRnlzd21zU21hM2tTZnFWRGlxS0dYVWJpZHg0RDRWVG95cWpX?=
 =?utf-8?B?K3BBaHQ4dzRzeGU5UFFEbnhzelFPTUNGcloxT3pDQTlnT3dxTzZ3YlB6NWxE?=
 =?utf-8?B?cGVvSDFlZEt4UzM1RU5EZXlDY1NueUt0WkR6REUvRDBESTVlV1daR1RObEFU?=
 =?utf-8?B?N25ITnBDT1ZNcHMzT1ZNditrcGVCOHFtdGFxOVVKcWpXZVpwUWZNcUFDY2ZK?=
 =?utf-8?B?em9yQ0RneTBnNzNVcGtvaFFxSlVON2Y1R3FvditFVzhsSnBER0RBMDJmMmZu?=
 =?utf-8?B?d0VaMzl6VWZSWFR0UllTckJXOUJGQWE1WExHSEZTLzZOUUZKOHZxRjZEUHVt?=
 =?utf-8?B?RlBGY1RHUk1MNUsvbnBPdjRFdWVKbTJDcEtoTDdvdGFWVmFDQ002L0lTMVBM?=
 =?utf-8?B?RFV2WllUdEc3cVBhQ3d2eGF2YUpqWlRrbi9hSVZ0ZW16cGJYTXVvYTJMd0E2?=
 =?utf-8?B?djlyZmJRWUhhNFZlU2Q2U3ZhcXdkZXVUTU9QUU8zWDJYYnlsb0ZDcnlWWUwx?=
 =?utf-8?B?N1dnaXVkYzVkOFpQdGZvV2tEUVphVWNjZFRBVWFNeFpuNUF6ZWF3dm1yWVh2?=
 =?utf-8?B?SjZma3FnUmYreDBjK2NzWGlvbmxtaHViajdmWURZRjg1YjRqZFJKeHNNdjFQ?=
 =?utf-8?B?UytnRnlmOWJUb1VzdjJ6QjBRaDlCNEJmZXpyb1JSSFh4ZnczdFA0bmFHU2lF?=
 =?utf-8?B?eDk5Y3k3ejAySVVRaUZ6cE1VRUd1YWdGSlQ4Y0YyNDJuWFlOMjhBclpycHVW?=
 =?utf-8?B?dmRpZTdGOGRuaHUzcFpNWSs3OGpYQVRuNTMrTlo4Z0tyT2kxTDZMV2R6SGNm?=
 =?utf-8?B?aTEwWm5IK0pZcU4xaVhwTGZPMkZjcUdVWVZjS2VSWERnR2wwYlZxNkx0dkpo?=
 =?utf-8?Q?2upA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc45a3ef-5214-4b0a-c3bd-08dc11969078
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2024 04:42:34.6047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W/E/M4aYRENRZHtJJURM+ce0mCFxxwtxjLUiDWBq1+t2bCD7CD3C2I3EDCz9u1MLGvSiLWZ2UmD3LZLgqtSP6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5961
Subject: [virtio-comment] RE: virtio-net collaboration bi-weekly

DQoNCj4gRnJvbTogWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbT4NCj4gU2Vu
dDogV2VkbmVzZGF5LCBKYW51YXJ5IDEwLCAyMDI0IDk6MjUgQU0NCj4gVG86IFBhcmF2IFBhbmRp
dCA8cGFyYXZAbnZpZGlhLmNvbT4NCj4gQ2M6IGhlbmdxaUBsaW51eC5hbGliYWJhLmNvbTsgc2J1
cmxhQG1hcnZlbGwuY29tOyBzaS13ZWkubGl1QG9yYWNsZS5jb207DQo+IHZpcnRpby1jb21tZW50
QGxpc3RzLm9hc2lzLW9wZW4ub3JnOyB2aXJ0aW9AbGlzdHMub2FzaXMtb3Blbi5vcmc7IFBhcmF2
DQo+IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4NCj4gU3ViamVjdDogUmU6IHZpcnRpby1uZXQg
Y29sbGFib3JhdGlvbiBiaS13ZWVrbHkNCj4gDQo+IFNvcnJ5LCBJIGFuZCBIZW5nIFFpIGFyZSBi
dXN5IHRvZGF5LCBzbyB3ZSBjYW4gbm90IGF0dGVuZCB0aGlzIG1lZXRpbmcuDQo+DQpUaGFua3Mg
Zm9yIHRoZSB1cGRhdGUsIFh1YW4uDQpXaWxsIGNhcHR1cmUgdGhlIG1lZXRpbmdzIGFuZCBzbGlk
ZXMgYXQgcHVibGljIHNoYXJlZCByZWd1bGFyIHBsYWNlIGZvciB5b3VyIGxhdGVyIHJlZmVyZW5j
ZS4NCg0KIA0KPiBUaGFua3MuDQo+IA0KPiANCj4gDQo+IE9uIFdlZCwgMTAgSmFuIDIwMjQgMDM6
NDU6NTUgKzAwMDAsIFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4NCj4gd3JvdGU6DQo+
ID4gR2VudGxlIHJlbWluZCBhbmQgdGVzdCBtZXNzYWdlIGZvciBuZXcgbWVldGluZyBpbnZpdGUg
dGhpcyB5ZWFyLg0KPiA+DQo+ID4gdmlydGlvLW5ldCBjb2xsYWJvcmF0aW9uIGJpLXdlZWtseQ0K
PiA+IFdlZG5lc2RheSBKYW4gMTAsIDIwMjQg4ouFIDEwOjMwYW0g4oCTIDExOjE1YW0gSW5kaWEg
U3RhbmRhcmQgVGltZSAtDQo+ID4gS29sa2F0YQ0KPiA+DQo+ID4gSm9pbiB3aXRoIEdvb2dsZSBN
ZWV0DQo+ID4gaHR0cHM6Ly9tZWV0Lmdvb2dsZS5jb20vZ2tqLXJhd2ktdWZwP2hzPTIyNA0KPiA+
DQo+ID4NCj4gPg0KPiA+IEpvaW4gYnkgcGhvbmUNCj4gPiAoVVMpICsxIDk3OC00MDMtMDU4NA0K
PiA+IFBJTjogNzU2OTY5NzY0DQo+ID4NCj4gPiBNb3JlIHBob25lIG51bWJlcnMNCj4gPiBodHRw
czovL3RlbC5tZWV0L2drai1yYXdpLXVmcD9waW49NzU3MzY4MDc4MzMyNiZocz0wDQo+ID4NCj4g
Pg0KPiA+IEF0dGFjaG1lbnRzDQo+ID4gdmlydGlvLW5ldCBjb2xsYWJvcmF0aW9uIGJpLXdlZWts
eSBtZWV0aW5nIG5vdGVzDQo+ID4gaHR0cHM6Ly9kb2NzLmdvb2dsZS5jb20vZG9jdW1lbnQvdS8x
L2QvMU1FLQ0KPiBqRm5jdlBNd0hfR3llTGhoSVlncW1GaFRBYmwNCj4gPiBzSW9wcUhDWlp4dWZN
L2VkaXQNCj4gPg0KPiA+IEhpIEFsbCxUaGlzIGlzIGEgYmktd2Vla2x5IGNvbGxhYm9yYXRpb24g
bWVldGluZyBmb3IgdmlydGlvIG5ldA0KPiA+IHNwZWNpZmljYXRpb24gZGV2ZWxvcGVycy5SZW5l
d2luZyB0aGUgc2VyaWVzLsKgTWVldGluZyBhZ2VuZGEgYW5kDQo+ID4gbWludXRlcyBhcmUgY2Fw
dHVyZWQgYXQgWzFdLlsxXQ0KPiA+IGh0dHBzOi8vZG9jcy5nb29nbGUuY29tL2RvY3VtZW50L2Qv
MU1FLQ0KPiBqRm5jdlBNd0hfR3llTGhoSVlncW1GaFRBYmxzSW9wcUhDWlp4dWZNL2VkaXQ/dXNw
PXNoYXJpbmfCoC0tLS0tLS1hLg0KPiA+IEFsbCBkZWNpc2lvbnMgYXJlIHN0aWxsIG1hZGUgYnkg
VEMgZWxlY3Ryb25pYyBiYWxsb3QgYXMgdXN1YWwuDQo+ID4gUHJvcG9zZWQgY29sbGFib3JhdGlv
biBtZWV0aW5ncyBhcmUgdW5yZWxhdGVkIHRvIFRDIGJhbGxvdC5iLiBBbGwNCj4gPiBkaXNjdXNz
aW9ucyBmb2xsb3cgT0FTSVMgZmVlZGJhY2sgbGljZW5zZS4NCj4gPiBodHRwczovL3d3dy5vYXNp
cy1vcGVuLm9yZy9wb2xpY2llcy1ndWlkZWxpbmVzL2lwci8jYXBwZW5kaXhhDQo+ID4NCj4gPiBP
cmdhbml6ZXINCj4gPiBQYXJhdiBQYW5kaXQNCj4gPiBwYXJhdkBudmlkaWEuY29tDQo+ID4NCj4g
PiBHdWVzdHMNCj4gPiBQYXJhdiBQYW5kaXQgLSBvcmdhbml6ZXINCj4gPiBoZW5ncWlAbGludXgu
YWxpYmFiYS5jb20NCj4gPiBzYnVybGFAbWFydmVsbC5jb20NCj4gPiBzaS13ZWkubGl1QG9yYWNs
ZS5jb20NCj4gPiB2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy1vcGVuLm9yZw0KPiA+IHZpcnRp
b0BsaXN0cy5vYXNpcy1vcGVuLm9yZw0KPiA+IHh1YW56aHVvQGxpbnV4LmFsaWJhYmEuY29tDQo+
ID4NCj4gPg0KPiA+DQo=

