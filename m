Return-Path: <virtio-comment-return-8205-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AACC4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:52:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B417822372
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:52:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A8B6E9867C1
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:52:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9FB1398671A; Mon,  6 Nov 2023 10:52:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 92BF0986720
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 10:52:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrRHjOHIGgH7APgSbBF9ot7HY5bkysbNtA8RrH5+/m9vk7pf+pzt12YuUSUW05xudMjoorIIOEcBGpwBc5PvzAKLaIwCNm/cl3l9jV+RuGFTIWdAGAfmEv9+ClaMt9Uomn6xztbuf6iFGHRGwVTl/ktoTHkob/jczQZGTY95AkUCJlAfO3mXMlr6BtaWJr+c00aVWiXINGp5TKhPX4fpfvrJTJsj9VuAuyz3WirWQwOD6uYs/bogjjQQbdQeirumspurqQ70teyqTQYYRzvfCZX6JU/+a7RAoknyVbj5myF3sphlJpPR3cd0m2AtmQgfbcPkEVyhZQiPEgrlKIaOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2/8FrPK5DTZbksfdf1ILGSje6t8+4YhN/SClHMcAgo=;
 b=E0ua0SQBlnUlg7zTpzpfdX5vSXlNI8QrTHsDM35jmkywMnjK7EelUW/u/nQluX2SDFOvdBaUOkKLNNwQOsWYrk5zWVPWM89hce70sEcBMHnVajSHryTyw8e5ls/qma7qTgveOAWk3B94dX1XwbxR1/tWF7vXs/nIkUoL5QKx3q0vfp3umtAbXQhzjZdgIQ618IHxJxqmbpJQPMCAwPZXCnDR2LnOSwi7kv+Qglh8ddxjd1UzCegohD0q+jW6nyFG3uKBkr4qm5jSSOFoLnKoggHjqUndGhzgu7cPk0YbHG2w11t9YbkhjxNRX6xUjSGIRBSL2tNpjlRnh9ocnC4Vew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE
Thread-Index:
 AQHaDkFl1Izi1X/8PEWVlDiafyu5VrBocsSwgAA8x4CAAA4dEIAD6TMAgAAKLuCAAFlegIAAFMUA
Date: Mon, 6 Nov 2023 10:52:43 +0000
Message-ID:
 <PH0PR12MB5481BCA941D86E1031D7A5D9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-5-lingshan.zhu@intel.com>
 <PH0PR12MB5481085F6E84FD2786FCD60BDCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <705607e3-39c3-47da-a688-80bbee31c48d@intel.com>
 <PH0PR12MB54814F9EEDD69ED434BF7994DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b0506d9f-37de-43c9-b99d-b00bb88c0d36@intel.com>
 <PH0PR12MB548174AF58B6ADDDA215123DDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b8d51cd3-33fe-4167-a87b-ae662609c5d8@intel.com>
In-Reply-To: <b8d51cd3-33fe-4167-a87b-ae662609c5d8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB5618:EE_
x-ms-office365-filtering-correlation-id: 8f77605b-25c9-4900-2f6d-08dbdeb6816c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ZaDq8uPdUiNR7xS4a1JdK6smu1TjJdylNVB1RKLlOg94TuY1NBvSEw48n4tHkeoRuHPYULa4u9r5/v3H80U5um0rfTgBAKuE10yIZCGR5c4SSYdiaF4+MUmIoiGd8T+LYH1A7oYnkzR0kfC4mvqqLiOFCoGCbLarQ/t+V6gH+Ggile+hbFSO0uY3mXyKX22a+V/85t9xExF8XpJ4eNUaF6ZrzBNjDSQOwK3rszBPpDFNrMWJ20i5vg6NyTVfbNgUv6RX1GZKqrZWq2IaB6X386raa+Hs+ex+U0I7yMEMMcTLD3243gJ96eiMfK7Cs7dVDxQHYv1pZNKGvFdxKdjDcwwVGcyZGk/waf/olqI198s/vz7cqA6C3Os5HGLLZrgDKxXUxLU0V6iLYSqeRqKGkL33Xn5EyPZX9rSm5Nsu5bwt5U+y/PBJa0TpXkju1TjNb5dZt/C6bNlCrdec9mORReL0N9farzwR44EyT8r3Z3rRqvPzs7iNMVz/Xf9L3z9uy674XWjD2uJ/yzIzQ/ib/RZ46QKcBWsWSAmws9e+1BU3OLout/rNUsr8+WkatNo+lbjER4o8ahooa2Wdjb3Ehw2Oqav6fQ6eOY4ZqCuUO1U4JV63NjpwULmAyhPYW0DZ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(2906002)(33656002)(41300700001)(4326008)(8676002)(8936002)(52536014)(86362001)(5660300002)(38070700009)(38100700002)(55016003)(478600001)(71200400001)(9686003)(53546011)(6506007)(7696005)(83380400001)(76116006)(66556008)(66446008)(66476007)(66946007)(26005)(110136005)(122000001)(64756008)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RkJTTWllSnhHOEp6cVdjUDB5ODdiY2traUc0S205TGZjUVJjT0h5akRPd0FK?=
 =?utf-8?B?V2lpYm9NNVZOeGQzdDFSK3pIdmgxU254eUcwZGpVYnlCWW1ET2ZYTXdwMWlm?=
 =?utf-8?B?MkV1S3p5SHdzK2VsRWdlVy9nRWNkZVJaKzR5WE9JVW9IVUhPaTVTaStNWmZR?=
 =?utf-8?B?VFZ3UHBGNGVodjFabUFtcEF4NDJ6Ym5sb3pDaDE1aFUxVG9FQmpIbG1IRFlL?=
 =?utf-8?B?L2FrZmRsVUluY1QrUUMwZy9SZ2l4ZmxLazNQM3p5UUNGL0FPblJ4Nmx5VUNj?=
 =?utf-8?B?T3RNSWh6SlVkeThaTUxtNUFGM0I4Wk1nTUw5UXRXRzJkcXZHTEhZNWhDbXJp?=
 =?utf-8?B?d2JCSXBxb0wvS3Q4RUQvZURsTnNQZTFMdGFlRzRoSW9lbVJTVFlaYnYrMGxG?=
 =?utf-8?B?TmNTOGkxZVNPOCtuR3ozY0dUVGxmTmFGSUllL3gyYTJ3SmhFQWpnT3MyU1NB?=
 =?utf-8?B?NUJ4QkhBc0dmQ2tFTlFPM2JFSWxMKzE0aWQ0OWJtditCZnNrZEl0WklsTWc4?=
 =?utf-8?B?bWRpM2txWmNxQkxUTXJHRjhuQmhobnUyNzFCdDhURytuUHRaYWFQUmxXWmU0?=
 =?utf-8?B?WmVhanN1MFJnOXdvbi9oYUNKR1A2QWpraGVPanFPZnRJMERrZjd0NXNuSVQx?=
 =?utf-8?B?M1I5TFBucStMUkFtM3hhTkt0SkI0R1lpUTllTXFTTGFVWkI2WkhWcTBxTG1V?=
 =?utf-8?B?MDRwNlJucXQvTmw0RWpMRlRFQUFaM09CUjF4Snl3djVlVElGUTNzOXV0L3ND?=
 =?utf-8?B?YXhXcXFDSnlGREM4SHNyNmExd2dwOGF1d3NOUEhIMGF0Yy9mTzM1WS9MZ2Jt?=
 =?utf-8?B?SUxRVTljakFFSGpkSzVXT3F5aVNNSUR3azgvcDRkWDBWTVhRbHhqTjNLclla?=
 =?utf-8?B?ak9ZZmRid0M5NWNrZFROd0EyNi9HNjBxSGxLZ0FSQjd0VEZCTW9Sbmk3ZEJV?=
 =?utf-8?B?aHdmTHIwcnMxYUdWK3R1U3Rjb0g1UHJYbTBOMG5uMEpRMVI1c05qTE94eTA3?=
 =?utf-8?B?RTRsY3doaEQ5VVlSaTA0SXkybGNDUGduNDBMVk1NQzNGcTV5NGxQdndOQ0Rs?=
 =?utf-8?B?SlMrSk93c3UvL1JNVlBhQXR5akhtTmdKNGpsSktlYXZwL1FFZFpFQ3hwMCtX?=
 =?utf-8?B?eEpQdWQ0am1YdEsvc1oxL25uREg2N25HbWRyR3NwMW94SURwb01nd3RJeFA5?=
 =?utf-8?B?TzFsUmpuTVYvNFp1WkJFVnpKK1hWQmhnMDIrbzY2RHc4NGFQZTEvdmxOZ0dD?=
 =?utf-8?B?UldKRTZxQmhnOUU0N3poMDd2a3pVRGVvRDBLRHhGNGRYaWVqWHRQeG4zck9V?=
 =?utf-8?B?TE1LQ29WaW5hbnRxcWtnd2tpVUdUQzVJbGhuYng3dVJvWU9oODBvOVh5eWFJ?=
 =?utf-8?B?Zy92SXpUZVlNd3R6STRtUGZMaExBNE03dCt4YXJoSHZtcmltaHZ5Y3NHRmNj?=
 =?utf-8?B?MHpaOG5BOTdEWnpZbVVidkF5aDFWeUFSQjg1SGlDZnF2bXp3RkNEdVVXdXd2?=
 =?utf-8?B?a2c0MDNZL0Jld1VZeW1kU1pyZG5nZEdjelB4L3loQ3o5MEVXWTlkcHlhWnVt?=
 =?utf-8?B?d0xibS9tWlNEVkpwRlVITWgyeDJrRlppbmE3dG1JY2JTQXhSSkJNdmxpdW4x?=
 =?utf-8?B?UHk2dTVTU3VlT0NvVkJETUxIVnZUa2VjUlMwdlFJY1J2MTBLemwrK3NSbEQy?=
 =?utf-8?B?b1J0ME4yOU40L1lmZDJGdEFmSzhCM25MS0NDSi9CNjg1WG8xcVJITkFkcW1E?=
 =?utf-8?B?NGtIVG0yUlE0aEVGQ29MU3Vja0w4QS9ZYmkyVGwxUWRnRzkralg4bE5zWFpu?=
 =?utf-8?B?NjJ3V010cnMwWjFUSUZhRlUzWE1UL0ZpaXl1Wnl1NEg5TjU1M2F6LzA5WGZw?=
 =?utf-8?B?cXR6ODN3OWNSN3JZeldwSjluRkZET2tQWHl4K3BLTjlJZmczYVA3d2h6ZEJF?=
 =?utf-8?B?RjJCdGJmdkViWUlvYUNNckJLRGtQZzN1akhTd2JESExZaXA3Q0plRFRIMFpy?=
 =?utf-8?B?MEpOemRPOS9CUitnYVZpT1ZBWldsd2NEVCtJQlRod3FZZmtqc0lQQktVNjZt?=
 =?utf-8?B?dGt4aFNQd2NUWVk4MW0wN2xBN21DblU5RTU1WlFPRUJNMXR3WklDbFE4QmJI?=
 =?utf-8?Q?CylE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f77605b-25c9-4900-2f6d-08dbdeb6816c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 10:52:43.9797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XoGJgAvgDSsCi5ZZFCihvLF86MgW0mTBeZQbwxECTCE3/bGldPapEHgchw/H4Vp3PKz6Fht39KPFSvGH8jhKCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5618
Subject: RE: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgTm92ZW1iZXIgNiwgMjAyMyAyOjU3IFBNDQo+IA0KPiBPbiAxMS82LzIwMjMgMTI6
MTIgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGlu
Z3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciA2LCAyMDIz
IDk6MDEgQU0NCj4gPj4NCj4gPj4gT24gMTEvMy8yMDIzIDExOjUwIFBNLCBQYXJhdiBQYW5kaXQg
d3JvdGU6DQo+ID4+Pj4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmcN
Cj4gPj4+PiA8dmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtIG9wZW4ub3JnPiBPbiBCZWhhbGYg
T2YgWmh1LCBMaW5nc2hhbg0KPiA+Pj4+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMywgMjAyMyA4
OjI3IFBNDQo+ID4+Pj4NCj4gPj4+PiBPbiAxMS8zLzIwMjMgNzozNSBQTSwgUGFyYXYgUGFuZGl0
IHdyb3RlOg0KPiA+Pj4+Pj4gRnJvbTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwu
Y29tPg0KPiA+Pj4+Pj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciAzLCAyMDIzIDQ6MDUgUE0NCj4g
Pj4+Pj4+DQo+ID4+Pj4+PiBUaGlzIHBhdGNoIGFkZHMgdHdvIG5ldyBsZTE2IGZpZWxkcyB0byBj
b21tb24gY29uZmlndXJhdGlvbg0KPiA+Pj4+Pj4gc3RydWN0dXJlIHRvIHN1cHBvcnQgVklSVElP
X0ZfUVVFVUVfU1RBVEUgaW4gUENJIHRyYW5zcG9ydCBsYXllci4NCj4gPj4+Pj4+DQo+ID4+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+
ID4+Pj4+PiAtLS0NCj4gPj4+Pj4+ICAgICB0cmFuc3BvcnQtcGNpLnRleCB8IDE4ICsrKysrKysr
KysrKysrKysrKw0KPiA+Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gZGlmZiAtLWdpdCBhL3RyYW5zcG9ydC1wY2kudGV4IGIvdHJh
bnNwb3J0LXBjaS50ZXggaW5kZXgNCj4gPj4+Pj4+IGE1YzY3MTkuLjMxNjE1MTkgMTAwNjQ0DQo+
ID4+Pj4+PiAtLS0gYS90cmFuc3BvcnQtcGNpLnRleA0KPiA+Pj4+Pj4gKysrIGIvdHJhbnNwb3J0
LXBjaS50ZXgNCj4gPj4+Pj4+IEBAIC0zMjUsNiArMzI1LDEwIEBAIFxzdWJzdWJzZWN0aW9ue0Nv
bW1vbiBjb25maWd1cmF0aW9uDQo+ID4+IHN0cnVjdHVyZQ0KPiA+Pj4+Pj4gbGF5b3V0fVxsYWJl
bHtzZWM6VmlydGlvIFRyYW5zcG9ydA0KPiA+Pj4+Pj4gICAgICAgICAgICAgLyogQWJvdXQgdGhl
IGFkbWluaXN0cmF0aW9uIHZpcnRxdWV1ZS4gKi8NCj4gPj4+Pj4+ICAgICAgICAgICAgIGxlMTYg
YWRtaW5fcXVldWVfaW5kZXg7ICAgICAgICAgLyogcmVhZC1vbmx5IGZvciBkcml2ZXIgKi8NCj4g
Pj4+Pj4+ICAgICAgICAgICAgIGxlMTYgYWRtaW5fcXVldWVfbnVtOyAgICAgICAgIC8qIHJlYWQt
b25seSBmb3IgZHJpdmVyICovDQo+ID4+Pj4+PiArDQo+ID4+Pj4+PiArCS8qIFZpcnRxdWV1ZSBz
dGF0ZSAqLw0KPiA+Pj4+Pj4gKyAgICAgICAgbGUxNiBxdWV1ZV9hdmFpbF9zdGF0ZTsgICAgICAg
ICAvKiByZWFkLXdyaXRlICovDQo+ID4+Pj4+PiArICAgICAgICBsZTE2IHF1ZXVlX3VzZWRfc3Rh
dGU7ICAgICAgICAgIC8qIHJlYWQtd3JpdGUgKi8NCj4gPj4+Pj4gVGhpcyB0aW55IGludGVyZmFj
ZSBmb3IgMTI4IHZpcnRpbyBuZXQgcXVldWVzIHRocm91Z2ggcmVnaXN0ZXINCj4gPj4+Pj4gcmVh
ZCB3cml0ZXMsIGRvZXMNCj4gPj4+PiBub3Qgd29yayBlZmZlY3RpdmVseS4NCj4gPj4+Pj4gVGhl
cmUgYXJlIGluZmxpZ2h0IG91dCBvZiBvcmRlciBkZXNjcmlwdG9ycyBmb3IgYmxvY2sgYWxzby4N
Cj4gPj4+Pj4gSGVuY2UgdG95IHJlZ2lzdGVycyBsaWtlIHRoaXMgZG8gbm90IHdvcmsuDQo+ID4+
Pj4gRG8geW91IGtub3cgdGhlcmUgaXMgYSBxdWV1ZV9zZWxlY3Q/IFdoeSB0aGlzIGRvZXMgbm90
IHdvcms/IERvIHlvdQ0KPiA+Pj4+IGtub3cgaG93IG90aGVyIHF1ZXVlIHJlbGF0ZWQgZmllbGRz
IHdvcms/DQo+ID4+PiA6KQ0KPiA+Pj4gWWVzLiBJZiB5b3Ugbm90aWNlIHF1ZXVlX3Jlc2V0IHJl
bGF0ZWQgY3JpdGljYWwgc3BlYyBidWcgZml4IHdhcw0KPiA+Pj4gZG9uZSB3aGVuIGl0DQo+ID4+
IHdhcyBpbnRyb2R1Y2VkIHNvIHRoYXQgbGl2ZSBtaWdyYXRpb24gY2FuIF9hY3R1YWxseV8gd29y
ay4NCj4gPj4+IFdoZW4gcXVldWVfc2VsZWN0IGlzIGRvbmUgZm9yIDEyOCBxdWV1ZXMgc2VyaWFs
bHksIGl0IHRha2UgYSBsb3Qgb2YNCj4gPj4+IHRpbWUgdG8NCj4gPj4gcmVhZCB0aG9zZSBzbG93
IHJlZ2lzdGVyIGludGVyZmFjZSBmb3IgdGhpcyArIGluZmxpZ2h0IGRlc2NyaXB0b3JzICsgbW9y
ZS4NCj4gPj4gaW50ZXJlc3RpbmcsIHZpcnRpbyB3b3JrIGluIHRoaXMgcGF0dGVybiBmb3IgbWFu
eSB5ZWFycywgcmlnaHQ/DQo+ID4gQWxsIHRoZXNlIHllYXJzIDQwMEdicHMgYW5kIDgwMEdicHMg
dmlydGlvIHdhcyBub3QgcHJlc2VudCwgbnVtYmVyIG9mDQo+IHF1ZXVlcyB3ZXJlIG5vdCBpbiBo
dy4NCj4gVGhlIHJlZ2lzdGVycyBhcmUgY29udHJvbCBwYXRoIGluIGNvbmZpZyBzcGFjZSwgaG93
IDQwMEcgb3IgODAwRyBhZmZlY3Q/Pw0KQmVjYXVzZSB0aG9zZSBhcmUgdGhlIG9uZSBpbiBwcmFj
dGljZSByZXF1aXJlcyBsYXJnZSBudW1iZXIgb2YgVlFzLg0KDQpZb3UgYXJlIGFza2luZyBwZXIg
VlEgcmVnaXN0ZXIgY29tbWFuZHMgdG8gbW9kaWZ5IHRoaW5ncyBkeW5hbWljYWxseSB2aWEgdGhp
cyBvbmUgdnEgYXQgYSB0aW1lLCBzZXJpYWxpemluZyBhbGwgdGhlIG9wZXJhdGlvbnMuDQpJdCBk
b2VzIG5vdCBzY2FsZSB3ZWxsIHdpdGggaGlnaCBxIGNvdW50Lg0KPiBTZWUgdGhlIHZpcnRpbyBj
b21tb24gY2ZnLCB5b3Ugd2lsbCBmaW5kIHRoZSBtYXggbnVtYmVyIG9mIHZxcyBpcyB0aGVyZSwN
Cj4gbnVtX3F1ZXVlcy4NCg0KOikNClN1cmUuIHRob3NlIHZhbHVlcyBhdCBoaWdoIHEgY291bnQg
YWZmZWN0cy4NCg0KPiA+IERldmljZSBkaWRu4oCZdCBzdXBwb3J0IExNLg0KPiA+IE1hbnkgbGlt
aXRhdGlvbnMgZXhpc3RlZCBhbGwgdGhlc2UgeWVhcnMgYW5kIFRDIGlzIGltcHJvdmluZyBhbmQg
ZXhwYW5kaW5nDQo+IHRoZW0uDQo+ID4gU28gYWxsIHRoZXNlIHllYXJzIGRvIG5vdCBtYXR0ZXIu
DQo+IE5vdCBzdXJlIHdoYXQgYXJlIHlvdSB0YWxraW5nIGFib3V0LCBoYXZlbid0IHdlIGluaXRp
YWxpemUgdGhlIGRldmljZSBhbmQgdnFzIGluDQo+IGNvbmZpZyBzcGFjZSBmb3IgeWVhcnM/Pz8/
Pz8gV2hhdCdzIHdyb25nIHdpdGggdGhpcyBtZWNoYW5pc20/DQo+IEFyZSB5b3UgcXVlc3Rpb25p
bmcgdmlyaXRvLXBjaSBmdW5kYW1lbnRhbHM/Pz8NCkRvbuKAmXQgcG9pbnQgdG8gaW4tZWZmaWNp
ZW50IHBhc3QgdG8gZXN0YWJsaXNoIHNpbWlsYXIgaW4tZWZmaWNpZW50IGZ1dHVyZS4NCg0KPiA+
DQo+ID4+Pj4gTGlrZSBob3cgdG8gc2V0IGEgcXVldWUgc2l6ZSBhbmQgZW5hYmxlIGl0Pw0KPiA+
Pj4gVGhvc2UgYXJlIG1lYW50IHRvIGJlIHVzZWQgYmVmb3JlIERSSVZFUl9PSyBzdGFnZSBhcyB0
aGV5IGFyZSBpbml0DQo+ID4+PiB0aW1lDQo+ID4+IHJlZ2lzdGVycy4NCj4gPj4+IE5vdCB0byBr
ZWVwIGFidXNpbmcgdGhlbS4uDQo+ID4+IGRvbid0IHlvdSBuZWVkIHRvIHNldCBxdWV1ZV9zaXpl
IGF0IHRoZSBkZXN0aW5hdGlvbiBzaWRlPw0KPiA+IE5vLg0KPiA+IEJ1dCB0aGUgc3JjL2RzdCBk
b2VzIG5vdCBtYXR0ZXIuDQo+ID4gUXVldWVfc2l6ZSB0byBiZSBzZXQgYmVmb3JlIERSSVZFUl9P
SyBsaWtlIHJlc3Qgb2YgdGhlIHJlZ2lzdGVycywgYXMgYWxsDQo+IHF1ZXVlcyBtdXN0IGJlIGNy
ZWF0ZWQgYmVmb3JlIHRoZSBkcml2ZXJfb2sgcGhhc2UuDQo+ID4gUXVldWVfcmVzZXQgd2FzIGxh
c3QgbW9tZW50IGV4Y2VwdGlvbi4NCj4gY3JlYXRlIGEgcXVldWU/IE52aWRpYSBzcGVjaWZpYz8N
Cj4gDQpIdWguIE5vLg0KRG8gZ2l0IGxvZyBhbmQgcmVhbGl6ZSB3aGF0IGhhcHBlbmVkIHdpdGgg
cXVldWVfcmVzZXQuDQoNCj4gRm9yIHN0YW5kYXJkIHZpcnRpbywgeW91IG5lZWQgdG8gcmVhZCB0
aGUgbnVtYmVyIG9mIGVuYWJsZWQgdnFzIGF0IHRoZSBzb3VyY2UNCj4gc2lkZSwgdGhlbiBlbmFi
bGUgdGhlbSBhdCB0aGUgZHN0LCBzbyBxdWV1ZV9zaXplIG1hdHRlcnMsIG5vdCB0byBjcmVhdGUu
DQpBbGwgdGhhdCBoYXBwZW5zIGluIHRoZSBwcmUtY29weSBwaGFzZS4NCg==

