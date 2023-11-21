Return-Path: <virtio-comment-return-8502-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D86EC61D98
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 16:29:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 812383357C
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 16:29:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 61545986896
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 16:29:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4BE5A98688A; Tue, 21 Nov 2023 16:29:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3CFAA98688B
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 16:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfIZdgOSnCLLUEsmnNHjclONYKl4L76enwqCgKNDtsQCBfpFIs/lU9FCYKVnjSKur5xtrEEP7urvUJmxm2IuIxkNwfcM56dYI35ns7BGrIu9nsBfdvBVSh0Rm5pPAJyRhBRjEBxpEpy/vp7bErA1fSK17YsGmnhPiRaM/vrovn3eq/HWc/BFc2bgo9xTxlakx4Sl/dG2G02uNtyaTdegzhYH1Rk8r74cmRETVT1MXEyVFjhXBf9v7Xa/L3HtC0I9OiH/6QyFllZ4xX97suUniR/BZnH6D4yMZL5svYEA6ZpidDLvopBy/BNGAab7c02YOHSLbFzDmWwO/OKvYaxR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpHBP2HtRBt9IVa/kIw/KJ4WUhBIJrTjoCGlxsJgbuY=;
 b=SaAgJT5m8mvlhQzyDMaSZ+CMO/eXxU19uRAI9NKP4tsLbqvdmcdNbNU3D7np7i4BEYMTJVRLeUylQRKRX3k8KSfB+jVuoYVDIJRh4dRdPRFa5cXbnPUiVRpxIvfXwdg4Ek4goJZPxgZg4k05wWGwMOBXHdr2hdIChJYhLq3wEwGat12nPR235F9dmyM2BWFwYElKvhUJcUv53YeAGDlRBFU9u0VaKOA3jt5Y9z1k17KS4c83QrQa1BwfT0F5lDxmW2zBiMrloVZOiThYYXx5KEfTbr8fN3m/Hd8NVh5wFDOQO7MiQh/bsgPDimoLSpNo2fwJ9NbwfmtwMBwy/iOXKw==
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
Thread-Topic: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/CAAEWagIAATXNQgAAQ3wCAAAB/YIAADsiAgACQwGCAAGEbgIAAB4aggAAG2gCAAABcQIAAA3mAgAAAL+CAAAy2AIAAAzkwgAAMKgCAAA13IIAABX6AgAACmVCABcrCgIAApljQ
Date: Tue, 21 Nov 2023 16:29:36 +0000
Message-ID:
 <PH0PR12MB5481036FE38E03DDFAE1D13CDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117044428-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E8342B26739B852B592FDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117053117-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481632B9E440DDCBEEA7B75DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117062003-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548133582D377B3FE4BB9F6CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073917-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481CD9329189829A8A6B6D1DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtEEj8jXeE7JHyFk6UkBkEP5vpYzXPHHSGpSjDKQivJAg@mail.gmail.com>
In-Reply-To:
 <CACGkMEtEEj8jXeE7JHyFk6UkBkEP5vpYzXPHHSGpSjDKQivJAg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL3PR12MB6426:EE_
x-ms-office365-filtering-correlation-id: 6756810b-66fc-4f87-54cb-08dbeaaf0cf4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aRw8Maq3YyKstk7gQ6K1EiJPkjT3kdJrOCZkL3JmJ2BfA5vfxqRP9lTxHxcDQfG65LIpTYqBKkUMyM0BoXrUEn5BVnQ9dPH7o33tHalzvO7PWJIi3vTi2qSYA/XcCM9GI1k0lX2kuMA+8wDpk1Z+vI6SXFGfUVMTZ14mZ2lvuxdcNM+zRDR2IkF3LTM5eX8R0wSGY0sFzvkbrxHRxvTdGoLzE8ced0vXUk44dbnCCzh9SqtBh8kOafEFkE15PN4fYKR8ZJBl2cREy98y3DTIJVBJbSl16TfLOmPtFhU9ddajBqvX5qvNWs1fAk0++7Tcs8c67yGLHTS2mT9KDXsjQjwOV+D3cbUiJljKx1G12VuwQ8XphvGEJrdasnW2VX2DyP5HUgNgSglGkuNOJGYltpYjSxtnTsPOHPA1JZtYKlnHdNTMlUJ1/HouDHwuq4bkSyzCIDz2MLKEBJ5Y9abc1JTf7Qq5nnZ5qtGtq+UJqzwp2T0+CqcvyKQB5H4zl4zbUdYzVbmGzqHeoHMarqqWbU5zEi6lpwTF/mC6PN+AgZyHE7pO4r7lR7J4Ev7nV5H8U0t/TRW6dzcwQNpCWH0uC1ulbxOceLx6FazCq1IPDp7bpliBFsdxRXtR1Ohmnl3BHjQivhJucmkIaNM7VLhBbSTnF8og0MMT+dkr58kS6BI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(396003)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(66899024)(83380400001)(9686003)(26005)(53546011)(52536014)(4326008)(8676002)(8936002)(38100700002)(41300700001)(2906002)(478600001)(5660300002)(966005)(76116006)(6506007)(7696005)(66946007)(54906003)(6916009)(71200400001)(316002)(64756008)(66476007)(66556008)(66446008)(122000001)(33656002)(86362001)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TnFjWUpqUGtpVWpiaCtTQmwwekhlQXFrMDlMemowTm5RS0JjZHFPK2VJd2VY?=
 =?utf-8?B?ZVV0VkdDdG9CN2NUK29hTXpaSDdOcEljbTJlUWY5K3AxYjh3ekkwUk8wTXox?=
 =?utf-8?B?TzVvMWFzNDFxZHlLckMvNk83UHNnN1hhL1hvSExGSW9ZbExsODYvcHBmT1F0?=
 =?utf-8?B?K0tWS1VJZzFUVnlRNXU0ZVpTMGVvRXB2WDFFK25YZ01yRGZPbmJRSlM0aVdE?=
 =?utf-8?B?RmVESVdVYUdNb0JVMmZRbEJRdXlOYmFxZGM2aDRPVFQzcktwQzQ1TjYwQlZD?=
 =?utf-8?B?WGZidnlabmk0WTJZeDlNVmpmK0JtdWhaUG9qK29uVU15NTh4K0M2NGkvOG5R?=
 =?utf-8?B?bFh0emZxdVIxeGt3b2h6eG5DamhoOGtwUVVSUVUvYUVlaG9xTFRtOXVJWGV1?=
 =?utf-8?B?akFpOHpqVUhxZ0h3QkRob1pTdHduY0dTZm4vMkdiOGhxOG8wc2t6aHhpd1ZM?=
 =?utf-8?B?MEFmUk14ZE92SUhkKzZPQ1V4SE9ybHRKamFoU28zSW9zUGxJVlhycW9EOW4r?=
 =?utf-8?B?eWc2WE9QcmNJQ3hZdVlUUE9xZVA5VVhzK2xHYVJ1MS9WUkhQM0tEQWtGSnR4?=
 =?utf-8?B?WVo5c2p1VVNRbHF5a2hKUGdwQVp3ZHh1MnJ1bHRDRDAxYjl6eXA1d0J1OWRQ?=
 =?utf-8?B?cDB3b1dyZTIwVmhoMjZKMVpwRHYrRm5BaVZ4N0hYdkNBSzgrN0xyNzY0RnZJ?=
 =?utf-8?B?ckpPYWxEbkRSbzVZMmhkNzNWdEd6bkhmazR6MWVLay8xVU1wWkVoRlpZZnhE?=
 =?utf-8?B?WGhtcEYxdEpoR2xPR3dWeVI5RXc5NnVBSlJ3dmhXQ1RLUkc4eDQvZXZvek85?=
 =?utf-8?B?djJGRmQwYTR6MTYyRmVWRk52WjJ2UGljTW03a1Bvc3kycnlCLzdONys5RVNU?=
 =?utf-8?B?M2xjTEtTZzk0anZDSlBDaVBMVEVpaVNjUG5WV0VrNWdDUERuNktyYkFjMDhs?=
 =?utf-8?B?VVI4bEZteVRRMFFnVFBnR2doTkZjRE05dkRMdkY0eW9qbVRGdVViNy9FbGEz?=
 =?utf-8?B?dTBoMFlWL2pVZzRwRklWMlVBVGdFbS9ONXJxemthdzdheVMxOXkyZGJkaWpy?=
 =?utf-8?B?eXZDb3FjZVQvOE96L3JWY1dMdVZrbWJsY3BRUGkvWmkrUXVETEtPMmh5QU5V?=
 =?utf-8?B?V0dORi9QNDhOenZHQVlsNVdCLzRCKy9OemQ1TVpLOS91bFIrQTQ2ak52dG93?=
 =?utf-8?B?RlRBNE9oMDRmUjNJU0FLQTYrNDR3MVo1NmpFMlVuc2FNekc2TThMRWdRVXBp?=
 =?utf-8?B?cHJET0EyMXp3VVhJWElGNWhGMWNtUXB2OS9yNXJRVCs5REhwMDdyZU16bHlh?=
 =?utf-8?B?TnpCbmYyay9NWTRicFJuWm00UHZIaEJ0U2tHSHMwaGJYNkJOUmpIMU93Ty9u?=
 =?utf-8?B?Y0J2eWxtZUpqVWZWSE80b0VZdkxWNEt6TlgyTXlBd2pXVFBDWDMrV1JSVGE0?=
 =?utf-8?B?V2FHQ1FKR1FaamVuRkY0QjRNUjZSekZEM2NMekxRYlUwY01CMjY5ekhlRktG?=
 =?utf-8?B?MXVjUGwyRnRKQ2oxS2Z3MW5KUE5ieXpyVWg5bVdxa3VweExEZnllZ1djeG1y?=
 =?utf-8?B?cmRmNjhNNUo4ejYwWUpSdWtLTDFLM3Yvd2QwekJmdWFPay9rZWtadW1JUU9i?=
 =?utf-8?B?Z29tcnpVODFyU3N3eVFrcUVPakhQbUpXamJCRUcrZUVZYzVMKzRSNDNuWVQy?=
 =?utf-8?B?aVBSSHBkQXYrSjA4cUVKWEZrMHl2K2Q1L09RcUVmbHoyZjd4UHQzdVNyQW5l?=
 =?utf-8?B?ajh6OEt6T2RZQy94cnFPYUxlME9CL0treEZGYk5Mdkdodndqa29neEIwNWN3?=
 =?utf-8?B?b0Q0Yk9wTjIremI1MjhzejJkYXE1WEVIcm5LajJkSXRyUXRDM3k1a29uKzdO?=
 =?utf-8?B?UWpjSE5NUVJLam5lYUlRUUxKNGFpVWd4ZEhFWjlkOEpObVY1QW4yU1J0Y3Er?=
 =?utf-8?B?akdRNW5CUU94VmtnY0JGbnF5QlVJN2lzRGxzRnJ4bzFQMXI1d05XUDFrT3Vs?=
 =?utf-8?B?eTZST2xsT0FjNHRWWjhqNmFsQ0o1THk2aEJhUkVHM0NyVnRTSitPZmgvVGFP?=
 =?utf-8?B?WVNWMHltY0NjbW9OTHJEK1dtTkxnWnBMNlpwYWVRZDd3NURwSVFHSGFmUGZq?=
 =?utf-8?Q?6n2o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6756810b-66fc-4f87-54cb-08dbeaaf0cf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 16:29:36.0281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l48XiW+kdS4yyy6bLdb8l80j5234J/Efo2cYG2D07ISnrvtRo1Xhadsd+hqcckVdfOE+9hb+tvku8s/AU6YHYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6426
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIE5vdmVtYmVyIDIxLCAyMDIzIDEwOjQ3IEFNDQo+IA0KPiBPbiBGcmksIE5vdiAxNywgMjAy
MyBhdCA4OjUx4oCvUE0gUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPiB3cm90ZToNCj4g
Pg0KPiA+DQo+ID4gPiBGcm9tOiB2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy1vcGVuLm9yZw0K
PiA+ID4gPHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLSBvcGVuLm9yZz4gT24gQmVoYWxmIE9m
IE1pY2hhZWwgUy4NCj4gPiA+IFRzaXJraW4NCj4gPiA+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIg
MTcsIDIwMjMgNjoxMSBQTQ0KPiA+ID4NCj4gPiA+IE9uIEZyaSwgTm92IDE3LCAyMDIzIGF0IDEy
OjIyOjU5UE0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4NCj4g
PiA+ID4gPiBGcm9tOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0KPiA+ID4g
PiA+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMTcsIDIwMjMgNTowMyBQTQ0KPiA+ID4gPiA+IFRv
OiBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+DQo+ID4gPiA+DQo+ID4gPiA+ID4gPiBT
b21laG93IHRoZSBjbGFpbSBvZiBzaGFkb3cgdnEgaXMgZ3JlYXQgd2l0aG91dCBzaGFyaW5nIGFu
eQ0KPiA+ID4gPiA+ID4gcGVyZm9ybWFuY2UNCj4gPiA+ID4gPiBudW1iZXJzIGlzIHdoYXQgSSBk
b24ndCBhZ3JlZSB3aXRoLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSXQncyB1cHN0cmVhbSBpbiBR
RU1VLiBUZXN0IGl0IHlvdXNlbGYuDQo+ID4gPiA+ID4NCj4gPiA+ID4gV2UgZGlkIGZldyBtaW51
dGVzIGJhY2suDQo+ID4gPiA+IEl0IHJlc3VsdHMgaW4gYSBjYWxsIHRyYWNlLg0KPiA+ID4gPiBW
aG9zdF92ZHBhX3NldHVwX3ZxX2lycSBjcmFzaGVzIG9uIGxpc3QgY29ycnVwdGlvbiBvbiBuZXQt
bmV4dC4NCj4gPiA+DQo+ID4gPiBXcm9uZyBsaXN0IGZvciB0aGlzIGJ1ZyByZXBvcnQuDQo+ID4g
Pg0KPiA+ID4gPiBXZSBhcmUgc3RvcHBpbmcgYW55IHNoYWRvdyB2cSB0ZXN0cyBvbiB1bnN0YWJs
ZSBzdHVmZi4NCj4gPiA+DQo+ID4gPiBJZiB5b3UgZG9uJ3Qgd2FudCB0byBiZW5jaG1hcmsgYWdh
aW5zdCBhbHRlcm5hdGl2ZXMgaG93IGFyZSB5b3UNCj4gPiA+IGdvaW5nIHRvIHByb3ZlIHlvdXIg
c3R1ZmYgaXMgd29ydGggZXZlcnlvbmUncyB0aW1lPw0KPiA+DQo+ID4gQ29tcGFyaW5nIHBlcmZv
cm1hbmNlIG9mIHRoZSBmdW5jdGlvbmFsIHRoaW5ncyBjb3VudC4NCj4gPiBZb3Ugc3VnZ2VzdCBz
aGFkb3cgdnEsIGZyYW5rbHkgeW91IHNob3VsZCBwb3N0IHRoZSBncmFuZCBudW1iZXJzIG9mDQo+
IHNoYWRvdyB2cS4NCj4gDQo+IFdlIG5lZWQgYW4gYXBwbGUgdG8gYXBwbGUgY29tcGFyaXNvbi4g
T3RoZXJ3aXNlIHlvdSBtYXkgYXJndWUgd2l0aCB0aGF0LA0KPiBubz8NCj4gDQpXaGVuIHRoZSBy
ZXF1aXJlbWVudHMgYXJlIG1ldCB0aGUgY29tcGFyaXNvbiBjYW4gYmUgbWFkZSBvZiB0aGUgc29s
dXRpb24uDQpBbmQgSSBkb27igJl0IHNlZSB0aGF0IHRoZSBiYXNpYyByZXF1aXJlbWVudHMgYXJl
IG1hdGNoaW5nIGZvciB0d28gZGlmZmVyZW50IHVzZSBjYXNlcy4NClNvIG5vIHBvaW50IGluIGRp
c2N1c3Npbmcgb25lIE9TIHNwZWNpZmljIGltcGxlbWVudGF0aW9uIGFzIHJlZmVyZW5jZSBwb2lu
dC4NCk90aGVyd2lzZSBJIHdpbGwgZW5kIHVwIGFkZGluZyB2ZmlvIGxpbmsgaW4gdGhlIGNvbW1p
dCBsb2cgaW4gbmV4dCB2ZXJzaW9uIGFzIHlvdSBhcmUgYXNraW5nIHNpbWlsYXIgdGhpbmdzIGhl
cmUgYW5kIGJlaW5nIG5vbiBuZXV0cmFsIHRvIHlvdXIgYXNrLg0KDQpBbnl3YXksIHBsZWFzZSBi
cmluZyB0aGUgcGVyZiBkYXRhIHdoaWNoZXZlciB5b3Ugd2FudCB0byBjb21wYXJlIGluIGFub3Ro
ZXIgZm9ydW0uIEl0IGlzIG5vdCB0aGUgY3JpdGVyaWEgYW55d2F5Lg0KDQo+ID4NCj4gPiBJdCBp
cyByZWFsbHkgbm90IG15IHJvbGUgdG8gcmVwb3J0IGJ1ZyBvZiB1bnN0YWJsZSBzdHVmZiBhbmQg
Y29tcGFyZSB0aGUgcGVyZg0KPiBhZ2FpbnN0Lg0KPiANCj4gUWVtdS9LVk0gaXMgaGlnaGx5IHJl
bGV2YW50IGhlcmUgbm8/IEFuZCBpdCdzIHRoZSB3YXkgdG8gZGV2ZWxvcCB0aGUNCj4gY29tbXVu
aXR5LiBUaGUgc2hhZG93IHZxIGNvZGUgaXMgaGFuZHkuDQpJdCBpcyByZWxldmFudCBmb3IgZGly
ZWN0IG1hcHBlZCBkZXZpY2UuDQpUaGVyZSBpcyBhYnNvbHV0ZWx5IG5vIHBvaW50IG9mIGNvbnZl
cnRpbmcgdmlydGlvIGRldmljZSB0byBhbm90aGVyIHZpcnR1YWxpemF0aW9uIGxheWVyIGFuZCBy
dW4gYWdhaW4gYW5kIGdldCBhbm90aGVyIHZpcnRpbyBkZXZpY2UuDQpTbyBmb3IgZGlyZWN0IG1h
cHBpbmcgdXNlIGNhc2Ugc2hhZG93IHZxIGlzIG5vdCByZWxldmFudC4NCkZvciBvdGhlciB1c2Ug
Y2FzZXMsIHBsZWFzZSBjb250aW51ZS4NCg0KPiANCj4gSnVzdCBhbiBlbWFpbCB0byBRZW11IHNo
b3VsZCBiZSBmaW5lLCB3ZSdyZSBub3QgYXNraW5nIHlvdSB0byBmaXggdGhlIGJ1Zy4NCj4gDQo+
IEJ0dywgaG93IGRvIHlvdSBkZWZpbmUgc3RhYmxlPyBFLmcgZG8geW91IHRoaW5rIHRoZSBMaW51
cyB0cmVlIGlzIHN0YWJsZT8NCj4gDQpCYXNpYyB0ZXN0IHdpdGggaXBlcmYgaXMgbm90IHdvcmtp
bmcuIENyYXNoaW5nIGl0Lg0KQWxsIG9mIHRoaXMgaXMgY29tcGxldGUgdW5yZWxhdGVkIGRpc2N1
c3Npb24gdG8gdGhpcyBzZXJpZXMgdG8gc2xvdyBkb3duIHRoZSB3b3JrLg0KSSBkb27igJl0IHNl
ZSBhbnkgdmFsdWUuDQpNaWNoYWVsIGFza2VkIHRvIGRvIHRoZSB0ZXN0LCB3ZSBkaWQsIGl0IGRv
ZXMgbm90IHdvcmsuIEZ1bmN0aW9uYWxseSBicm9rZW4gY29kZSBoYXMgbm8gY29tcGFyaXNvbi4N
Cg0KPiBUaGFua3MNCj4gDQo+ID4NCj4gPiBXZSBwcm9wb3NlIGRldmljZSBjb250ZXh0IGFuZCBw
cm92aWRlZCB0aGUgbnVtYmVycyB5b3UgYXNrZWQuIE1vc3RseQ0KPiB3b250IGJlIGFibGUgdG8g
Z28gZmFydGhlciB0aGFuIHRoaXMuDQo+ID4NCj4gPiBUaGlzIHB1YmxpY2x5IGFyY2hpdmVkIGxp
c3Qgb2ZmZXJzIGEgbWVhbnMgdG8gcHJvdmlkZSBpbnB1dCB0byB0aGUNCj4gPiBPQVNJUyBWaXJ0
dWFsIEkvTyBEZXZpY2UgKFZJUlRJTykgVEMuDQo+ID4NCj4gPiBJbiBvcmRlciB0byB2ZXJpZnkg
dXNlciBjb25zZW50IHRvIHRoZSBGZWVkYmFjayBMaWNlbnNlIHRlcm1zIGFuZCB0bw0KPiA+IG1p
bmltaXplIHNwYW0gaW4gdGhlIGxpc3QgYXJjaGl2ZSwgc3Vic2NyaXB0aW9uIGlzIHJlcXVpcmVk
IGJlZm9yZQ0KPiA+IHBvc3RpbmcuDQo+ID4NCj4gPiBTdWJzY3JpYmU6IHZpcnRpby1jb21tZW50
LXN1YnNjcmliZUBsaXN0cy5vYXNpcy1vcGVuLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiB2aXJ0aW8t
Y29tbWVudC11bnN1YnNjcmliZUBsaXN0cy5vYXNpcy1vcGVuLm9yZw0KPiA+IExpc3QgaGVscDog
dmlydGlvLWNvbW1lbnQtaGVscEBsaXN0cy5vYXNpcy1vcGVuLm9yZw0KPiA+IExpc3QgYXJjaGl2
ZTogaHR0cHM6Ly9saXN0cy5vYXNpcy1vcGVuLm9yZy9hcmNoaXZlcy92aXJ0aW8tY29tbWVudC8N
Cj4gPiBGZWVkYmFjayBMaWNlbnNlOg0KPiA+IGh0dHBzOi8vd3d3Lm9hc2lzLW9wZW4ub3JnL3do
by9pcHIvZmVlZGJhY2tfbGljZW5zZS5wZGYNCj4gPiBMaXN0IEd1aWRlbGluZXM6DQo+ID4gaHR0
cHM6Ly93d3cub2FzaXMtb3Blbi5vcmcvcG9saWNpZXMtZ3VpZGVsaW5lcy9tYWlsaW5nLWxpc3Rz
DQo+ID4gQ29tbWl0dGVlOiBodHRwczovL3d3dy5vYXNpcy1vcGVuLm9yZy9jb21taXR0ZWVzL3Zp
cnRpby8NCj4gPiBKb2luIE9BU0lTOiBodHRwczovL3d3dy5vYXNpcy1vcGVuLm9yZy9qb2luLw0K
PiA+DQoNCg==

