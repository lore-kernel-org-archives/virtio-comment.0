Return-Path: <virtio-comment-return-8258-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AB4C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 07:16:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EFCBE41F31
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 07:16:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6E91986C9E
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 07:16:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BC860986C94; Wed,  8 Nov 2023 07:16:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE471986C95
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Nov 2023 07:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aavbRn80lyRl22Bapz9MfQuN/McuEbuMfwobOcJxtsSd+FlTt6dh08Jb7UeowqvZXcpZ82d0xnEihCrVwn1pxSESX7zFxPC5+2RHIBotSEW8BdifGD0qUOblaQESEDH8mTEGMQMHUqLZOXLQefZCPn1M7iU0VAwkWfluENFEA0JnPP/4hDgEfLumQOWqVjLJ9/h7+DQQKXMbIidkEpQo+gi1T18Uu/2StYiodKRkH8GsG6pP6ZVCFkXpq/LmhysiC8YKJ+avN12plVut9u3WxFRzAtRfVAbC9pfPsm1lzdAod5czFfz0GgeHxWDM5kUHmGCiKcmsYRxN0jKDy16jnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7xEGVtU5cWY4WbqK6Y9cOzn2lPooHwwrDX+jxBy5PY=;
 b=eqRUo553cNNcXC0q1kUycq3t+yewUlAXjaqgDxwVR6GYcaZVC6Rd+y08TRPePRTj+R0n9kE+ebZnkOIrQPu0XXZfULdmoiGPrX9M9VwCc0xBxwyACn3TVhnKzwjwT1LaaoSJH6Plbr9RPQ77++Zm0xUsj1lf+4GCsP868LBqvwr4UmHnP9XmuW9rvKR9tCcdTTBQJ9Mn1pQrdpNbPpJvqixVezXsxI3dJ5qUfUCc9c77j50b4HNy40XjXmEwJCHGtHVdO6FXG+DzzO+LQ+cihPe27BXxmaeH85TkBUx7s9jXICjpz4DgaZ/+cufi1aS6vKcxl9TsewINr+e/Ex9gOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 6/6] virtio-pci: implement dirty page tracking
Thread-Index:
 AQHaDkFr7w3tkrCqqkSwyxm5dwAptLBoapSAgAABpXCAAETRAIAACO2QgAPyz4CAAAX1wIAAWYwAgAAWBzCAAYPtgIAABqgAgAAGLQCAAAnHkIABTEuAgAAA23A=
Date: Wed, 8 Nov 2023 07:16:07 +0000
Message-ID:
 <PH0PR12MB5481E72F7CB092F52D22118BDCA8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2615baa2-9450-4504-aa8a-e46fdbb332b8@intel.com>
 <PH0PR12MB54810847007367DD75FA3D60DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <431c0495-f0d9-46d6-8336-cc2bd293cc35@intel.com>
 <20231107051012-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813AC62A9D6811585A159DDCA9A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548142AE109CA96BCE5A351ADCA9A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvcRgfwhQWJmBYtOjMWT97-rgZ4p5LjZ+JbTpsDP8kqkw@mail.gmail.com>
In-Reply-To:
 <CACGkMEvcRgfwhQWJmBYtOjMWT97-rgZ4p5LjZ+JbTpsDP8kqkw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|LV8PR12MB9261:EE_
x-ms-office365-filtering-correlation-id: a5990614-1160-4462-2820-08dbe02a93be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 US6vEP37XsJ4Ai6rg3BdeJo4LYsEIUyeEDAqPajux4gtZcHLK6gAGxbRliJr4USZFFR7KEWEQDylUj9XwKLOKBBaginn3nc4pFW9ReGr3YHsg3lV4p4z9ThiyjIoBUn5R1Joc7nhw3xUSKPzn1HWvQtldN1uMNIL2sTk3dAP6/Iwd39jFwj9usP9eIi9WZ9hpcALLc+Jt86Z57Ys+aVzaFvqx9gzvjqVyYWaCqlra7A8O/+wDi4lx6qbd5t29Ac5xjvTRnRbXLBZkc+p2Y8Tug521b2j7BEo1c46I2B0TV0kIvUo6ScC4MenspzTXX3uXH+VhuSMVmiBudb5kENctDX7CqvMIjn7lFaL82P81U5nuiyZx4u1eB5Rfs9L0Yuj3qrhgvmWBNSczGEqMe4pKnp5uj9jj0hESFFYHsgo2+60AL0g6h1inx7QadPqrIp689YpQTJFwnk95aTcryu2JD3UL/nk3dZs8j+2T1KRD5WJ3RJLFvRTM8x9Cgox3LQ74h8rFQEsFIM0kzT4sEYCsOUyCKRTdCCrypecyuy1/UBpErXYKtkz2rv03SyYbd1myzNSJYuBXDmYIqUx9sh0Jq6vDJ6wg74KhlmjMkGv7mveVYH+i5JuGkmMsLxMZt7Ut3BqwIOuyoTpAfHW3mU2xQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(478600001)(9686003)(83380400001)(38100700002)(122000001)(26005)(54906003)(76116006)(64756008)(66556008)(66946007)(66476007)(66446008)(316002)(6916009)(7696005)(6506007)(53546011)(71200400001)(55016003)(4744005)(8936002)(8676002)(4326008)(2906002)(41300700001)(33656002)(52536014)(38070700009)(86362001)(5660300002)(14143004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b1NubFZYdjg3aktubndkMmQyY1ZRUlBRZHh4MTB0RDAvVjEyelIrcEtDY0NF?=
 =?utf-8?B?QXEvbExJV2svU0Y4OCsvb1l6djU4czZNbGFxZ0pYckNhaVVlZTlrcVVPZzhh?=
 =?utf-8?B?R2Q4YjRLS1ZRMjJaU2wwQ2JseEdHTTF6T05RRFhnTUhpWFJxdnFsL00wTUl0?=
 =?utf-8?B?Zm1tY2g3WGc1ajhTbTEvVmVSdi9WdlNWWjN0RG01ZmhoNEpBaWJOajA3aDFh?=
 =?utf-8?B?UVVUMHh0QXB6Rk81RGhQT0lXby9oQm12TGROY3IybE1lZnVLOWI1Mms0WUI0?=
 =?utf-8?B?U1luVFBwbTZiVGg4SDlNSXc1bXFvM0FxZHFVMDdoZFRFZkNsTk13ckdnbDVG?=
 =?utf-8?B?STBjaHdmdUV1SjM0UGZ4b05BNjByc1ZmUUM5MGxaaFFTVXBBV0E2OWEyTkpH?=
 =?utf-8?B?Zm9jVU9XSm0wU09abnBlUHVzdDJjdnAxckM3enlSSnJuZTFhUXJwa2FvNi92?=
 =?utf-8?B?UFZCOVNKZG1RRzAraEZsaE5tNlF5WDVsbWNvQ0lyUVBjOGpMMzhnejY0UldK?=
 =?utf-8?B?Sk5oUm5vZVQvVTJMZFFTcDltNWgzMkdDSktIZi90NXFRR3g3N2tpNmRRVTRQ?=
 =?utf-8?B?dzRvYm83aVFXQVdiamRVckMrQzVLVTAyaGZEc3VzZ1lDSG1PcW54TTBLNm10?=
 =?utf-8?B?S1R5T2lrWEV2dzNqUGhNc2N6ZXZOVFVTM09VUkx1NkEzZnR6NHpVaXdKTGRD?=
 =?utf-8?B?MmtFQm5rVG5RTDZaMU8yZThiQXlyUWxCZVZ5Wm9VK1hPSlRNdWxSbVgzL3I4?=
 =?utf-8?B?Uk1yRExJVzBiMzRIUktBeGJjT0FEbTJnT20ydjdLeWw0YndhUGEzWkEvcTdC?=
 =?utf-8?B?R3lnYjRyRGxKanBOYk1sdUtqblJNNmlUb1JaWU1sSnUzcVhKcTRIOHJiY2pz?=
 =?utf-8?B?andaM25tWG5pdkZIWWZoZDZpZTRMSFRWZEF5MGx1SEpBZU13a0lrbzlJNitp?=
 =?utf-8?B?c043Yzk4QjhDeEc2aGtpMkhBdDV3MUE1TkdsTWNFOUxJNE5wU3FLSWFkREE4?=
 =?utf-8?B?QThJVkxhWEdWdkhMZDFYMXFLYzl1eHc2U2xmRDA4M1RQSkk0UXRlOUpTekxn?=
 =?utf-8?B?YzJBTWlOWlRoMDhmTFBvNzhwNzF5MjFJOE1yTE9Vc3BmR3NENFg3dU84Nm8v?=
 =?utf-8?B?clVUclFBaFd4VnhXM2pJVlE4YTJzNTRWVHlkNTUva0tQeWgvbFIxTDFXL2pW?=
 =?utf-8?B?dkJmUytzaklwUlBZNG9ZRUpOOFREOUh4WmU1dlZYYVVkR1BLdXM0S2hVSEIw?=
 =?utf-8?B?ZVgzVTlQOEJoajQrczh6UDZXdWxjYXgvME1NRGRtSUlzVlEwQVZoQi9HeitF?=
 =?utf-8?B?OXNlSkpuQXVENUhGYVArcDgwc2IzZVh1N3FrZ0lYWkoxM3B1TGlwb0UrejBM?=
 =?utf-8?B?QWhwZzRERVZUZ00xNDJrTmxWcXBNRmJad0krUG5SWTAxdzZOM3lOY3M2TlVL?=
 =?utf-8?B?Y0p0NDd3RnJJeDkwenV3QTYvSkp5NU1HSjJyTVBMYmhKVGYxWXJRYWt4bGsx?=
 =?utf-8?B?K2FFRDErbzZBc0xSS1kycFlaZmlGOEhaYUJySzRNc3h5VEczVUNscmdPbGJG?=
 =?utf-8?B?R1RrSFlITU05azU4MVl6YmZnSVloUWdWTVB3aFJMZjRueGkxYzJQS1lEV2VW?=
 =?utf-8?B?SHp2WUd5UHZBK3pqYVM1ckFDSE95M2hwSURqM2EwUnNOT1FZYUIxdHUvY1NJ?=
 =?utf-8?B?Z0ZFUXV4a3ZDaTV1WlBWa0JCSlJ0WThtN0lvb3JseTFrRFo1L3R6SDhqNGxT?=
 =?utf-8?B?ejFQRE44MC9BVm51SllkVHF1NjhtYjBPZjlLNFdid010QjVxT1ErNFNzYSto?=
 =?utf-8?B?QmNIQXFEVjZZeFNvRjk2czVhNjhtUFdzV1hjQTlyVnhpOFZwemwxNldjNzZC?=
 =?utf-8?B?Z2U0UEdYNEE3TklqaVUveWhUUDdMVHBZcGF5blZxL1E1aGIvc1prczhiQWV2?=
 =?utf-8?B?QWtlY0gzUWpMUUJpQ2dsb3MreVBMNDJVWHovdlBiUFBTYWFNRXlycVFacUlZ?=
 =?utf-8?B?NXV4RXk2VnUvS1hhSGM3MHFYcWM1UngzekpiZy9XUEJPMHo0TjA0T295RlVJ?=
 =?utf-8?B?cW94Wm1PMkkwTFcxR283SWZQcXlpanpJS1lFY3dzYW1UQmZqSFpZZHMzM3Jl?=
 =?utf-8?Q?VCkw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5990614-1160-4462-2820-08dbe02a93be
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 07:16:07.4748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jUElpFHn5dHrKBXI63stx4lFJnVLLoZlPd2yBA0PTF4Uw4kqD0XGqdYDiDXBPv7YzlhbFj2tPXORcavKJgSLmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9261
Subject: [virtio-comment] RE: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

PiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiBTZW50OiBXZWRuZXNk
YXksIE5vdmVtYmVyIDgsIDIwMjMgMTI6NDIgUE0NCj4gDQo+IE9uIFR1ZSwgTm92IDcsIDIwMjMg
YXQgNzoyNOKAr1BNIFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4gd3JvdGU6DQo+ID4N
Cj4gPiA+IEZyb206IHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnDQo+ID4gPiA8
dmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtIG9wZW4ub3JnPiBPbiBCZWhhbGYgT2YgUGFyYXYg
UGFuZGl0DQo+ID4gPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciA3LCAyMDIzIDQ6NDMgUE0NCj4g
Pg0KPiA+ID4gTXkgaHVtYmxlIGlucHV0IGlzOg0KPiA+ID4gMS4gQWNjZXB0IHRoZSB0d28gdXNl
IGNhc2VzIGxpc3RlZCBvZiB2ZmlvIGFuZCB2ZHBhIGJlaW5nIHByYWN0aWNhbA0KPiA+ID4gdG8g
c3VwcG9ydCBleGlzdGluZyBzdGFja3MgMi4gVHJ5IHRvIGNvbnZlcmdlIHR3byBjYXNlczsgaWYg
dGhlcmUgaXMNCj4gPiA+IGNvbW1vbiB2aXJ0aW8gc3BlYyBmcmFtZXdvcmsgaXQgY2FuIHVzZSAz
LiBJZiB0aGV5IGNhbiwgZ3JlYXQgbGV0cyB1c2UgaXQuDQo+IA0KPiBUaGF0J3MgbXkgcG9pbnQg
YXMgd2VsbC4NCj4gDQo+ID4gPiA0LiBJZiBub3QsIGJvdGggdXNlIGNhc2VzIG5lZWQgZGlmZmVy
ZW50IGluZnJhc3RydWN0dXJlLCBzbyBidWlsZCB0d28uDQo+ID4gPg0KPiA+ID4gRG8geW91IGhh
dmUgYW55IGJldHRlciBzdWdnZXN0aW9ucyB0byBzdXBwb3J0IGJvdGggdXNlIGNhc2VzPw0KPiA+
DQo+ID4gQW5kIGJvdGggdXNlIGNhc2VzIGNhbiBiZSBzZXJ2aWNlZCBieSBwcm9wb3NlZCBhZG1p
biBjb21tYW5kcyB3aXRoDQo+IGRpZmZlcmVudCBoeXBlcnZpc29yIGxheWVycyB0byB1c2UgdGhl
bS4NCj4gDQo+IEkgdGhpbmsgaXQgc3RpbGwgaGFzIHNvbWUgb3BlbiBxdWVzdGlvbnMgdGhhdCBu
ZWVkIHRvIGJlIGFuc3dlcmVkLg0KDQpZZXMuIEkgd2lsbCBnZXQgdG8gaXQgdG9tb3Jyb3cgb24g
MTEvOSBvciB0b2RheS4NCg==

