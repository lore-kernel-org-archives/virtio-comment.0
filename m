Return-Path: <virtio-comment-return-7968-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B45C25B48
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 03:58:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 220952B148
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 03:58:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 02D32986A41
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 03:58:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DF3EC986A3F; Thu, 26 Oct 2023 03:58:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CE92D986A40
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 03:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhbLy/rcgskDvIsOSxxqcjF+dB1jTCIk+1l9gkzRT/RIcm+ldf25K4nTIJ8uPdA/WjEsnrPYFcts9SAXQrtWsvF7CRxZXsIwiODSeP7G7JPLh+UogSru2JMfeOnrMV05RbhxdFB6ngNJldbW9OgHzb7YufVuD1IVLXvXkC+8MrRCkT00BGyo9204QVVhK4yYB3Q6YVagvS9g0xOpit1i5yQHTY7wRkVx9EAKBjXQJfM94eSn5QROkzT13f0RsRg4CqNTdyz5DVKDtLNKIYchNQ0vK5yxgVwMhTxPpKI5+fSTPcMxwH1MmGkGKcQCBIcxCKdrxfC+zHBLDiDB40OohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AYXiiY7CtWTQM97CvLZ6a9rr881XLqPGwqFKup8Cos=;
 b=dsvQ4yii503sSaQx+KjC87cXMKcr/Np/iTrvAWBjzw0KdZFEGlJ7RHb9KrNxLRB9nG9ROy7Y6pacHukRdkFeT+W9rmoSlnBRI5NzlGvfhgRDPz8c/i1+Kcy40OgqgXSZ8Cfn+qT64JL33QX/Yv9D39NKNprt5TymdzWbbzvyHkf3Tx1bphheTr8W4kc2dp8bigFFEOpRGgXvNuUyxha0mHy6aTQ2QuStmi/0q5sPUj7grsKfRwxzBNP+ApwJBcTkSAMoBI+oO682HW9gR6QqInVrzwnkwPEyOMw/wBWHs6ei8DpTOe/+1xA2mxXZFSXlpjKq7WLHjbVSTKmKee/iSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com"
	<sburla@marvell.com>, Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb
	<maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAAALdAIAAGU2AgAHbxICAAsgMAIAAGOUAgAGAHQCAAXKpAIABEquAgAAxULA=
Date: Thu, 26 Oct 2023 03:58:19 +0000
Message-ID:
 <PH0PR12MB5481E50E25268163CD85751DDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <20231020053534-mutt-send-email-mst@kernel.org>
 <3932dd54-f43a-40b6-8dba-962f997f7122@intel.com>
 <20231021112420-mutt-send-email-mst@kernel.org>
 <2cc0d8fc-8ed5-4b98-b5e7-3a86d3da80b0@intel.com>
 <20231023072519-mutt-send-email-mst@kernel.org>
 <8d601578-2083-4f45-a700-6b67d0c5b789@intel.com>
 <20231025042512-mutt-send-email-mst@kernel.org>
 <CACGkMEtaw-DKy7vwWj8wgG8-_9Kg4SV3=pS1djntOEYM62Dg-g@mail.gmail.com>
In-Reply-To:
 <CACGkMEtaw-DKy7vwWj8wgG8-_9Kg4SV3=pS1djntOEYM62Dg-g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB6112:EE_
x-ms-office365-filtering-correlation-id: fbd4688e-5874-4246-58db-08dbd5d7ca39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aptMrfSC7b1QaoEcHBH3LKnvY2lIyarVHd0oX9Adl/LSfMwfFhMcRsa/soD1d97E9gYuzf3Cn5rd70s6PUgfpuTrTPz7u9xxyPNBHMMEPfiDIDpmbCFPBMHaJRv2OFoQVMGuoapJ/4jn4ucbZprfemTWuo3XykOl5EJ+mBcwQNXleBmCsB+LemheENJM7oh/GCqV8Toedc7EkdI0yDVlZ9CwK+p38HH1ImT7uz1R+oCJN2Qm4q0txGlVdH88JM0Y/T7QPuyQ8/540UwRWBrc6le9ECrQIcJemkUJzcKgF1r+aahN4i4OkmGsoYKWkWiLhVJIWgnKjKxNDfRRnpfnNgnKNG3mM2qzrwMgJ/3pS6a0pnBJj1YCdF8L/76u1udA9L6IgOXsuCiYrV1kS5snB/gxPF+m0+MGpTCxcAaeSbD2CZ8AiHN48hfUyAgZHH7JT4stz/CRSQCgyTP4u8jT95Kr43nsJd9+cuawfJPHZ6ntrrkPiyhiblbqUePRKCtoGp9Y+OR+m+EqtLe/NjvroOnbd346ywR4hJ0z/FbyaenIUufThfY53IVC7a7R8meSkKY1mLMWkIuMhI2Ou5E4WbtXLGDCkNm4DLXAAj7MAbLWWZrccHixQ7vR2cT7WJakd4z3Z4qH7tZYFn/ti0O38TIiXweKVGRw76nn1ZIRxFQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(376002)(39860400002)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(33656002)(86362001)(5660300002)(55016003)(38070700009)(26005)(2906002)(478600001)(45080400002)(9686003)(966005)(6506007)(66476007)(38100700002)(122000001)(7696005)(76116006)(41300700001)(107886003)(83380400001)(66446008)(8936002)(316002)(71200400001)(53546011)(66556008)(64756008)(8676002)(4326008)(110136005)(66946007)(52536014)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkFUODVEVmtVMWZQOTRBYTY4WUU4SWlVMSs2VFozOXBpNEFRay9KUFo4aTNx?=
 =?utf-8?B?V012V1ZSYjRBSUlMUVlzbDg4bFpTaU43SFRhVDVqWFBPZi9kVDAvdVVIdndY?=
 =?utf-8?B?aWMyMkE4MTZhWFI0MGpoUGVoNGppa3dxWDhnNExkYTJPbmU2TEpjTFB3NGhy?=
 =?utf-8?B?UXUzeTlvSUxwWWNIM1orTFRKWVU2aGk0NWxnd0tsdXlpakRCRS9ybnFtcWNn?=
 =?utf-8?B?eWMzd1Zua01OenhKencxRkcyMktHNUp0eTRLQ0Q1RWVPcFZTd0xnVHhGbW9C?=
 =?utf-8?B?c2x5azgyc1d0d3ZQM3k3MHJ0a1JjbmhFOU9KM3NuckJ4ZzgzMkxEL2c1eTFv?=
 =?utf-8?B?cERoa0Q2SXVOVmxNeEpyVnpvSFlQdngyT1ExRHc0WjZCN1dmRHJwS1Q5VmFh?=
 =?utf-8?B?TVkxYXJaWDY5YzZDYlRJbE1KcG9oVEN3bGNqelJwOWs2MW50Ukg5cWJzQ1JF?=
 =?utf-8?B?VWZjRUJPS1hLSksvMkQxanljZ1hIZDJxUDlKRDYvdkpvK3NlYVJPUlYrMC9R?=
 =?utf-8?B?bE81Mko2V1ViRW95TWdoSlNZd1dpRCtNblF5cGZqRzczYWY4T3BpUzJ6eS92?=
 =?utf-8?B?U2s5dkpoNjlLYjlCd1Rvc3hIQkx2MUxzUTZ3dUlRd3U5aFhqYW9wd0lXb2Mw?=
 =?utf-8?B?VkZlVDVYTW51aHZpQ1ZVWll5amRBWkRjUGNBUjNNRmNpN0tJTGYvVnJBMEVs?=
 =?utf-8?B?YU1SeDlpTnVNUHQ2TisyVllTWEZnNVZuZVRra0pEeWdsaTRCWmJVNGxHRDN2?=
 =?utf-8?B?UERmRjdhVUJVRC9VS0t0MmZLTkIzdTQ5dFN3NC94a3plWVZCZXpXbm1wKzFR?=
 =?utf-8?B?WllhM3Vsdy9GYU8zVzBNZnVuL3pEV3JYRFpWdmJJU1ozTURxRjB5S1JlNEtS?=
 =?utf-8?B?bkdCSzhXVVJIZWx1QVV2YTl0V2J5VXMyUEM2N2JIZ2NQMjBXNEJvMmExM2Zh?=
 =?utf-8?B?b1VOamtRdjFPWVk1N1dtaFd4em5oUDJ5NFZwdnF3RVJFelBMcm9TRE4rTEV0?=
 =?utf-8?B?STZuNDY0MTJlWE1qZGkraE4zdmY4ZHQrZVpBYVc0VFd0akFYZ1JUbkxQQ0Vy?=
 =?utf-8?B?N3Fpckw0M3JRZVZsU3hVYWEvQnNOOHl1YW82dlBaT3h4Z2ZvYmdwbVE5Wm00?=
 =?utf-8?B?bGtOSFBPSnVZbjBwcWJ4SWJNaVZMc0xBenFMenRITHhXZzlvMUxObzdjcmRG?=
 =?utf-8?B?VEJ0Q05WRXkrVXQxVjdEY2tHVDJKQktuY0d1cy94amR6bkNNeVhXSHRWOE43?=
 =?utf-8?B?SUZibE13RndKdm5NTGRveTdIU0VZWmhXZ1labzRaQzE1RExISTBUN2lxRVYx?=
 =?utf-8?B?b0QvRGpUNzdmeFE2bkJxOG5IdStMZjhXVWsvRHBUVVhvblFhS3Raenl4K0hy?=
 =?utf-8?B?ZUM1dUsvcjdTbTJUNFdiZE4vQVd4bGtBM2pIQ1E3ZDdvN2Y4a3c5Q29aNzIr?=
 =?utf-8?B?OTd1VXJrVjZDeXN3OFg5RjR5N240MjNtWnhFZDJ3SlFuWUNIdXkxZkVkY1lH?=
 =?utf-8?B?WWV5T1U5K0tWYkQwS1dxVFhjVThMMnI0dVA0bWhraTUyMGpRaEgxeDF1MjVZ?=
 =?utf-8?B?U2MvemZ2bGxDNGYzNDRvNW1GVWVKMEdrbm9Oa3JUYnc0TE15aU9FVXlSS2Ez?=
 =?utf-8?B?MURvZWRiNnUrYmtBT0ZzMFluMXRzaU5tM2dOYnNjVlRDVTNGaTRPbzRpMlBs?=
 =?utf-8?B?aG95RXF0K0gwM3pYT3hqUmtkdzMvMHlmNnJlU0xVb25VMGVPaFRyV005RzlJ?=
 =?utf-8?B?NU1uZVlxR2crbHpkMFRndGwvQ3FQOEpZaVB1UGVydHg5WVpydE5DdWhid01k?=
 =?utf-8?B?S0dZbUNPNmpIK0JQSjQvRzN0MWc4eEhYYUkrcDUreHJ3c1ZwajRCVEFuZGNw?=
 =?utf-8?B?TmZ6ZGRESUYvZzBxNFowaUtEaDY2ZUpvMXhCYTVWelNES1NFT1pONjJPazRF?=
 =?utf-8?B?OExOT2tIemQ0L25naTZobUNodlFzTU5hWktpQW5lcGw3elc0RnVibE05cG9H?=
 =?utf-8?B?NG5vL0RVRjZzMUV6eG43RDg0YXNVdHpGUnA4NDFYVVFqdHJ6ZHhPMmtuZjhX?=
 =?utf-8?B?TzAvYlVlK2RHYXMyS1ZTYmtaTXIzTUFmT21JR1U5TTZBb1YxWWMwOTBqbW5B?=
 =?utf-8?Q?YVEc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd4688e-5874-4246-58db-08dbd5d7ca39
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 03:58:19.0169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ijNhQmJPw9p8sU+UD4F8r/zxw2eSx2cjSP4UZS+RehdAZFWRTG7XgBT2UZrlXenqgTYg1yuC8l6Jh8IWSFdi4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6112
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogVGh1
cnNkYXksIE9jdG9iZXIgMjYsIDIwMjMgNjoyNyBBTQ0KPiANCj4gT24gV2VkLCBPY3QgMjUsIDIw
MjMgYXQgNDozM+KAr1BNIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+IHdyb3Rl
Og0KPiA+DQo+ID4gT24gVHVlLCBPY3QgMjQsIDIwMjMgYXQgMDY6Mjc6MDRQTSArMDgwMCwgWmh1
LCBMaW5nc2hhbiB3cm90ZToNCj4gPiA+DQo+ID4gPg0KPiA+ID4gT24gMTAvMjMvMjAyMyA3OjMy
IFBNLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gICAgIE9uIE1vbiwg
T2N0IDIzLCAyMDIzIGF0IDA2OjAzOjEwUE0gKzA4MDAsIFpodSwgTGluZ3NoYW4gd3JvdGU6DQo+
ID4gPg0KPiA+ID4gICAgICAgICBjb25maWcgc3BhY2UsIE1NSU8sIHJlZ2lzdGVycyB3b3JrIGZv
ciB5ZWFycywgd2hhdCBpcyB3cm9uZyB3aXRoIHRoZW0/DQo+ID4gPg0KPiA+ID4gICAgIE5vdGhp
bmcgYXMgc3VjaC4gVGhleSBkb24ndCBzZWVtIHRvIGJlIGFwcHJvcHJpYXRlIGZvciBhbGwgdXNl
LWNhc2UNCj4gPiA+ICAgICB3aGVyZSBwZW9wbGUgd2FudCB0byB1dGlsaXplIHZpcnRpby4gSSB0
aGluayBhIG5ldyB0cmFuc3BvcnQNCj4gPiA+ICAgICB3aWxsIGJlIG5lZWRlZCB0byBhZGRyZXNz
IHRoZXNlLg0KPiA+ID4NCj4gPiA+IE5ldyB0cmFuc3BvcnQgZm9yIG5ldyB0eXBlIG9mIGRldmlj
ZXMgZm9yIHN1cmUsIGxpa2UgdHJhbnNwb3J0IHZxIGZvciBTSU9WLg0KPiA+ID4NCj4gPiA+IEkg
YWdyZWUgYWRtaW4gdnEgb3IgYWRtaW4gY21kcyBhcmUgdXNlZnVsIGluIHNvbWUgdXNlIGNhc2Vz
LCB0aGF0IGlzDQo+ID4gPiBhbm90aGVyIHN0b3J5LCBzaG91bGQgYmUgY2FzZSBieSBjYXNlLg0K
PiA+ID4NCj4gPiA+IEZvciBub3csIGxldCdzIGRvbid0IHRhbGsgYWJvdXQgYWxsLXVzZSBjYXNl
cywganVzdCBmb3IgY3VycmVudA0KPiA+ID4gdGFzaywgZm9yIGxpdmUgbWlncmF0aW9uLg0KPiA+
ID4NCj4gPiA+IFNvIElNSE8sIEkgc3RpbGwgdGhpbmsgd2Ugc2hvdWxkIHVzZSBjb25maWcgc3Bh
Y2UgcmVnaXN0ZXJzIHRvDQo+ID4gPiBjb250cm9sIGxpdmUgbWlncmF0aW9uIHByb2Nlc3MuDQo+
ID4gPg0KPiA+ID4NCj4gPg0KPiA+IE5vIGJlY2F1c2UgaXQgZm9yY2VzIGludGVncmF0aW5nIG1p
Z3JhdGlvbiBwcm9jZXNzIHdpdGggZGV2aWNlIGRyaXZlci4NCj4gPiBXaGljaCBpcyBvayBmb3Ig
c29tZSB1c2UtY2FzZXMgYnV0IG5vdCBhbGwgb2YgdGhlbS4gIEZpbmQgc29tZSBvdGhlcg0KPiA+
IGNvbnRyb2wgcGxhbmUgZm9yIHRoaXMuDQo+ID4NCj4gPg0KPiA+ID4gICAgICAgICAgICAgICAg
IENvbmZpZyBzcGFjZSBpcyBjb250cm9sIHBhdGgsIERNQSBpcyBkYXRhLXBhdGgsIGxldCdzIGJl
dHRlciBub3QgbWl4DQo+IHRoZW0sDQo+ID4gPiAgICAgICAgICAgICAgICAgd2UgbmV2ZXIgZXhw
ZWN0IHRvIHVzZSBjb25maWcgc3BhY2UgdG8gdHJhbnNmZXIgZGF0YS4NCj4gPiA+DQo+ID4gPiAg
ICAgICAgICAgICAgICAgU28gd2UgbmVlZCBETUEgdG8gdHJhbnNmZXIgZGF0YSwgZm9yIGV4YW1w
bGUgSSB0YWtlIGFkdmFudGFnZXMgb2YNCj4gZGV2aWNlIERNQQ0KPiA+ID4gICAgICAgICAgICAg
ICAgIHRvIGxvZ2dpbmcgZGlydHkgcGFnZXMsIFRoaXMgYWxzbyBhcHBsaWVzIHRvIGluLWZsaWdo
dCBkZXNjcmlwdG9ycy4NCj4gPiA+DQo+ID4gPiAgICAgICAgICAgICBBcyBsb25nIGFzIHlvdSBk
bywgSSBwZXJzb25hbGx5IHNlZSBsaXR0bGUgYmVuZWZpdCB0byByZXRyaWV2ZSBwYXJ0cyBvZg0K
PiA+ID4gICAgICAgICAgICAgc3RhdGUgd2l0aCBtZW1vcnkgbWFwcGVkIGFjY2Vzc2VzLg0KPiA+
ID4NCj4gPiA+ICAgICAgICAgcmVnaXN0ZXJzIG9ubHkgY29udHJvbCwgYW5kIEkgcGVyc29uYWxs
eSBiZWxpZXZlIGEgc2luZ2xlIHJlZ2lzdGVyIGlzIG11Y2gNCj4gPiA+ICAgICAgICAgYmV0dGVy
DQo+ID4gPiAgICAgICAgIHRoYW4gcHJvY2Vzc2luZyBhZG1pbiBjb21tYW5kcywgbW9yZSBsaWdo
dC13ZWlnaHQsIG1vcmUgcmVsaWFibGUsDQo+IHdvcmtpbmcNCj4gPiA+ICAgICAgICAgZm9yIHll
YXJzLg0KPiA+ID4NCj4gPiA+ICAgICBZZWEuIEl0IHdvdWxkIGJlLCBpZiB3ZSBjb3VsZCBkbyBl
dmVyeXRoaW5nIHRocm91Z2ggdGhhdCByZWdpc3Rlci4NCj4gPiA+ICAgICBCdXQgd2UgY2FuJ3Qg
cmVhbGx5LiBNaWdyYXRpb24gaGFzIHRvbyBtdWNoIGRhdGEgdG8gcGFzcyBhcm91bmQNCj4gPiA+
ICAgICBmb3IgdGhhdCB0byBiZSByZWFzb25hYmxlLg0KPiA+ID4NCj4gPiA+IGRhdGEgYXJlIG5v
dCB0cmFuc2ZlcnJlZCBieSByZWdpc3RlcnMsIHRoZXkgb25seSBjb250cm9sLg0KPiA+ID4NCj4g
PiA+IFdlIHRyYW5zZmVyIGRhdGEgYnkgRE1BLCB0aGUgZGV2aWNlIHdyaXRlcyBETUEgZGlydHkg
cGFnZXMNCj4gPiA+IGluZm9ybWF0aW9uKGJpdG1hcCkgdG8gaG9zdCBpc29sYXRlZCBtZW1vcnkg
cmVnaW9uLg0KPiA+ID4NCj4gPg0KPiA+DQo+ID4gSWYgeW91IGRvIHRoYXQgdGhlbiBJIGRvbid0
IHNlZSBhbnkgcmVhc29uIG5vdCB0byB1c2UgYWRtaW4gY29tbWFuZHMNCj4gPiBmb3IgdGhhdCAt
IGVpdGhlciB0aHJvdWdoIGEgdnEgb3IgYSBzaW1wbGVyIGludGVyZmFjZS4NCj4gDQo+IEkgdGhp
bmsgd2UgbmVlZCB0byBhZ3JlZSB0aGF0IGFkbWluIGNvbW1hbmRzIGFyZSB0aGUgb25seSBpbnRl
cmZhY2UgZm9yIGFueQ0KPiBmdXR1cmUgZmVhdHVyZXMgYmVmb3JlIHdlIGNhbiBoYXZlIGFuIGFn
cmVlbWVudCBoZXJlLg0KPg0KRm9yIHBhc3N0aHJvdWdoIG1lbWJlciBkZXZpY2VzLCB0aGlzIGFk
bWluIGNvbW1hbmRzIHRvIGJlIHRyYW5zcG9ydGVkIHZpYSB0aGUgb3duZXIgZGV2aWNlIGJ5IHRo
ZSBtaWdyYXRpb24gZHJpdmVyIHdoaWNoIHNpdHMgb3V0c2lkZSBvZiB0aGUgZ3Vlc3QgVk0uDQoN
CklmIHRoaXMgYmFzaWMgcmVxdWlyZW1lbnQgaXMgbm90IGNsZWFyIGl0J3MgcG9pbnRsZXNzIHRv
IGRpc2N1c3MgZnVydGhlci4NCkhvdyBpcyB0aGUgcGFzc3Rocm91Z2ggZGV2aWNlIGRlZmluZWQ/
IEl0IGlzIGRlZmluZWQgYXMgWzFdLg0KDQpDYW4gbm9uIHBhc3N0aHJvdWdoIGRldmljZSBtb2Rl
cyBzdWNoIGFzIHZkcGEgYWxzbyB1c2UgdGhlc2UgYWRtaW4gY29tbWFuZHMgZnJvbSB0aGUgb3du
ZXIgZGV2aWNlPw0KU3VyZSwgd2h5IG5vdD8NCg0KWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3ZpcnRpby1jb21tZW50L1BIMFBSMTJNQjU0ODFFQTZBNEQwQzY0QzVBRjZEM0E1N0RDRDRBQFBI
MFBSMTJNQjU0ODEubmFtcHJkMTIucHJvZC5vdXRsb29rLmNvbS8NCg==

