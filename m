Return-Path: <virtio-comment-return-8629-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191D5C07D5A
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 10:20:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8143F33980
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 10:20:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 48B529863AF
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 10:20:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 38E0B98638E; Mon, 27 Nov 2023 10:20:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A34BA986397
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 10:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfgAw9qgu9+QDhVLSA0bZZenvsZTuHRaUuUrerBcgVrR0EG0etoaajtEN8KYyT5nnFZcDMsP+H38e804Fd6DVTcAxf83UKMLRior6Vf3SjULwRENQW/ucE/qnsForOxZYJctQjJAXKDr2GhnLU5B9pmgMZ9NE/4MgPdjOvQ36XdBm4xP6/ia9+DZJryqwSr404RWmO0JY+53ewuiqvEvHtVFohLW7zUAuPAoZ2L4smib+eNhzKxCwGoliBe4ingWqSrO0Fl0sQihQFvpwFkkGNXHBsyIBfpToY+owtzsCNPPf7m6jfDUvy09qHYrQ6eGum10NVhHB/rJAAfZLUruTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrazST1N3hdm5QVkOh1IUdeKwM36k0WXzQ1tUSNKUJc=;
 b=CeVjjuCw/V3WNrt6E4cPuz+AD0zMMl/OFyqN8DBGAxu9VN9inSbkUqGxToXv0T7x7fg1xB6exJBYovznnRzzXmjEg2ysccjfsg3puaP4j5U5c/8H2g7iNr8Y3P8lruigja7DZNihMp2HHwogFbLEY0IQyWV6r//08n8x6CRjhtfKJ9l0s1TUb5vC9dL3vTIV5spAIPCksYRfUB78AicKO/gK/pyvux28GDv7hbzd/GTmEyj1ICA0uE/rW1VWTugoIMUHzwGqmEBXYd5BwLn0XSW1BDPlHpJPEzjP9PZrNXN7/eiH2DCgXmA3QAT0ggTr4Uhy4Ss1NtS4W2ACQc2c/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Thread-Topic: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands
Thread-Index:
 AQHaE9L2DjdkCoB6dUewtbJsrpd4HbCGcWKAgAAAe3CAAA00AIACb1eAgAAArBCAABgnAIAAAHbggAAIJoCAAAhSgIAALSaAgAStofA=
Date: Mon, 27 Nov 2023 10:19:45 +0000
Message-ID:
 <PH0PR12MB548153830F24B8B8A22E3BDADCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124002357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsTBKVVnWriVEWAmVY+nfOCx7faHt3-ieSiMfJyEUYNEw@mail.gmail.com>
 <PH0PR12MB5481F5BC8384D1C5B4284A7EDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124040545-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231124040545-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM6PR12MB4044:EE_
x-ms-office365-filtering-correlation-id: d68d5898-deb1-4788-fdf3-08dbef3260a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6q71GlgXF+QRoigdPf3qXk50pndMorNRgqNxueawvRGknMMnO+drDWGQSPmugGA4csDady9CL0BmaxlFhHPQvwMhPfJZqOdlpRZbFLmRPQbnmDnoi1fKL42vjPZyFcp21xpIYWRe+vuqyAN0oNqYwLgnFW+aww+vb+sS2ABaPaXGRjjXko7o8n+wWsSif62M6vVX/T6S1/MsI1RGemhibtTHBeaM6+H0HkRsuj/rIXEnyYP8sBa/Ai6NB8QLmlt3eo1sHW6qebkemN2jZU9Nr6gnDazzuZWvsaSKvkRM/pP9ZKTmX35TGmiXXJqD9Iksm8zU6/BZEdBFuzOII2Rjy6WXiUnCb8JUTAF8ZCkyn2SciY/HJNLowJoxKFq77xt6MFCcuUG2eZq5vl4dM6EjkhTUJ5s9AWBqnl4SAkRZYIda/WdP5dTVdanW4zJoOxU6FVD6GIBPf/NHx99bdahfiuw0SmhCFGs0fPf96XNKmo1wt5ZOL1nXzZkTLFK35UVW4d8DPKXvLtM+bf5uDkjmXyby3PyKTSTiYp3pZRsS8kZ8ScamupHH+88kvyEdfAm9FJbJNlDN3HXp2DfAYXY8dFXbzc54T3sgprTHTclF+Z7jy8zTLVfKQPNPxTYzP5k9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(9686003)(55236004)(6506007)(478600001)(7696005)(71200400001)(83380400001)(2906002)(41300700001)(5660300002)(66946007)(76116006)(66446008)(54906003)(64756008)(66556008)(66476007)(6916009)(316002)(52536014)(4326008)(8936002)(8676002)(38100700002)(38070700009)(86362001)(122000001)(33656002)(55016003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RWVJeUFSYkFVc2hzdDlHekpsVzJ3dnVSTmlpUHYwNlVLTGc5Zm9oby9TQkFy?=
 =?utf-8?B?eEJScWgvc3k5aERucjhqV2VnbnlwRkhkWnk1SlZFM296R2R5RDM4THVtYm83?=
 =?utf-8?B?YldiYm4xZ3M4NzVPamNrQTAyazBRMnFyTm5wNkpqOGFQNmFIWXdJQThxUkNE?=
 =?utf-8?B?V081Q3lNR0h5K20yOVh6a0tTc2NCRkVXVVk4RjJtRERnNmdVZk9BbkgrY0tD?=
 =?utf-8?B?Y0gvTWQwUUdJK1ZRa01RY0lwQXE0YXVtTThyc3ZiNzZZV3lINWs4YVBJTVVN?=
 =?utf-8?B?Q1ZBMlFDS25uSDlQQWd4aGN5M3A1OEFzOGJuN0hqalp0QWhNWkpxMW5qMkZT?=
 =?utf-8?B?S21adjNJQjFCOUNwWGJ6OVlWSTlwZE13QkhsV0k5eUxYZXUyZi8rODdqRjUy?=
 =?utf-8?B?RytnSWxBOEhFeEc5blNtOS94cmpLUkhUaUR4WE5mb24vQllXeEJON3lWYkJU?=
 =?utf-8?B?WE1IZjRLRHB0VW1BUkZsOURvUTFDNWpLcnZSbnRkd3pNQ0hwTlVRMWpPbU5v?=
 =?utf-8?B?dFdTcFhqSVN1VnF3NlQzSE9kaldadEUvRTdnUEEvUHpCS2QxcXlXN25CTDFZ?=
 =?utf-8?B?WksxVm8rRjlwQkVibjFNSHcvWTdlSURtQWg0UmVKMUx5cGZpTTRLWFRXMnhW?=
 =?utf-8?B?a0FSanV6VFk0cEJCSW0vUGtqQUhYMU9hRUtSRCtSUVNQZGNVLzh4dVJoSXFW?=
 =?utf-8?B?NGpUNTY5R3F4L3ZjSy91WjFJVkxBRmVpUFh6VDRBZnJTdFhiaDJDVTIraXU1?=
 =?utf-8?B?N2NCUm9LeVpxQ1p5bWJLenBUTFVSL1Q3engyQlJBeEE0RUFNYWRPZ01CVG04?=
 =?utf-8?B?aEFKRVoyaERBZFhqNTRqUEZIdmZmc1hiTEU1YjNkVW9ldnlDd0ZEV1o4N1Jo?=
 =?utf-8?B?ODd4VXNheUU3Q2xJcUlPaUY3TjFNY0FNWWxZQlJvTm5FbVV4NDBidTVyblB0?=
 =?utf-8?B?L0xCQkhCY2Z1Tmsrc0thZmVpY3hPVmRBYlF2ckkxbVAwTXdyVEh0ejBiNlpQ?=
 =?utf-8?B?QWM5YjFUYSthWUZ6Mk5WNFRGdWlib09DcXp1ZnRVbEEvRXdDQVN2b21TUzgr?=
 =?utf-8?B?OVpjaTYvemFJb3NvTlZHcURNTTJsZzN4T1NFV1VYMkZreDU1aDBkWlZNSElQ?=
 =?utf-8?B?OTRDekV3eDJweFFaU1dGdzJielY5SXJXNFE5bUtVMGhxajBvSHdERkdsNERt?=
 =?utf-8?B?OE1DQ3d3UU5iNHo0eVVnUFgzK2Z0czlwMjJhRE1tYXZwdzgzUDI2RlVabzVz?=
 =?utf-8?B?QmN2cHhnQkFOTEhYd0hPWE9CY0NBRTlIYloybDFwUjF0ZnVQTkJLZ1l6ZVY3?=
 =?utf-8?B?c1ZseGNETTB5dTd5VkR2aTJpZUJJdEl2Um45QVhXcm15R3RFS0h2dkpyR1Qr?=
 =?utf-8?B?UThhamRLRkpGbENzdmIwK1dtY09CS1gyMmFQUW10UTcrNDlsUGZLREFHMGh6?=
 =?utf-8?B?clhrSlNydWhZek9kYWZHMVBlYmNydGhYQTNPYzJ1RlFkTllVSHRSK1NRenR4?=
 =?utf-8?B?dkVLZFVpOVNvNHJxb0w5RUJpamtma1N4MlJ2TXg2TFozd2lEMTRwaEloTmtm?=
 =?utf-8?B?bmd6QzhLYndjbW9xSDQ5bzJTS3dIdEdwY1FKRzZEWUM1ZUFQSmRodVkyeXpi?=
 =?utf-8?B?cjJEcFErK2hEeHZadnROSXZEMFhERlJzTUZRUnR1bVR3YmZVTDFMaDAzRGp3?=
 =?utf-8?B?Yk9DWFBmcHpnVHc3OUY5bm9UNE5NZzgrMFZ2R0MvSTYwNDJyNTJNODA0VEY3?=
 =?utf-8?B?M2FETjhqeWF2NUJUZ2JzcCswN0pVb0E2OHhIWjNReDgyZHpRVW1sRld0OWZM?=
 =?utf-8?B?V3krT1hjYVdOa2xiaE1HM1NFbEZkUjQ5eDcycjd5MitKNkpDZHZDd1E1Ti9U?=
 =?utf-8?B?Qi9XMWhtOFNmb3NDYU1DaHBHVUw2T2EzWWhqc3oyTFhaMWIyM2oxWWMxQUdj?=
 =?utf-8?B?WTdib0Z6ZW05anNrMlhQcEMzNktzYkIzWjFzSjlmc2hTZFdoajdVRk5WYVdj?=
 =?utf-8?B?RFJaUUJBNmpWL21JTWI0Wkg1MHY1WXY2dXNLMTZzTHhTTjNrOURUYmdEcUZ0?=
 =?utf-8?B?ZkNUU0dqN1FIeHNZNUUzd2pCRDdKM0FkanUxUUc0bElOcVI3RkdWYUkvWUdF?=
 =?utf-8?Q?n5qg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68d5898-deb1-4788-fdf3-08dbef3260a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 10:19:45.1762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 77H7DwQqUkHaWOC2OYpla60rFXS7UnuGq7+hW5MJjQZx9ay/MLpbVrGPS00DoYc/5fgm5IBgSMqf9dmJ7mkVPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4044
Subject: RE: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IEZy
aWRheSwgTm92ZW1iZXIgMjQsIDIwMjMgMjo0MyBQTQ0KPiANCj4gT24gRnJpLCBOb3YgMjQsIDIw
MjMgYXQgMDY6NDE6MTFBTSArMDAwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+DQo+ID4gPiBG
cm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiA+ID4gU2VudDogRnJpZGF5
LCBOb3ZlbWJlciAyNCwgMjAyMyAxMTozMiBBTQ0KPiA+DQo+ID4NCj4gPiA+IEp1c3QgdG8gY2xh
cmlmeSBteSBwb2ludCwgd2hhdCdzIEknbSBzYXlpbmcgaXMNCj4gPiA+DQo+ID4gPiAxKSBGb3Ig
Q1ZRLCBpdCBpcyB1c2VkIHRvIHNlbmQgdGhlIGNvbW1hbmRzIHRvIHRoZSBkZXZpY2UuIEl0J3Mg
bm90DQo+ID4gPiBnb29kIHRvIHVzZSB0cmFuc3BvcnQgdG8gc2VuZCB0aG9zZSBjb21tYW5kcw0K
PiA+IFRoaXMgaXMgbm90IHdoYXQgaXMgcHJvcG9zZWQuDQo+ID4NCj4gPiBDVlEgaXMgcHJvcG9z
ZWQgdG8gZXhjaGFuZ2UgY2FwYWJpbGl0aWVzIGFuZCBjb25maWd1cmF0aW9uIGJldHdlZW4gZHJp
dmVyDQo+IGFuZCBkZXZpY2UuDQo+ID4gKG5vdCB0byB0cmFuc3BvcnQgdG8gc2VuZCBjb21tYW5k
cykNCj4gPg0KPiA+ID4gMikgVGhlIGNvbmZpZ3VyYXRpb24gc3BhY2UgaXMgdGhlIHBsYWNlIHRv
IGFkdmVydGlzZSB0aGUNCj4gPiA+IGNhcGFiaWxpdGllcywgZS5nIHdoYXQga2luZCBvZiBjb21t
YW5kcyBjb3VsZCB0aGUgZGV2aWNlIGFjY2VwdC4NCj4gPiA+DQo+ID4gYW5kIGl0IGlzIG5vdCBl
ZmZpY2llbnQgYW5kIG5vdCB1c2VkIGFueW1vcmUgd2l0aCAxLjMgYW5kIGhpZ2hlci4NCj4gPiBU
aGV5IGFyZSBleGNoYW5nZWQgdXNpbmcgc2luZ2xlIGdldC9zZXQgaW50ZXJmYWNlIHdoZXJlIGRl
dmljZSBkb2VzIG5vdA0KPiBuZWVkIHRvIGRvIHNwZWNpYWwgY3Jvc3Mgc3luY2hyb25pemF0aW9u
IGJldHdlZW4gd2hhdCBpcyBleHBvc2VkIHZpYQ0KPiBpbnRlcmZhY2VfMSAoY29uZmlnIHNwYWNl
KSBhbmQgY29udHJvbCB2aWEgaW50ZXJmYWNlXzIgKGN2cSkuDQo+IA0KDQo+IFdoeSBiZWNhdXNl
IHlvdSB3cm90ZSB0aGF0IGdvb2dsZSBkb2M/IFRoZXJlIG5ldmVyIHdhcyBhbnkgY29uY2Vuc3Vz
IG9uDQo+IHRoaXMuDQpOby4gVGhlIGNyb3NzIHN5bmNocm9uaXphdGlvbiBuZWVkcyB3aXRoaW4g
dGhlIGRldmljZSB0byBiZSBkb25lIGV2ZW4gd2l0aG91dCB3cml0aW5nIHRoZSBkb2MuDQpUaGUg
ZG9jIGNhcHR1cmVzIG11bHRpcGxlIGRpc2N1c3Npb25zIHRoYXQgY2FwdHVyZWQgdGhlIHByb3Mg
YW5kIGNvbnMgb2YgZWFjaCBpbiBGQVEgZm9ybSBhbmQgb3VyIHZpZXcgaW4gdGhpcyBhcmVhLg0K
DQo+IA0KPiA+ID4gMikgZG9lc24ndCBjb25mbGljdCB3aXRoIDEpDQo+ID4gPg0KPiA+IENWUSBk
b2VzIG5vdCBjb25mbGljdCB3aXRoIGFueXRoaW5nIGFzIGl0IHN0YW5kcyB0b2RheSBpbiAxLjMu
DQo+ID4NCj4gPiA+IEFuZCB3ZSBhcmUgZGlzY3Vzc2luZyB0aGUgcHJvdmlzaW9uaW5nIHdoaWNo
IGlzIG1vcmUgYWJvdXQgMikgYnV0DQo+ID4gPiBub3QgMSkgaGVyZS4NCj4gPiBQcm92aXNpb25p
bmcgd2lsbCBzZXQgdGhlIGRldmljZSBhbmQgZGV2aWNlIHdpbGwgcnVuIGJhc2VkIG9uIHdoYXQg
aXMgYmVpbmcNCj4gc2V0Lg0KPiA+IElmIE1TSVggaXMgcHJvdmlzaW9uZWQsIGl0IHdpbGwgc2hv
dyB1cCBpbiBNU0lYIGF0dHJpYnV0ZS4NCj4gPiBJZiB0aGUgQkFSIHJlZ2lvbiBzaXplIGlzIHBy
b3Zpc2lvbmVkIGl0IHdpbGwgc2hvdyBpbiBQQ0kgTU1JTyBzaXplLg0KPiA+IElmIDEuMyBsZWdh
Y3kgbWFjIGFkZHJlc3MgY29uZmlndXJlZCwgc2hvd3MgdXAgaW4gdmlydGlvX25ldF9jb25maWcu
DQo+ID4gaWYgMS4zIHJzcyBjb25maWd1cmF0aW9uLCBzaG93cyB1cCBpbiB2aXJ0aW8gbmV0IGNv
bmZpZw0KPiA+DQo+ID4gaWYgMS4zIHN0YXRzIGNvbmZpZ3VyYXRpb24sIHNob3dzIHVwIGluIHN0
YXRzLg0KPiA+IElmIDEuNCBmbG93IGZpbHRlcnMgcHJvdmlzaW9uZWQgc2hvd3MgaW4gZmxvdyBm
aWx0ZXIgY2Fwcy4NCj4gPg0KPiA+IFRoZSBwcmltYXJ5IHRlbmV0IGlzOiBjb25maWcgc3BhY2Ug
Y29udGFpbnMgb25seSB0aGUgbmVjZXNzYXJ5IGRyaXZlcg0KPiBib290c3RhcCBmaWVsZHMuDQo+
IA0KPiBJIGRvbid0IHdhbnQgdG8gYXJndWUgd2hhdCBib290c3RyYXAgaXMuIFBsZWFzZSB1c2Ug
ZXhpc3Rpbmcgc3BlYyB0ZXJtaW5vbG9neS4NCj4gaW5pdGlhbGl6YXRpb24gdGltZSBpcyBhIGJl
dHRlciBkZWZpbml0aW9uIHdlIGFscmVhZHkgdXNlIGluIHNwZWMgLSBpdCBpcyBjbGVhcmx5DQo+
IHdoYXRldmVyIGluZm8gZHJpdmVyIG5lZWRzIGR1cmluZyBwcm9iZSBhbmQgd2hhdGV2ZXIgc3Vi
c3lzdGVtIHNwZWNpZmljDQo+IGluaXRpYWxpemF0aW9uIGNhbGxiYWNrIGlzLiAgRm9yIGV4YW1w
bGUsIGZvciBuZXR3b3JrIC0gbmRvX29wZW4uDQo+IA0KSW5pdGlhbGl6YXRpb24gdGltZSBhcyBk
ZWZpbmVkIGluIHNwZWMgYXMgbGlzdGVkIGluICIgRGV2aWNlIEluaXRpYWxpemF0aW9uIi4NClRo
aXMgbWVhbnMgb25seSB1cHRvIERSSVZFUl9PSyBwaGFzZS4NCg0KRG9lcyB0aGUgZHJpdmVyIG5l
ZWQgdG8ga25vdyBhYm91dCBmbG93IGZpbHRlciBjYXBhYmlsaXRpZXMgdG8gaW5pdGlhbGl6ZSB0
aGUgZGV2aWNlPyBOby4NCg0KQ2FuIGl0IGJlIGRldGVjdGVkIHBvc3QgaW5pdGlhbGl6YXRpb24/
IGkuZS4gYWZ0ZXIgRFJJVkVSX09LIHdpdGhvdXQgYnVybmluZyBzb21lIE1NSU8gcmVnaXN0ZXJz
PyBTdXJlIHllcy4NCg0KPiANCj4gPiBUaGUgYnJpZ2h0IGxpbmUgaW4gYmFzZWQgb24gdGhpcyB1
c2FnZTogYm9vdHN0YXAgb3Igbm90Lg0KPiA+IElmIGl0cyBydW50aW1lLCBzdXJlIGhhdmUgaXQg
b3ZlciBDVlEuDQo+ID4gRm9sbG93aW5nIHRoZSBuaWNlIHRlbmV0IG9mIEIuMiBvZiB0aGUgc3Bl
YyBzbmlwcGV0OiAiRGV2aWNlIGNvbmZpZ3VyYXRpb24NCj4gc3BhY2Ugc2hvdWxkIG9ubHkgYmUg
dXNlZCBmb3IgaW5pdGlhbGl6YXRpb24tdGltZSBwYXJhbWV0ZXJzIg0KPiA+IFRoYXTigJlzIGl0
Lg0KPiA+IEFuZCBldmVyeW9uZSBpcyBhbHJlYWR5IGFsaWduZWQgdG8gaXQuDQo+IA0KPiBBYnNv
bHV0ZWx5LiBTcGVjaWZpY2FsbHksIHdoZW4gZG8geW91IGV4cGVjdCBkcml2ZXIgdG8gcHJvYmUg
dGhlc2UgY2Fwcz8gQXMNCj4geW91IHlvdXJzZWxmIGV4cGxhaW5lZCwgaXQgaGFzIHRvIGRvIGl0
IGJlZm9yZSBldGh0b29sIGNhbGxzIC0gdGhhdCBjbGVhcmx5IG1lYW5zIGl0DQo+IHdpbGwgZG8g
aXQgaW4gcHJvYmUuDQo+IFRvIG1lIHRoaXMgc2ltcGx5IHNjcmVhbXMgImluaXRpYWxpemF0aW9u
IHRpbWUiLg0KPiANCkl0IGNhbiBiZSBkb25lIGluIGRyaXZlciBwcm9iZSByb3V0aW5lIGFmdGVy
IERSSVZFUl9PSywgdGhpcyBpcyBmaW5lLg0KDQo+IA0KPiA+ID4NCj4gPiA+IFRoYXQncyBpdC4N
Cj4gPiA+DQo+ID4gPiBUaGFua3MNCj4gPiA+DQo+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiA+IFdv
cnN0IGNhc2UgZGV2aWNlcyBjYW4gbGllLCBpdCBpcyBub3QgY2xlYXIgd29ycnlpbmcgYWJvdXQN
Cj4gPiA+ID4gPiBzdGF0aXN0aWNzIHdoZW4gcHJvdmlzaW9uaW5nIGlzIGltcG9ydGFudCBlbm91
Z2guDQo+ID4gPiA+IERldmljZSBzdGF0aXN0aWNzIGNhbm5vdCBiZSBicm9rZW4gd2hlbiBtaWdy
YXRpbmcuDQo+ID4gPiA+DQo+ID4gPiA+ID4gQW5kDQo+ID4gPiA+ID4geW91IGFyZSBub3cgdW5k
ZXIgdGhlIGltcHJlc3Npb24gZXZlcnlvbmUgZ290IGNvbnZpbmNlZCB3aGVuIGluDQo+ID4gPiA+
ID4gcmVhbGl0eSBldmVyeW9uZSBqdXN0IGdvdCB0aXJlZCBvZiBhcmd1aW5nLiBUaGlzIGlzIG5v
dCBhIGdvb2QNCj4gPiA+ID4gPiBwYXR0ZXJuIHRvIHRyeQ0KPiA+ID4gYW5kIHJlcGVhdC4NCj4g
PiA+ID4gPiBMZXQgbWUgcmVwZWF0IHRoZSByZWxldmFudCBwYXJ0IGhlcmUgZm9yDQo+ID4gPiA+
ID4geW91Og0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gICAgICAgU28gd2h5IHNob3VsZG7igJl0IHdl
IGp1c3QgYWRkIHNvbWUgdHJhbnNwb3J0IFZRIG9uIHRoZQ0KPiA+ID4gPiA+IG93bmVyIGRldmlj
ZSB0byB0cmFuc3BvcnQgdGhlIFNJT1YgZGV2aWNl4oCZcyBjb25maWd1cmF0aW9uPw0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gICAgICAgICAgICAgICBBbnM6DQo+ID4gPiA+ID4gICAgICAgICAgICAg
ICBTdWNoIGFkZGl0aW9uIG1lYW5zIHRoYXQgaGFyZHdhcmUgdmVuZG9ycyBuZWVkIHRvDQo+ID4g
PiA+ID4gYnVpbGQgcnVudGltZSBjb25maWd1cmF0aW9ucyBpbiA0IGRpZmZlcmVudCB3YXlzLg0K
PiA+ID4gPiA+ICAgICAgICAgICAgICAgT25lIHdheSB1c2luZyBDVlEgZm9yIFBDSSBQRiBhbmQg
VkZzDQo+ID4gPiA+ID4gICAgICAgICAgICAgICAybmQgd2F5IGFzIGJhY2t3YXJkIGNvbXBhdGli
bGUgU0lPViB1c2luZyBvd25lcuKAmXMNCj4gPiA+ID4gPiBhZG1pbiBWUQ0KPiA+ID4gPiA+ICAg
ICAgICAgICAgICAgM3JkIHdheSB1c2luZyBTSU9W4oCZcyBvd24gQ1ZRIGNoYW5uZWwgZm9yIFRE
SVNQDQo+ID4gPiA+ID4gICAgICAgICAgICAgICA0dGggd2F5IHVzaW5nIG1peCBvZiBiYWNrd2Fy
ZCBjb21wYXRpYmxlIGFuZA0KPiA+ID4gPiA+IHNlY3VyZSBhbmQgZWZmaWNpZW50IHdheSB1c2lu
ZyAjMiBhbmQgIzMuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoaXMgaXMganVz
dCBhIHN0cmF3LW1hbiBhcmd1bWVudC4gTm8gLSB3ZSBtYWtlIGEgY2FwYWJpbGl0eQ0KPiA+ID4g
PiA+IG9wdGlvbmFsLA0KPiA+ID4gPiBDYXBhYmlsaXRpZXMgYXJlIG5vdCBvcHRpb25hbC4NCj4g
PiA+ID4gVGhlIGRlc2lnbiBoYXMgdW5kZXJnb25lIGNhcmVmdWxseSByZXZpZXcgdG8gZW5zdXJl
IHRoYXQgZHJpdmVyDQo+ID4gPiA+IGhvbm9ycyB0aGUNCj4gPiA+IGNhcGFiaWxpdHksIGFuZCBp
dCBpcyBtaWdyYXRhYmxlIGJvdGguDQo+ID4gPiA+DQo+ID4gPiA+IFlvdSBkaW50IGV4cGxhaW4g
d2h5IGNhcGFiaWxpdHkgc2hvdWxkIGJlIG9wdGlvbmFsLg0KPiA+ID4gPiBUaGUgZmlyc3QgcGF0
Y2ggaGFzIGRlZmluZWQgaG93IHRoZSBjYXBhYmlsaXRpZXMgYXJlIHVzZWQgYnkgdGhlIGRyaXZl
ci4NCj4gPiA+ID4NCj4gPiA+ID4gPiB3ZQ0KPiA+ID4gPiA+IHN0cm9uZ2x5IHN1Z2dlc3QgdGhh
dCAqZHJpdmVycyogc3VwcG9ydCBib3RoIG9sZCBhbmQgbmV3DQo+ID4gPiA+ID4gbWVjaGFuaXNt
LCBhbmQgdGhlbiAqZGV2aWNlcyogd2lsbCBvbmx5IGltcGxlbWVudCB3aGF0J3MgcmVxdWlyZWQu
DQo+ID4gPiA+IFRoZXJlIGFyZSBvdGhlciBleGFtcGxlcyBpbiB0aGUgc2FtZSBkb2N1bWVudCB0
aGF0IG1ha2VzIHRoaW5ncw0KPiA+ID4gPiB3b3JzdA0KPiA+ID4gd2l0aCBvbGQgYW5kIG5ldy4N
Cj4gPiA+ID4NCj4gPiA+ID4gQWxzbyB0aGVyZSBpcyBsaXRlcmFsbHkgbm8gd2F5IHRvIGVuZm9y
Y2UgdGhhdCBkcml2ZXIgc3VwcG9ydHMNCj4gPiA+ID4gYm90aCBhbmQgbmV3LiBJdA0KPiA+ID4g
aXMganVzdCBzb3VuZHMgbGlrZSBhbiBleGN1c2UgdG8gZm9yY2UgaW5maW5pdGUgY29uZmlnIHNw
YWNlLg0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgbWV0aG9kIHByb3Bvc2VkIGhlcmUgaXMgZWxlZ2Fu
dCBhbmQgY2xlYXJseSBwcm9tb3RlIG9uZSB3YXkgdG8NCj4gPiA+ID4gZG8NCj4gPiA+IHRoaW5n
cyBmb3IgZHJpdmVyIGFuZCBkZXZpY2Ugd2l0aCBwcmVkaWN0YWJpbGl0eS4NCj4gPiA+ID4NCj4g
PiA+ID4NCj4gPg0KDQo=

