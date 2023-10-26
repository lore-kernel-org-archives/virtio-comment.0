Return-Path: <virtio-comment-return-7966-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46436C0032E
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 03:45:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A07B92B07B
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 03:45:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 898DE986A41
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 03:45:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 698A9986A3E; Thu, 26 Oct 2023 03:45:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 58A02986A3F
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 03:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/bVtMT2ALIFujPPXMiRh43vWlstdPYFR6LZ7nwYzjgbW6f7A8Sa38+Mv0MM7xAHYb0vXOR9x5ua1Cr3m7/fuMhAO+obvNqdff7QisIpWAVL+0ZrTSL9WJm4LNwT8b1KkEmd/6kT+BfTgRc/HH6+ZV5+ygiyyeYyQgaLe3Dg+eX+EHp+1I4X+6oR1nm/HqHGTP2SosoWMO/mPTsuJ7WJhMVc5VcPxhKJassclRZyEg7olv04ubaiB2/Eb3ChYgfzCUxeMx7OXBXtDEDNRvsfzM0i4eNt+j+zwJ9JpglPORTTTzlyAOng6iV2kVeGfa21Bku5vx7ezsVkFcd59QS1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0py90YpqTGy+xHC/e5b6PCXhrOgVJbAysD3V+lVejU=;
 b=muaM//e6zRbVViTTL4LoN/qqwbz+dgJ4uEs7PovgGWWTaS4eT7hN31eCUv6+1BgZbBOOBiM3316ASkoa23o/Lt8s0g5Qvq02pjhNgrr71vxfFkgCtHT1OgerM4v11baRJXpfktCtiy0r6/5DzddxZ2V/zCxqYHQlHz1jfi0OV//hcjxGCz0+pp9mHBabhE5NfQxWUbklsFc24Z3s4miHdiLOFLBsgrbrdr13MOBI4UNRbCL3h3O9rWG+kmML3Fs6yiUpItsLzryVJa6kUslggavZ0LA9p8eqXTdMXB/VUiEw7ARnjhomesaA0DZuuaUiwlZJ8CJywsdmasxsJvlRhA==
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
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCABizrAIAAD2aggAGUBACAAABcUIABWsEAgABcQLCAASo6AIAALsiA
Date: Thu, 26 Oct 2023 03:45:07 +0000
Message-ID:
 <DM8PR12MB5480FD897C13FCB2CBE15268DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
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
 <PH0PR12MB5481A39FADD3A19F0CBF1B66DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt_aVfMgYQo3uMy-_DXrYDpgkWHtSq_qfr-tXs289pQWg@mail.gmail.com>
 <PH0PR12MB54817E76866D0E98863F6C5DDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEs+M+z0HoBo9i_w5qjNt7=MxViSu2PYbTSyfe+Pm-dnqQ@mail.gmail.com>
 <PH0PR12MB5481C28D6E1C3C9490AF682BDCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt7F6VHiam7bNxK8EqqR6vyyGxrETP7s9b3DHiDktxtHQ@mail.gmail.com>
In-Reply-To:
 <CACGkMEt7F6VHiam7bNxK8EqqR6vyyGxrETP7s9b3DHiDktxtHQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|CH3PR12MB8308:EE_
x-ms-office365-filtering-correlation-id: bb2a3b1a-9df4-49c6-c7df-08dbd5d5f2b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 It38hJexDZTzq5h17CG2nrRVQ+1K76YmGdsefvc4CQtKTv2rmwbaNLNEAxuPOcFa5XB3kxYrkayFf0n9l5qQnhNzp3o04WZp80Oar04r0yCA/S5UlcxN6tsK4hNJxh1EzTKGyEK8Zzdp+KusuQo5AcYfAG6Zd5gLDcxH9xNN1R3/qDcdvaeDR1/co1m3s9gPDQyZ1gMEFdPEy85bYP4FpjwpyMz6bJN8DP5K0miduC8LqavPqH2mX9crl91sxkoBQIuETiyZvW4ok7mk9vBPgnzanH6R6jZxgNQVtojiqxdLxL4Cd9LE/Dze3g61o1ZU03TvS5MYknIhqvtDSfVb9ZF9Ew6hu51Xw3Uefo2UpCrImkS1CawsjSIKa98jh101T6bFpGsUB7T+XFjSgDWAefEYVG29OQBI3nczNysuddQedvwadWb5LlneHEItLM+oQzPH+LzdG/aXcEBNtgq54F+5uLRdx830/8gdiUFGCutGnrETy2JkjXq5Iwi/KknuSLdzvmRbLBTxQNWdLgXDRzPhoy3URaG/1aDmtgUycG8aFy4vyU/B1XCXCbfEudIZt5efQchwrEhk8rbyw7ngRBgpvSa4yIKyDEl0zQN2nNqFAztiRzah/JehXcmvA9+J
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(366004)(396003)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(66899024)(26005)(76116006)(478600001)(316002)(86362001)(6506007)(6916009)(66946007)(66556008)(66446008)(38100700002)(66476007)(64756008)(54906003)(38070700009)(33656002)(7696005)(107886003)(2906002)(122000001)(71200400001)(52536014)(83380400001)(4326008)(8676002)(8936002)(5660300002)(9686003)(55016003)(41300700001)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N3RWZzBMMkNFVy9nQmVEODlzRlpGRmtQeEpZYm5xM3ZqZ1BBV3dpb1RLR09S?=
 =?utf-8?B?OWNLR09vcHdVSThtbmFidTFkdVEvK3F0b2RVVE80b05IZ1NaQTN6TDg4Nzg0?=
 =?utf-8?B?d1ZacWFLMEc4TWdwcmJEVUhzWFN4THpTbnJWWWs3Nnk3eENnNy9FZnM1dVpL?=
 =?utf-8?B?QUNHT2NUVkh1aXlKQ3VFNFRaMEhTdDZRb1htQi9Mbzh0dXBsbjl5TTFqcGRi?=
 =?utf-8?B?VWxqQXdNa1N4Z3Nnckl2aERqb2dubmE1enhETWlNUmY2eXQ2VXcyV0RycXB0?=
 =?utf-8?B?ank5MnlxRTJaVzI1N1ZhaEt6U3I2QW9zc1V0N0J1eXpSOHVGRlZQdHlFTkxj?=
 =?utf-8?B?VGtsbnRKZGlNdURpTmRLMjQyRENuaTcyMFB6Wm9lN2szRDh1NlUrYkg5VXJJ?=
 =?utf-8?B?N0Zxei9qTVIwdUNDdjBKWmU4VDUycU8vOFdMcFZlQk9rZ0VHS3JUM24yd1c2?=
 =?utf-8?B?L3gyVmExSXhlRldZR1J0OFozaC9OZjZMWDlYc05hOHh4VWFKeGxVam9GM0ZU?=
 =?utf-8?B?VjdwU2tMYTh2eWlDK1ZxbUdPdzUyU1RGU2Q4L1ZwQm5OSW9Xakx2YUd3RDRP?=
 =?utf-8?B?bXYvYkpZelZDazQ5Sk9CS04xU1ZoY3p0RWIwNk4vdkhBalhPRUhoSjNZWE1h?=
 =?utf-8?B?dUFzQTd4RFk0ekY5RzRoQmxVczlNN2tmVEtsTXpxSVVZenk5YjFVMFIydkNT?=
 =?utf-8?B?bGZaTXlOc0M2c2IxYVVIaWtWOEd4YTRIOFM4eU5wbE9ScCtaQU5EMnA5LzIv?=
 =?utf-8?B?RUk0RmNZTDM1Y3NEOUhLQnpFeWdTb1IvdW1UY3NxRTd5dmh2bHpjNklId2JM?=
 =?utf-8?B?VTFoVlpvU2IybFV6SmNYTlp4SjJtcktvYVZreVF5ZDhYRVh5ZDNQVE5nUUZ2?=
 =?utf-8?B?Ni8rZWJhNnlnd3FIUitiQ2djbGZmVHZJRlpZeWxXblRBWGM3Yjl5azZrWTBF?=
 =?utf-8?B?KzhkekVodVUvYzdnQ0ppUGM1SFNYbytkZUcwSWpIMmdUL1h1ZzREcm04QkdS?=
 =?utf-8?B?dE5yQXVTZEtmT3RSRUx2cC9kSGNQdy9Pckc2dDUvSS92UG1Kc3ZZNFhuNWdT?=
 =?utf-8?B?RFFJV1FGR1JvUVFxQUZCNElaOWxELzJNdjd5cVIzTGI2cEJnT2NaTVpKK2VM?=
 =?utf-8?B?OXdvb2hDdHBLeDVMMDBnN0tLMHhCMkZSSHo0S05XblpCemJNKzlKSjYrUmFk?=
 =?utf-8?B?TTF5ZEdkaFdJTW44U09ISk1hRFphTFVYOG5yYlJqY2pZVmJWcE42YmRsOHo5?=
 =?utf-8?B?VTAwOGE2bE5WTlFPVm5VaVV5TVJ2RkMwelZWNFdHOU9hT3dNcXNueThzWWg5?=
 =?utf-8?B?VGljUnM4NFJYNld0bWt5Z3p5RWxlMU9jYVlMUFp5Z09HZ2tCQk85K003N1BU?=
 =?utf-8?B?RW5waVZ0aWlNQ3ZQNEFVSHZVbDNXU1RQR0o4V1lmYTBEZHBRSVZtVE5aeWdU?=
 =?utf-8?B?YXBIc0FzVlpBRUlwWkVLb1VMdmdwOExPeHl0WnZ2ZnFCWHNwWWxNQndaRHlG?=
 =?utf-8?B?aGdEU1djZkVSRlE4bUZxd1dDLzNjbnhiTHlibytoTzNnNDVKZTQxdko2QmFo?=
 =?utf-8?B?TENnQ3ZoUHdtUGNqeVpoSEZ2cmxQMXhVQUdOUHlLUjZXYXNKQ29uS1RhQ2Z1?=
 =?utf-8?B?WEhqNmRkbHNrOVJaZVQ3Z3FTOWd0TFdYc0lWNHdyZGlpVXI2bGhLancwbGVD?=
 =?utf-8?B?SGlwL2p1MVJxSnhIUDBtQXJCcGZyRXZGVGFNS3MzSmlFbXJjcUdmYUhkT3ZV?=
 =?utf-8?B?c2hTLzBOUEt6M09DbXdZcENibmhwb2xSZVJkNFphR1FtRko2RmF2ZWRHZVFy?=
 =?utf-8?B?OEQvbzlQMFRNVUZzUTRNazV2NVo2SXFaNVFiK2duVklwajltU28xaysyR0xB?=
 =?utf-8?B?cnRLY1AzVVZmMUhZd3IrdkdyZGtrWXlsRzlBVjNLeFFJM0hrVm1QY1dHTGRY?=
 =?utf-8?B?NW1xV3pEZERDMGZvWW15QTdITEJSRFdnZDV0R3MvSlJPWmNkbTg3Y0FHaU5V?=
 =?utf-8?B?SmpmRi9mTEcvYVVZbzVEbWxmamk1RFFMaXdNSHd5Y05POWRjUTlydWVwSm1D?=
 =?utf-8?B?eFd3cWl4M3hsdG13eExjU0lZSlZwbzA3YzNiazNCN29BTDRscXdhMnNaZWNP?=
 =?utf-8?Q?t1eY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2a3b1a-9df4-49c6-c7df-08dbd5d5f2b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 03:45:07.9658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IAEeQktjwZR0yYp5wDXNP2dos0AkszcsQy+VwEXWEtGYQyJMPJgaPjOgel9OTWZXgLjitYT1uwSF1MuLS96Kjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8308
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogVGh1
cnNkYXksIE9jdG9iZXIgMjYsIDIwMjMgNjoxNiBBTQ0KPiANCj4gT24gV2VkLCBPY3QgMjUsIDIw
MjMgYXQgMzowM+KAr1BNIFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4gd3JvdGU6DQo+
ID4NCj4gPg0KPiA+ID4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4g
PiA+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyNSwgMjAyMyA2OjU5IEFNDQo+ID4gPiA+IEZv
ciBwYXNzdGhyb3VnaCBQQVNJRCBhc3NpZ25tZW50IHZxIGlzIG5vdCBuZWVkZWQuDQo+ID4gPg0K
PiA+ID4gSG93IGRvIHlvdSBrbm93IHRoYXQ/DQo+ID4gQmVjYXVzZSBmb3IgcGFzc3Rocm91Z2gs
IHRoZSBoeXBlcnZpc29yIGlzIG5vdCBpbnZvbHZlZCBpbiBkZWFsaW5nIHdpdGggVlEgYXQNCj4g
YWxsLg0KPiANCj4gT2ssIHNvIGlmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHlvdSBhcmUgc2F5
aW5nIHlvdXIgZGVzaWduIGNhbid0IHdvcmsgZm9yIHRoZQ0KPiBjYXNlIG9mIFBBU0lEIGFzc2ln
bm1lbnQuDQo+DQpOby4gUEFTSUQgYXNzaWdubWVudCB3aWxsIGhhcHBlbiBmcm9tIHRoZSBndWVz
dCBmb3IgaXRzIG93biB1c2UgYW5kIGRldmljZSBtaWdyYXRpb24gd2lsbCBqdXN0IHdvcmsgZmlu
ZSBiZWNhdXNlIGRldmljZSBjb250ZXh0IHdpbGwgY2FwdHVyZSB0aGlzLiANCiANCj4gPg0KPiA+
ID4gVGhlcmUgYXJlIHdvcmtzIG9uZ29pbmcgdG8gbWFrZSB2UEFTSUQgd29yayBmb3IgdGhlIGd1
ZXN0IGxpa2UgdlNWQS4NCj4gPiA+IFZpcnRpbyBkb2Vzbid0IGRpZmZlciBmcm9tIG90aGVyIGRl
dmljZXMuDQo+ID4gUGFzc3Rocm91Z2ggZG8gbm90IHJ1biBsaWtlIFNWQS4NCj4gDQo+IEdyZWF0
LCB5b3UgZmluZCBhbm90aGVyIGxpbWl0YXRpb24gb2YgInBhc3N0aHJvdWdoIiBieSB5b3Vyc2Vs
Zi4NCj4gDQpOby4gaXQgaXMgbm90IHRoZSBsaW1pdGF0aW9uIGl0IGlzIGp1c3QgdGhlIHdheSBp
dCBkb2VzIG5vdCBuZWVkIGNvbXBsZXggU1ZBIHRvIHNwbGl0IHRoZSBkZXZpY2UgZm9yIHVucmVs
YXRlZCB1c2FnZS4NCg0KPiA+IEVhY2ggcGFzc3Rocm91Z2ggZGV2aWNlIGhhcyBQQVNJRCBmcm9t
IGl0cyBvd24gc3BhY2UgZnVsbHkgbWFuYWdlZCBieSB0aGUNCj4gZ3Vlc3QuDQo+ID4gU29tZSBj
cHUgcmVxdWlyZWQgdlBBU0lEIGFuZCBTSU9WIGlzIG5vdCBnb2luZyB0aGlzIHdheSBhbm1vcmUu
DQo+IA0KPiBUaGVuIGhvdyB0byBtaWdyYXRlPyBJbnZlbnQgYSBmdWxsIHNldCBvZiBzb21ldGhp
bmcgZWxzZSB0aHJvdWdoIGFub3RoZXIgZ2lhbnQNCj4gc2VyaWVzIGxpa2UgdGhpcyB0byBtaWdy
YXRlIHRvIHRoZSBTSU9WIHRoaW5nPyBUaGF0J3MgYSBtZXNzIGZvciBzdXJlLg0KPg0KU0lPViB3
aWxsIGZvciBzdXJlIHJldXNlIG1vc3Qgb3IgYWxsIHBhcnRzIG9mIHRoaXMgd29yaywgYWxtb3N0
IGVudGlyZWx5IGFzX2lzLg0KdlBBU0lEIGlzIGNwdS9wbGF0Zm9ybSBzcGVjaWZpYyB0aGluZ3Mg
bm90IHBhcnQgb2YgdGhlIFNJT1YgZGV2aWNlcy4NCg0KPiA+DQo+ID4gPg0KPiA+ID4gPiBJZiBh
dCBhbGwgaXQgaXMgZG9uZSwgaXQgd2lsbCBiZSBkb25lIGZyb20gdGhlIGd1ZXN0IGJ5IHRoZSBk
cml2ZXINCj4gPiA+ID4gdXNpbmcgdmlydGlvDQo+ID4gPiBpbnRlcmZhY2UuDQo+ID4gPg0KPiA+
ID4gVGhlbiB5b3UgbmVlZCB0byB0cmFwLiBTdWNoIHRoaW5ncyBjb3VsZG4ndCBiZSBwYXNzZWQg
dGhyb3VnaCB0byBndWVzdHMNCj4gZGlyZWN0bHkuDQo+ID4gPg0KPiA+IE9ubHkgUEFTSUQgY2Fw
YWJpbGl0eSBpcyB0cmFwcGVkLiBQQVNJRCBhbGxvY2F0aW9uIGFuZCB1c2FnZSBpcyBkaXJlY3Rs
eSBmcm9tDQo+IGd1ZXN0Lg0KPiANCj4gSG93IGNhbiB5b3UgYWNoaWV2ZSB0aGlzPyBBc3NpZ25p
bmcgYSBQQUlTRCB0byBhIGRldmljZSBpcyBjb21wbGV0ZWx5DQo+IGRldmljZSh2aXJ0aW8pIHNw
ZWNpZmljLiBIb3cgY2FuIHlvdSB1c2UgYSBnZW5lcmFsIGxheWVyIHdpdGhvdXQgdGhlIGtub3ds
ZWRnZQ0KPiBvZiB2aXJ0aW8gdG8gdHJhcCB0aGF0Pw0KV2hlbiBvbmUgd2FudHMgdG8gbWFwIHZQ
QVNJRCB0byBwUEFTSUQgYSBwbGF0Zm9ybSBuZWVkcyB0byBiZSBpbnZvbHZlZC4NCldoZW4gdmly
dGlvIHBhc3N0aHJvdWdoIGRldmljZSBpcyBpbiBndWVzdCwgaXQgaGFzIGFsbCBpdHMgUEFTSUQg
YWNjZXNzaWJsZS4NCg0KQWxsIHRoZXNlIGlzIGxhcmdlIGRldmlhdGlvbiBmcm9tIGN1cnJlbnQg
ZGlzY3Vzc2lvbiBvZiB0aGlzIHNlcmllcywgc28gSSB3aWxsIGtlZXAgaXQgc2hvcnQuDQoNCj4g
DQo+ID4gUmVnYXJkbGVzcyBpdCBpcyBub3QgcmVsZXZhbnQgdG8gcGFzc3Rocm91Z2ggbW9kZSBh
cyBQQVNJRCBpcyB5ZXQgYW5vdGhlcg0KPiByZXNvdXJjZS4NCj4gPiBBbmQgZm9yIHNvbWUgY3B1
IGlmIGl0IGlzIHRyYXBwZWQsIGl0IGlzIGdlbmVyaWMgbGF5ZXIsIHRoYXQgZG9lcyBub3QgcmVx
dWlyZSB2aXJ0aW8NCj4gaW52b2x2ZW1lbnQuDQo+ID4gU28gdmlydGlvIGludGVyZmFjZSBhc2tp
bmcgdG8gdHJhcCBzb21ldGhpbmcgYmVjYXVzZSBnZW5lcmljIGZhY2lsaXR5IGhhcyBkb25lDQo+
IGluIG5vdCB0aGUgYXBwcm9hY2guDQo+IA0KPiBUaGlzIG1pc3NlcyB0aGUgcG9pbnQgb2YgUEFT
SUQuIEhvdyB0byB1c2UgUEFTSUQgaXMgdG90YWxseSBkZXZpY2Ugc3BlY2lmaWMuDQpTdXJlLCBh
bmQgaG93IHRvIHZpcnR1YWxpemUgdlBBU0lEL3BQQVNJRCBpcyBwbGF0Zm9ybSBzcGVjaWZpYyBh
cyBzaW5nbGUgUEFTSUQgY2FuIGJlIHVzZWQgYnkgbXVsdGlwbGUgZGV2aWNlcyBhbmQgcHJvY2Vz
cy4NCg0KPiANCj4gPg0KPiA+ID4gPiBDYXBhYmlsaXRpZXMgb2YgIzIgaXMgZ2VuZXJpYyBhY3Jv
c3MgYWxsIHBjaSBkZXZpY2VzLCBzbyBpdCB3aWxsDQo+ID4gPiA+IGJlIGhhbmRsZWQgYnkgdGhl
DQo+ID4gPiBIVi4NCj4gPiA+ID4gQVRTL1BSSSBjYXAgaXMgYWxzbyBnZW5lcmljIG1hbm5lciBo
YW5kbGVkIGJ5IHRoZSBIViBhbmQgUENJIGRldmljZS4NCj4gPiA+DQo+ID4gPiBObywgQVRTL1BS
SSByZXF1aXJlcyB0aGUgY29vcGVyYXRpb24gZnJvbSB0aGUgdklPTU1VLiBZb3UgY2FuIHNpbXBs
eQ0KPiA+ID4gZG8gQVRTL1BSSSBwYXNzdGhyb3VnaCBidXQgd2l0aCBhbiBlbXVsYXRlZCB2SU9N
TVUuDQo+ID4gQW5kIHRoYXQgaXMgbm90IHRoZSByZWFzb24gZm9yIHZpcnRpbyBkZXZpY2UgdG8g
YnVpbGQgdHJhcCtlbXVsYXRpb24gZm9yDQo+IHBhc3N0aHJvdWdoIG1lbWJlciBkZXZpY2VzLg0K
PiANCj4gdklPTU1VIGlzIGVtdWxhdGVkIGJ5IGh5cGVydmlzb3Igd2l0aCBhIFBSSSBxdWV1ZSwg
DQpQUkkgcmVxdWVzdHMgYXJyaXZlIG9uIHRoZSBQRiBmb3IgdGhlIFZGLg0KDQo+IGhvdyBjYW4g
eW91IHBhc3MNCj4gdGhyb3VnaCBhIGhhcmR3YXJlIFBSSSByZXF1ZXN0IHRvIGEgZ3Vlc3QgZGly
ZWN0bHkgd2l0aG91dCB0cmFwcGluZyBpdCB0aGVuPw0KPiBXaGF0J3MgbW9yZSwgUENJRSBhbGxv
d3MgdGhlIFBSSSB0byBiZSBkb25lIGluIGEgdmVuZG9yICh2aXJ0aW8pIHNwZWNpZmljIHdheSwg
c28NCj4geW91IHdhbnQgdG8gYnJlYWsgdGhpcyBydWxlPyBPciB5b3Ugd2FudCB0byBibGFja2xp
c3QgQVRTL1BSSSBmb3IgdmlydGlvPw0KPiANCkkgd2FzIGF3YXJlIG9mIG9ubHkgcGNpLXNpZyB3
YXkgb2YgUFJJLg0KRG8geW91IGhhdmUgYSByZWZlcmVuY2UgdG8gdGhlIEVDTiB0aGF0IGVuYWJs
ZXMgdmVuZG9yIHNwZWNpZmljIHdheSBvZiBQUkk/IEkgd291bGQgbGlrZSB0byByZWFkIGl0Lg0K
VGhpcyB3aWxsIGJlIHZlcnkgZ29vZCB0byBlbGltaW5hdGUgSU9NTVUgUFJJIGxpbWl0YXRpb25z
Lg0KUFJJIHdpbGwgZGlyZWN0bHkgZ28gdG8gdGhlIGd1ZXN0IGRyaXZlciwgYW5kIGd1ZXN0IHdv
dWxkIGludGVyYWN0IHdpdGggSU9NTVUgdG8gc2VydmljZSB0aGUgcGFnaW5nIHJlcXVlc3QgdGhy
b3VnaCBJT01NVSBBUElzLg0KRm9yIFBSSSBpbiB2ZW5kb3Igc3BlY2lmaWMgd2F5IG5lZWRzIGEg
c2VwYXJhdGUgZGlzY3Vzc2lvbi4gSXQgaXMgbm90IHJlbGF0ZWQgdG8gbGl2ZSBtaWdyYXRpb24u
DQo=

