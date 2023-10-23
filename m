Return-Path: <virtio-comment-return-7894-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0FBC25B41
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 04:42:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0A7BD3309F
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 04:42:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E4B3A986666
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 04:42:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CEACC986377; Mon, 23 Oct 2023 04:42:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BA086986663
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 04:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqKYY+JkB9pFFQ17iRmuq2gZqecAYTTknW3APM6BlD/mljzdS4cIYmM2dEqqboYL5R6/LVD/qpimlr3W0+Z0StYdbTqWX0+iWXzBY5A79RV4o3daMHxpHKNo7UQTbajclgCHXp1B99y1an29cwc02unYS4Bw8Pj2BKCAYSJXcfexr/L76FCbS6Z/zhnp2XdbRGikSw4jVvBGKt18OYheuTCBIof2Gjin4s5W0LZERQbU82LTcVeXy18u4mzWW0ECcrqAsY0exk5Jr5H5aMOMZi52iuQHNixvQx2/qCrbjCC84tTznWOVQNiKUtetgjxhSwnZ3l8QFpbw26ksheMuSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyy8pCTlQct8/43Spr2W3mpiG1SqTjbCuatPImk3TbU=;
 b=Vpw88h3dEFIJWGh0WI3IHpcf7+CseeeJTN4bmKjmBgIex5dnB3/kV39IIWHrob6ro3W3vsIHDfAJ2Rnko+TI0OJQLdU5pfHihei5bcbuyEsvvAPjffeSKE1JJkNN92aBmSP04S7btXoSrUQksQNEHYdEE/CmdqA3TRn2+dYG6i6DhVU+Y4AEhNUhBn4A4E/0EEHZ3WeKkNxcHkKEVY1QCruGUDK55CB6cc9R+tMMB6WPoDVT+oXN9O5dMOeGmjFCvBBMTBWeEp6mj2M07r6INK42KjjwTD0a3fjozQG5ytbH65K73BA+tDp4nRiTCBr4YG/RG9b5MQ2hcXek/Jg0lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCABizrAIAAD2ag
Date: Mon, 23 Oct 2023 04:42:19 +0000
Message-ID:
 <PH0PR12MB5481A39FADD3A19F0CBF1B66DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com>
 <PH0PR12MB5481F8312139BB197CEB024BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtihTxYADd1dbG=vX9=VLp0xfRJSQ4jd_m0UiuZNz_2sg@mail.gmail.com>
 <PH0PR12MB5481E85F17F9D22CBCC9FDF8DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com>
 <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMF4JVEQJ6skT2DrEWjop6wjKS6ad6dW2UNOA1oRuPKQ@mail.gmail.com>
 <PH0PR12MB548109DEAE4B6C76025BD57ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com>
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsfyOCf-qCxr7kGM7WPco3YgeBsbOXbDT9AtigZpXF6Tg@mail.gmail.com>
In-Reply-To:
 <CACGkMEsfyOCf-qCxr7kGM7WPco3YgeBsbOXbDT9AtigZpXF6Tg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ2PR12MB8881:EE_
x-ms-office365-filtering-correlation-id: bd07ef16-6c68-48d9-12c8-08dbd38270d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lZNzsCrPzmv/oHceENPjKNOZG1xCds+FmNpbAbNGZqlVDmy7pOlF7dE3+S4QPf0v41FnAsNgL8kGaT/igzWK3vZBRENdKL2twn9imFT9EO8yVzrV3lK3tVvH0xpIesKRS+KP14olhQhpT5bGI/W77/ccoH8k5khBBmAK/AQiyQrZbAXVdOKeTOzatg5nXO67A/7Ph+y1Ba3c6EaLcLrIDo7r+OtJ4TVCMzwziDgC+x2hqxZdWw5tjip4GH/2m4NLoIC5ofD9CMbMkO5dBo7m2Q+Ka7/+I+mJY/Xgs+sd/sdbyFoSuyieO9FiPt9C1swHk4sBUgYT2hqzjXTzyF2ztfSLPXfHBG3ZPJnUd6FL1pADGKLLhUAKqiyhrbRZ4XOjkPpKXoMFqC9liXSIjrZcyp/7Mg6z0g71pKFVZwjF5kRrjGZ5A6g8zYRGYBKwt/pAL9BvNeZBmLRt0dSjw2zc1lzL96z8wePJhx/+OvYVcX/XGL3+MXi6IAxIMEwKd8LmVlmvr4zBm++Tfonyc7llSFyqdGx+ui/xQMlwzeEkQtzCH8y80WuZyotMLBH8e2Jb3q4RZ1V4qF1KhvYR8fML2WPQCEtSiEZJ+WoJhKTG/owLYUhjIuUjSLbkUscyAst1
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(38070700009)(478600001)(55016003)(2906002)(53546011)(55236004)(7696005)(66476007)(9686003)(66446008)(26005)(54906003)(71200400001)(6506007)(107886003)(86362001)(66946007)(33656002)(64756008)(316002)(122000001)(83380400001)(4326008)(76116006)(41300700001)(66556008)(38100700002)(8676002)(5660300002)(8936002)(52536014)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YTJaSjJYeGh5OWFPd0kwSGZuVjFTdXJ1R2V5eE16OStqNGxmTE9WL1ppbmIv?=
 =?utf-8?B?ZnN1T1IrbDQ0TzZocmEzYUVWMlZMZDJ2eWVlNFhCc2czcFIzQ2lucW1LRUp0?=
 =?utf-8?B?ZDUxV1VuRklLSUY2L1AycTc3RXpjcHRyYm8zUDRqczZsOFBIaG5YSU12NzZZ?=
 =?utf-8?B?VWc5L0F1TE9xWFZMS3pxUmlFVzVWUlJ0c0Z3dFprc1VNb0lndWx4bU5LOVVM?=
 =?utf-8?B?ZDJtOHpLYTVHa0Jpa1JQMVpBV0h1ZGxQd1NRZ3AyZU9GYXIwRWF1WGsxK1J5?=
 =?utf-8?B?R0FmdFkyMHNDNEEycXpZMkhpanBRN3Nab0FrbTAycFFhZi9CVGtZaisrYW9j?=
 =?utf-8?B?cUgrdGhnUUxSdFNMbGV4a3dURmNuTHp0eWg5Nzkxek9lblozVGZkdkxUQkt4?=
 =?utf-8?B?Z040amFvKzFZWHM3SVhqRHUrZlNIVmtSTmdNV3BJWUtGc2ZBVC9PWFFQTVVP?=
 =?utf-8?B?S1h5bTkvWWpwZWRaVENMN084UTVaeVY3OEJQcEgybGRncHBFUEw0L2dwSjdV?=
 =?utf-8?B?UHUxYktlZTVML2FRdXZIeTZndjdaYVpHendOaFhyT201b25tWVA0emR3dEFG?=
 =?utf-8?B?dU5PdVlmU3U2dHpSVm1aTFNSQkNCYnBwaEkzYnUzaE1LQi9ZdmpCN2NGZmkx?=
 =?utf-8?B?NjlJWHYzK1d6bDkzQVJOY25xaFJnNklvZVRmTkwyRWVlazhpNVBQcG1hdWpY?=
 =?utf-8?B?c3I1dmJlUnNtZGE3a2pxOEI4WUhJUU5Tb3dvYUMwaHFFY3h2QWFQc3JKV3k1?=
 =?utf-8?B?V2NqQXVBUUUzZk1wTzArYWJqVUM2Sy85QTMxT0dxeGEzVVByM2hIOWY1K255?=
 =?utf-8?B?RXdwTXdWaDRoZEl5YkJrR2xscURiOGFuYngxUTYxT3B2akxmMzd1L1g5c0o5?=
 =?utf-8?B?YjMzSGdlWkdmRVJGMjRZZ0RKNk4zMUNOcFR3czB6UHArUmZWcSszRmZxZjBz?=
 =?utf-8?B?SWcrUEJiZnFlcDQ4UU9sbWxWTUNDanNTbWxFdjB4MXhQaldzQXVVOEVHMWFh?=
 =?utf-8?B?WlI4UzB5VWRBUVB3WFBSUGlDUkY2TEU2ZWU5TE42aG1tK1c5OWR4SFdFbzly?=
 =?utf-8?B?MUJiMFpGaHBZb2g0UkhmZFBacWhPRk5XVjZEWEtGZGxyTXFlS280cm5SU3g5?=
 =?utf-8?B?UWJkRHdEZGlGUDE5RjRSOTlvYXlqVU1ucXN0aHBibDNSMG8wUkJoVGlpYm56?=
 =?utf-8?B?TUc2K0kxM3NrTFBuZzJsa29oUnowZjFnY2lieHNqNUlRWS9yV3owMEUwcnZx?=
 =?utf-8?B?VUhRZGt4WHc4RkpTUUVYanJ0T1pPYzVHL3I5VDNpanRlREV1TC81QmluanM4?=
 =?utf-8?B?RGJQdytWeWtxcktWTEI2dmxHbDR1UUZNSDNaL3Z1KzNBcGZCSXBsNHo1alAv?=
 =?utf-8?B?MXdUeFZNVC9FRDQ4RlVzdlFsNk1QUEpGSFdzeUVVZjdDdXQvemxwNjMyS0VK?=
 =?utf-8?B?TTQyaTF5REdScWJPb0JzamhlcTlVY3RFTEJJQldUeGRNdy9uYlpKZGdvc3hs?=
 =?utf-8?B?MlZMak9abVZtWnU2U0FGRU56cXY2a2M3UXlZcUUva2wzbWRnQXMvSlN3NEYv?=
 =?utf-8?B?UC9iVXFvVFM3K1JFYktoM2VPWEMyR3c3TmRYcC9zaCtTNTV3OWRUQVRYRkVs?=
 =?utf-8?B?aWQ2OUcxTEc4RHdTTjNZTENRT0d6YWQwZlZaSG9DRFFKYmhSenNTaXhkbU1s?=
 =?utf-8?B?TGxoajVyWmUwTXpZNk5kK2xlZTY2dlNBczJuRDYrSDRsTUJGbSs4QVNqNEJs?=
 =?utf-8?B?c1lydndjUjk0NEM4Z0Z3Wlp6ZXpWRHBrYTNTWTFiU1JpeDBFOFdqWTVlNGwr?=
 =?utf-8?B?aXJEYURYUTlNb2VxanZDa2VTcS8rbDRQU2xReWdOV0RhREVVMlRUdjBHUnlr?=
 =?utf-8?B?bi81OTJqa21mNExoNThnZFZmWTVkYXZpUTJlUEFCM1NxMVRlbVB6WnJ3SnJB?=
 =?utf-8?B?QklEREw5ZExnd2lEbVRmNWRvcjhvMWZ5cWo5dWtDQVlZbDR5cEFJVUhVLzBG?=
 =?utf-8?B?MDZWWVhCNUdGYWwvQWZLenU3TElhMGxVeENhZk5RenUrbWtSdTVNVDRNMDNv?=
 =?utf-8?B?cDBRcUJndUxGdTgrZTkvMklLWVRqdkNNaUtINUNyV1dod2ZzUG16NXZ0cUtu?=
 =?utf-8?Q?zUzc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd07ef16-6c68-48d9-12c8-08dbd38270d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 04:42:19.4936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ptTMuE+k/2VHEBSZbHWn7C7i7qy9Mle9+QY01oD9sBmFxFp70QAj/Q9X30g+wlTS4sypjx5pZWCvdvhtMbK3HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8881
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBPY3RvYmVyIDIzLCAyMDIzIDk6MTUgQU0NCj4gDQo+IE9uIFRodSwgT2N0IDE5LCAyMDIz
IGF0IDE6MzLigK9QTSBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+IHdyb3RlOg0KPiA+
DQo+ID4NCj4gPg0KPiA+ID4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5v
cmcNCj4gPiA+IDx2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy0gb3Blbi5vcmc+IE9uIEJlaGFs
ZiBPZiBKYXNvbiBXYW5nDQo+ID4gPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAxOSwgMjAyMyAx
MDoxNSBBTQ0KPiA+ID4NCj4gPiA+ID4gPiBBZ2FpbiwgaWYgeW91IGRvbid0IHdhbnQgdG8gdGFs
ayBhYm91dCB0cmFuc3BvcnQgdmlydHF1ZXVlLA0KPiA+ID4gPiA+IHRoYXQncyBmaW5lLiBCdXQg
bGV0J3MgbGVhdmUgdGhlIHNjYWxhYmlsaXR5IGlzc3VlIGFzaWRlIGFzIHdlbGwuDQo+ID4gPiA+
ID4NCj4gPiA+ID4gUmVnaXN0ZXJzIGFyZSByZWxhdGVkIGZvciBmdW5jdGlvbmFsaXR5IGFuZCBz
Y2FsZS4NCj4gPiA+ID4NCj4gPiA+ID4gTGV0cyBmaXJzdCBhZ3JlZSBvbiB1c2UgY2FzZSBiZWZv
cmUgdGhlIGRlc2lnbiwgdGhhdCBJIGFza2VkIGFib3ZlLg0KPiA+ID4gPg0KPiA+ID4gPiBJIHdp
bGwgd2FpdCB0byByZXNwb25kIHRvIGFueSBvdGhlciBlbWFpbHMgdW50aWwgd2UgYWdyZWUgb24g
dXNlDQo+ID4gPiA+IGNhc2UNCj4gPiA+IHJlcXVpcmVtZW50cy4NCj4gPiA+DQo+ID4gPiBUaGVy
ZSBhcmUgbW9yZSB0aGFuIGp1c3QgbWUgd2hvIHdhbnQgeW91IHRvIGRlZmluZSAicGFzc3Rocm91
Z2giDQo+ID4gPiBmaXJzdCB3aGVyZSB5b3UgcmVmdXNlIHRvIHJlc3BvbmQuDQo+ID4gPg0KPiA+
IFRvdGFsbHkgZGlzYWdyZWUuDQo+ID4gSW4gdGhlIHByZXZpb3VzIGVtYWlsIGl0c2VsZiwgSSB3
cm90ZSB3aGF0IHBhc3N0aHJvdWdoIGlzLg0KPiA+IFNvIGxldCdzIHRyeSB5ZXQgb25lIG1vcmUg
dGltZS4NCj4gPiBFaXRoZXIgeW91IGNhbiByZS1yZWFkIGxhc3QgZW1haWwgb3IgZm9yIGJldHRl
ciByZWFkIGJlbG93IGFuZCBzZWUgaWYgaXQgaXMNCj4gdW5kZXJzdG9vZCBvciBub3QuDQo+ID4N
Cj4gPiA+IEhvdyBjb3VsZCB3ZSBtYWtlIGFueSBhZ3JlZW1lbnQgd2l0aG91dCBhbiBhY2N1cmF0
ZSB0aGUgZGVmaW5pdGlvbg0KPiA+ID4gb2YgInBhc3N0aHJvdWdoIiB3aG8gaXMgYSBrZXkgdG8g
dW5kZXJzdGFuZCBlYWNoIG90aGVyPw0KPiA+DQo+ID4gSSByZXBsaWVkIGZldyB0aW1lcyBpbiBw
YXN0IGVtYWlscyBidXQgc2luY2UgdGhvc2UgZW1haWwgdGhyZWFkcyBhcmUgc28gbG9uZywgaXQg
aXMNCj4gZWFzeSB0byBtaXNzIG91dC4NCj4gPg0KPiA+IFBhc3N0aHJvdWdoIGRlZmluaXRpb246
DQo+ID4gYS4gdmlydGlvIG1lbWJlciBkZXZpY2UgbWFwcGVkIHRvIHRoZSBndWVzdCB2bQ0KPiAN
Cj4gSSByZWFsbHkgdGhpbmsgd2UgbmVlZCB0byBiZSBhY2N1cmF0ZSBoZXJlLiBGb3IgZXhhbXBs
ZSwgd2hhdCBkb2VzICJtYXAiIG1lYW4NCj4gaGVyZT8NCj4NCk5vdCB0cmFwcGVkIGJ5IGh5cGVy
dmlzb3IgaXMgYmV0dGVyIHdvcmRpbmcgdGhhbiBtYXBwZWQuDQogDQo+ID4gYi4gb25seSBwY2kg
Y29uZmlnIHNwYWNlIGFuZCBtc2l4IG9mIGEgbWVtYmVyIGRldmljZSBpcyBpbnRlcmNlcHRlZCBi
eQ0KPiBoeXBlcnZpc29yLg0KPiANCj4gV2hhdCdzIHRoZSBjcml0ZXJpYSBmb3IgY2hvb3Npbmcg
YSBjYXAvYmFyIHRvIGJlIHRyYXBwZWQgb3Igbm90PyBGb3IgZXhhbXBsZSwNCj4gdGhlcmUncmUg
YSBsb3Qgb2Ygb3RoZXIgdGhpbmdzIHRoYXQgbmVlZCB0byBiZSB2aXJ0dWFsaXplZCBiZXNpZGVz
IE1TSS1YIGZvciBzdXJlLg0KPiANCkZvciBwYXNzdGhyb3VnaCwgd2hpY2ggYXJlIHRob3NlPw0K
DQo+ID4gYy4gdmlydGlvIGNvbmZpZyBzcGFjZSwgdmlydGlvIGN2cXMsIGRhdGEgdnFzIG9mIGEg
bWVtYmVyIGRldmljZSBpcyBkaXJlY3RseQ0KPiBhY2Nlc3NlZCBieSB0aGUgZ3Vlc3Qgdm0gd2l0
aG91dCBpbnRlcmNlcHRlZCBieSB0aGUgaHlwZXJ2aXNvci4NCj4gPg0KPiA+IChXaHkgYj8sIG5v
IGdyYW5kIHJlYXNvbiwgaXQgaXMgaG93IHRoZSBoeXBlcnZpc29ycyBhcmUgd29ya2luZyB3aGVy
ZSB0bw0KPiBpbnRlZ3JhdGUgdGhlIHZpcnRpbyBtZW1iZXIgZGV2aWNlIHRvKS4NCj4gDQo+IFdo
YXQgeW91IHN0YXRlIGhlcmUgaXMgbW9yZSBhYm91dCB0aGUgbWV0aG9kIHRvIHN1cHBvcnQgYSB1
c2UgY2FzZSBub3QgdGhlDQo+IHVzZSBjYXNlIGl0c2VsZi4gTXkgdW5kZXJzdGFuZGluZyBpcyAi
bGl2ZSBtaWdyYXRpb24iIGlzIGEgdmFsaWQgdXNlIGNhc2UgZm9yIHN1cmUuDQo+IEFuZCAicGFz
c3Rob3VnaCIgaXMgcHJvYmFibHkgb25lIHdheSBmb3IgYWNoaWV2aW5nIGxpdmUgbWlncmF0aW9u
IGJ1dCB0aGlzIGlzDQo+IHdoYXQgeW91IG5lZWQgdG8gZGVmaW5lIGFuZCBqdXN0aWZ5IGluIHRo
aXMgc2VyaWVzLg0KPiANCkkgbGFyZ2VseSBjYXB0dXJlZCB0aGF0IGluIHYyIGluIGRldmljZSBj
b250ZXh0IGFuZCBpbiB0aGVvcnkgb2Ygb3BlcmF0aW9uLg0KSSB3aWxsIGtlZXAgaXQgc2hvcnQg
YXMgd3JpdHRlbiBpbiB2Mi4gSWYgc29tZXRoaW5nIGlzIHVuY2xlYXIgKHdpdGhvdXQgd3JpdGlu
ZyB0aGUgYm9vayksIEkgYW0gaGFwcHkgdG8gZXh0ZW5kIGl0Lg0K

