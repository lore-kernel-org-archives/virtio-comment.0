Return-Path: <virtio-comment-return-8467-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B31C197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:50:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 516EF7786F
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:50:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1B83D986E30
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:50:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EF202986E21; Fri, 17 Nov 2023 12:50:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7E430986E22
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 12:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1vWS+5BIfxSiiuxpTNu0Xz4CEhAIcvc2AKVNr4psUDThlRzL+f/KPDITX+J770r/wUfJEbHtKlWl1SYq8EyJn0wM0Lp/41gS7faOeHQECWYHKe+cfB4cx332oDZeeJ9EFkoE2zQlgm7yPyL1CrTRqH5RovlaIC9nsJfHQndy4Yv2p0zYsaUKw9Jj4QnccTF45ERiF4yPxlUfiHhrheLOMw2AHaeWv+nU/R4A1bn2Z2Qq6zEY29xLCw2VgWziKVEHc35rFPesOIisIDJs4u6KdRn1QkW9XUOyn7s0U+R+I0UfT+fPILxQY0YROhdzuuAL/X9GDazcvmdM/F+kOBBIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJgtZOlXOdHPwfEX1NmsO2BHgsEgsgOvOYWHb9111LI=;
 b=dceRjGkZyLKIffkOJWImN7YoZ0x4dyYp/Gq+XIE+g3W1A3h1yXx1azR7GJSUdN96R92CjHJjfd46/VhGVvTR1Yf1rDs5lbZtl34XtWrhjeUoz6NZFz5WxWMVfkbkt2UZEXoBmXb7c3untIQJBrCwbXMJTwUpvsRGT5MaFV2CaBZEOlNdhVQgSWqAXOyA/eVe4f234XsDqRQHxiG+o4gc/3yuqOhyX71pFd7bylEeALsUkAVZv3b+vgkSdhZ3aH0Z9ZZW+dWeit8id2WAlFQAYsDLCar5WyIv7APVPhrXvE7V1gQgsurLbV867hV2fwB5nDxev+eqtQA/xUNOSSikMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands
Thread-Index:
 AQHaEfwUGl0o9tnLPEOcv64rj4RwurBwFAEAgAFCeICAAEregIAF/oGAgAPhNHCAAtkIAIAAAl/AgAAPhQCAAACmgIAAB8mAgAAD0iCAAAlyAIAAAp7g
Date: Fri, 17 Nov 2023 12:49:36 +0000
Message-ID:
 <PH0PR12MB5481473DCF72D2CB13AC61C6DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org>
 <CACGkMEuSpZ0Y8kxXv26b38pvX--OCdvWm5KvMniqo=W10ruBTA@mail.gmail.com>
 <PH0PR12MB5481170EBDD5A8EBFF6C84C7DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117050838-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481101F980800BDAB4EB24CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117061122-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819ACE638B70505B131B28DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117064344-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481BEBAA57399B3A9CF2795DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073250-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117073250-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY5PR12MB6060:EE_
x-ms-office365-filtering-correlation-id: bbcf96ee-d3c5-4e0b-af45-08dbe76ba7b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 47+7/mG/IDPuc6xjtJqB9vrZ/yP+BZcL0HYUh89gIymu7TitnyvLd61Oxt3Khlpvdwk6rex8A89xnHaOein44JGrh/VSCUnHEL1SqLLWcKjSXcLmhYz1yTkW7xhMIQxd/V/fZvPFJKlKkHvnJOVfwk3ev6YlwY0Fz7eYvLVMR2cyYlu//uKjA3bp//wIlZDDZBWnpMpkX8bii8/N6JRsmQub67lcIY+rrqf0Ptft0roCQVDqZ5MfwgEbxZ/g/cmfpPkrsiODXiB0KocY7Emv1RGG3GD5RmfQYT5LUScOlRwGohALRY9qUfGKayXHtb9DhhHXRB+43+mluBnu8PaaJnV/xEWpURJFTU1WuhhcBM5U9YjRCxQY8XZI/ZAS9n+t7wjKsbNR9DRa44BEfUmW5o5ksPOTjGmHl6cq9AMhgVQKCmroZPX84AOs7GmWEVom+1pBX30fKUJ4izvMFMAXtXVRBqfj8P+juR7hHbS9jQiRlIvq3iMQglNPPN92fGUT4DcN1qyzU6ckXTGPaJEDxvLdFw/hs6uPVbNMXKI2CnmklTZk7yh5oEKhdRrpkvLNL17b6zPp5iAF6nAEPDizO3nM/rpQ007ostXIXgb/SO4wxMK7H1lb46wR+oInlhmt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(86362001)(33656002)(122000001)(38070700009)(2906002)(478600001)(71200400001)(6506007)(5660300002)(7696005)(83380400001)(55016003)(55236004)(53546011)(9686003)(41300700001)(26005)(52536014)(8936002)(8676002)(4326008)(76116006)(6916009)(54906003)(316002)(66946007)(66476007)(66446008)(66556008)(64756008)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VEdjTWo0aGRNL2gwOG96TXEzS1lJMEFYU3JnTDliMVhpZG1DWG1FWTgreVZy?=
 =?utf-8?B?aHBCenhFLzdVWjZRVTJmVXVIMGZlN2dlckt6QTA2NmdtdlNkMkZWNVdvV1ZT?=
 =?utf-8?B?LzJKR2lqVVZhMC92V2lCZXRvanpESFU2TTFobU16eWtRU0NBbkg3ZkJUc3h4?=
 =?utf-8?B?YkNBbUdRVlBTT09mUzZqdUlHUFl5ZStod3JHKzE2U3hoYUhQOVBtbVUyYWhs?=
 =?utf-8?B?SGlnVi9pbXQ2Mjcra002L3A5S1VDSm54Mi8zSkticnF6bnlSZE16d3Vyem9v?=
 =?utf-8?B?NTUrdG9iZU5uL0Z5KzBvUUxKZ1QvaUZsNXJpeUVveWxLczRXQys1czA5STl5?=
 =?utf-8?B?dTVaWHFuSVlveCtVMnVRZ0pYMDVzVGV4b2YvVlByaVZOUnFob3lwejlsaG14?=
 =?utf-8?B?bG94N3ZDcUtoZUpYcmtxM3JDVkl1VThoUnJvNFIvZUljWlZPemV4VHFtUXFh?=
 =?utf-8?B?bU9oeUY4bUg3ZEUzdWdKQ2FXeVJpOTBlMDFJMzVZaEFqMGtORmtORjF2RWlr?=
 =?utf-8?B?eWlXekdJMGhtV3A2ZnZ2M25SUEJSZVNmdHMrNHZYTk9FMzdXaDhtNS9uZkwv?=
 =?utf-8?B?YWxqeWZ3Vyt2WjdZOUg1T3FNc21LR2FrRC9ROGJJSE1vcEdjMFY2aGtNUDU5?=
 =?utf-8?B?M2dOaHFNSFVuV0lRdlFENmdaOGFrRFFXOVIzS0s3TjJjU0QvZm1TTExXc3d4?=
 =?utf-8?B?SXBTaXFKd0NkVjZMbVh5bXZaTmFSdVNDUUJxN2lQbXBnSXdLa085VWtEZ3ox?=
 =?utf-8?B?cEV4RmpZdytLT3g0YkJDVDlyQUFMRzk4dFZWZlRiRW5hZDloUkdpYktHZDhF?=
 =?utf-8?B?OVh1eWV6aW1vN0FGMENTRU1PRHZLQ0M3WE1UZE5yTzRkNU1YdEZaZHVTNXlh?=
 =?utf-8?B?MDVrL1J1M1FtOWNOVVg1TzlSQ0tlaEZNRDVVKzUxbmhxYWx6VlZabi9kSVd6?=
 =?utf-8?B?Zk5CVHZyUjIrNlBFdFExb0JCa3FVbjNMVC84VFRXMllveEwyUlhxd000L01F?=
 =?utf-8?B?Tzg4TU1lK2QyZDNWVGpCeHFaTDVaVUJCQnBpelJqTXVnWitZamFzbVFCa1Qw?=
 =?utf-8?B?OU4vbGVzU1JzaWxHTTN5WXZ6UWlCWGVjMXhjWjZCSXFYVGVVSmhFTG1PSGpa?=
 =?utf-8?B?SGtub04rbGpDOWNOQ0lYZ1FsbHc4Nk5IeTBvMWV5b0cvYXVBU214QU14VzE5?=
 =?utf-8?B?cXYrVVJLb2pvdHVyRW9BbEgrNFhKVEtwbU5MSlFydHNka2V4UUNUd1lDWjc0?=
 =?utf-8?B?eDJrWVhRZkNEelRJSU1oN3NzTWpZaEdXQkN4YUN4U2o1YXBUYnk4QnJOdi9p?=
 =?utf-8?B?WE5lb0NIK3pGUmkvUXB6MmJ0dWJmZ2RuSjFMaDliQmpmL1BOWEtPdjN1TTZZ?=
 =?utf-8?B?enhLaURvZzBRSDV1dzNTeWJXRmhkTHMxQ0tscXJGeXNTZVE5VGNCbWt0djNY?=
 =?utf-8?B?QWs2MmJoL2l5Y1prMjlwckNzYmRZSDJwMHNmdkhpMkFrN056azdpbTVRc1Br?=
 =?utf-8?B?cWxLUkwrcjdMSWlDNHVlcWRscE02OVhvSlY3V1dJcmk4SElVdjlQMkk2N0c1?=
 =?utf-8?B?TFAxWWl2cG1DY2plTVhIYnRsL3VxaXlmU3dJOWllenVrME8zcDFuck5BSXh6?=
 =?utf-8?B?U09RTythK1h6QnM1d0tyL2NBK1M2WXBBT3hDaEZrSllsR2pUTk9mQXZFYkc5?=
 =?utf-8?B?TkZTTFpkc09NNWdXb05RZFpmVWY1OGl2M2htTUo0ZFpVbjZCRFRBSkhha3Y3?=
 =?utf-8?B?TUhadVJkQi93VzU2bEFNOWY5Y25aMG9Hc21mVWlIZ21VaUd2Ris3ZzNBYTFj?=
 =?utf-8?B?Mkg5WXUxN3ZlQ2pPRWpqUm8rc0ZHMXJRZmtXSngwT2QzRUNPWGEvbGUxSnhJ?=
 =?utf-8?B?VXpEMjdxM0svMmpFa0ZYR0ZsQnFVMTJWbjZkbVRGUlhMSGpKbVVUcnN3SXBp?=
 =?utf-8?B?MlFSZThkazB1ZFhXeDQxSXpUMExMaDlJNEFXNWgzNkFUdVYxWER6MWFSSnUy?=
 =?utf-8?B?aHdSQnBVRGJsbTR2L09PajF2OXpyQm1ORVJtYkhRejd4eHlXcm9sRW9PdzF3?=
 =?utf-8?B?dkgxdGlMNExKRFVTMzY5dkZhaWJiRTh0SU1RYWtKdU1NZm0vMmp4U3QvSlBJ?=
 =?utf-8?Q?0Lwg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbcf96ee-d3c5-4e0b-af45-08dbe76ba7b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 12:49:36.3748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YGMNyrfWu2ibXwcNY3J3rF34jzdQPHwjsl5FXniGfcVKayZb3bve8a3VP620WdEyuSDKosaa1N0rQ9mptmdDQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6060
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

DQoNCj4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gU2VudDog
RnJpZGF5LCBOb3ZlbWJlciAxNywgMjAyMyA2OjA3IFBNDQo+IFRvOiBQYXJhdiBQYW5kaXQgPHBh
cmF2QG52aWRpYS5jb20+DQo+IA0KPiBPbiBGcmksIE5vdiAxNywgMjAyMyBhdCAxMjoxNTo1NFBN
ICswMDAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4gSGkgQWxleCwgSmFzb24sDQo+ID4NCj4g
PiA+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+ID4gPiBTZW50
OiBGcmlkYXksIE5vdmVtYmVyIDE3LCAyMDIzIDU6MjAgUE0NCj4gPiA+IFRvOiBQYXJhdiBQYW5k
aXQgPHBhcmF2QG52aWRpYS5jb20+DQo+ID4NCj4gPiA+ID4gPiBBbGxvY2F0aW5nIHJlc291cmNl
cyBvbiBvdXRnb2luZyBtaWdyYXRpb24gaXMgYSB2ZXJ5IGJhZCBpZGVhLg0KPiA+ID4gPiA+IEl0
IGlzIGNvbW1vbiB0byBtaWdyYXRlIHByY2lzZWx5IGJlY2F1c2UgeW91IGFyZSBvdXQgb2YgcmVz
b3VyY2VzLg0KPiA+ID4gPiA+IEluY29taW5nIGlzIGEgZGlmZmVyZW50IHN0b3J5LCBsZXNzIG9m
IGEgcHJvYmxlbS4NCj4gPiA+ID4gPg0KPiA+ID4gPiBUaGUgcmVzb3VyY2UgYWxsb2NhdGVkIG1h
eSBub3QgYmUgb24gc2FtZSBzeXN0ZW0uDQo+ID4gPiA+IEFsc28gdGhlIHJlc291cmNlIGFsbG9j
YXRlZCB3aGlsZSB0aGUgVk0gaXMgcnVubmluZywgc28gSSBkb27igJl0IHNlZSBhDQo+IHByb2Js
ZW0uDQo+ID4gPg0KPiA+ID4gPiBBZGRpdGlvbmFsbHksIHRoaXMgaXMgbm90IHdoYXQgdGhlIExp
bnV4IGtlcm5lbCBtYWludGFpbmVycyBvZg0KPiA+ID4gPiBpb21tdSBzdWJzeXN0ZW0NCj4gPiA+
IHRvbGQgdXMgZWl0aGVyLg0KPiA+ID4gPiBMZXQgbWUga25vdyBpZiB5b3UgY2hlY2sgd2l0aCBB
bGV4IFcgYW5kIEphc29uIHdobyBidWlsZCB0aGlzIGludGVyZmFjZS4NCj4gPiA+DQo+ID4gPiBW
RklPIGd1eXMgaGF2ZSB0aGVpciBvd24gaWRlYXMsIGlmIHRoZXkgd2FudCB0byB0YWxrIHRvIHZp
cnRpbyBndXlzDQo+ID4gPiB0aGV5IGNhbiBjb21lIGhlcmUgYW5kIGRvIHRoYXQuDQo+ID4NCj4g
PiBTaW5jZSBvbmUgb2YgdGhlIHVzZSBjYXNlcyB3b3VsZCBoYXZlIGFjY2VwdGVkIHRvIGxldCBk
aXJ0eSB0cmFja2luZyB0byBmYWlsLCBJDQo+IGRvbnQgc2VlIGEgcHJvYmxlbS4NCj4gPiBUaGlz
IGlzIG5vdCB0aGUgb25seSBjb21tYW5kIG9uIHNvdXJjZSB0aGF0IGZhaWxzLg0KPiA+IFNvIEkg
YW50aWNpcGF0ZSB0aGF0IFFFTVUgYW5kIGxpYnZpcnQgb3IgYW55IHZmaW8gdXNlciB3b3VsZCBi
dWlsZCB0aGUNCj4gb3JjaGVzdHJhdGlvbiBhcm91bmQgdGhlIHBvc3NpYmxlIGZhaWx1cmUgYmVj
YXVzZSB0aGUgVUFQSSBpcyB3ZWxsIGRlZmluZWQuDQo+ID4NCj4gPiBXaGVuIHRoZXJlIGlzIGh5
cGVydmlzb3IsIHRoYXQgbXVzdCBoYXZlIHplcm8gZmFpbHVyZXMgb24gc3JjIHNpZGUsIHN1Y2gg
a2VybmVsDQo+ICsgZGV2aWNlIGNhbiBidWlsZCBldmVyeXRoaW5nIHJlc2VydmVkIHVwZnJvbnQu
DQo+ID4NCj4gPiBEbyB5b3Ugc2F5LCBRRU1VIGhhcyB6ZXJvIG1lbW9yeSBhbGxvY2F0aW9ucyBv
biBzb3VyY2Ugc2lkZSBmb3IgbWlncmF0aW9uPw0KPiA+IFRoYXQgd291bGQgYmUgaW50ZXJlc3Rp
bmcgdG8ga25vdy4NCj4gDQo+IE1vcmUgb3IgbGVzcyB5ZXMuIE1vcmUgcHJlY2lzZWx5IHdoaWxl
IGluIHRoZW9yeSBhbGxvY2F0aW9ucyBpdCdzIGRvaW5nIGNhbiBmYWlsIGluDQo+IHByYWN0aWNl
IGl0IGhhcHBlbnMgcmFyZWx5IGVub3VnaCB0aGF0IFFFTVUgZG9lcyBub3QgZXZlbiBib3RoZXIg
Y2hlY2tpbmcNCj4gYW5kIHdpbGwgaW1tZWRpYXRlbHkgY3Jhc2ggaWYgdGhleSBkby4gVGhlIHJl
YXNvbiBpcyB0aGF0IGl0J3MgdXNpbmcgdmlydHVhbA0KPiBtZW1vcnksIHNvIGl0IHNjYWxlcyB0
byBhIGh1Z2UgbnVtYmVyIG9mIFZNcy4NCj4gTWlncmF0aW5nIGEgc2luZ2xlIFZNIGF0IGEgdGlt
ZSBpcyBub3QgZXZlbiB3b3J0aCBkaXNjdXNzaW5nLg0KDQpXb3cgdGhhdCBpcyBldmVuIG11Y2gg
d29yc2UgdG8gY3Jhc2ggdGhlIHJ1bm5pbmcgVk0sIGluc3RlYWQgb2YgZmFpbGluZyB0aGUgbWln
cmF0aW9uLg0KSSBoYXZlIGxpdmUgbWlncmF0ZWQgVk1zIG9uZSBieSBvbmUgYW5kIGhhdmUgc2Vl
biBjdXN0b21lcnMgbWlncmF0ZSBvbiBoeXBlcmNvbnZlcmdlZCBzeXN0ZW1zLiBPZmNvdXJzZSBp
dCB3YXMgbm90IFFFTVUuDQpTaW5nbGUgVk0gbWlncmF0aW9uIGlzIHJlYWwgYW5kIHVzZWQgYnkg
Y2xvdWQgb3BlcmF0b3JzLg0KV2h5IHdvdWxkIHlvdSBpZ25vcmUgaXQ/DQo=

