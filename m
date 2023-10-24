Return-Path: <virtio-comment-return-7929-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C38C07545
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 04:50:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6A9582CADD
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 04:50:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 380E598699B
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 04:50:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2003798638A; Tue, 24 Oct 2023 04:50:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 134AF986992
	for <virtio-comment@lists.oasis-open.org>; Tue, 24 Oct 2023 04:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNs4hmtGpX4+7ScQWYvYAW1a2ntf/dTp943nD5xHl/8qZU+WZ+UnuUiQMtbhTaUDeWuk9SbBk1AjzGP2qUZO4NvubjkQI5Xw/xBMt2IZ8Ket3MnjvHne6BBUyawnMeANJgEsfPIUwKlfBd1fBTngNRgf6KSyr6IRslmFaZ0wQ1hMVdpxC2tp/Tj+oZjEgaP7ccYtPeX+oOKBV1/koKs0Eq7dDsoKD6y7UdtOna7jln3mJlMht3UuVhtaSGz/kEsQ1/ls3hd0vcVCBa29WUcppZmtxT5kjQmrHL8eNTPxNpOHfNIL/PqsmPeom3MoyZdRYHSylmE6CUcgZdICN2MWKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17hzFm31dp8lgi+RFjOA0HnwZStE0x0gRhy/c50o1Jk=;
 b=f+iUJ9ZBSqgR6Ny4e26zJVT4omKIr9tDgOhriLtmk1L5D7/fESDjJoxFAbpBJ+JY8y36vh9pyJSnP/oluee9X9rdpHQM4LVXbgdq7iS1hHyJi0PlERavSLYNA5i8L2xYiaRo+doT5NZ4PRCUwZui1u+yPB++69vXe7/DckSDm96UfFUrvhaK7hoe5TFoQ1kVViBzL4H+MW+DMzY5hBc8Rm7LZycK6WC20+YMrCqEZ64mfBXsL6ZcQOhiVzYvmeuEbbKrgFJaZMVlVqmE92p/R3kYF8EfWXL8NhLjTSLa0YYme55wYMLG19FCBG/kXOcNM/c3MssEjlJLfCF2VYYRFw==
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
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCABizrAIAAD2aggAGUBACAAABcUA==
Date: Tue, 24 Oct 2023 04:49:18 +0000
Message-ID:
 <PH0PR12MB54817E76866D0E98863F6C5DDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
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
In-Reply-To:
 <CACGkMEt_aVfMgYQo3uMy-_DXrYDpgkWHtSq_qfr-tXs289pQWg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH0PR12MB8052:EE_
x-ms-office365-filtering-correlation-id: 6c95b30f-e752-4bad-c3d6-08dbd44c9511
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bTZdt7d/XLLbYslTsRw19Y80tIEI4glVr9cjYec2VBOrDnasfSLb6VIRe80d2uc+lxLXo6wSykROf5BcYp9Vbk2w6BQh8kTbhvnzhdaSK9m2XvRS16TKc0QZ9WVV60m97tBbZPsyqci7QRSIUIJDDS5JwjOOJcQkrLzy0QMrqUDwHszq8RtbfyR5PIRmTlaVByjayuiZng8yGJ9k+6RuHIEZiG0VIGjKYQTqvirQxCHKX037a7DwnVGP4ETK8w5B9SbSEkJodQ3qbOf7p+1sxPM9saRYem6u3Tx4Dg3NACCeKtWAE8i7Ig9hy3ko3mKqqI7aLM878Xr6f6Ke7nbqZlNLhlqxqzpXB+cexI6DYG6xCAXI1javI32GOlMuNRcdM+QFWzGrepGM0wPYZbRQHKuy3bn15FLR82jccmV5jeEool2q0xcSKTXAfxB/9Jybo1G1tfpBjBPIPJpwyaZqQQi7vNds+YDvoJFvRDBjt/NqjD0N5wIDDKF1PibDRTG5/H/6jz88EZpoenz62hsHaafwSe3rvIFMkeZaSQHEuWTMSXs0fgVBaiXb1k0Ua6id+AOrG9kLTz68aGLXaM6c4NiaOcJuBJ+kvTYFJoaLDbsZUiQ5ar3fvU1/d0XFn3FQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(9686003)(55016003)(26005)(6506007)(71200400001)(7696005)(2906002)(53546011)(8936002)(41300700001)(52536014)(5660300002)(8676002)(478600001)(4326008)(316002)(66946007)(66556008)(6916009)(54906003)(107886003)(122000001)(64756008)(66446008)(66476007)(76116006)(86362001)(38100700002)(33656002)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RTFnZkFPUGRhYzhuV0wyL2F1dnJiQjJocFk2T2hCQnhObmJsMVFLTUZCRVVz?=
 =?utf-8?B?S0JiaHd0Tk9tbGVlZ2JqVWt0SlZwUGk4blFGOU1uMWUwN00vS215TEg0LzJW?=
 =?utf-8?B?alNDdDJXVFBxUlZGWXJTdUhaWmxTMlpkRVpnc0Mvbk9iakdUK2VBTlN2MUQ4?=
 =?utf-8?B?ODdEZjJvMU40R3lyZnhselZDMnZrSEp1UEFaT21hQmpLWWpGRFFjQmd6ZFFC?=
 =?utf-8?B?ZjNZTUh0YzNFRXpwQTZ6UlpEZzRYYUxLOXJ5eWV5NzFyWUFhYWl4S3dWMGNu?=
 =?utf-8?B?WGNnN3NkYXBXUktBY3d6OEE2dmhSVTA5WDErMGR3Sld6aUNqVmt0Wjl4SEJs?=
 =?utf-8?B?QXpUMnM4UFBjRE5BL1RHNkdqeFlHMlZJQ05wdGt6dmowci9qbE54TFduUUNH?=
 =?utf-8?B?VnpQb0diZ0t6cFFEN1l3cnNZV3pDWmxvdlJKZkQ5YVpGK0FZOFA5djkrWC8y?=
 =?utf-8?B?VG5Wekk3L1RGZUlxbURQc0QrdHVPSGxsUzBxbmk2dHRIRFliYUFTLzE5d0R2?=
 =?utf-8?B?UjZpWTJPa3Z0UFFyS1FlVTRHWmdOVHNHNUFRSmtIbHhvZ0x2Ui9LUVdxTWkr?=
 =?utf-8?B?Mk9qUDFaZG5CK3BGcXgvUkYxTmZOeTUrMVp6VlBEL3JhQUxHOHRQRGFnZkJN?=
 =?utf-8?B?OWJWSnBGZlJEV01lZEQ1dDBzRjJhOU1pYlNOLzVUQXhUOXVKcmdMbmlRdGs1?=
 =?utf-8?B?UW4vWjhoTm9DU0FnUkIvT01KZFpRY2VuVHExWmVBTHBReWtrNml4R2YvK2pN?=
 =?utf-8?B?SHF6UllIclpsQ21CZHA5dkVmU0xIVUFoZmFrWTRSNStRODY3eVBKa2VuVEcv?=
 =?utf-8?B?UGZFOHNFL3dLa1FFUElYQmNhcEFmRWZZaEdRYzdkMXU2NFZWSWx6V2tucDcv?=
 =?utf-8?B?TElQak9QS0x0SnVaRDVHY2E1TitWRDk0UzdRdWxGR3VNQU1TODM4TU5pVnp0?=
 =?utf-8?B?UFl0OVR2aWViVUErTDE1VXNvbmVnTW04a3IvZmVCUFM3Q0NRQlBXQzJscDNC?=
 =?utf-8?B?eUl0V3JUZmVzTEQyV1N1bWVVUWVKZndGVS9mTEJQNzF1YlFrTjBLRXVNNmJX?=
 =?utf-8?B?SHFXSkh6cGtrc0JJYWFjZVp3U0lKcVdrMTkzdmVkRTdEWW5YdzJyN2p2VGhh?=
 =?utf-8?B?U0VOL2wyU2NLYXErOU5EaTBWSUtWRzhNM2FKNFJqMnNnR0lVclhRNzR0akRG?=
 =?utf-8?B?c3JWMjI2UW5XWEluSWM1dGtabGkvWlFhUmFvak5SMStnQ1hFOXRlTGxrSFV2?=
 =?utf-8?B?dzNnQVYzYXplV2l2SENlZnFUZGVRK3JuR2hja21Ba3l1bkVLeUp5N0NkdmQ5?=
 =?utf-8?B?RlV4RHJmOGJIZDhRUEM4bnRXbXd1MERpckY1MUR1dTlqMWRDRDlaQktkNm04?=
 =?utf-8?B?L21yTUJ1U3JsSHVyYlg2aFhHQTR6Nk9NVTZBSU1ITzVRbDlkY2c5VzNIUkdJ?=
 =?utf-8?B?S1htQlFCUW8yWnNvcVExdEp6SWlPQ2toaTlnSTVGRFI0V0NET3JDSy9nWWJ5?=
 =?utf-8?B?ZFFJcmJ5aStDcGJwbUVQYW15WFZQcDU5aGNUenVhU1ZkNFRYc3dwanVPeUFK?=
 =?utf-8?B?WXNxWGJ6RlRCbW9FSFdKVnorbHdzQ0VnZVJvU3VLZ2o4ZEpjSG40c0liV3Q2?=
 =?utf-8?B?ckVjL1U1WDRsTzAzYnFPbjZDSUZRWU1hYnR0MjhwOG9iSEtHc0ZFOFFac25K?=
 =?utf-8?B?WCtEY3VvbWRrc1VxK3JlZGJRM3REQ3ZPSHdmRHVtWjV6WFdiZ3RTQllHYXpT?=
 =?utf-8?B?dDBDVkFUaFZzang4cDcyeDg2ZllkVFJqMnFiOU1UckJnbG95ZWpDb3VDNkhP?=
 =?utf-8?B?aXZ3MWM1N2Q3UEFEekpnVHl0K2xJQ3RGMGtCQndSdEhkMmJZTWRaZS9BZjJW?=
 =?utf-8?B?SVNjSDJzKzRXL0diZlBrYSs1a1ZhdlJvNE1HenRoQ0FzSlJsYnNnZFBta2pV?=
 =?utf-8?B?MnVLVHdFbFgvWndUeFpEL0dPYXViWTNVREpITXh3UXp4RXcyR3lhSDdsU25T?=
 =?utf-8?B?OS9KOHVrY1dzZDZDd3dseFpoUm5WTHpYS3lqSG5BVUVTZ1NtOHdjU05iZk1L?=
 =?utf-8?B?QVdJZjNZYUEwbklZRTNrM2oxZ3ZZQXdRZUY1eURJZEhaMFVpTnpKLysyT01S?=
 =?utf-8?Q?OV88=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c95b30f-e752-4bad-c3d6-08dbd44c9511
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2023 04:49:18.6383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uA0XAqHtcPFptubKSHxYCCpGC2L/pXQFj3liIuvQ84ewqRtoUaVyGDlXzCBPOVdsQlIO1Z/YIw4+53rxfiIxew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8052
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVl
c2RheSwgT2N0b2JlciAyNCwgMjAyMyAxMDoxNiBBTQ0KPiANCj4gT24gTW9uLCBPY3QgMjMsIDIw
MjMgYXQgMTI6NDLigK9QTSBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+IHdyb3RlOg0K
PiA+DQo+ID4NCj4gPg0KPiA+ID4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNv
bT4NCj4gPiA+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAyMywgMjAyMyA5OjE1IEFNDQo+ID4gPg0K
PiA+ID4gT24gVGh1LCBPY3QgMTksIDIwMjMgYXQgMTozMuKAr1BNIFBhcmF2IFBhbmRpdCA8cGFy
YXZAbnZpZGlhLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+
ID4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmcNCj4gPiA+ID4gPiA8
dmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtIG9wZW4ub3JnPiBPbiBCZWhhbGYgT2YgSmFzb24g
V2FuZw0KPiA+ID4gPiA+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDE5LCAyMDIzIDEwOjE1IEFN
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gQWdhaW4sIGlmIHlvdSBkb24ndCB3YW50IHRvIHRh
bGsgYWJvdXQgdHJhbnNwb3J0IHZpcnRxdWV1ZSwNCj4gPiA+ID4gPiA+ID4gdGhhdCdzIGZpbmUu
IEJ1dCBsZXQncyBsZWF2ZSB0aGUgc2NhbGFiaWxpdHkgaXNzdWUgYXNpZGUgYXMgd2VsbC4NCj4g
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFJlZ2lzdGVycyBhcmUgcmVsYXRlZCBmb3IgZnVuY3Rp
b25hbGl0eSBhbmQgc2NhbGUuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gTGV0cyBmaXJzdCBh
Z3JlZSBvbiB1c2UgY2FzZSBiZWZvcmUgdGhlIGRlc2lnbiwgdGhhdCBJIGFza2VkIGFib3ZlLg0K
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEkgd2lsbCB3YWl0IHRvIHJlc3BvbmQgdG8gYW55IG90
aGVyIGVtYWlscyB1bnRpbCB3ZSBhZ3JlZSBvbg0KPiA+ID4gPiA+ID4gdXNlIGNhc2UNCj4gPiA+
ID4gPiByZXF1aXJlbWVudHMuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGVyZSBhcmUgbW9yZSB0
aGFuIGp1c3QgbWUgd2hvIHdhbnQgeW91IHRvIGRlZmluZSAicGFzc3Rocm91Z2giDQo+ID4gPiA+
ID4gZmlyc3Qgd2hlcmUgeW91IHJlZnVzZSB0byByZXNwb25kLg0KPiA+ID4gPiA+DQo+ID4gPiA+
IFRvdGFsbHkgZGlzYWdyZWUuDQo+ID4gPiA+IEluIHRoZSBwcmV2aW91cyBlbWFpbCBpdHNlbGYs
IEkgd3JvdGUgd2hhdCBwYXNzdGhyb3VnaCBpcy4NCj4gPiA+ID4gU28gbGV0J3MgdHJ5IHlldCBv
bmUgbW9yZSB0aW1lLg0KPiA+ID4gPiBFaXRoZXIgeW91IGNhbiByZS1yZWFkIGxhc3QgZW1haWwg
b3IgZm9yIGJldHRlciByZWFkIGJlbG93IGFuZCBzZWUNCj4gPiA+ID4gaWYgaXQgaXMNCj4gPiA+
IHVuZGVyc3Rvb2Qgb3Igbm90Lg0KPiA+ID4gPg0KPiA+ID4gPiA+IEhvdyBjb3VsZCB3ZSBtYWtl
IGFueSBhZ3JlZW1lbnQgd2l0aG91dCBhbiBhY2N1cmF0ZSB0aGUNCj4gPiA+ID4gPiBkZWZpbml0
aW9uIG9mICJwYXNzdGhyb3VnaCIgd2hvIGlzIGEga2V5IHRvIHVuZGVyc3RhbmQgZWFjaCBvdGhl
cj8NCj4gPiA+ID4NCj4gPiA+ID4gSSByZXBsaWVkIGZldyB0aW1lcyBpbiBwYXN0IGVtYWlscyBi
dXQgc2luY2UgdGhvc2UgZW1haWwgdGhyZWFkcw0KPiA+ID4gPiBhcmUgc28gbG9uZywgaXQgaXMN
Cj4gPiA+IGVhc3kgdG8gbWlzcyBvdXQuDQo+ID4gPiA+DQo+ID4gPiA+IFBhc3N0aHJvdWdoIGRl
ZmluaXRpb246DQo+ID4gPiA+IGEuIHZpcnRpbyBtZW1iZXIgZGV2aWNlIG1hcHBlZCB0byB0aGUg
Z3Vlc3Qgdm0NCj4gPiA+DQo+ID4gPiBJIHJlYWxseSB0aGluayB3ZSBuZWVkIHRvIGJlIGFjY3Vy
YXRlIGhlcmUuIEZvciBleGFtcGxlLCB3aGF0IGRvZXMNCj4gPiA+ICJtYXAiIG1lYW4gaGVyZT8N
Cj4gPiA+DQo+ID4gTm90IHRyYXBwZWQgYnkgaHlwZXJ2aXNvciBpcyBiZXR0ZXIgd29yZGluZyB0
aGFuIG1hcHBlZC4NCj4gPg0KPiA+ID4gPiBiLiBvbmx5IHBjaSBjb25maWcgc3BhY2UgYW5kIG1z
aXggb2YgYSBtZW1iZXIgZGV2aWNlIGlzDQo+ID4gPiA+IGludGVyY2VwdGVkIGJ5DQo+ID4gPiBo
eXBlcnZpc29yLg0KPiA+ID4NCj4gPiA+IFdoYXQncyB0aGUgY3JpdGVyaWEgZm9yIGNob29zaW5n
IGEgY2FwL2JhciB0byBiZSB0cmFwcGVkIG9yIG5vdD8gRm9yDQo+ID4gPiBleGFtcGxlLCB0aGVy
ZSdyZSBhIGxvdCBvZiBvdGhlciB0aGluZ3MgdGhhdCBuZWVkIHRvIGJlIHZpcnR1YWxpemVkIGJl
c2lkZXMNCj4gTVNJLVggZm9yIHN1cmUuDQo+ID4gPg0KPiA+IEZvciBwYXNzdGhyb3VnaCwgd2hp
Y2ggYXJlIHRob3NlPw0KPiANCj4gSSBoYXZlbid0IGdvbmUgdGhyb3VnaCBhbGwgdGhlIGNhcHMg
YnV0IHRoaXMgaXMgd2hhdCBpbiBteSBtaW5kDQo+IA0KPiAxKSB2SU9NTVUgcmVsYXRlZCBzdHVm
ZnM6IEFUUy9QUkksIGFzc2lnbiBQQVNJRCB0byBhIHZpcnRxdWV1ZSBpbiB0aGUgZnV0dXJlDQo+
IDIpIGNhcGFiaWxpdHkgcmVsYXRlZCB0byByZXNvdXJjZXM6IGxpa2UgUmVzaXphYmxlIEJBUiBl
dGMNCkZvciBwYXNzdGhyb3VnaCBQQVNJRCBhc3NpZ25tZW50IHZxIGlzIG5vdCBuZWVkZWQuDQpJ
ZiBhdCBhbGwgaXQgaXMgZG9uZSwgaXQgd2lsbCBiZSBkb25lIGZyb20gdGhlIGd1ZXN0IGJ5IHRo
ZSBkcml2ZXIgdXNpbmcgdmlydGlvIGludGVyZmFjZS4NCkNhcGFiaWxpdGllcyBvZiAjMiBpcyBn
ZW5lcmljIGFjcm9zcyBhbGwgcGNpIGRldmljZXMsIHNvIGl0IHdpbGwgYmUgaGFuZGxlZCBieSB0
aGUgSFYuDQpBVFMvUFJJIGNhcCBpcyBhbHNvIGdlbmVyaWMgbWFubmVyIGhhbmRsZWQgYnkgdGhl
IEhWIGFuZCBQQ0kgZGV2aWNlLg0KDQo=

