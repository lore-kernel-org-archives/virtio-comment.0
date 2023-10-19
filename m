Return-Path: <virtio-comment-return-7829-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AF9CDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 05:31:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B69D82CAD5
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 05:31:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9ABB69868CC
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 05:31:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 856459868C3; Thu, 19 Oct 2023 05:31:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7522A9868C4
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 05:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsHKRJu6m6zygb20hKmkURNykrcdp2f//mSN7SnNaxyuHHpll/I/jdgH0Dw1uGIllHHsAw1M6iZbfr0BHgvl22c+kiYjemh6ztYz4zhx7w6I5mdILniONLtMhg5FGpxzSO0pt9TvK/yXtT1sje0lPmYgBv7W1m4oWAbeguOIit3Q+El8jQ7eGjuEonXixm2b7d6vIjgsQA7HB9AeHuDUvhBPHo+YqQwOUoz+VSO/vsogXNwp+yPfQKS/C+K3gBZ2oEZYwhx/3mpt9cfZ2U/wkHI04moxRWiYVgNlYEP36RzEUPg7w5yHe1nL+cdNFNHzkCS1iLHEBDK8ByuLy93myQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAcdCDBPj2iS7N0rWQ8rCSzrykV3OCAV50NT4a59vOo=;
 b=DEcrroAZ84MKPc7gpdtiZ+lmkQdb9B28VqaaUJSkthmCfMo2gJfgUHKS7RFuk94DReV4NXGzlKr64qY8cKDH9v6fWDX2pkf2VOX/XIK156IElkKtDbI+l8rXPB962A3ldN0gAUkSnvH1BrqWP4vT8iAI1XrieGDTk/3HVGJjJk5+jORKyRbxfb91yiO0PqkHqeHvrRDQL/dOnQcTeSFqJZf91h7vu7QP2USAsb7nrviJLiwHme76CPEITuwstLoec2LDM/erg/eBMZO0FuCyZbpRqdpa55FAgub3YFvEDzZ2vCOC/7KrwUczD2XiY3cQpD5/NmvSsI0lHNU6Fkarfg==
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
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzA=
Date: Thu, 19 Oct 2023 05:31:37 +0000
Message-ID:
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
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
In-Reply-To:
 <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN0PR12MB6271:EE_
x-ms-office365-filtering-correlation-id: 96529fa4-f936-4c55-7b7f-08dbd064aa1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2yktfN5zJ1g7cYiMvVFf6U9/Kd8XsIocuwiS/nCIUQpk+SxtGkVuja6Vco72jcPlBYFvo4aEKGA0PrCi71IsaLOR8jjfv935IjBiVO60M8i9244LieeMjRI95J8FhqhsG+sExFo3b7OgnLN4ExUUqVEitgCDiH1DtHj6iQ3NtHvWGDGRmn3P3+Wz0z4ojjcxrTNNmVUwelRcSsFbVRdwLzXTgHvsrdrKO9UhNz55tGVNhRZFJ2eAw155k9uAErT70MsB53pyPVTTCWmknjZgQGRPaujYYcgkagks7BcSnlo6C10M0ptRljAJafENTR/jdd5koX4Y2MZOri8HAWN0G0uCJYDHpDNQZW+hhk1mc42vkBkd0rbBlzoC6aH6mUDVPDksavf9RpesiLt2yTXBUvCQtgzRxhOxd40+UfOC4hOYCovsElAjdtZ3RAd5qJBXf9V2X//yezuHYQI0wTwg8frwYNgk3S/o5EVOB+WVVFssMpXRE+u+Wg1YJQJMqCB55EArmze4VxuzZzDerNwFs1GH+jDQMIPoVMjQili/3P88Mafo30F8TjvKustU6NSCfS78oqrTVqYbE/fqKilECICR2JNQkSJiBBG+Mgfnllo2Sz05k6YplP5eHZfc0h48
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(366004)(396003)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(478600001)(66556008)(316002)(66446008)(6916009)(41300700001)(64756008)(4326008)(8676002)(8936002)(76116006)(54906003)(66946007)(66476007)(5660300002)(55236004)(71200400001)(52536014)(6506007)(7696005)(55016003)(9686003)(38100700002)(122000001)(86362001)(38070700005)(26005)(107886003)(2906002)(83380400001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZHl2ak9WZ0R6bUhMWU1tRUlRWGpIWjAyU1Y5U2tNUmJ6NThwNzBvOTljZC93?=
 =?utf-8?B?NDRmMThUb21LZ0JjNzM4RVhkSWJtWEJ4RElOaHdZekk5bCswOEhUU3VTcGJN?=
 =?utf-8?B?bXI4NHN3UWhiL3EySEVQMTlOYjBhYlJFcjRrcG9vWk5SbXMrSVliTGtLNWJh?=
 =?utf-8?B?OU5tdFNSTlgwVXlVNjM5WFVFQlE5djFHYWkzNmFBWkRWb3FvRkZQTm12VjNO?=
 =?utf-8?B?M3kvVWtZVU54d1ArMjZmT21RVmpHUDZlQVZGSnNtRXJ4UXdUdkFUTW5RaFky?=
 =?utf-8?B?U0JlemRGbEFmWEZmZENlUnpIeU5XUGNQQ3RZeEQ2L29veDBJYVJZS1hCTjUx?=
 =?utf-8?B?blE5VW9pdkJSZTMvdGlmNlRlNkpxTURLZG93TlVOcEhRTjFzaGlrMWtOSVFu?=
 =?utf-8?B?eHV6YjBmd3pkTitUeWtFNGk5Z1BqRlR2dndQVm90bkVaZ2ptNElqb1VwZjJB?=
 =?utf-8?B?UjNWeTF3bVkxR1VrUXhLWU1vM0ExWlZiYzEzRkxEa0kyZFR3NzZRQ0QxRkN2?=
 =?utf-8?B?VUt3SDYvTm5yYUtySmkxNDVROS9JZEVCWHFwUEhIYUNqVnNkcDA0WHNXa1Ez?=
 =?utf-8?B?Z2FEZ2gyVi9ZS0VXaytmbndDc2dqSWtFelo1ZHJHYXVTYmpucGVnQ1dqeWpG?=
 =?utf-8?B?WXZVb0xhbzY1a2xobG9Cdlplc2xYOU5UOWR6THNDWnVpcUw5YWdFOFB3bzJV?=
 =?utf-8?B?eUVFdld4Mk5jUW4rcFZNVEI2UnMrblpxTEYydzMyMmlHaVJsU3lhME44di9j?=
 =?utf-8?B?Z0s2amRsRGlqSndVYmZxeTlYdDN1NVZYRytjQnc3MDVtUjF1MFgwOWc4Y1h0?=
 =?utf-8?B?UVNNQlhsUTAzNEFMZ0JadFowbDlLTjY4ZkVjVVVDMWpzT0ZhUjFxZ1JBaFpq?=
 =?utf-8?B?aE8zQmEwa2NPUXRPSlNCWktwa2p5ZUZMeFdLVDQrYUFobUhTN0hFZUl6N1NU?=
 =?utf-8?B?VDFsQzhoZTM4cTdwK2hPWEdVYURuYW1YTytRNEl0bUppMHMxV1JjVU1VMU1I?=
 =?utf-8?B?c0NkYkoyTHl0QkphTE8rQ1R2R093dTN4elpJRG5RVGJhdVJycVpidjNFalZO?=
 =?utf-8?B?U3FPcFJpNmtFRExPS3FKSU90TjFVemZIZHBmOXd4cmk4OGVSQ1VEVUtSTkpw?=
 =?utf-8?B?dlpvMERUSi9Cam4xWCtNL2xqVHUyTEtTekxFbTNlVzhJS3FQa3pyZEI3Z3BG?=
 =?utf-8?B?WS93MnBoaEVoV2k4dFZqdmdaMUpOTStyTFhETHlSTFpTQ2tEYzlDeW9qdmUx?=
 =?utf-8?B?SHNCd24vMEhQN0p1ZUNKVldFYmIrNmx0U0REM29BUDNLQ3JZU3hGT0Zhc2xi?=
 =?utf-8?B?U2FzSVZnVVNkQWdnaWtjcFVQWGRKbmEwTzNlRGtNb0dYY3FlZkx0K0RCNG9W?=
 =?utf-8?B?SWZDT0VWY1ZZK0c2K1ppTjlhdnZYcHRMbzJESXR5TmV2UjN1bEJ1WWVIdTND?=
 =?utf-8?B?ZXRRRWFVWFhRZDVna3NLK3MzUjMwc2Fqb2w5NnlDRWZDbHhDNGlSRXJFQURD?=
 =?utf-8?B?QSt0M2hHdlZ5Yy9DN0FtNy9kM2NpakcxeC8rN0FaWUtiSGtTTk5ER05qYXBW?=
 =?utf-8?B?L1pYWEdzN29xTk1NVnE5RUg5Rk1peTRvenY2VkJYMUJ2c0pDTzIycWxtRmxr?=
 =?utf-8?B?c29kcVpZbUZXZkh2VzZVWGx6UmpEblg0RU9aTG13eVE2eTVuNzVnVHNic3R4?=
 =?utf-8?B?YTl2dUU4U2s1emg0Rmg3NFpTVGZ5NjEzY3VNekdxWXZnNWJDUUI1TEhWbU5X?=
 =?utf-8?B?T3VpemN1WUR1NUI3cC94UHhlVXB3Wm8zQmpEakV0WGtONFB4VGtja0dPK1NJ?=
 =?utf-8?B?R0FNeXEvZGFoZ2taaCttMC9xbmxmNEtHVHV5VGl6Z2lNWFFvekJCdW5HSy8y?=
 =?utf-8?B?UjR2MUVNRmRtdUEzN01LeE9VNlkzL1QyRGQvLzZ4eXI5VTlxSEM5RjZ0MGZG?=
 =?utf-8?B?WUtIR09pUCtPd2tsa1RUTUlsb0pDbVpoTVlJdk00VE54MG5scnFHUy8zZXR5?=
 =?utf-8?B?NE5qNE5xUXFDeHRoanJxUmUvM2ZMcnN1bHZ1S3VCaHZVRFZRTm9CME1EV3Ji?=
 =?utf-8?B?RE5vdFlPeEp1dnRBRndLUWJDMjdrZ0ZTT0U0Qy9RL1laVnJ4S2FFUXpkblZK?=
 =?utf-8?Q?2hNU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96529fa4-f936-4c55-7b7f-08dbd064aa1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 05:31:37.2291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jMBcmjqvQPEZVhgy4ytZNWDpD5v6F1h3n6y+e43qkB7yuTXaGzWfihE9g4YQZP24jUE2h+eYpahwrBQ0GyvalQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6271
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQoNCj4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmcgPHZpcnRpby1j
b21tZW50QGxpc3RzLm9hc2lzLQ0KPiBvcGVuLm9yZz4gT24gQmVoYWxmIE9mIEphc29uIFdhbmcN
Cj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMTksIDIwMjMgMTA6MTUgQU0NCj4gDQo+ID4gPiBB
Z2FpbiwgaWYgeW91IGRvbid0IHdhbnQgdG8gdGFsayBhYm91dCB0cmFuc3BvcnQgdmlydHF1ZXVl
LCB0aGF0J3MNCj4gPiA+IGZpbmUuIEJ1dCBsZXQncyBsZWF2ZSB0aGUgc2NhbGFiaWxpdHkgaXNz
dWUgYXNpZGUgYXMgd2VsbC4NCj4gPiA+DQo+ID4gUmVnaXN0ZXJzIGFyZSByZWxhdGVkIGZvciBm
dW5jdGlvbmFsaXR5IGFuZCBzY2FsZS4NCj4gPg0KPiA+IExldHMgZmlyc3QgYWdyZWUgb24gdXNl
IGNhc2UgYmVmb3JlIHRoZSBkZXNpZ24sIHRoYXQgSSBhc2tlZCBhYm92ZS4NCj4gPg0KPiA+IEkg
d2lsbCB3YWl0IHRvIHJlc3BvbmQgdG8gYW55IG90aGVyIGVtYWlscyB1bnRpbCB3ZSBhZ3JlZSBv
biB1c2UgY2FzZQ0KPiByZXF1aXJlbWVudHMuDQo+IA0KPiBUaGVyZSBhcmUgbW9yZSB0aGFuIGp1
c3QgbWUgd2hvIHdhbnQgeW91IHRvIGRlZmluZSAicGFzc3Rocm91Z2giIGZpcnN0IHdoZXJlDQo+
IHlvdSByZWZ1c2UgdG8gcmVzcG9uZC4NCj4gDQpUb3RhbGx5IGRpc2FncmVlLg0KSW4gdGhlIHBy
ZXZpb3VzIGVtYWlsIGl0c2VsZiwgSSB3cm90ZSB3aGF0IHBhc3N0aHJvdWdoIGlzLg0KU28gbGV0
J3MgdHJ5IHlldCBvbmUgbW9yZSB0aW1lLg0KRWl0aGVyIHlvdSBjYW4gcmUtcmVhZCBsYXN0IGVt
YWlsIG9yIGZvciBiZXR0ZXIgcmVhZCBiZWxvdyBhbmQgc2VlIGlmIGl0IGlzIHVuZGVyc3Rvb2Qg
b3Igbm90Lg0KDQo+IEhvdyBjb3VsZCB3ZSBtYWtlIGFueSBhZ3JlZW1lbnQgd2l0aG91dCBhbiBh
Y2N1cmF0ZSB0aGUgZGVmaW5pdGlvbiBvZg0KPiAicGFzc3Rocm91Z2giIHdobyBpcyBhIGtleSB0
byB1bmRlcnN0YW5kIGVhY2ggb3RoZXI/DQoNCkkgcmVwbGllZCBmZXcgdGltZXMgaW4gcGFzdCBl
bWFpbHMgYnV0IHNpbmNlIHRob3NlIGVtYWlsIHRocmVhZHMgYXJlIHNvIGxvbmcsIGl0IGlzIGVh
c3kgdG8gbWlzcyBvdXQuDQoNClBhc3N0aHJvdWdoIGRlZmluaXRpb246DQphLiB2aXJ0aW8gbWVt
YmVyIGRldmljZSBtYXBwZWQgdG8gdGhlIGd1ZXN0IHZtDQpiLiBvbmx5IHBjaSBjb25maWcgc3Bh
Y2UgYW5kIG1zaXggb2YgYSBtZW1iZXIgZGV2aWNlIGlzIGludGVyY2VwdGVkIGJ5IGh5cGVydmlz
b3IuDQpjLiB2aXJ0aW8gY29uZmlnIHNwYWNlLCB2aXJ0aW8gY3ZxcywgZGF0YSB2cXMgb2YgYSBt
ZW1iZXIgZGV2aWNlIGlzIGRpcmVjdGx5IGFjY2Vzc2VkIGJ5IHRoZSBndWVzdCB2bSB3aXRob3V0
IGludGVyY2VwdGVkIGJ5IHRoZSBoeXBlcnZpc29yLg0KDQooV2h5IGI/LCBubyBncmFuZCByZWFz
b24sIGl0IGlzIGhvdyB0aGUgaHlwZXJ2aXNvcnMgYXJlIHdvcmtpbmcgd2hlcmUgdG8gaW50ZWdy
YXRlIHRoZSB2aXJ0aW8gbWVtYmVyIGRldmljZSB0bykuDQoNCg==

