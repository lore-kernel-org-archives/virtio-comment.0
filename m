Return-Path: <virtio-comment-return-8438-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC45C197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:20:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 36A9F613CA
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:20:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0626A986E24
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:20:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DF91A986E1B; Fri, 17 Nov 2023 10:20:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D0656986E1C
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 10:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOGvYppzWbF4Bpbzf2dAetYT2zaKvBppwo2SJQgmCCNl6j/YGeoqNY9LhKMSCHLcdHw/YoNTP5DCULLudDx9/pCtpDzrx/CylcoIsFfvAjtfSWrkoB9DTaJ+59EOhgZFdlNcClbMASf6GPnAVO8DzFlzjga+WYLnUMocZMBtbr3sBC5gLXx8re4IHzX5mrsPcWS4t4fX756zAepLFWTWqieZki5/b3JBZ4UnXKJP1zRMCccclDqRsxVaLpHHDR7qY7bA4xgBJ/cfu5S7wSGWs2mU/LnAB+E7g2C3TofVYBX01rEyeMKXsMRKOkzsbfPSYPQLHQxN1mtc0ckaLIZ8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkCXHcTRhc1rTFHaLHGvrTPDbn6H3n5mLXq+Y1aeZYY=;
 b=V3pg94fO9o8X/sP3mQG4KRbB9/FZp4oS/h7+NlaAONDnnbq/0VShh/ZcVVWf1THuUpPyRaUuXvFAlQs6i8TEMi6wTpIEvuFoHubpfK8PhwkQ63me3UtqTgppQMVuA4V2HpTAMVbXk2tuz+dfu24/n5EEmOOoXyN2plpv4zPXyb/85pnCgVbZr2IQHEg9yNgKAR7/+iJQMTwh3DVlgLiOjVoqCnSJ5eHFbzAEobkvpD1HRPrwx2ZX0AlNs59JJEld1Jzc/dqd6+bHri73Ek78HAUcSwZmI0oMiL1AHXjpwuKdaNok+lcd2gNOSFft0r1wmagDQKtCIhUdRnnVJ+7Hqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCABizrAIAAD2aggAGUBACAAABcUIABWsEAgABcQLCAASo6AIAALsiAgAZSfICAAAYzAIABYc4AgAA+ffCAAULTgIAALVPAgAGlyQCAABp/kIAGUuiAgAAFiECAAWL9AIADJo4QgAY+aoCAA+XikIAC0e+AgAABs1A=
Date: Fri, 17 Nov 2023 10:20:45 +0000
Message-ID:
 <PH0PR12MB54810D15E0897C2435697E39DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEu0gfw4zNc9KTLm9ekhuWgsgzHLVya_68HajQZObtr3-w@mail.gmail.com>
 <DM8PR12MB54808B71AA9C0A945D0A3226DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtKPPudHAXGbrOppwgRP=Umt-F0GNKeoajOGzgs+wvyLA@mail.gmail.com>
 <PH0PR12MB54815F58F470493FC516CDCCDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117050357-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117050357-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ0PR12MB7036:EE_
x-ms-office365-filtering-correlation-id: 96f7f59c-db85-4313-d646-08dbe756dcb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 J2Zn8SmdQ18CZnpD+fSgnOYjlat8ZMQBrfqjis76myUdzluRaFVwa1a/LjN3WoiPcbW9naAUFcal23VG1QipwQPwK7rqPC2EmIN0krDpR7IOfzMynF9U0zJyelWcK3y5+21Kjpu1G+2owEx7Nfu9mfNt24/Ld3g06veczA/6xy+AfeUonmAyl32Qe3wzOKuSVkOMflgW2pZOtF6FUnbK9PhScbyY3bDp/dmUBLL+fDTaVffTBS5F/r5wtqP7S6MOTZ9NyzGl1bSfzWmhTW7eO32wncRoUtq5n/T+t0BugnikpdZ6vE3OmzUGF/4BBXJbVsq4N1kd8R++4dMrypata++XrQY1EaJst2ZZzsTsmPWTJnOqlECXUnzVRreNBt0/WUkJ3/grmMH0ow0DA7uY9Z+8uN3jtVT+RPyWP3MWhA3+rsOT00LpsSm1H8Ez6rb8nItzKeTK0T+LmpnEj9jvk9WvH1zLKvXN6HJ7GYNoaoA0FCVfdeNi2neuQ6Glaf1Aq7Zm4b2a4bWLb3a4jsKX2SHfbX/zSTh1xBt0vKtWKoydIKLgR8QbLGpymHEK66fllLWAOg73DpPk73p4vGswkxgXhUcIRwfC4O9U/4YJccbKZg0iTrwVTL3XaKwGVzjwkeQIyiu6U84RFLRUoWKVnJXkVhkeXa3efNYC+/Aq/GmqUnRHrolTY5MuFCr8wuJV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(38100700002)(38070700009)(122000001)(55016003)(26005)(107886003)(9686003)(7696005)(6506007)(55236004)(71200400001)(478600001)(966005)(86362001)(5660300002)(4326008)(66446008)(66556008)(66476007)(66946007)(76116006)(41300700001)(54906003)(64756008)(6916009)(316002)(8936002)(52536014)(5930299018)(8676002)(33656002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VjhkK2ZRd0h4NHdNbTlnNFYwa1krY1FjdWxDTG55VUw1L0dZOVREUjlLZmJj?=
 =?utf-8?B?djlSeDRTTmV4TFJMbkxaQzV4WFN3di94NVF2VERQWksrV0RseUlkN1d4UXk5?=
 =?utf-8?B?TzRUdXNoWW9pb0U0WlBvVkYzanBDd1BuUnVoeU5uWVByVHRJVGVHdkFRR2w4?=
 =?utf-8?B?N1puSWZaUUU0aFhDRFFSNUJNQXhWRU1XeGc5dy9CZU1vVGVvV0d4Si9HUFhs?=
 =?utf-8?B?QzE2UUpiOXhLWGh2dDBrK2UxNW5Ka3h0ZmNvRUtqT3FKa0kvckdTSHcrQzkr?=
 =?utf-8?B?U0phYnA3Nko1YkMzVWpJUGk2SncvcXRMM2tUL3NSYlUxL1hqUUdtQkRHOVBE?=
 =?utf-8?B?b2ZBRmVFRjF6RzBjWnhVaENRQWYvQlpGS280RXhINlJVUG1jTTRmUkN0UGlj?=
 =?utf-8?B?WllRTTRsOElqTERHWmdDUTErcVpwV3U3SURoeUl6STMrNFNzOG9CRHJRbnJB?=
 =?utf-8?B?NG5BOFJNa25PMVFFWko5QVhaY3M0L3I5N3BsN3ZnZlphL0wzelhLa1kwMVlE?=
 =?utf-8?B?MlZCSXBBRDE0UHJ5N3Uzb0V5ZWdoYWhvcUZQVGVSdnA1Z3plNFhydWQ3Nktk?=
 =?utf-8?B?UWk1N21GQlpOaDhEdElhaElOSHRYa1M4aHdLL2hYcWZtODVsek0vRU5pL043?=
 =?utf-8?B?YWRnK2FXcDFrN3dEc21aSENVY29QOFVQVDd1dzlDWGZMOXNKVDZsK1NOWWpB?=
 =?utf-8?B?a05tV2VBaURUTzRBTlZJUDBPTXNZL3BlMWxDY1dLYnNMd0pML1NGaWtrS3hX?=
 =?utf-8?B?cXRVbS9vMndPS1pUYUVmNTR5NWdZRVNVcm9NSUw0QWhDS0ZndUQ2M1Z2QnRB?=
 =?utf-8?B?RjlMbHZOeWRkL2hNYTRRbVBFT1V3cC94T0NPUmQrblh3YWU0UXcvczlOa2xw?=
 =?utf-8?B?MW9ENEUycDhlTVpxTHZTcWY0KzFyWVBzNVJLRUtQYWhKa3B6YkFabkkzOE4v?=
 =?utf-8?B?QmEzMXpxS01LWit2MWN6eWJ0MnJZRkJJSVorZTlkajhOcmVYeUlxYjEwZ000?=
 =?utf-8?B?L0VjZU9JK1ZMSW1kWXdYMzU1VFo5bzA0MzhxbndhY21rdlEyUUcyZHNvWkJv?=
 =?utf-8?B?bHhRcFZteHQ4Z3NUNGp2YnVGSjhNZUtITmtJdUxOMlNyRFMyaXBPQk43MkJj?=
 =?utf-8?B?Y3F6NnZDQ2x1TEhXSXZEUGNHblhHWlN4NzFLV1JLL2dFRWNSbTFqa0JGOUNu?=
 =?utf-8?B?enVRaGU1bGk2bnR4MldPVFBQSHA0cVJsY0NLS09Pb3FHbGhRd3lqUUtIbHFL?=
 =?utf-8?B?NFRieXlxMFhrOERSVGV4aERrdnZaVVVQZWVnQlZ4S01BNHhRVUtzYzlnMEZV?=
 =?utf-8?B?MUhZODJEek9IR2U0NE9valpDaXdqdmtvK2tyY2dMMWFPVGExRDBSVTN3REJE?=
 =?utf-8?B?RW1Va2w5dXFGWjdqOUJzaDhoOG1DN1YwT0w3RGRESU1DUWdLU3hlYjl5Z2Ji?=
 =?utf-8?B?c2VQdVpxQndJdCtXRm5hT2pZVlc5WnhWbU1reWFqbDVzZmpHZmpTS0lFaUFC?=
 =?utf-8?B?K0Q5TFdyYm13SE1LWS9HKzdrbVFCVHhXTlNrcXYxY0o3NElISjdnYzYxaFpC?=
 =?utf-8?B?Z1VnYjNkQWJYTFJYaDkrYkZFYThGZHdSaFBFVnI3VktsYjBKaW5rY2Jxdzhp?=
 =?utf-8?B?ZG5mY0dFSjd3UDlKR3c2MVY0bzVJaVNQdjJWUDc4MklreWpXY0FnVGNUdGdZ?=
 =?utf-8?B?anUvVkVPSHZNNFZiMnpPVjlhaktwY0trYTM4c00vT09jZkUzdzFUMmpBYktz?=
 =?utf-8?B?ZHFvNnFGRHZnNmtiVVdJTlVRNU9seVpTa2VORG0xTlgrNDN1dzc4bk1FdWJ1?=
 =?utf-8?B?ZVBGTlNWSnByMnZScWJvSzlTZ2pydlA5NXZ3bFErSUV1dkxabmxhOVcyVDZY?=
 =?utf-8?B?aHgrZ1R6QXRDV3hORzdXWXdmdnBCK1hmRk9ZdGZIV2lrMHNndzZmNDYydml4?=
 =?utf-8?B?RW5wdFNaRjFCMHlTR0lrTTRielp5OVRXRWFadEpBOGg3M3VnUFRqVW5OdEZY?=
 =?utf-8?B?YlZVVndBTW1STmF2RnJVQldMYU9JVFg4SHhZNzN3WkxQbzdHUk5nbk8rbDYz?=
 =?utf-8?B?eHdqcVFzREtKMVgrTERJdHUxbktRMXBMVEp0ZUlKN1ZYUmpuYXBqQktCZGVL?=
 =?utf-8?Q?AFCA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f7f59c-db85-4313-d646-08dbe756dcb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 10:20:45.8187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pyf72U6C865uNU3z+mzVvmXHjqrBxdnFyYFVbtHm9/L4xwI0q2hDnabOsS+fizBM7rU+hL1sjf/X2Gf4y7PEYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7036
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQoNCj4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gU2VudDog
RnJpZGF5LCBOb3ZlbWJlciAxNywgMjAyMyAzOjM4IFBNDQo+IA0KPiBPbiBXZWQsIE5vdiAxNSwg
MjAyMyBhdCAwNTozOTo0M1BNICswMDAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4gPiA+DQo+
ID4gPiA+IEFkZGl0aW9uYWxseSwgaWYgaHlwZXJ2aXNvciBoYXMgcHV0IHRoZSB0cmFwIG9uIHZp
cnRpbyBjb25maWcsIGFuZA0KPiA+ID4gPiBiZWNhdXNlIHRoZSBtZW1vcnkgZGV2aWNlIGFscmVh
ZHkgaGFzIHRoZSBpbnRlcmZhY2UgZm9yIHZpcnRpbw0KPiA+ID4gPiBjb25maWcsDQo+ID4gPiA+
DQo+ID4gPiA+IEh5cGVydmlzb3IgY2FuIGRpcmVjdGx5IHdyaXRlL3JlYWQgZnJvbSB0aGUgdmly
dHVhbCBjb25maWcgdG8gdGhlDQo+ID4gPiA+IG1lbWJlcidzDQo+ID4gPiBjb25maWcgc3BhY2Us
IHdpdGhvdXQgZ29pbmcgdGhyb3VnaCB0aGUgZGV2aWNlIGNvbnRleHQsIHJpZ2h0Pw0KPiA+ID4N
Cj4gPiA+IElmIGl0IGNhbiBkbyBpdCBvciBpdCBjYW4gY2hvb3NlIHRvIG5vdC4gSSBkb24ndCBz
ZWUgaG93IGl0IGlzDQo+ID4gPiByZWxhdGVkIHRvIHRoZSBkaXNjdXNzaW9uIGhlcmUuDQo+ID4g
Pg0KPiA+IEl0IGlzLiBJIGRvbuKAmXQgc2VlIGEgcG9pbnQgb2YgaHlwZXJ2aXNvciBub3QgdXNp
bmcgdGhlIG5hdGl2ZSBpbnRlcmZhY2UgcHJvdmlkZWQNCj4gYnkgdGhlIG1lbWJlciBkZXZpY2Uu
DQo+IA0KPiBTbyBmb3IgZXhhbXBsZSwgaXQgc2VlbXMgcmVhc29uYWJsZSB0byBhIG1lbWJlciBz
dXBwb3J0aW5nIGJvdGggZXhpc3RpbmcgcGNpDQo+IHJlZ2lzdGVyIGludGVyZmFjZSBmb3IgY29t
cGF0aWJpbGl0eSBhbmQgdGhlIGZ1dHVyZSBETUEgYmFzZWQgb25lIGZvciBzY2FsZS4gSW4NCj4g
c3VjaCBhIGNhc2UsIGl0IHNlZW1zIHBvc3NpYmxlIHRoYXQgRE1BIHdpbGwgZXhwb3NlIG1vcmUg
ZmVhdHVyZXMgdGhhbiBwY2kuIEFuZA0KPiB0aGVuIGEgaHlwZXJ2aXNvciBtaWdodCBkZWNpZGUg
dG8gdXNlIHRoYXQgaW4gcHJlZmVyZW5jZSB0byBwY2kgcmVnaXN0ZXJzLg0KDQpXZSBkb27igJl0
IGZpbmQgaXQgcmlnaHQgdG8gaW52b2x2ZSBvd25lciBkZXZpY2UgZm9yIG1lZGlhdGluZyBhdCBj
dXJyZW50IHNjYWxlIGFuZCB0byBub3QgYnJlYWsgVERJU1AgZWZmb3J0cyBpbiB1cGNvbWluZyB0
aW1lIGJ5IHN1Y2ggZGVzaWduLg0KQW5kIGZvciBmdXR1cmUgc2NhbGUsIGhhdmluZyBuZXcgU0lP
ViBpbnRlcmZhY2UgbWFrZXMgbW9yZSBzZW5zZSB3aGljaCBoYXMgaXRzIG93biBkaXJlY3QgaW50
ZXJmYWNlIHRvIGRldmljZS4NCg0KSSBmaW5hbGx5IGNhcHR1cmVkIGFsbCBwYXN0IGRpc2N1c3Np
b25zIGluIGZvcm0gb2YgYSBGQVEgYXQgWzFdLg0KDQpbMV0gaHR0cHM6Ly9kb2NzLmdvb2dsZS5j
b20vZG9jdW1lbnQvZC8xSXluLWwzTm0weWxzM3BaYXVsNGxaaVZqOHgxczczRWQ2ck9zbW42TGZY
Yy9lZGl0P3VzcD1zaGFyaW5nDQoNCg==

