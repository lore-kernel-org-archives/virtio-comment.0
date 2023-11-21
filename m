Return-Path: <virtio-comment-return-8497-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9CFC61D90
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 16:25:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 252912AEDF
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 16:25:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0DFE9986892
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 16:25:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E1B4C98688A; Tue, 21 Nov 2023 16:25:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D14BE98688B
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 16:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCsMNEUzbciydgFKejQhoJEN0RzOtBTWlexIX7bvAiMceMpGsHDkHogUyU0uwKiJQ+oryaUGYfcGhcs7/XpucKPUnDRY0qI2Uh9AeoTiURJBS80QHvB6fCh6C5i8JWsYwknJwtwkmwNJzJa74ndDqX/3tlpKpq4sJkQ+iAX072x3pKIbDZ14QReCSJ3kGknbAJqF9kE/Qcw6DFRQWPfsv3mn5gMRhx2kwGUfvrRJF0IN2ZbAG5v/COjw0/LcLYzp94zPX+gL27a9fXRDUN3zL2XDfh68nwarWgiEKeA3hNl7z5LpGfIM0Uui2D05TsGwFS0gafXfO5WwXRNnOZHORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYkx/oL6V+1076tQN2Y3SMmPjTkiJQdQazb4tFfu/T0=;
 b=NSk46wXcxfmVWtQA8x5VwPqqQCom0rT/7CmMmEcajkdhCI9yn6R7CpqCvWo6nRJIWA4YN2HngPJxTrjQ2L+wKKWBn2DbN9UJS/qmpSEbQi+ohzBbb6MqSj2N6ZG0QbMNqBhIF3B7MHzIKu89c6zS2MfNWpg3mEOHHtDuqQ6v5d+w+qjeRlL9yLXfdeIj/URMDzchIJs6Io6mVwJsLI82GILelCa/sK5MlI5Wm3cw9Kxw2TISawHUvoYtccMPfAs871YZ0qfydd1elb+G/o8JduGVROom5upGADFEvWeQJUzvslh3ToLyq9N8dkTaDCdK55Jbvyo5g2TDdRe6eSk2Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands
Thread-Index:
 AQHaEfwUGl0o9tnLPEOcv64rj4RwurBwFAEAgAFCeICAAEregIABfKLQgASEhoCABAQNMIAAvw2AgAAohQCAB7JegIAAqq4g
Date: Tue, 21 Nov 2023 16:24:57 +0000
Message-ID:
 <PH0PR12MB54817F78ED7ADD0CBCE4D3A9DCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org>
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org>
 <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813C84CFA5601DB1B47885DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu-Zs-dxcYRjtV+hLBVy5Tv9JzgT2c83Zjzt7A-a1QR2A@mail.gmail.com>
 <PH0PR12MB54810DA3AAA7631319B2C1BFDCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsWN38gptqRBN=50LY6S-yJ0cRQcJk=kih9Dj-7bm0V6Q@mail.gmail.com>
 <20231116014250-mutt-send-email-mst@kernel.org>
 <CACGkMEtb6QF=m3n+yp4-NLXoCHSpQb--iN5XKLmGXCCpCoP_Uw@mail.gmail.com>
In-Reply-To:
 <CACGkMEtb6QF=m3n+yp4-NLXoCHSpQb--iN5XKLmGXCCpCoP_Uw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL3PR12MB6569:EE_
x-ms-office365-filtering-correlation-id: b0b9cb5e-1d09-4259-775c-08dbeaae673b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xAY5khqVLZgzpl0IT6/FhL4XAyIrNgot79ECo0FPCX9SkaWwXp5+y6OQYyv1csXFx9OoK0lloVIZP3TqouukZX7Xbkid+gFLS4sz57XaIFsE0ai+K2vJYc8EHIakA0essS22e17fle6iZApQtOM/HqQwG/7t5xS+RptcMSP0SaA3xBX1TQs82N4/fFV9VotX8wDa0SkoN/abK4b6aUktFTVVzJ7B7GQZF2RidcGV1i1Cgkz7JhYl37pi92IofjxSy1/S1VciKRSeCO5fmnDxuiEocCNoLIozFGThqPXwftlO170xedS1MP4FkSPw1uxrWRs3aBnMKvfxjNKDJgneZ1e6NETbrJBrvIgS8mQ0s78ZKp6NLZT4YqgN5IQzzxU/U0s2no6NPu4H3YnOCn4Sui94KuJMgYlUA+LQyQWZj0O65PYDQGPbfWZOKkzitZLmZZToZGljd0EERhs8G2DtihIRRJrBvqf1TAy1Hhl5E5/rwABhzwqYa2tvUd1rPZDoY9SVvSvsujqwvyAK6GS3Fdde7m/mBRPNv5FFtNa9DMWwz8vazTq/4FHstA++a+p+xm5O2cCDJBGrvbwGNzMSUxyLbL4limaVjIVR6+sZ2oamX0IPhhJpU0H9Db+jFmJ9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(376002)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(86362001)(5660300002)(2906002)(54906003)(64756008)(66946007)(66556008)(66476007)(66446008)(316002)(76116006)(110136005)(8676002)(8936002)(4326008)(52536014)(38070700009)(33656002)(41300700001)(9686003)(55016003)(83380400001)(122000001)(478600001)(7696005)(6506007)(53546011)(71200400001)(26005)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWs4R3NsY0lDQkV2aFd3ODJ3VHN0WjRwZERPL3ZlZTFnY2NXbnF5aDh2dmF6?=
 =?utf-8?B?eklKZFgxTU9jWlU0U0FBY292cHB4R0EzbDN6S1RSOWFsU2tiQWgyU2lWZWYr?=
 =?utf-8?B?TkNzT3VSZWJOVDVvaWJmWUpFUE9xZWtyNU0yUHFpTjFOMng2QVFGZTNoUloz?=
 =?utf-8?B?L2FIcGwrN1FqSGF3aklkVlg1M29GUXdnK0NycHVJbFFyTldCRW51OThOcVdW?=
 =?utf-8?B?L0VCbjBuTDF1YjNzVUFlWityc0xLZkx1QThiQnEzQ0VhaWRKSmR2NTlhNzA1?=
 =?utf-8?B?SFB1bVBNamFHQzAzUW93eHg5K2dkNUVJSnk5ckpIS1Q4dWE3d3RhQXJUZ0pr?=
 =?utf-8?B?ZndiUWVGUTBsbk9sTDluWmpCekNqalBaVlZoZTAxaVlRTlhyODU0VHVjRlMy?=
 =?utf-8?B?UllzT3NKcWg4MDVreWd6VkpILzVoSlNPeTFKcldGVTBxeHgyKzl5ZVRyOU0w?=
 =?utf-8?B?RGtRa3c4WHRKcTRObGNiSjIrTHJuemh6THdRakJ5eHJWc2lCZmtnRFZJaXVC?=
 =?utf-8?B?Mjl2S0VNUy9uMklnRlduNzRTdnBtZ2JGK0RuTW11OTJRK1RpVnVmeTJnWUdJ?=
 =?utf-8?B?Mm1FbnZheXJZNHp0TWtuOFFnMjF3RlFhdmZxNVF6eUdMWlhVZ2VFOTkzWFhQ?=
 =?utf-8?B?MC9Pd1N0WjMySDNidVBGc2lkWnZuZnZUTDkyY2YvbVk4SWF4WVZMamZwY2RC?=
 =?utf-8?B?NHhCTER6RjdvZityZlN6MlcydExYdUVZOWZFTHNQaFlBYTJEb2lGamNYcXY3?=
 =?utf-8?B?UEFlZ0FnUFpIVmVGUDFQRThmMkRSMkp6NGY5YllFekZHVGdoYy9EdktvQmd6?=
 =?utf-8?B?M1RCc2RyZGZFN2VpZWRoSmhteFNILzBadVVqK281Q0VYMGdPdDZwNVlBWk1y?=
 =?utf-8?B?MkZJOG84eVo3ZitKblVPS0lHVnpRdXpaRElzckxRZXg0ZDFCdW44WlZYV1Vl?=
 =?utf-8?B?cjU3Y3JEQUFITFpmSnpidDVUS1FBNXVpSkRhWG1iU2IzRnhRN1d3dUhaYnRF?=
 =?utf-8?B?ZUQvOElOQVlkbDY4VjlCYTVZdnpweXVCT2FUS3pYdlpLNUM0TFlhRjlleHN6?=
 =?utf-8?B?S2lNTHBMVUNFeGc5Mi9Pd0svS2NLU25uenRvTUk2WXZWVkVBUmNUSnJMcFdM?=
 =?utf-8?B?TTN3ckhFUkhRZzgwaGQya3lPcUpHcHh5Nk0wdjIyQlozRklxV2ZEZS9TVnFq?=
 =?utf-8?B?eFR0eWlMRGtqRklIV2pnSC9SRHlFS2pFWU5SOXhjMk90L2UxNWFyVWcwRWk0?=
 =?utf-8?B?bXVENVBUQkVsNUFyMDQxV09uVWN4U25mMkZUVEgxbElNaTNtckVTN01WYlcz?=
 =?utf-8?B?UzNIUnBZQkpzRzB1QTM2VFZrZWVsS2xxSDE1OTN5V1dpZ21mSVd0YkRvSDRB?=
 =?utf-8?B?cVVVVmh0c1M2UUpPWVdJMkRRVk5qVEt4UHJ0bEZhUzd3blVWTGx5a00raTdE?=
 =?utf-8?B?bVprMlBKOXg3WkZFUHBQSjdxNm5FQ0ZlVEZYV2Jzb1BwaUdtQmdkMzR6WkxQ?=
 =?utf-8?B?UlRCcGFETDRaSHIreXBFMWV5Y2xPS0k4cUhNWUorTUFKaTg1eDc2UjlkUzRr?=
 =?utf-8?B?dU1Ba1VhS2J4MTF0WG8rSlBnems3VjJtREp1WjI4WkY0NTFzeFZMQjczaWVK?=
 =?utf-8?B?bzh1WW5lbkVmWlozUks1NVMrcHdLMW5sMFl1V3NoVXdIa1J2U05JUnJuZ0du?=
 =?utf-8?B?cVlORHpFMG5yaTRzRE1WSEZFUEs4RE9qWWVqa1YwQnVpMnF6dVAvYW5NVVZK?=
 =?utf-8?B?Wk8rZXd2aTV4T3V0Ukh6RDJZcElIYzVNY21SWGtIS095SmRhNVBTK0tRZk4y?=
 =?utf-8?B?U2ViN0ZJKzZUdzQ4akw0NjVlV2IrZEo2eEJnRUc2OEFNMURJZTJGcWx1aktL?=
 =?utf-8?B?bUNqbnpZZ0d6elA3bFZTNStReUo2MWZlNHdpNzdnYm9zc2pxN3ZtQ0VxRDcz?=
 =?utf-8?B?T3ZMYmJGQWxWTzNZSlB6SU1XK2kyM0tTRzlZYXVLL2NJQmRkOG9vY3dkcmNG?=
 =?utf-8?B?RURNb2dHWkdOS28rTGdzMU1nNTBkUTRxaTVuZ0dwTzR1NGFZTXdnNS9KamVU?=
 =?utf-8?B?YjFTSWdTKzB2Q3JBZXBjTnZRZ2RvVVJLMllhbHlRUGhqRXFIK2NMazNkakd3?=
 =?utf-8?Q?+mgw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b9cb5e-1d09-4259-775c-08dbeaae673b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 16:24:57.9680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xojLC5pQsIXivzJjO6tqKA2wziUN/3mavQTWswlpoycspdk0kW6xoxVrlPpgOnyjaYiQpyqjkXh1C+ePXG1AFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIE5vdmVtYmVyIDIxLCAyMDIzIDk6NTIgQU0NCj4gDQo+IE9uIFRodSwgTm92IDE2LCAyMDIz
IGF0IDI6NDnigK9QTSBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0KPiB3cm90
ZToNCj4gPg0KPiA+IE9uIFRodSwgTm92IDE2LCAyMDIzIGF0IDEyOjI0OjI3UE0gKzA4MDAsIEph
c29uIFdhbmcgd3JvdGU6DQo+ID4gPiBPbiBUaHUsIE5vdiAxNiwgMjAyMyBhdCAxOjM34oCvQU0g
UGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0KPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+
ID4NCj4gPiA+ID4gPiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiA+
ID4gPiA+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMTMsIDIwMjMgOToxMSBBTQ0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gT24gRnJpLCBOb3YgMTAsIDIwMjMgYXQgMjo0NuKAr1BNIFBhcmF2IFBhbmRp
dCA8cGFyYXZAbnZpZGlhLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
SGkgTWljaGFlbCwNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IEZyb206IE1pY2hhZWwgUy4g
VHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+ID4gPiA+ID4gPiA+IFNlbnQ6IFRodXJzZGF5LCBO
b3ZlbWJlciA5LCAyMDIzIDE6MjkgUE0NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBbLi5dDQo+
ID4gPiA+ID4gPiA+ID4gQmVzaWRlcyB0aGUgaXNzdWUgb2YgcGVyZm9ybWFuY2UsIGl0J3MgYWxz
byByYWN5LCBhc3N1bWluZw0KPiA+ID4gPiA+ID4gPiA+IHdlIGFyZSBsb2dnaW5nDQo+ID4gPiA+
ID4gPiA+IElPVkEuDQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiAwKSBkZXZpY2Ug
bG9nIElPVkENCj4gPiA+ID4gPiA+ID4gPiAxKSBoeXBlcnZpc29yIGZldGNoZXMgSU9WQSBmcm9t
IGxvZyBidWZmZXINCj4gPiA+ID4gPiA+ID4gPiAyKSBndWVzdCBtYXAgSU9WQSB0byBhIG5ldyBH
UEENCj4gPiA+ID4gPiA+ID4gPiAzKSBoeXBlcnZpc29yIHRyYXZlcnNlIGd1ZXN0IHRhYmxlIHRv
IGdldCBJT1ZBIHRvIG5ldyBHUEENCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IFRo
ZW4gd2UgbG9zdCB0aGUgb2xkIEdQQS4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gSW50
ZXJlc3RpbmcgYW5kIGEgZ29vZCBwb2ludC4gQW5kIGJ5IHRoZSB3YXkgZS5nLiB2aG9zdCBoYXMN
Cj4gPiA+ID4gPiA+ID4gdGhlIHNhbWUgaXNzdWUuICBZb3UgbmVlZCB0byBmbHVzaCBkaXJ0eSB0
cmFja2luZyBpbmZvIHdoZW4NCj4gPiA+ID4gPiA+ID4gY2hhbmdpbmcgdGhlIG1hcHBpbmdzIHNv
bWVob3cuICBQYXJhdiB3aGF0J3MgdGhlIHBsYW4gZm9yDQo+ID4gPiA+ID4gPiA+IHRoaXM/IFNo
b3VsZCBiZSBhZGRyZXNzZWQgaW4NCj4gPiA+ID4gPiB0aGUgc3BlYyB0b28uDQo+ID4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiBBcyB5b3UgbGlzdGVkIHRoZSBmbHVzaCBpcyBuZWVkZWQgZm9yIHZo
b3N0IG9yIGRldmljZS1iYXNlZCBEUFQuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBXaGF0IGRvZXMg
RFBUIG1lYW4/IERldmljZSBQYWdlIFRhYmxlPyBMZXQncyBub3QgaW52ZW50DQo+ID4gPiA+ID4g
dGVybWlub2xvZ3kgd2hpY2ggaXMgbm90IGtub3duIGJ5IG90aGVycyBwbGVhc2UuDQo+ID4gPiA+
ID4NCj4gPiA+ID4gU29ycnkgZm9yIHVzaW5nIHRoZSBhY3JvbnltLiBJIG1lYW50IGRpcnR5IHBh
Z2UgdHJhY2tpbmcuDQo+ID4gPiA+DQo+ID4gPiA+ID4gV2UgaGF2ZSBkaXNjdXNzZWQgaXQgbWFu
eSB0aW1lcy4gWW91IGNhbid0IGp1c3QgZGVwZW5kIG9uIEFUUyBvcg0KPiA+ID4gPiA+IHJlaW52
ZW50aW5nIHdoZWVscyBpbiB2aXJ0aW8uDQo+ID4gPiA+IFRoZSBkZXBlbmRlbmN5IGlzIG9uIHRo
ZSBpb21tdSB3aGljaCB3b3VsZCBoYXZlIHRoZSBtYXBwaW5nIG9mDQo+IEdJT1ZBIHRvIEdQQSBs
aWtlIGFueSBzdyBpbXBsZW1lbnRhdGlvbi4NCj4gPiA+ID4gTm8gZGVwZW5kZW5jeSBvbiBBVFMu
DQo+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBXaGF0J3MgbW9yZSwgcGxlYXNlIHRyeSBu
b3QgdG8gZ2l2ZSBtZSB0aGUgaW1wcmVzc2lvbiB0aGF0IHRoZQ0KPiA+ID4gPiA+IHByb3Bvc2Fs
IGlzIG9wdGltaXplZCBmb3IgYSBzcGVjaWZpYyB2ZW5kb3IgKGxpa2UgZGV2aWNlIElPTU1VIHN0
dWZmcykuDQo+ID4gPiA+ID4NCj4gPiA+ID4gWW91IHNob3VsZCBzdG9wIGNhbGxpbmcgdGhpcyBz
cGVjaWZpYyB2ZW5kb3IgdGhpbmcuDQo+ID4gPg0KPiA+ID4gV2VsbCwgYXMgeW91IGhhdmUgZXhw
bGFpbmVkLCB0aGUgY29uZnVzaW9uIGNhbWUgZnJvbSAiRFBUIiAuLi4NCj4gPiA+DQo+ID4gPiA+
IE9uZSBjYW4gZXF1YWxseSBzYXkgdGhhdCBzdXNwZW5kIGJpdCBwcm9wb3NhbCBpcyBmb3IgdGhl
IHN3X3ZlbmRvcg0KPiBkZXZpY2Ugd2hvIGlzIGZvcmNpbmcgdmlydGlvIGh3IGRldmljZSB0byBv
bmx5IGltcGxlbWVudCBpb3F1ZXVlcyArIFBBU0lEICsNCj4gbm9uX3VuaWZpZWQgaW50ZXJmYWNl
IGZvciBQRiwgVkYsIFNJT1ZzICsgbm9uX1RESVNQIGJhc2VkIGRldmljZXMuDQo+ID4gPiA+DQo+
ID4gPiA+ID4gPiBUaGUgbmVjZXNzYXJ5IHBsdW1iaW5nIGlzIGFscmVhZHkgY292ZXJlZCBmb3Ig
dGhpcyBpbiB0aGUNCj4gPiA+ID4gPiA+IHF1ZXJ5IChyZWFkIGFuZA0KPiA+ID4gPiA+IGNsZWFy
KSBjb21tYW5kIG9mIHRoaXMgdjMgcHJvcG9zYWwuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGUg
aXNzdWUgaXMgbG9nZ2luZyB2aWEgSU9WQSAuLi4gSSBkb24ndCBzZWUgaG93ICJyZWFkIGFuZCBj
bGVhciIgY2FuDQo+IGhlbHAuDQo+ID4gPiA+ID4NCj4gPiA+ID4gUmVhZCBhbmQgY2xlYXIgaGVs
cHMgdGhhdCBlbnN1cmVzIHRoYXQgYWxsIHRoZSBkaXJ0eSBwYWdlcyBhcmUgcmVwb3J0ZWQsDQo+
IGhlbmNlIHRoZXJlIGlzIG5vIG1hcHBpbmcvdW5tYXBwaW5nIHJhY2UuDQo+ID4gPg0KPiA+ID4g
UmVwb3J0ZWQgYXMgSU9WQSAuLi4NCj4gPiA+DQo+ID4gPiA+IEFzIGV2ZXJ5dGhpbmcgaXMgcmVw
b3J0ZWQuDQo+ID4gPiA+DQo+ID4gPiA+ID4gPiBJdCBpcyBsaXN0ZWQgaW4gRGV2aWNlIFdyaXRl
IFJlY29yZHMgUmVhZCBDb21tYW5kLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gUGxlYXNlIGV4cGxh
aW4gaG93IHlvdXIgcHJvcG9zYWwgY2FuIHNvbHZlIHRoZSBhYm92ZSByYWNlLg0KPiA+ID4gPiA+
DQo+ID4gPiA+IEluIGJlbG93IG1hbm5lci4NCj4gPiA+ID4gMS4gZ3Vlc3QgaGFzIEdJT1ZBIHRv
IEdQQV8xIG1hcHBpbmcgMi4gUlggcGFja2V0cyBvY2N1cnJlZCB0bw0KPiA+ID4gPiBHSU9WQSAz
LiBkZXZpY2UgcmVwb3J0ZWQgZGlydHkgcGFnZSBsb2cgZm9yIEdJT1ZBIChoeXBlcnZpc29yIGlz
DQo+ID4gPiA+IHlldCB0byByZWFkKSA0LiBndWVzdCByZXF1ZXN0ZWQgbWFwcGluZyBjaGFuZ2Ug
ZnJvbSBHSU9WQSB0byBHUEFfMg0KPiA+ID4gPiA0LjEgRHVyaW5nIHRoaXMgSU9UTEIgaXMgaW52
YWxpZGF0ZWQgYW5kIGRpcnR5IHBhZ2UgcmVwb3J0IGlzDQo+ID4gPiA+IHF1ZXJpZWQgZW5zdXJp
bmcsIGl0IGNhbiBjaGFuZ2UgdGhlIG1hcHBpbmcNCj4gPiA+DQo+ID4gPiBJdCByZXF1aXJlcw0K
PiA+ID4NCj4gPiA+IDEpIGh5cGVydmlzb3IgdHJhcHMgSU9UTEIgaW52YWxpZGF0aW9uLCB3aGlj
aCBkb2Vzbid0IHdvcmsgd2hlbg0KPiA+ID4gbmVzdGluZyBjb3VsZCBiZSBvZmZsb2FkZWQgKElP
TU1VRkQgaGFzIHN0YXJ0ZWQgdGhlIHdvcmsgdG8gc3VwcG9ydA0KPiA+ID4gbmVzdGluZykNCj4g
PiA+IDIpIHF1ZXJ5IHRoZSBkZXZpY2UgYWJvdXQgdGhlIGRpcnR5IHBhZ2Ugb24gZWFjaCBJT1RM
QiBpbnZhbGlkYXRpb24gd2hpY2g6DQo+ID4gPiAyLjEpIEEgaHVnZSByb3VuZCB0cmlwOiBndWVz
dCBJT1RMQiBpbnZhbGlkYXRpb24gLT4gdHJhcHBlZCBieQ0KPiA+ID4gaHlwZXJ2aXNvciAtPiBz
dGFydCB0aGUgcXVlcnkgZnJvbSB0aGUgZGV2aWNlIC0+IGRldmljZSByZXR1cm4gLT4NCj4gPiA+
IGh5cGVydmlzb3IgcmVwb3J0cyBJT1RMQiBpbnZhbGlkYXRpb24gaXMgZG9uZSAtPiBsZXQgZ3Vl
c3QgcnVuLiBIYXZlDQo+ID4gPiB5b3UgYmVuY2htYXJrZWQgdGhlIFJUVCBpbiB0aGlzIGNhc2U/
IFRoZXJlIGFyZSBqdXN0IHRvbyBtYW55IHBsYWNlcw0KPiA+ID4gdGhhdCBjYXVzZSB0aGUgZGVs
YXkgaW4gdGhlIG1pZGRsZS4NCj4gPg0KPiA+IFRvIGJlIGZhaXIgaW52YWxpZGF0aW9ucyBhcmUg
YWxyZWFkeSBleHBlbnNpdmUgZS5nLiB3aXRoIHZob3N0IGlvdGxiDQo+ID4gaXQgcmVxdWlyZXMg
YSBzbG93IHN5c3RlbSBjYWxsLg0KPiA+IFRoaXMgd2lsbCBtYWtlIHRoZW0gKmV2ZW4gbW9yZSog
ZXhwZW5zaXZlLg0KPiANCj4gWWVzLCBhIHNsb3cgc3lzY2FsbCBwbHVzIGEgdmlydHF1ZXVlIHF1
ZXJ5IFJUVC4NCj4gDQpPbmx5IGR1cmluZyB2aW9tbXUgY2FzZS4NCldpdGhvdXQgdGhpcyBpcyBu
b3QgYXBwbGljYWJsZS4NCg0KPiBOZWVkIHNvbWUgYmVuY2htYXJrLiBJdCBsb29rcyB0byBtZSBj
dXJyZW50bHkgdGhlIGludmFsaWRhdGlvbiBpcyBkb25lIHZpYSBhDQo+IHF1ZXVlZCBiYXNlZCBp
bnRlcmZhY2UgaW4gdnRkLiBTbyBndWVzdHMgbWF5IG5lZWQgdG8gc3BpbiB3aGVyZSBpdCBtYXkg
dHJpZ2dlcg0KPiBhIGxvY2t1cCBpbiB0aGUgZ3Vlc3QuDQo+IA0KDQo+ID4NCj4gPiBQcm9ibGVt
IGZvciBzb21lIGJ1dCBub3QgYWxsIHdvcmtsb2Fkcy4gIEFnYWluIEkgYWdyZWUgbW90aXZhdGlv
biwNCj4gPiB0cmFkZW9mZnMgYW5kIGNvbXBhcmlzb24gd2l0aCBib3RoIGRpcnR5IHRyYWNraW5n
IGJ5IGlvbW11IGFuZCBzaGFkb3cNCj4gPiB2cSBhcHByb2FjaGVzIHJlYWxseSBzaG91bGQgYmUg
aW5jbHVkZWQuDQo+IA0KRGlydHkgdHJhY2tpbmcgaXMgaW9tbXUgdG8gYmUgY29uc2lkZXJlZC4N
ClNoYWRvdyB2cSBpcyBub3QgaW4gbXkgc2NvcGUgYW5kIGl0IGRvZXMgbm90IGZpdCB0aGUgYmFz
aWMgcmVxdWlyZW1lbnRzIGFzIGV4cGxhaW5lZCBiZWZvcmUuDQpTbyBpdCBpcyBkaWZmZXJlbnQg
ZGlzY3Vzc2lvbi4NCg0KPiArMQ0KPiANCj4gPg0KPiA+DQo+ID4gPiAyLjIpIEd1ZXN0IHRyaWdn
ZXJhYmxlIGJlaGF2aW91ciwgbWFsaWNpb3VzIGd1ZXN0IGNhbiBzaW1wbHkgZG8NCj4gPiA+IGVu
ZGxlc3MgSU9UTEIgaW52YWxpZGF0aW9uIHRvIERPUyB0aGUgZS5nIGFkbWluIHZpcnRxdWV1ZQ0K
PiA+DQo+ID4gSSdtIG5vdCBzdXJlIGhvdyBtdWNoIHRvIHdvcnJ5IGFib3V0IGl0IC0ganVzdCBk
b24ndCBhbGxvdyBtb3JlIHRoYW4NCj4gPiBvbmUgaW4gZmxpZ2h0IHBlciBWTS4NCj4gDQo+IFRo
YXQncyBmaW5lIGJ1dCBpdCBtYXkgbmVlZCBhIG5vdGUuDQo+IA0KPiBUaGFua3MNCj4gDQo+IA0K
PiA+DQo+ID4NCj4gPg0KPiA+ID4gPg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFdoZW4gdGhl
IHBhZ2Ugd3JpdGUgcmVjb3JkIGlzIGZ1bGx5IHJlYWQsIGl0IGlzIGZsdXNoZWQuDQo+ID4gPiA+
ID4gPiBIb3cvd2hlbiB0byB1c2UsIEkgdGhpbmsgaXRzIGh5cGVydmlzb3Igc3BlY2lmaWMsIHNv
IHdlDQo+ID4gPiA+ID4gPiBwcm9iYWJseSBiZXR0ZXIgb2ZmIG5vdA0KPiA+ID4gPiA+IGRvY3Vt
ZW50aW5nIHRob3NlIGRldGFpbHMuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBXZWxsLCBhcyB0aGUg
YXV0aG9yIG9mIHRoaXMgcHJvcG9zYWwsIGF0IGxlYXN0IHlvdSBuZWVkIHRvIGtub3cNCj4gPiA+
ID4gPiBob3cgYSBoeXBlcnZpc29yIGNhbiB3b3JrIHdpdGggeW91ciBwcm9wb3NhbCwgbm8/DQo+
ID4gPiA+ID4NCj4gPiA+ID4gTGlrZWx5IHllcywgYnV0IGl0IGlzIG5vdCB0aGUgc2NvcGUgb2Yg
dGhlIHNwZWMgdG8gbGlzdCB0aG9zZSBwYXRocyBldGMuDQo+ID4gPg0KPiA+ID4gRmluZSwgYnV0
IGFzIGEgcmV2aWV3ZXIgSSBuZWVkIHRvIGtub3cgaWYgaXQgY2FuIHdvcmsgd2l0aCBhIGh5cGVy
dmlzb3Igd2VsbC4NCj4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+ID4gPiBNYXkgYmUgc3VjaCByZWFk
IGlzIG5lZWRlZCBpbiBzb21lIG90aGVyIHBhdGggdG9vIGRlcGVuZGluZyBvbg0KPiA+ID4gPiA+
ID4gaG93DQo+ID4gPiA+ID4gaHlwZXJ2aXNvciBpbXBsZW1lbnRlZC4NCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IFdoYXQgZG8geW91IG1lYW4gYnkgIk1heSBiZSAuLi4gc29tZSBvdGhlciBwYXRoIiBo
ZXJlPyBZb3UncmUNCj4gPiA+ID4gPiBpbnZlbnRpbmcgYSBtZWNoYW5pc20gdGhhdCB5b3UgZG9u
J3Qga25vdyBob3cgYSBoeXBlcnZpc29yIGNhbiB1c2U/DQo+ID4gPiA+DQo+ID4gPiA+IE5vLiBJ
IG1lYW50IGh5cGVydmlzb3IgbWF5IGhhdmUgbW9yZSBvcGVyYXRpb25zIHRoYXQNCj4gbWFwL3Vu
bWFwL2ZsdXNoIHdoZXJlIGl0IG1heSBuZWVkIHRvIGltcGxlbWVudCBpdC4NCj4gPiA+ID4gU29t
ZSBvbmUgbWF5IGNhbGwgaXQgc2V0X21hcCgpLCBzb21lIG1heSBzYXkgZG1hX21hcCgpLi4uDQo+
ID4gPg0KPiA+ID4gT2suDQo+ID4gPg0KPiA+ID4gVGhhbmtzDQo+ID4NCg0K

