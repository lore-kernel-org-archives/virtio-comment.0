Return-Path: <virtio-comment-return-6873-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08ADAC001B0
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:35:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5CC0823D53
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:35:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4DF7E98680B
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:35:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3C8169867FC; Thu, 20 Jul 2023 02:35:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2EF43986804
	for <virtio-comment@lists.oasis-open.org>; Thu, 20 Jul 2023 02:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTHdExMKyqS1VZOZz55/fU+0xYarvH4ADYdGji79VrBsN7AdLtfgh7XKMWOmAiJRqWO1r4aNDaisKKZilz5oUPdrEDDmo6klSB3W02g8C9mMy5CRT30LY0b9B9qUyYJamknJ/bzjcpEcp/Cqwg/VG3oV6rC1MWtRaqnQeD//wTrCwdilE3fNejH529jyPTjdxyQ0IAUbV1H25dGjdZRU2RNxUXZrUSM1U8BoZZMLpkLVnAqa80Zx/KC4ZdntuuX6OpExlNLJ0WMg8vh6MsUU3isLZy41E3uzV5YNZZ8Ncluc4gLmATBCTR/MrnMfGUn7CxBf8nkPrJanmcXnNxNmiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJWwv5VnbQ2DPIafjE1MTtnEOU/QoHhzwT27DWTyfX4=;
 b=f2qxnn8wCMC8QXxW0KRRy58KV8YcFbbocE42h+D9RRk93lGn19+OIG0ODSEsulREGq6xVJwRMWxRmcj3e6klnR/iziozKEu7mN15EIpDwbmfJQazMiDsvyEq5H0QdvPyNV0wx3Xk0cQZ/ZnGSUu0Ne0GtZ7iSu1OZMbn0OqICmE15diRPCykcWAdW6oakNP5hC5ChV2cpxkhmQj1hxDkE4u1Qi/dl8nFjkRzHpvOi50fW8tUpgz+VuYfx1kbW5v6J1I+jUH6GKOO8xVqydRDSl19nGUQAdq1dqauJmX5yKSTJVA5zshCYjvtFlSEQtlbAAgKJ7AMAx4iBpUj1WdekQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: zhenwei pi <pizhenwei@bytedance.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: "stefanha@redhat.com" <stefanha@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "houp@yusur.tech" <houp@yusur.tech>,
	"zhouhuaping.san@bytedance.com" <zhouhuaping.san@bytedance.com>,
	"xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
Thread-Topic: Re: PING: [PATCH v4 0/7] Introduce Virtio Over Fabrics
Thread-Index: AQHZurJkaweRusYlDE62nVu/55S586/B76FQ
Date: Thu, 20 Jul 2023 02:34:46 +0000
Message-ID:
 <PH0PR12MB5481AE7811DF963BA0E23453DC3EA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <aae0b5ac-96ad-00ab-ace1-9fa2c0a15498@bytedance.com>
 <PH0PR12MB54816BDFABCC4F2D7DD9D95EDC39A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230719084646-mutt-send-email-mst@kernel.org>
 <578f2945-3603-2e25-54f2-7ad72f402591@bytedance.com>
In-Reply-To: <578f2945-3603-2e25-54f2-7ad72f402591@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BY5PR12MB4872:EE_
x-ms-office365-filtering-correlation-id: 8d9ae4f3-176e-49ce-2818-08db88c9e217
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 g7c2QVyiiB1xGg6CmgKnl9Jffz+EaJxk4cU2u3DDQyW7LX8YZnOHmMJJSMsSdmNaYYFrwBot8Yk5DaSRd/MUj1SNfXHutLlJeJUR3oTI6zrCCnir9i4NciuLxEmrDhwCihLrTXhagGnbPoYyaC7goIt+K8EpYswuHUzZm6eu2zK3KFTTaFEEohtjSas1xR8ZqBKq+60LbGwctFADW5Qo0DiN+FL2oeD0GbV9BqUOsl2gtlGv+p8D3u9/unRaDAUErUCpx60mzIuWE9P5jlzSj/dP47VFKqpvWKTp6I+4ZZvLx6uwjUuorQKxOwdOY/5iYsLiWJ2Recvq0Bq0wrFXMe1b+X0bhvrXVZmXAfXPyXtvlyejgfXJGt3N88cvyXckUS+mIIrN6cffzZSpAknCIlZgUfpxWcvdDvg1G1E9nUlqu8+p2SnnuV0uQMB3UGaXdojcj6vku2U9VGQGBOKP/eySaVLVKDYLQbuqgX3Xnl4LbwQrILVoLBn8JnZMMs91gSK90DycP0bMnHcGP3TP2upGBj4ssAu1eKBl9lnBSyn4t5coigP/TaFmpVlsTXtmaJwVe8twZaKTj3nwHrVCS6e4oFjEpTgSmUKvaa8XBsQcn0SEaqIPrDsZEVSG27SRQm1jm40VPSPWt2/qgDPdLeIHWQCQiPkXuIMzHA8eRQM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199021)(38070700005)(122000001)(33656002)(86362001)(55016003)(2906002)(110136005)(4744005)(54906003)(478600001)(38100700002)(9686003)(26005)(186003)(53546011)(71200400001)(6506007)(41300700001)(8936002)(5660300002)(8676002)(966005)(52536014)(66446008)(7696005)(76116006)(66476007)(66556008)(4326008)(64756008)(316002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cGpQRVpJN0xVdkdZMnUzMFduR29Ea0JuOUppckdEWGNBYldKZTBNdXk4cENq?=
 =?utf-8?B?QVVmMlZFZW9DRlBIYjYyNGRRend2NEc5TDE0bDlXa05JelVyWGtLNWptWnc5?=
 =?utf-8?B?VVAxZ0dzUTlDT2xBd1ZlOWhLV2hLZVdtbGRzMVJjZC8vVFk4L2JvYkZHcVZ1?=
 =?utf-8?B?NUhZMmp3SU5vdWozbk5GZ0FWSXZ6NTN6UmdMNUYzTWZaYVhpUmlYVnJ6cWJY?=
 =?utf-8?B?K2FxUWp6OHBOT0EvdE9wemtoUXEzbmhOalZBVTllZ0VZVHA3QVYzei9TN05i?=
 =?utf-8?B?aVlSa0RTRlgzVGtTdHg0VDJuMWkwdFdlTFBQOXZjcHU4Sml6ZFlBR3dEUmt6?=
 =?utf-8?B?bFduSkJNMnUwdlc0MUprYWZ1ZThnLzVia3FaMFY2ZEtnMEFaNzZ6UzVkWTA2?=
 =?utf-8?B?OTRZaWljOWdCNE1IZE0xbXVIeUJKNHRQeVI3UG4rTEhoMSs3Sm9DWlEyd3lO?=
 =?utf-8?B?YngzQm1vSjE1Y2ZqdVEydmliWUZVcllTeVVtWUxnVG9BSlY0dm51OVoraDBZ?=
 =?utf-8?B?Q1d5bWMxaTl6MXcrWU1wTWs5RHY1YVZlUGNCQ1lXNXdJMjM1bFg4V3dnRml1?=
 =?utf-8?B?N1h4STBEUi94cklJVE9sb3laMmdDMkNzeU5lMkdrczZhQWJ3d3p6S3QwTCtJ?=
 =?utf-8?B?N3lqZk9FWVg2aUdnOVIwSGdVRzRqZ3U2dnlPOUdJQlZjV252Vk54UzBkQk84?=
 =?utf-8?B?ZlcwQ0xlS0NFUEhWT2VCRmZxU0tXUlhaNWkyR0tGc3hFWWxrSlNjWGlEZ3h4?=
 =?utf-8?B?V3FISWhIbGRyeEVraW9kWk90VXVQUThQN0xNL0hiM2Z4dDl4dFRhS0NNZUFM?=
 =?utf-8?B?K3hUME9iOGFzMlFjaE83NHZOMHpJNDEwZzc5SzFwaytwbzQzMXBORjZpR0hr?=
 =?utf-8?B?R3V6ZFFEOUFKbWdMMkZYR1BlZXpiaHcyM0p3ekU4em5sTlBqTU1Ud3N2K25m?=
 =?utf-8?B?dE9OQkhRTi95aVMrNFlWcTBKVUdzQVNLT3BiYkVKcHAyWU90REdWaDQrSWp3?=
 =?utf-8?B?TE96QnBQRjN0elQzSE4zMTFHb1p1Q2d6T2NYRWJ1T0hGM0ZFdTQybEcvbmMx?=
 =?utf-8?B?NitlMGhZeHJpWmU4Mno5RVBjSXR2NENaVTBlbnI4UlhqTllEakNEQ1VSM1M4?=
 =?utf-8?B?dURNc1FFbVdIVDdWWk0ySmc4c2RlS3FLL3RFbm5zbXVpY0w0bDh1SDgxM3dx?=
 =?utf-8?B?QUFQRHYvZmxXMUlyelVnZ05TQUxsT2lia3A3WEVZbllZdFVHN0pZcDArWXdq?=
 =?utf-8?B?L1ZsR0NOTjhyQ2VmUGtRMVNydjJieUFWQW9tYWh6STJoNzBlVkJtamtNSlNF?=
 =?utf-8?B?OHpWTkNCL0tCYUF1V214UUI1Z2VtMmkyc3p6RXA4bWNqdXFieFNWWWhjRk1s?=
 =?utf-8?B?b3J5VTZaUUF5ZnZOWFg0WG4zT2srWEQvUGFaUFpmT2FyRWMxMFBpVDdQQWRu?=
 =?utf-8?B?dE9ubEpsTkF0enJZQXNaTW9kcktKV0wyVWJSWTRNckZGRENoVGpaVHViRWc4?=
 =?utf-8?B?emt4OC9mNHlwVHRtZUo5Slp0ZFZSdC94b3pobkFoMVpVdTAzNlU4WlBlTjU2?=
 =?utf-8?B?dmkxSFQ2Z2pnQWhJNGpIWjN5NUI1Zy9IVmRuRjhSQlc1NThRTCtzT1FtUnhR?=
 =?utf-8?B?VHE3ZkNXb2srY3hSSDdJazV2MzhSUDlvaStVSExIZElwQmltSko4eWo0MjdL?=
 =?utf-8?B?M2FPQW9mZi90ME8rYTF1b1BjN2d2S2lzQ0xWUU5xck1LU3FJZDF4OXcwOThO?=
 =?utf-8?B?cng0QktyNHVRQjRRR3ZIVFUxYjJuQmdST0NpOUR1ZWdyRDdpaktYaUdGSWdU?=
 =?utf-8?B?NmpEZmRjWkVDM09VaHV1WlBJY1U4TnY5Q3FpN0pZL0VocHQ1N25VTytBUHgr?=
 =?utf-8?B?cjlqNlpTYzdlSFl4OEoycXFENGpBYVYrakdSSjg0VitKUGt6ZUlIdzd0Z2Np?=
 =?utf-8?B?SFNWeWhyaVNHRkhqMHJVMmJ2SU1oM0tJRWxTQ0pXVXZsdTZRa2dRRVozRm90?=
 =?utf-8?B?TDQ3OEZZT3crNFhVcWxKZHdJRGtSZXY1dTQ2Mk9HYWZLSk92YjhsWGt1bDRS?=
 =?utf-8?B?MElXYjlOS3RjZWNzVmJJQ1F6R0gxMkIra1pCcElRUlJSVmUxWlA3WHZkVkZo?=
 =?utf-8?Q?GfBY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9ae4f3-176e-49ce-2818-08db88c9e217
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 02:34:46.6000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GUcN1LL4lSBu5eSRLaS2AB5D8qMiCSdAg7cdFpDlJ4xBHS8+yeENBUndXm6KiyzjphDp0N8YrBs8mTfBkVn8Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4872
Subject: [virtio-comment] RE: Re: PING: [PATCH v4 0/7] Introduce Virtio Over Fabrics

DQoNCj4gRnJvbTogemhlbndlaSBwaSA8cGl6aGVud2VpQGJ5dGVkYW5jZS5jb20+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgSnVseSAxOSwgMjAyMyAxMDozMiBQTQ0KPiANCj4gT24gNy8xOS8yMyAyMDo0
OCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOg0KPiA+IE9uIFdlZCwgSnVsIDE5LCAyMDIzIGF0
IDEyOjQ0OjUyUE0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4NCj4gPj4NCj4gPj4+
IEZyb206IHpoZW53ZWkgcGkgPHBpemhlbndlaUBieXRlZGFuY2UuY29tPg0KPiA+Pj4gU2VudDog
V2VkbmVzZGF5LCBKdWx5IDE5LCAyMDIzIDM6MDcgQU0NCj4gPj4+DQo+ID4+PiBIaSBTdGVmYW4g
JiBQYXJhdg0KPiA+Pj4NCj4gPj4+IFBpbmchDQo+ID4+Pg0KPiA+Pg0KPiA+PiBUaGlzIHRhc2sg
aXMgbm90IGluIHRoZSB0b3AgaXRlbXMgZm9yIDEuNCBmb3IgdmlydGlvLCBzbyBoYWQgc2xvdyBw
cm9ncmVzcy4NCj4gPj4gSSB3aWxsIHNwZW5kIHNvbWUgdGltZSB0aGlzIG1vbnRoLg0KPiA+DQo+
ID4gbWF5YmUgaXQgc2hvdWxkIGJlIDopDQo+ID4gemhlbndlaSBpZiB5b3UgYXJlIGdvaW5nIHRv
IGRvIHNvbWV0aGluZyBhcyBzaWduaWZpY2FudCBhcyBhZGRpbmcgYQ0KPiA+IG5ldyB0cmFuc3Bv
cnQgeW91IHJlYWxseSBzaG91bGQgam9pbiB0aGUgVEMgYXMgYSBtZW1iZXIgSSB0aGluay4NCj4g
Pg0KPiANCj4gSGkgTWljaGFlbA0KPiANCj4gSSdtIGV4Y2l0ZWQgdG8gam9pbiB0aGUgVEMgYXMg
YSBtZW1iZXIsIEkgaGF2ZSBhbHJlYWR5IHN1YnNjcmliZWQgdGhlIHZpcnRpby0NCj4gY29tbWVu
dCBtYWlsaW5nIGxpc3QsIHNob3VsZCBJIGRvIGFueXRoaW5nIGVsc2U/DQoNCk1pY2hhZWwgd2ls
bCBoYXZlIG1vcmUgZGV0YWlscyB0byBleHBsYWluLA0KDQpJbiBtZWFuIHRpbWUsIHBsZWFzZSBl
eHBsb3JlIGZvbGxvd2luZyBzdGVwcyB0byBqb2luIE9BU0lTIGZvbGxvd2VkIGJ5IHZpcnRpby10
YyBhdCBbMV0uDQoNClsxXSBodHRwczovL3d3dy5vYXNpcy1vcGVuLm9yZy9qb2luLWEtdGMvDQo=

