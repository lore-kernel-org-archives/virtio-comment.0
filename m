Return-Path: <virtio-comment-return-8499-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD45C61D90
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 16:26:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CC2853309A
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 16:26:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C801C98689C
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 16:26:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BC4FE98688A; Tue, 21 Nov 2023 16:26:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE9C698688B
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 16:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVk2Q6gJBlJfVvVlXnePJrrs8aErYeDwGey9h0fkRFqST0VaxNTAD7izbsUbl0cuWKLk3NJ/XLjgkGdV5mSQM7eK5vXxRUjOYpTB+5A+7eo2gINefffB8p9glyPkbWNKUhZaZJI9PrBDJTtl3aExgTdHoOr5e7fIebUilQrDKRBfkez7lz87qNH3YPA1tuktfoAoBftRpboOakQ26d+IaCbdBkqxhzrIiAO3qBLoJkB+rFAlQch49OnVLAFa+COR2iHEjAuxEjJ4MZjDcgjAanhV8lxgQw4Pcnfe0+iCTJdSHTqkmqSIADj6xphI9Tf89fPJJhthRSYVm1jtM3AkOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DG9UFBmib2jy44X9fFn6gbNsfgHBHsIoeDIJkaS9K5k=;
 b=lGpoxfiKTaRw3vGT8z8jb3X5yrlW69/GWI6PyFkyC9h+HBiWBngPmweRl66c+y1CzaNvu9VSlSAqjvfNzZSnxH7Ew+Ds5ZIBj7Ep6RtL9dEfbZQqthgThAXEnfMv9aizhXyOvkgpgU0ubgM1srWXyrX+mQkBjTeW7ZK2Mnf5FByUoO0nXGvxFlgMwEGOksba4U1mx4uT37IhKsmHOWfC1BzKkpsl/iPzEw4/1zgnG9DhSRg5S6VdvxbJbr0I2ndDjt9YJxSSJZVaaSlpdEeQMHYmTKfEOglB2lazweRTWYRTV5x6XgtCBhvsedV5osBcxxn/QEByiNWOQOHq7RKDFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com"
	<sburla@marvell.com>, Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb
	<maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/CAAEWagIAATXNQgAAQ3wCAAAB/YIAADsiAgACQwGCABmFpAIAAsomw
Date: Tue, 21 Nov 2023 16:26:05 +0000
Message-ID:
 <PH0PR12MB5481D5A3FF96B355348A7F2ADCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116064611-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvWK65GY_U4MMa6=43wqnM8T4-ALK07d7zEHp8Aa36wGg@mail.gmail.com>
In-Reply-To:
 <CACGkMEvWK65GY_U4MMa6=43wqnM8T4-ALK07d7zEHp8Aa36wGg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL3PR12MB6426:EE_
x-ms-office365-filtering-correlation-id: 8f2877ea-c5f8-46d1-9ffc-08dbeaae8f9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zYf3TiV8nzMPAp8JuOzw8xOoAkpD3sTFCc4kXRznwV+8NFsW5nh1R+0DZkTI9xnb6R+HwvyqRRpNyCzTDDOHuYqiOlPUxHQ2/NAWb8mAm6CpMmW9SzsBj6b3G+zESm207CtxQLMhMLVplnIab9A9UazMvGIBltqszzE0crMClKUiUrIOxiMpI39mHyTL9N4zzdPWO66jokccLg02QV+5LCeEefup7fh2AC5NM2hI3fA8zHbS/il/2ywNgX4wrR5owgwi7Ri/HrUIUbgEGlY3iwySUOyFFsyRF+JMPYhebQL0vObA6xLapoNHzGQ5EyruLE3JTZfI+f5br1C3pAHH3Uhvu2PEA6geU4GE92OdaLCLQLEJbZiWtDqhD7ItFEYsm6yJyR9Jikv4LAWdSn4SevKZgnmc0wjt24iYonYx8pCcJfoYln3A9RiuE8WkZWYZ/haTpxMj4ZEb/PGLoXRj4NYqPbgnP1Mhhq2zfnwOlvOdn3xAIsJ9R3wrv70XSfQ3VHQK17xqHedOFjTflK7qpcSOBAZeuaWE4lUdv+P049fQ21cqaHEfOuMmSyTc9hrRHYI14C3/FlJbLB2x9GBmxpIbeuI3i0fMJ4L2dGZG1prvkkpbS5I4oRc9+Z+qnDjo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38070700009)(86362001)(55016003)(7696005)(6506007)(76116006)(66556008)(66446008)(6916009)(66946007)(54906003)(71200400001)(66476007)(64756008)(316002)(33656002)(122000001)(53546011)(26005)(9686003)(83380400001)(2906002)(478600001)(41300700001)(5660300002)(52536014)(8936002)(38100700002)(4326008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnpFRDJqcnhUb3c1NUtkUEwyK1VvYmlPQXJxQkhPY1pmMFJxQm5sbHJSWmVU?=
 =?utf-8?B?bGpwTzJNL1kyNnNqZ25RcENHSDVQTWR2c091N0kvQzRXdWNPMkdqc2hSbFBn?=
 =?utf-8?B?cW5idlQ4TEcrS1NGaXlKbUhqb3V3Njk5ZnMxanJLdXd4UU5LNEJuYWFocHBr?=
 =?utf-8?B?ZVhuL1BiNFlHZmdpZ0FkU2lEdHRxYkRaaGRJUFcrS1JyZThmTjVEbDZtZ0Jz?=
 =?utf-8?B?djlzd283bXVQdTF4c3lHajhiNGo0OWtXZjV4d1JwdW8vcTAyQ1R0aHRIY2tJ?=
 =?utf-8?B?RXhRcGs0aDNZcTU4MGdUU0dDY2dlVk1DODZRYjdEY3IxUmh2OFVoZHBtWklO?=
 =?utf-8?B?MFFjKzA0UG9DbWwxS1V5ZVBEbThaS3JrbG5ualBFTVp4VzU4VGRIOUhQWm0z?=
 =?utf-8?B?bjF2cWZIYTg1YUJ4aWZuTmVJZStzZnRTUkNGRWluMjhPbnExMko2czZXNkFB?=
 =?utf-8?B?ZFJUVlBnc2tvZHpqTHRDeU0zSmVpLzE5VFdON3JNRkFrWVVMbEc0NWtXam13?=
 =?utf-8?B?Y1pMS3h1SUdTenpiRGZqVEN0VCtBbXpheThIN1ZlMXdnTUU5NTRhS0lyWmpG?=
 =?utf-8?B?RUtwRE5FUXViMEhteGtlNTROTkhzbEFKcjJUenVIZGpNR0RMNDF5WWVRcWZD?=
 =?utf-8?B?R0s5YUY4WnFKYWJMV1Jvem5sRmZzSHRYamVUNHdWbmk2Qk51aUNnRGdhZ2RP?=
 =?utf-8?B?ck5PdU4vLzhHbDRrSjg5YWVXWDdUUkhZY05zTk5TczBHcW9hK3ZyZnpWMGUz?=
 =?utf-8?B?UnpiUklxYTd2c1JwK1NqMjFaUVB4QWJYRnV2dWVDYkNFNENZMkVwY0lFTFR6?=
 =?utf-8?B?V28xSFdKbnVUY2dZSCtOT3B4eW5TOVNZMm5raTVnakNmdXJoWWU2b29CcVYx?=
 =?utf-8?B?MmFDRTlMMzBSZWpZeXZvWXgrOGFYOVZzekd5WXRTOGRjTldmdnBhbmdGUXpJ?=
 =?utf-8?B?Sm9pUkdwVllZdVQyNUUwNlg1SkhsbnlNNHZNbElYUXV2VW5Vb0V1d2p6d3hr?=
 =?utf-8?B?MmNKdWZ6Y1BGcHlkTkpERk8vbUJFcHp4WE45a0QzVHJqekY1b2NlN2tvQ1Y3?=
 =?utf-8?B?dkNSeUlRV05TeVlYTEVoaWlWQi8zMndudnJrTDBRRXhRNHpYVzVXV0U5SkFN?=
 =?utf-8?B?OHRoc2hvR3hwSHI1K0JieWRPc0JQU0dYV09XNy9pa0hqNlkraDNBUVhXcG1R?=
 =?utf-8?B?T3lOamU5NjFUdGxFNGtyd3k2b3V2bmlrVWFzdXJ2ejNTb0tsUkRuY2haL05T?=
 =?utf-8?B?cCt2eVZzekMvZkFZVmNsWXRONmZKMFZBSFU5VHpzVkN6TlNwLzFoaHdYNkwr?=
 =?utf-8?B?YXE3N0dSTkxTTUZOcjhoQXZJZkY4b3pFRG1yU21XRDhNWDVGL3dMYnh6Rk8r?=
 =?utf-8?B?WkZtbDVpbHV4Vkl6eXdEd0xiSEZ5eXk1NXIrSkFReEFZeDQvRjhLQWxVZnZs?=
 =?utf-8?B?RGx4QkZ2SmdmcnRlOEtWRWwrNkZWbHpwNTBlT2lUWitMM0lKR1NWMGdvb0hP?=
 =?utf-8?B?eWhDWEJCOWphbGxZa2tvZUVrQ0NyWTZ2TUduSENVY1RSUVEzSkpMaHIzQXV3?=
 =?utf-8?B?MTJJM3hDeXo1RngyQS9YKytEOHFYM3hUajhiTXR4ZGc5WkRZM0FUZnpGZjdr?=
 =?utf-8?B?YTgzeVk3Vkgvd1ZXSXIwODM1SzgwMDNEck52YUdkaHJNSmZ6WlFFT1VmMFJy?=
 =?utf-8?B?VjN0RkhKM1duQjM5aUZJc3VFejVFUDUycUl2Y3lpQ2RzY2RFbXhsckJxc3Ju?=
 =?utf-8?B?amNVZzZyaFovWnZnbk9XRCt1cWVqM3ovb1BvbUI5b2lGT0FOVjVRSjJoTXJ1?=
 =?utf-8?B?bVY2M3J2bllud1lpNWQwMVMvMEVJYU12VStjRDBJWFIvazNrNmFmQmgvTEhX?=
 =?utf-8?B?UkFqU09NdUNaRk1WTkttWGxoTFR1b2pYRjRnRFZmZXRjYitad05BaDdtMm5w?=
 =?utf-8?B?RC9HYng2Ui9WNlgvTkVnWDVPdFVObEtaT3VoZU4yZFFjY1ZqRGF1YjJSOE8x?=
 =?utf-8?B?YWpDbnVJSVlXdy9wQlpmZTVQWVB5NzUrMHRwMkNjWm14T2hYQm9mNmU5aFI5?=
 =?utf-8?B?dUNpK2hMdHoyN0ZtOXJsTGRwa0xWaXBiOHVvNjh1czA3R3NIZG1hWkEvVnFZ?=
 =?utf-8?Q?jsoU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2877ea-c5f8-46d1-9ffc-08dbeaae8f9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 16:26:05.6986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uODEkUqSTwnNKYiQMBDjxlubccR5ucq0SgSUJyLWA5yQBD9bYidyri/7QTlNsF2g2F6nhEIX1cI9zAUZzEOyjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6426
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIE5vdmVtYmVyIDIxLCAyMDIzIDk6NTUgQU0NCj4gDQo+IE9uIEZyaSwgTm92IDE3LCAyMDIz
IGF0IDExOjAy4oCvQU0gUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPiB3cm90ZToNCj4g
Pg0KPiA+DQo+ID4NCj4gPiA+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5j
b20+DQo+ID4gPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMTYsIDIwMjMgMTE6NTEgUE0NCj4g
PiA+DQo+ID4gPiBPbiBUaHUsIE5vdiAxNiwgMjAyMyBhdCAwNToyOTo0OVBNICswMDAwLCBQYXJh
diBQYW5kaXQgd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+ID4gRnJvbTogTWljaGFlbCBTLiBUc2ly
a2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gPiA+ID4gPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIg
MTYsIDIwMjMgMTA6NTYgUE0NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9uIFRodSwgTm92IDE2LCAy
MDIzIGF0IDA0OjI2OjUzUE0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPiA+ID4gPiA+
ID4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gPiA+ID4gPiA+
ID4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDE2LCAyMDIzIDU6MTggUE0NCj4gPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+ID4gT24gVGh1LCBOb3YgMTYsIDIwMjMgYXQgMDc6NDA6NTdBTSArMDAw
MCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4g
PiBGcm9tOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0KPiA+ID4gPiA+ID4g
PiA+ID4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDE2LCAyMDIzIDE6MDYgUE0NCj4gPiA+ID4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBPbiBUaHUsIE5vdiAxNiwgMjAyMyBhdCAxMjo1
MTo0MEFNIC0wNTAwLCBNaWNoYWVsIFMuIFRzaXJraW4NCj4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+
ID4gPiA+IE9uIFRodSwgTm92IDE2LCAyMDIzIGF0IDA1OjI5OjU0QU0gKzAwMDAsIFBhcmF2IFBh
bmRpdA0KPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBXZSBzaG91bGQgZXhwb3NlIGEg
bGltaXQgb2YgdGhlIGRldmljZSBpbiB0aGUNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBwcm9wb3Nl
ZA0KPiA+ID4gPiA+ID4gPiA+ID4gV1JJVEVfUkVDT1JEX0NBUF9RVUVSWSBjb21tYW5kLCB0aGF0
IGhvdyBtdWNoIHJhbmdlIGl0DQo+ID4gPiA+ID4gPiA+ID4gPiBjYW4NCj4gPiA+ID4gPiB0cmFj
ay4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBTbyB0aGF0IGZ1dHVyZSBwcm92aXNpb25pbmcgZnJh
bWV3b3JrIGNhbiB1c2UgaXQuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
PiA+ID4gPiBJIHdpbGwgY292ZXIgdGhpcyBpbiB2NSBlYXJseSBuZXh0IHdlZWsuDQo+ID4gPiA+
ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+IEkgZG8gd29ycnkgYWJvdXQgaG93IHRo
aXMgY2FuIGV2ZW4gd29yayB0aG91Z2guIElmIHlvdQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiB3YW50
IGEgZ2VuZXJpYyBkZXZpY2UgeW91IGRvIG5vdCBnZXQgdG8gZGljdGF0ZSBob3cNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gbXVjaCBtZW1vcnkNCj4gPiA+IFZNIGhhcy4NCj4gPiA+ID4gPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gQXJlbid0IHdlIHRhbGtpbmcgYml0IHBlciBwYWdlPyBX
aXRoIDFUQnl0ZSBvZiBtZW1vcnkNCj4gPiA+ID4gPiA+ID4gPiA+ID4gdG8gdHJhY2sNCj4gPiA+
ID4gPiA+ID4gPiA+ID4gLT4gMjU2R2JpdCAtPiAzMkdiaXQgLT4gOEdieXRlIHBlciBWRj8NCj4g
PiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBVZ2guIEFjdHVhbGx5IG9mIGNvdXJz
ZToNCj4gPiA+ID4gPiA+ID4gPiA+IFdpdGggMVRCeXRlIG9mIG1lbW9yeSB0byB0cmFjayAtPiAy
NTZNYml0IC0+IDMyTWJpdCAtPg0KPiA+ID4gPiA+ID4gPiA+ID4gOE1ieXRlIHBlciBWRg0KPiA+
ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+IDhHYnl0ZSBwZXIgKlBGKiB3aXRoIDFL
IFZGcy4NCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gRGV2aWNlIG1heSBub3Qg
bWFpbnRhaW4gYXMgYSBiaXRtYXAuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IEhvd2V2
ZXIgeW91IG1haW50YWluIGl0LCB0aGVyZSdzIDI1Nk1lZ2EgYml0IG9mIGluZm9ybWF0aW9uLg0K
PiA+ID4gPiA+ID4gVGhlcmUgbWF5IGJlIG90aGVyIGRhdGEgc3RydWN0dXJlcyB0aGF0IGRldmlj
ZSBtYXkgZGVwbG95IGFzDQo+ID4gPiA+ID4gPiBmb3IgZXhhbXBsZQ0KPiA+ID4gPiA+IGhhc2gg
b3IgdHJlZSBvciBzb21ldGhpbmcgZWxzZS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFBvaW50IGJl
aW5nPw0KPiA+ID4gPiBUaGUgZGV2aWNlIG1heSBoYXZlIHNvbWUgaGFzaGluZyBhY2NlbGVyYXRv
ciBvciBvdGhlciBpbXByb3ZlbWVudHMNCj4gPiA+ID4gdGhhdA0KPiA+ID4gbWF5IHBlcmZvcm0g
YmV0dGVyIHRoYW4gYml0bWFwIGFzIG1hbnkgcXVldWVzIGluIHBhcmFsbGVsIGF0dGVtcHQgdG8N
Cj4gPiA+IHVwZGF0ZSB0aGUgc2hhcmVkIGRhdGFiYXNlLg0KPiA+ID4NCj4gPiA+IE1heWJlLCBJ
IGRpZG4ndCBnaXZlIHRoaXMgdGhvdWdodC4NCj4gPiA+DQo+ID4gPiBNeSBwb2ludCB3YXMgdGhh
dCB0byBiZSBhYmxlIHRvIGtlZXAgYWxsIGNvbWJpbmF0aW9ucyBvZiBkaXJ0eS9ub24NCj4gPiA+
IGRpcnR5IHBhZ2UgZm9yIGVhY2ggNGsgcGFnZSBpbiBhIDFUQnl0ZSBndWVzdCBkZXZpY2UgbmVl
ZHMgOE1CeXRlcw0KPiA+ID4gb2Ygb24tZGV2aWNlIG1lbW9yeSBwZXIgVkYuIEFzIGRlc2lnbmVk
IHRoZSBxdWVyeSBhbHNvIGhhcyB0byByZXBvcnQNCj4gPiA+IGl0IGZvciBlYWNoIFZGIGFjY3Vy
YXRlbHkgZXZlbiBpZiBtdWx0aXBsZSBWRnMgYXJlIGFjY2Vzc2luZyBzYW1lIGd1ZXN0Lg0KPiA+
IFllcy4NCj4gPg0KPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQW5kIHRoaXMgaXMgcnVu
dGltZSBtZW1vcnkgb25seSBkdXJpbmcgdGhlIHNob3J0IGxpdmUNCj4gPiA+ID4gPiA+IG1pZ3Jh
dGlvbiBwZXJpb2Qgb2YNCj4gPiA+ID4gPiA0MDBtc2VjIG9yIGxlc3MuDQo+ID4gPiA+ID4gPiBJ
dCBpcyBub3Qgc29tZSBfYWx3YXlzXyByZXNpZGVudCBtZW1vcnkuDQo+IA0KPiBXaGVuIGRldmVs
b3BpbmcgdGhlIHNwZWMsIHdlIHNob3VsZCBub3QgaGF2ZSBhbnkgYXNzdW1wdGlvbiBmb3IgdGhl
DQo+IGltcGxlbWVudGF0aW9uLiBGb3IgZXhhbXBsZSwgeW91IGNhbid0IGp1c3QgYXNzdW1lIHZp
cnRpbyBpcyBhbHdheXMgZW11bGF0ZWQNCj4gaW4gdGhlIHNvZnR3YXJlIGluIHRoZSBEUFUuDQo+
IA0KVGhlcmUgaXMgbm8gc3VjaCBhc3N1bXB0aW9uLg0KSXQgaXMgc3VwcG9ydGVkIG9uIG5vbiBE
UFUgZGV2aWNlcyB0b28uDQoNCj4gSG93IGNhbiB5b3UgbWFrZSBzdXJlIHlvdSBjYW4gY29udmVy
Z2UgaW4gNDAwbXMgd2l0aG91dCBoYXZpbmcgYSBpbnRlcmZhY2UNCj4gZm9yIHRoZSBkcml2ZXIg
dG8gc2V0IHRoZSBjb3JyZWN0IHBhcmFtZXRlciBsaWtlIGRpcnR5IHJhdGVzPw0KDQo0MDBtc2Vj
IGlzIGFsc28gd3JpdHRlbiBhbnl3aGVyZSBhcyByZXF1aXJlbWVudCBpZiB0aGlzIGlzIHdoYXQg
eW91IHdhbnQgdG8gYXJndWUgYWJvdXQuDQpUaGVyZSBpcyBub3RoaW5nIHByZXZlbnRzIHRvIGV4
dGVuZCB0aGUgaW50ZXJmYWNlIHRvIGRlZmluZSB0aGUgU0xBIGFzIGFkZGl0aW9uYWwgY29tbWFu
ZHMgaW4gdGhlIGZ1dHVyZSB0byBpbXByb3ZlIHRoZSBzb2x1dGlvbi4NCg0KVGhlcmUgaXMgbm8g
bmVlZCB0byBib2lsIHRoZSBvY2VhbiBub3cuIE9uY2UgdGhlIGJhc2UgaW5mcmFzdHJ1Y3R1cmUg
aXMgYnVpbHQsIHdlIHdpbGwgaW1wcm92ZSBpdCBmdXJ0aGVyLg0KQW5kIHByb3Bvc2VkIHBhdGNo
ZXMgYXJlIHJlYXNvbmFibHkgd2VsbCBjb3ZlcmVkIHRvIG91ciBrbm93bGVkZ2UuDQoNCj4gDQo+
IFRoYW5rcw0KPiANCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE5vIC0gd3JpdGUgdHJhY2tpbmcgaXMg
dXNlZCBpbiB0aGUgbGl2ZSBwaGFzZSBvZiBtaWdyYXRpb24uIEl0DQo+ID4gPiA+ID4gY2FuIGJl
IGVuYWJsZWQgYXMgbG9uZyBhcyB5b3Ugd2lzaCAtIGl0J3MgYSBxdWVzdGlvbiBvZiBwb2xpY3ku
DQo+ID4gPiA+ID4gVGhlcmUgYWN0dWFsbHkgZXhpc3Qgc29sdXRpb25zIHRoYXQgdXRpbGl6ZSB0
aGlzIHBoYXNlIGZvcg0KPiA+ID4gPiA+IHJlZHVuZGFuY3ksIHBlcm1hbmVudGx5DQo+ID4gPiBy
dW5uaW5nIGluIHRoaXMgbW9kZS4NCj4gPiA+ID4NCj4gPiA+ID4gSWYgc3VjaCB1c2UgY2FzZSBl
eGlzdHMsIG9uZSBtYXkgZnVydGhlciBpbXByb3ZlIHRoZSBkZXZpY2UNCj4gaW1wbGVtZW50YXRp
b24uDQo+ID4gPg0KPiA+ID4gWWVzIHN1Y2ggdXNlIGNhc2VzIGV4aXN0LCB0aGVyZSBpcyBubyBs
aW1pdCBvbiBob3cgbG9uZyBtaWdyYXRpb24gdGFrZXMuDQo+ID4gPiBTbyBnbyBhaGVhZCBhbmQg
ZnVydGhlciBpbXByb3ZlIGl0IHBsZWFzZS4gRG8gbm90IGdpdmUgdXMgIndlIGRpZA0KPiA+ID4g
bm90IGdldCByZXF1ZXN0cyBmb3IgdGhpcyBmZWF0dXJlIiBwbGVhc2UuDQo+ID4NCj4gPiBQbGVh
c2UgZGVzY3JpYmUgdGhlIHVzZSBjYXNlIG1vcmUgcHJlY2lzZWx5Lg0KPiA+IElmIHRoZXJlIGlz
IGFueSBhcHBsaWNhdGlvbiBvciBPUyBBUEkgZXRjIGV4aXN0cywgcGxlYXNlIHBvaW50IHRvIGl0
IHdoZXJlIHdvdWxkDQo+IHlvdSBsaWtlIHRvIGZpdCB0aGlzIGRpcnR5IHBhZ2UgdHJhY2tpbmcg
YmV5b25kIGRldmljZSBtaWdyYXRpb24uDQo+ID4gV2UgbWF5IGhhdmUgdG8gZHJhdyBhIGxpbmUg
dG8gaGF2ZSByZWFzb25hYmxlIHBvaW50IGFuZCBub3Qga2VlcA0KPiBkaXNjdXNzaW5nIGluZmlu
aXRlbHkuDQo+ID4NCg0K

