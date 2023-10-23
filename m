Return-Path: <virtio-comment-return-7903-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C3FC001E0
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:26:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 66D2F120D4F
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:26:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 445E0986678
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:26:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2EE6E98666A; Mon, 23 Oct 2023 10:26:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1F26698666B
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 10:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYTXDRP0fjhOjffO9eV17GXEJVen9kTOKDxzMvGHjSSkLw/FFoILBmuZgDmS5qPvViHb9xMgVlLGak66+peW/auY/TXzNVCL2QigXyrcJVDWbJx8TMUkDDAnEvPNpH2S29o6sEjWh9IGyCFPFz1ivlftjjRqA5UGtcBm0eNiQ1PFuWFmYOi+C1oqM6aMs9FjS4ZeiLs9QqwM5PldcMCiQBhb8nnrJIQulbj/WmnBFUHl5O2gJc6QjKXQYxOiNMHXXkb/PuyxA7ByUanFG6R1G3BewkfBs/m7SlgPO/peIZbQGIIVDgWnXKwcptsXzd5LVICvGZLFtivM8c9PxfMopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsDLsJIhsN57w6rps1Tlxm7HmrzRvBZ3Z5hkzteUJQY=;
 b=Xryce/typ8DMnzpOeqFNPhpJJeCnQuGCGHzXyrbOT6dO6WMb8MZ9Kzqh9MMlWZA4dNLoQpLlp9NXBadtq+t0dAR9z9GlvpbdIyiOAvPs2ALqvgIXwG4B51IyMNV/aMMARTEaKQdup3jICp3KHF3pAyiuwV/NKke67Dy+zJ7YWNJcEMUD91R7bMJ8ffLeLih8jO9ViOnKXKULCsanQQygFew0OWoN3UTAjehCMM6wPgtDtLgDTbzvJ92KD2XK8FixkT+EBK2U198ISuUfmYB/u0xHBDMQuZk49Je2Y3RVV3odJ26q3Sm9+X+Z0gYcKV9iJByV2ypLXYPazfFrVUFmyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAAALdAIAAGU2AgAAZUrCABIZTgIAAAScQgAAGEYCAAABSUA==
Date: Mon, 23 Oct 2023 10:26:15 +0000
Message-ID:
 <PH0PR12MB5481CC7678B3FF95776CFCE3DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <20231020053534-mutt-send-email-mst@kernel.org>
 <3932dd54-f43a-40b6-8dba-962f997f7122@intel.com>
 <PH0PR12MB54813F96D29B2D2ACEADD62ADCDBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b9ac0893-be30-41d9-8898-2a60e8e909aa@intel.com>
 <PH0PR12MB5481735CC313D32DBAA054E6DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2b7e3aac-e238-4056-bf8c-80640d631a1f@intel.com>
In-Reply-To: <2b7e3aac-e238-4056-bf8c-80640d631a1f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB8269:EE_
x-ms-office365-filtering-correlation-id: 396e6601-c3e9-4b22-5dca-08dbd3b27cf0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Wo0QMIxP4qvYSfGeUDl7aV3HGhqSun4sQEQAv2iL9W887E7Dqsl2kiHaalefh3AtVo/WgBRB7hofjDcpw2ZMNaDjtu12Ix034zxrw9YpVwqtQq+vzx98ZBR+wZHvri62sN2BGNggg8yWmDLiL/yOotqds/R2u2ec5IbP7NyokaMXyheKBbfQOXyQzshZHzXfdjeL0DuNLzJLR7gPFw6rxTbqdq2w2hz82O9BJKx3l0fbClI/Kx4bw8q93BAC6VsYFs/l9OJL/W9MonOxXGNPjW1FrK24ImrDqXvfQzAROE8aBtL6j8+r48YZVmDaj7JSdKnq6pRze8KNfruuk8ti9pDsZWcAzPTviC+eMEWTS84I1X+q28Mw1UgrH04KW94UzkbTnnMet5VemAfcks5Sc445JVIgwhzh9fiibnSswkYApzTqMvrbTHpooNRM6hVu4LMcp1R9IFbCb4qYDZ4wME/OTufp3vkshICVW9qwP3U5twPhRdaXbpxM/fvv61YPzDm2izonlaQZ26aU+80LhFphFYO37ux09lwUTfG1ImL0zkzssJymq7WNRuReghMn5J05pCj65idYZe6VItkALC4AFb56Z2PVH05HIWJC+d1GyFc9tnQ2huDhEisfwrI/
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(376002)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(38070700009)(2906002)(41300700001)(107886003)(26005)(122000001)(33656002)(86362001)(38100700002)(83380400001)(110136005)(5660300002)(7696005)(53546011)(52536014)(55236004)(9686003)(64756008)(66446008)(66556008)(66476007)(478600001)(54906003)(316002)(76116006)(66946007)(55016003)(6506007)(71200400001)(8676002)(4326008)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Rk0zcFZBNWxkczNjQ2FhaFowYWk0YlJYZUY1S24yRXVUTC9jTHBRTzMwMjNt?=
 =?utf-8?B?ZjJ4cXA5MTVuMzJudVlYWEJPcFlGS0xHdE9ONXo3bEdHNHFTVDcrQzJCdzBG?=
 =?utf-8?B?YjdhU0VtWUltb1I2ZTJEWG5nWVl4VFB0TkN2VTErN0ZUK0FQN0N3QWVleWpm?=
 =?utf-8?B?QjhWN1NGYTdTOUVWK1FwUkdlaG1mK0xtbTF6QjVoNThWbW1OOVd3Rnl6MEtN?=
 =?utf-8?B?cFROaWxVWEZEbDI1S2l5VkVDVFdhaVE4d1VCWGMwRWo0RytEcURtV2ZJaExR?=
 =?utf-8?B?SmZUVUU5MzkzSFcwK1R0Q2ZrV0VIdHhGakZIR3lod3RNaW5OMGhBVHR6ejI4?=
 =?utf-8?B?U05iTDd0N3hXN2VrU0s1aEhteFJrcEVLWGpZM1p5ZHJCd3NVcmhsWnZPQzd3?=
 =?utf-8?B?SW4rUzZHZ3hWMitoTmtNbHhZaUlxeWZsdWJUU3RiOFBDQitoWVdxZUswU3Bm?=
 =?utf-8?B?YkhENmdYeE5uQkJZaHlIUVRwa1p6djNwTHJHVjEvSVlVSXdhMFk5Z2Y2cG9I?=
 =?utf-8?B?VHh2anVHZFRRSkpEdE9wUnhIcVluWGN3VHlCMHo2L1BKc2RDV1ZqL1M2Z0Nn?=
 =?utf-8?B?SWlIV2V2bTk5dGNYVzJjQXBXejZ5YWZXbE5tSlF4UVZ4RWNyNWc1MjZJUFVy?=
 =?utf-8?B?SkRlNkVvL09IVUtmdGZBSldaZzgwZkRsZ2g4bmU1c1lhRzh3N1RuaDV4d0lk?=
 =?utf-8?B?SFgvOStIemRUd1grUXpUR2hXb1B3cFVycFJOcjdad1ZsbFFRRy8wVzVvc3dp?=
 =?utf-8?B?eUJZZE1hZ2Z6dVRMajd4V3ZUc0Vwa1N4K2tZcmJ2WDZHeFFrUlVTZWhFaUdm?=
 =?utf-8?B?STRTc1k0ZnNpZmMrME40SmRoN3VTempBV3VLYmduRE1Nc1NyVXhDb2ovclA3?=
 =?utf-8?B?MnllU0FQZ242a216VitMZC96WHQvM0NHNkFQbW9PczBMWHNscDJHOVpwWkMv?=
 =?utf-8?B?MC8zQlJDTTdBYms2dVpyZVVSY3AzNEJhYXFoRzdjdmowNlRkM3hkNE9qRzVm?=
 =?utf-8?B?YUNDRm1XZTZHTFBFWStHMU1UMEU4OGFySjR5TVpwYS9FRDRmZlpFeDgyYnBT?=
 =?utf-8?B?NXUyRVVVRHlOTHU5RlphVy9sQnh0VERBZDNoOUdEQXJiU3Fzc3AxMysvRXBL?=
 =?utf-8?B?Ujk2cU1oZStBSFRnczVyUkFNTVZXRVdDcHFDdFlFVEtGT0kwb2FGVHVlNGF2?=
 =?utf-8?B?MWZ0VXdHSmlhQnp1UHdTemMyUktQTm5UMklyR1lVd3ZZUkkwUkg1VFJ5WlVS?=
 =?utf-8?B?Z0pvcS84UzlNN0ZEdi9melJRUWcva1pHZHFSaUMxUldFalltT1JoOEozYnlK?=
 =?utf-8?B?UWxiSVJIc05QYWlqSUsyQlpPUE94dDlFQVZ3bTErdktycm96R21LeGpwelVk?=
 =?utf-8?B?MXFCRlErdFljUTJYaTRsNEZzVlh6aEJ6cEd4VmFLbWRicU5tcml2cDBLdlpZ?=
 =?utf-8?B?Rm12b1JwRnJWTGJPQ01HSGJkbW9IQjJGSGlCclAwNEhMNndvRnlXVUFlS3Ns?=
 =?utf-8?B?a3NrSVV3MGNjMGE0bElEaHNWdEdyUFZLbEZMUEZrRlQzdlhkYjJrMEErcmVz?=
 =?utf-8?B?bVV0TjRWR1NVV2M1OHhBeGpEZ0tyNjJhWTNZU1F3cE9pN1BUanRJRGxNd1RO?=
 =?utf-8?B?L3ZtUmUxSCtqczh4eXRRZVA1KzMzRWFBMWFhT3JvaEtBOW9QM0o3aGpvUzha?=
 =?utf-8?B?a2RJZitUbktYT3BkanVmYXhraFJLVVh6UWk3YTdRa2JEWVZoY3BIclVCWGhP?=
 =?utf-8?B?VGtmbzR3SUNEL2FZV0xQU3F4Sm9VUVI4bVNWMkllNUVhVStEUUJvclRyZmtO?=
 =?utf-8?B?UGJGdDViNzRWbm1jR2lscG1wWDczOVRBL3AyN1A3OW8yU1Y2WCt5OHZ5SHh4?=
 =?utf-8?B?ek4zVzZpMDNlYUVzR0ZVVUFINEdNT2tQODA0OXRMOWxBLzRhTW5Yd25PN0Zk?=
 =?utf-8?B?cUIyZmN6NnNoQ1QrZ1pPcUxyOVRLajNKM3JHMW5lUEJlZDJpdG92a0Vwd09l?=
 =?utf-8?B?dEMxODd2dERjUkxGZ21PcjRUWnovYW1uRzY5WXk4aW9zMi9QSldZOTIrd1o3?=
 =?utf-8?B?VExGWU1HSVE1Y1d1emNUanJhaW1PcFY0MDN1SGcrV01HdFpTR1RYcUJWRVUw?=
 =?utf-8?Q?sIOI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396e6601-c3e9-4b22-5dca-08dbd3b27cf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 10:26:15.6728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fp8CwuBGED5yebtIDaNZ/pjfvWIFyp1ztj5K2qQiokDgvVqRb0M6xFixMx+GyOilSOUSwkUTvGv7cXpVD6wJGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgT2N0b2JlciAyMywgMjAyMyAzOjQ0IFBNDQo+IA0KPiBPbiAxMC8yMy8yMDIzIDY6
MDEgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPg0KPiA+PiBGcm9tOiBaaHUsIExpbmdzaGFu
IDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPg0KPiA+PiBTZW50OiBNb25kYXksIE9jdG9iZXIgMjMs
IDIwMjMgMzoxOCBQTQ0KPiA+DQo+ID4+PiBOby4gUGxlYXNlIHJlYWQgdGhlIHJlc3BvbnNlIGNh
cmVmdWxseS4NCj4gPj4+IEkgc2FpZCAnRm9yIG5vbi1iYWNrd2FyZCBjb21wYXRpYmxlIFNJT1Yg
ZGV2aWNlIG9mIHRoZSBmdXR1cmUsIHllcywNCj4gPj4+IHZpcnRpby1wY2kNCj4gPj4gY29tbW9u
IGNvbmZpZyAobm9uIGluaXQgcmVnaXN0ZXJzKSBzaG91bGQgYmUgbW92ZWQgdG8gYSB2cSwgbG9j
YXRlZA0KPiA+PiBvbiB0aGUgbWVtYmVyIGRldmljZSBkaXJlY3RseS4nDQo+ID4+PiBOb3RpY2Ug
dGhlICdtZW1iZXIgZGV2aWNlIGRpcmVjdGx5Jy4NCj4gPj4+IE5vdCB0aGUgUEYgYWRtaW4gdnEu
DQo+ID4+IEkgdGhpbmsgdGhpcyBpcyBhIHF1ZXN0aW9uIHRvIE1pY2hhZWwgYW5kIGhlIGFuc3dl
cmVkLg0KPiA+Pg0KPiA+PiBXZSBhcmUgdGFsa2luZyBhYm91dCBQQ0ksIG5vdCBTSU9WLCBmb3Ig
U0lPViB3ZSBuZWVkIHRyYW5zcG9ydCB2cS4NCj4gPj4NCj4gPiBIeXBlcnZpc29yIGZvciBmdXR1
cmUgZGV2aWNlIGFuZCBmdXR1cmUgZnVuY3Rpb25hbGl0eSBtdXN0IG5vdCBnZXQgaW52b2x2ZWQg
aW4NCj4gbG9va2luZyB0aGUgZGV2aWNlIGNvbmZpZ3VyYXRpb24uDQo+ID4gSGVuY2UsIGFzIGxv
bmcgYXMgdHJhbnNwb3J0IHZxIGlzIGxvY2F0ZWQgb24gdGhlIFNJT1YgZGV2aWNlIGl0c2VsZiBm
b3Igbm9uLQ0KPiBiYWNrd2FyZCBpdGVtcywgaXQgaXMgZmluZSB0byB0cmFuc3BvcnQgU0lPViBj
b25maWd1cmF0aW9uLg0KPiA+IEZvciBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IHB1cnBvc2UsIG9u
ZSB3aWxsIGJlIGFibGUgdG8gdXNlIHRoZSBhcSBvZiB0aGUNCj4gb3duZXIgZGV2aWNlLiBObyBu
ZWVkIHRvIGNyZWF0ZSBhIG5ldyB0cmFuc3BvcnQgVlEuDQo+ID4gVG8gY3JlYXRlIGEgYW5vdGhl
ciB0cmFuc3BvcnQgdnEsIG5lZWQgdG8gY2xhcmlmeSB0aGUgbGltaXRhdGlvbnMgb2YgYXEgdGhh
dA0KPiB0cmFuc3BvcnQgdnEgY2FuIG92ZXJjb21lLCBhbmQgd2h5IGFxIGNhbm5vdCBiZSBleHRl
bmRlZCB0byBvdmVyY29tZSBpdC4NCj4gU0lPViBhbmQgdHJhbnNwb3J0IHZxIGlzIG5vdCByZWxh
dGVkIHRvIHRoaXMgdG9waWMsIGRvbid0IG1peCB0aGVtLg0KPiANCj4gYW5kIGFkbWluIHZxIGlz
IG5vdCBhIG11c3QgZm9yIGxpdmUgbWlncmF0aW9uLg0KDQpPay4gWW91IHJhaXNlZCB0aGUgcG9p
bnQgb2YgdHJhbnNwb3J0IHZxLi4uDQoNCj4NCkFsbCByZXBlYXQgcG9pbnRzLCBub3QgbGVhZGlu
ZyBhbnl3aGVyZSBmb3IgeW91IG5vciBtZS4NCiANCj4gYW5kIHdlIGFyZSBub3QgaW50cm9kdWNp
bmcgYSBuZXcgZGV2aWNlIHR5cGUgaGVyZS4NCj4gDQpJdCBkb2VzIG5vdCBtYXR0ZXIuDQoNCj4g
Rm9yIGZ1dHVyZSBkZXZpY2UgYW5kIGZ1dHVyZSBmdW5jdGlvbmFsaXRpZXMsIGxldCdzIGRpc2N1
c3Mgd2hlbiB0aGV5IGFyZQ0KPiBpbXBsZW1lbnRpbmcsIG9uIHRoZWlyIHNlcmllcy4NClRoZSBu
ZXcgZGV2aWNlIHdpbGwgaW5oZXJpdCB0aGUgImJhc2ljIGZ1bmN0aW9uYWxpdHkgbm9uIGluaXQg
dGltZSByZWdpc3RlciIuLi4NClNvIHBsZWFzZSBkb27igJl0IHByb3Bvc2UgdG8gaW1wbGVtZW50
IHN1Y2guDQoNCj4gPg0KPiA+PiBIZXJlIGFnYWluLCB3ZSBhcmUgaW50cm9kdWNpbmcgYmFzaWMg
ZmFjaWxpdGllcyBmb3IgbGl2ZSBtaWdyYXRpb24sDQo+ID4+IGFuZCB0aGUgaW1wbGVtZW50YXRp
b24gaXMgdHJhbnNwb3J0LXNwZWNpZmljLg0KPiA+IE5vdCByZWxldmFudCBjb21tZW50Lg0KPiA+
DQo+ID4+Pj4gQ29uZmlnIHNwYWNlIGlzIGNvbnRyb2wgcGF0aCwgRE1BIGlzIGRhdGEtcGF0aCwg
bGV0J3MgYmV0dGVyIG5vdA0KPiA+Pj4+IG1peCB0aGVtLCB3ZSBuZXZlciBleHBlY3QgdG8gdXNl
IGNvbmZpZyBzcGFjZSB0byB0cmFuc2ZlciBkYXRhLg0KPiA+Pj4+DQo+ID4+PiBBbmQgdGhhdCBj
b250cm9sIHBhdGggaXMgb25seSBmb3IgdGhlIGluaXQgdGltZSBjb25maWd1cmF0aW9uIGFzDQo+
ID4+PiBjb3JyZWN0bHkgbGlzdGVkIGluIHRoZSB2aXJ0aW8gc3BlYyBhcywNCj4gPj4+DQo+ID4+
PiAiIERldmljZSBjb25maWd1cmF0aW9uIHNwYWNlIHNob3VsZCBvbmx5IGJlIHVzZWQgZm9yDQo+
ID4+PiBpbml0aWFsaXphdGlvbi10aW1lDQo+ID4+IHBhcmFtZXRlcnMuIi4NCj4gPj4gZG9uJ3Qg
eW91IGtub3cgbmV3IGZpZWxkIHJlc2V0X3ZxIGlzIGludHJvZHVjZWQgdG8gdmlydGlvIGNvbW1v
biBjZmc/DQo+ID4+IFRoaXMgaXMgbm90IG9ubHkgZm9yIGluaXRpYWxpemF0aW9uLCByaWdodD8N
Cj4gPiBSaWdodC4gSXQgd2FzIHVuZm9ydHVuYXRlIGFuZCBhbHNvIGl0IHdhcyBsYXN0IG1vbWVu
dCBlbnRyeSB0aGF0IHdlIGhhZCBmaXhlZA0KPiBpbiByZXNldCByZWdpc3RlciBwb2xhcml0eS4N
Cj4gQXBwZW5kaXggQi4gQ3JlYXRpbmcgTmV3IERldmljZSBUeXBlcywgYW5kIHdlIGFyZSBub3Qg
aW50cm9kdWNpbmcgbmV3IGRldmljZQ0KPiB0eXBlLg0KVGhlIGNvbmNlcHQgc3RpbGwgYXBwbGll
cyB0byBleGlzdGluZyBkZXZpY2UgdHlwZS4NCkl0IGlzIGlsbG9naWNhbCBvdGhlcndpc2UuDQoN
Cj4gPg0KPiA+PiBhbmQgeW91ciBjaXRhdGlvbiBpcyBmcm9tIEFwcGVuZGl4IEIuIENyZWF0aW5n
IE5ldyBEZXZpY2UgVHlwZXMsIGFyZQ0KPiA+PiB3ZSBjcmVhdGluZyBhIG5ldyBkZXZpY2UgdHlw
ZT8NCj4gPiBUaGF0IGlzIGd1aWRhbmNlIGZvciB0aGUgbmV3IGRldmljZSBjcmVhdGlvbiBvbiAi
aG93IHRvIHVzZSBjb25maWcgc3BhY2U/Ig0KPiA+IEl0IGVxdWFsbHkgYXBwbGllZCB0byBleGlz
dGluZyBkZXZpY2VzIHRvbyB0byBub3QgZ3Jvdy4NCj4gPiBUaGUgc2VjdGlvbiBpcyBlcXVhbGx5
IGhlbHBmdWwgZm9yIG5ldyBjcmVhdG9ycyBhbmQgZm9yIGV4dGVuZGluZyBkZXZpY2VzIGxpa2UN
Cj4geW91IGFuZCBtZSB0byB1bmRlcnN0YW5kIHdoYXQgbm90IHRvIHB1dCBpbiBjb25maWcgc3Bh
Y2UuDQo+IHRoaXMgZG9lcyBub3QgbWFrZSBhbnkgc2Vuc2UsIGlmIHlvdSBzdGljayB0byB0aGUg
d29yZGluZywgdGhlbiBsZXQgbWUgcmVwZWF0DQo+IGFnYWluICJBcHBlbmRpeCBCLiBDcmVhdGlu
ZyBOZXcgRGV2aWNlIFR5cGVzIiEhISEhIQ0KU29ycnksIHlvdXIgaW1wbHlpbmcgaXM6IG5ldyBk
ZXZpY2UgdHlwZSBzaG91bGQgYmUgZWZmaWNpZW50IGFuZCBleGlzdGluZyBvbmUgY2FuIG1ha2Ug
aXQgZnVydGhlciBiYWQuIERvZXMgbm90IG1ha2Ugc2Vuc2UgdG8gbWUuDQoNCkl0IGlzIGZ1bGx5
IGxvZ2ljYWwgdG8gaGF2ZSBvbmx5IGluaXQgdGltZSB0aGluZ3MgaW4gdGhlIGNvbmZpZyByZWdp
c3RlcnMgYXMgZG9uZSB0b2RheSBpbiB0aGUgc3BlYyBmb3IgZXhpc3RpbmcgYW5kIG5ldyBkZXZp
Y2VzLg0KDQpJIHdvdWxkIGJlIGhhcHB5IHRvIGV4dGVuZCBCLjUgRGV2aWNlIGltcHJvdmVtZW50
cyB0byBjYXB0dXJlIGl0IHRvby4NCg0KPiA+DQo+ID4+Pj4gU28gd2UgbmVlZCBETUEgdG8gdHJh
bnNmZXIgZGF0YSwgZm9yIGV4YW1wbGUgSSB0YWtlIGFkdmFudGFnZXMgb2YNCj4gPj4+PiBkZXZp
Y2UgRE1BIHRvIGxvZ2dpbmcgZGlydHkgcGFnZXMsIFRoaXMgYWxzbyBhcHBsaWVzIHRvIGluLWZs
aWdodCBkZXNjcmlwdG9ycy4NCj4gPj4+Pg0KPiA+Pj4gQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbiB2
aWEgdmlydHF1ZXVlIGNhbm5vdCBiZSB1c2VkIGZvciBETUEgYnVsaw0KPiA+Pj4gZGF0YQ0KPiA+
PiB0cmFuc2ZlciBhcyBsaXN0ZWQgaW4gdmlydGlvIHNwZWMuDQo+ID4+PiAiIFRoZSBtZWNoYW5p
c20gZm9yIGJ1bGsgZGF0YSB0cmFuc3BvcnQgb24gdmlydGlvIGRldmljZXMgaXMNCj4gPj4+IHBy
ZXRlbnRpb3VzbHkNCj4gPj4gY2FsbGVkIGEgdmlydHF1ZXVlIg0KPiA+PiB3aGF0IGlzIHlvdXIg
cG9pbnQ/IHZxIGNhbiBkbyBETUEsIHNvIHdoYXQ/DQo+ID4gSSBhbSBhc2tpbmcsDQo+ID4gSWYg
dGhlcmUgaXMgQVEgb24gdGhlIG1lbWJlciBkZXZpY2UsIGNhbiB5b3UgdXNlIGl0PyBJZiBub3Qs
IHdoYXQgaXMgdGhlDQo+IHRlY2huaWNhbCByZWFzb24ocykgdG8gbm90IHVzZSBpdC4NCj4gUmVw
ZWF0ZWQgZm9yIG1hbnkgdGltZXMsIFFPUywgbmVzdGVkIGFuZCBzbyBvbi4NCldoeSB3b3VsZCB0
aGVyZSBiZSBhbnkgUW9TIHdoZW4gdGhlIEFRIGlzIG9uIHRoZSBtZW1iZXIgZGV2aWNlIGZvciBu
b24tcGFzc3Rocm91Z2ggdXNlIGNhc2U/DQpXaHkgbmVzdGVkIHdvbid0IHdvcmsgd2hlbiB0aGUg
QVEgaXMgb24gdGhlIG1lbWJlciBkZXZpY2UgZm9yIG5vbi1wYXNzdGhyb3VnaCB1c2UgY2FzZT8N
Cg==

