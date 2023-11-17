Return-Path: <virtio-comment-return-8449-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9135FC072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:20:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 18C8EE6E2D
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:20:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7CDF2986E21
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:20:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DE39D986E20; Fri, 17 Nov 2023 11:20:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 694F4986E1E
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 11:20:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+3cYoIjTkbejnWQpKkaV2pksj+r9R2xCMXys3QCOAD4ldMv0/sI4Zzw6uo4vpWOPhmQs+4kNsmyHiH3z7+a/AyOdlaGo+9hQUvNyGi4AQRXNmXUNRV0AjU+lmEK1636GToQ8ui1Rr132OpblgKqu2QU5FqD6KmEV0j9l6/GKwRPH69ouy9dggVNID0oGATB2pop0LXoGiEtMhAxZqL18UgGIxN0zYzIBHwcUOHUCyxOISoP/zjkVwyUfaApwrau+9AEROkA+svdbqjqJLWW49+ejJbKleaFJmmN1gTPlg5fQojRuCkIwCu6fzEqUP5SUqcT8TWAbDhtohPKzSSK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCNIqAKxhNfqLOJ00LpUT7sVgdybjXsNe9PNyPseGWw=;
 b=L9m4Cyw1AztLoZN3UXcIzpnwHsEVQSQkVF5lSeqdBhvIjr3QJr0BoApUfgdSQNt3DaCq3VY4ydqaK0/epDGruZihYDSZp9blx/YiUf+dZ1tnCKc17KsTzst7uy20QDS/vCTHPTS4mOGvwrokb5lGioJoN2JQ6TkbunUbEld9O+KnpZ0U6bk+7ckUP0y6wWiReIAq9bndRbM5qM+vjY+nM6O7qLqXazcv0jnTwKHrLX28tZzIN0dixG+I6d/4/7yVRMiIkEZ0u8M636NXM8zbpHjDEiapAc9Q7r4nLkundYf7XCqZjaxfcfWHt/cewFjHc9kEtZsyk1jYTM5TUytKOg==
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
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCABizrAIAAD2aggAGUBACAAABcUIABWsEAgABcQLCAASo6AIAALsiAgAZSfICAAAYzAIABYc4AgAA+ffCAAULTgIAALVPAgAGlyQCAABp/kIAGUuiAgAAFiECAAWL9AIADJo4QgAY+aoCAA+XikIAC0e+AgAABs1CAAA/MAIAAAIgg
Date: Fri, 17 Nov 2023 11:20:14 +0000
Message-ID:
 <PH0PR12MB5481AB5ECF613D806C338C54DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEtKPPudHAXGbrOppwgRP=Umt-F0GNKeoajOGzgs+wvyLA@mail.gmail.com>
 <PH0PR12MB54815F58F470493FC516CDCCDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117050357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810D15E0897C2435697E39DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117060456-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117060456-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH0PR12MB7837:EE_
x-ms-office365-filtering-correlation-id: c5a19c6b-7b22-49b8-dede-08dbe75f2b83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 AhbT61MOC4pOTZQ8lC1oO7cMB/iewCfwzso9p4SPSwygk/enYaskoQ7V8FCeSl79c+xP53PtCuc5sr1gwKxXYKM3E1ySXjNwJOUBk1kQAH1GSklL8SCO11nxWp1uzxM2tF4NXPJ0STncASiTRLinLTaYywAFqrQxk722YdudnXEMJRqbj0Zw/CkATV/wJgIui/FxwbPdg6jlbwP8+WSt3r76O2tyM608lZyCmFU+lp/uhiZmndbNViKeYCTgHl97OWqcwr1MgThMTmLAWS5LH+IAnau38+qV60UWZTz1Vwm6wadyB1/dP7PLUwCd39n0nZIPCzZXA4vcsuuMWXj6IaYGbnRW4g2UCQEd+0SA4GpRBgMio2xxCNRc+JlqI62li4iCCOPQSNr6Tquty7A282n2kCpEnZ9vkOFQ3WipQgJohChWaDKFBOGJaO5JdcoDSdb9sY6sr/mnCM8FLeSc2mFJVu5EmCP6fff+J5SGrYFb6mc/UvcTZ4otg1L53227ttAv5qbT6QqCUBdpOd8rS5//N7Wogkf8ukjPanHCmdg6PGBXM0nEnw0r2v9FvuFWBOXzOvJ5mCjM74JITl7FB9JhRBSKXewq+DJsW92IrWAHnS/GmvKdkygb+vl5ZhARrMCoclArkDVqt7kvNwn8aO8gf72NA976bC+dov3x6sTT4zSlGeQzAcaHt2nnpKuP
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(396003)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(8676002)(66446008)(966005)(55016003)(66946007)(64756008)(54906003)(66556008)(107886003)(66476007)(316002)(6916009)(478600001)(8936002)(5930299018)(71200400001)(76116006)(52536014)(6506007)(7696005)(9686003)(4326008)(38100700002)(86362001)(41300700001)(33656002)(5660300002)(83380400001)(38070700009)(26005)(122000001)(55236004)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFdLellMSS9FeGl1VElDSE92VVRMeG5laG56TVRnZGU0KzRzRFVVcDFMM0oy?=
 =?utf-8?B?QkVFTUsxSzBIVnJzUEJ1T1hzQjFIS3B2dmxqUGllcTVjcWROZnBIQjNNaEFv?=
 =?utf-8?B?c0FRRDVEOWg2T1pBcG5qRUF4WHpMVW9zeHViOUpWSXJEYWRnSU5ERWRBd3Fj?=
 =?utf-8?B?TWJBMUR2bTBCcU1rT3hCRmNqc0dTRzQ5NnhtcVJYNkl6d3VwaGplQUpWQmtE?=
 =?utf-8?B?NXU4cE9qK0hFWjFCNG5kR2cwQWtlQTVaT0oyenUyY20xS2FRRjl6UiszcTh6?=
 =?utf-8?B?S1RicnZjL0lHUXJid3JabkJCb0FsRFJlL1ljb01iRzVsd0duY0ZPM09PZHVW?=
 =?utf-8?B?bGZ4TzQ3ZWdYTjVaMWt0cUlibGxDYlpVMzlZNnlTNkVwbGRZRDhpLzlKK2ZB?=
 =?utf-8?B?YjY0TDJXcFBPckpPSlZOOEVyazhhOWJKdFJMUjhWTGg5alg2UUsvSlBZbCtk?=
 =?utf-8?B?YVpScUdyQVpMRWRzOXVEOENTMWRBSk8xVDVoWGFjQmluTnlIdDBxbzhxcTlP?=
 =?utf-8?B?K0huSnAzUnYrZ1BNNmRJOThneU9PTUlzNTFNRTZwMThTZmFSWUZpRUNEVERG?=
 =?utf-8?B?cjFrNVpUMHNZRnNWT3ZMenhNdFRkWkgySGc5NFNDK2tIYzBDY3RLKzFxSXJB?=
 =?utf-8?B?bnhtd0xUVm1XZDBrMWJ3NndrZFFwSGxnYTVRcmZjZWpINzBodjh5Y2J1azhI?=
 =?utf-8?B?WHRGYSthWS9wNUoyTHI5OWVEdThDRDJ0TlExZFRVMUd3ZFpFeXkxZzBUUVcr?=
 =?utf-8?B?SzVSRmxxdzBPUVhMR1hqR0dPNWpUUm5SR0h3OUp4WmkyZXMvUjFramZOMGpm?=
 =?utf-8?B?RkpzZTg5NWhCcDRZdlNEdUFreVJEWU41dkVlc255RG1wWmVMWEtJbVVteTVI?=
 =?utf-8?B?d093Q092RHV0U3M0VHRWeVgraEVzY1VlTUhPVVVucUVISDF3VmlDUWUrK1M1?=
 =?utf-8?B?RlBzQ1loK1VFQ2NBdjBnalpWNENkTkQwcnRnRW9zTWpqVWp0TnhwaWVhUGRE?=
 =?utf-8?B?aTJTS1MzWXRVSWpoV0xGaVp2WmV2blB1SkZFd2hIMnpHVnR2TlFUeWgwUTU2?=
 =?utf-8?B?VEZNTE9FenNpQkRQYVBzRytBUG5tR1VxZFJ3NG9OakdKeFphMEQzaW93Y3kv?=
 =?utf-8?B?VEZWRGJpTUJKSFlaSysreWU2UzMzMlhNdElXQWlVMGtoZmNrbHVlM1NWZEVY?=
 =?utf-8?B?eVNEOEF1R2NSSk91dmtKRHdZY3d6LzUxTnJDU0RKUThPR0xEdDRGOTkxUUJC?=
 =?utf-8?B?aDk2djhpeWFqV0ZvYy9CL0VRV3h1VEVKU2tVZnhDc2RVNExjZVVadDhHZWc5?=
 =?utf-8?B?d2JsNmtUN0J2RDdZSldFdDFmbDNuUkRQR0tjSElsWHBScTZIRXRWc1RoY1Zj?=
 =?utf-8?B?WVhzd0dGc3htM2IzL0FTcTRBUWM3TTR6SjNKcUdMaXRKcXNDcTBQYVR0dmd1?=
 =?utf-8?B?MmR2V2dvOFBleDdyei9Mc1ZHeFkxOVlxNXYvN3I4RWlGNytSTXlVSmgxamsy?=
 =?utf-8?B?QTR6WmVQTUJnRHp1OW9sN3ZYYTlHWU9yVU0yYzdublFQOWRQSU5Ec0NDVmpo?=
 =?utf-8?B?ODdWcFgwdXhHbFFXSGFsckM1RXNLQktsWmxWd2pGTFJqbTZFZGx6SWtrOFpE?=
 =?utf-8?B?ZnU5T2tFMjJpV1JSb2tvK2x3ZUZIVXZCR2xNWHd1S2VpYXQyYkpWSlVCMTg2?=
 =?utf-8?B?S0x1ZzNKeHMxeXlNQ3A0WkFCWGRwbzZFTHFSY0FDQTh5N3o5SFhBVXN2Ukx2?=
 =?utf-8?B?MkhpelE0VUJFVUlIZ0poaUQzTlp4YjJpUS9qeDM0RFBZQnBBL2FVWmp1MWVP?=
 =?utf-8?B?bmI2elcrcEFvTGlUZTUwU3NPY3lGeVA4U1VrWHJkQmFscGEyUUlNSDJJUU5Y?=
 =?utf-8?B?MDhLRmQ4SEd2ZXdqbUNFcERNUHgvZGt3MGJBV0czQ3Zva09ZVUN3R05QOVlK?=
 =?utf-8?B?VnVMc3hKYm4zOHRtdDY4VEJhejIrZE9oOVVpNnBIZzV5cHJ0ZFlqbE1SeGdi?=
 =?utf-8?B?M3dIRkRSWUNBb2hIdHNmZFdJN2NtQTF5UnVPaTUxdlJsclJNb25xUUZxN0Nu?=
 =?utf-8?B?dlhzL3JicEkzWmIvY1Yra3NnQXFSb2pCYmR6Tk1sTWNValRDOFFFY3BrbTRp?=
 =?utf-8?Q?4A28=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a19c6b-7b22-49b8-dede-08dbe75f2b83
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 11:20:14.0835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LprkiF5kEUlL/9EaJ3yOGRbvjKB+UAc4FMeKVCVmSCkK7lFCzYAqnp20Azyb8xjQsZZu9q5IlTmbu+eiioimdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7837
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IEZy
aWRheSwgTm92ZW1iZXIgMTcsIDIwMjMgNDo0MSBQTQ0KPiANCj4gT24gRnJpLCBOb3YgMTcsIDIw
MjMgYXQgMTA6MjA6NDVBTSArMDAwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+DQo+ID4NCj4g
PiA+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+ID4gPiBTZW50
OiBGcmlkYXksIE5vdmVtYmVyIDE3LCAyMDIzIDM6MzggUE0NCj4gPiA+DQo+ID4gPiBPbiBXZWQs
IE5vdiAxNSwgMjAyMyBhdCAwNTozOTo0M1BNICswMDAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQWRkaXRpb25hbGx5LCBpZiBoeXBlcnZpc29yIGhhcyBw
dXQgdGhlIHRyYXAgb24gdmlydGlvIGNvbmZpZywNCj4gPiA+ID4gPiA+IGFuZCBiZWNhdXNlIHRo
ZSBtZW1vcnkgZGV2aWNlIGFscmVhZHkgaGFzIHRoZSBpbnRlcmZhY2UgZm9yDQo+ID4gPiA+ID4g
PiB2aXJ0aW8gY29uZmlnLA0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEh5cGVydmlzb3IgY2Fu
IGRpcmVjdGx5IHdyaXRlL3JlYWQgZnJvbSB0aGUgdmlydHVhbCBjb25maWcgdG8NCj4gPiA+ID4g
PiA+IHRoZSBtZW1iZXIncw0KPiA+ID4gPiA+IGNvbmZpZyBzcGFjZSwgd2l0aG91dCBnb2luZyB0
aHJvdWdoIHRoZSBkZXZpY2UgY29udGV4dCwgcmlnaHQ/DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJ
ZiBpdCBjYW4gZG8gaXQgb3IgaXQgY2FuIGNob29zZSB0byBub3QuIEkgZG9uJ3Qgc2VlIGhvdyBp
dCBpcw0KPiA+ID4gPiA+IHJlbGF0ZWQgdG8gdGhlIGRpc2N1c3Npb24gaGVyZS4NCj4gPiA+ID4g
Pg0KPiA+ID4gPiBJdCBpcy4gSSBkb27igJl0IHNlZSBhIHBvaW50IG9mIGh5cGVydmlzb3Igbm90
IHVzaW5nIHRoZSBuYXRpdmUNCj4gPiA+ID4gaW50ZXJmYWNlIHByb3ZpZGVkDQo+ID4gPiBieSB0
aGUgbWVtYmVyIGRldmljZS4NCj4gPiA+DQo+ID4gPiBTbyBmb3IgZXhhbXBsZSwgaXQgc2VlbXMg
cmVhc29uYWJsZSB0byBhIG1lbWJlciBzdXBwb3J0aW5nIGJvdGgNCj4gPiA+IGV4aXN0aW5nIHBj
aSByZWdpc3RlciBpbnRlcmZhY2UgZm9yIGNvbXBhdGliaWxpdHkgYW5kIHRoZSBmdXR1cmUgRE1B
DQo+ID4gPiBiYXNlZCBvbmUgZm9yIHNjYWxlLiBJbiBzdWNoIGEgY2FzZSwgaXQgc2VlbXMgcG9z
c2libGUgdGhhdCBETUEgd2lsbA0KPiA+ID4gZXhwb3NlIG1vcmUgZmVhdHVyZXMgdGhhbiBwY2ku
IEFuZCB0aGVuIGEgaHlwZXJ2aXNvciBtaWdodCBkZWNpZGUgdG8gdXNlDQo+IHRoYXQgaW4gcHJl
ZmVyZW5jZSB0byBwY2kgcmVnaXN0ZXJzLg0KPiA+DQo+ID4gV2UgZG9u4oCZdCBmaW5kIGl0IHJp
Z2h0IHRvIGludm9sdmUgb3duZXIgZGV2aWNlIGZvciBtZWRpYXRpbmcgYXQNCj4gPiBjdXJyZW50
IHNjYWxlDQo+IA0KPiBJbiB0aGlzIG1vZGVsLCBkZXZpY2Ugd2lsbCBiZSBpdHMgb3duIG93bmVy
LiBTaG91bGQgbm90IGJlIGEgcHJvYmxlbS4NCj4NCkkgZGlkbuKAmXQgdW5kZXJzdGFuZCBhYm92
ZSBjb21tZW50Lg0KIA0KPiA+IGFuZCB0byBub3QgYnJlYWsgVERJU1AgZWZmb3J0cyBpbiB1cGNv
bWluZyB0aW1lIGJ5IHN1Y2ggZGVzaWduLg0KPiANCj4gTG9vayB5b3UgZWl0aGVyIHN0b3AgbWVu
dGlvbmluZyBURElTUCBhcyBtb3RpdmF0aW9uIG9yIGFjdHVhbGx5IHRyeSB0byBhZGRyZXNzDQo+
IGl0LiBTYWZlIG1pZ3JhdGlvbiB3aXRoIFRESVNQIGlzIHJlYWxseSBoYXJkLg0KQnV0IHRoYXQg
aXMgbm90IGFuIGV4Y3VzZSB0byBzYXkgdGhhdCBURElTUCBtaWdyYXRpb24gaXMgbm90IHByZXNl
bnQsIGhlbmNlIGludm9sdmUgdGhlIG93bmVyIGRldmljZSBmb3IgY29uZmlnIHNwYWNlIGFjY2Vz
cy4NClRoaXMgaXMgYW5vdGhlciBodXJkbGUgYWRkZWQgdGhhdCBmdXJ0aGVyIGJsb2NrcyB1cyBh
d2F5IGZyb20gVERJU1AuDQpIZW5jZSwgd2UgZG9u4oCZdCB3YW50IHRvIHRha2UgdGhlIHJvdXRl
IG9mIGludm9sdmluZyBvd25lciBkZXZpY2UgZm9yIGFueSBjb25maWcgYWNjZXNzLg0KDQo+IEZv
ciBleGFtcGxlLCB5b3VyIGN1cnJlbnQgcGF0Y2hlcyBhcmUgY2xlYXJseSBicm9rZW4gZm9yIFRE
SVNQOg0KPiBvd25lciBjYW4gY29udHJvbCBxdWV1ZSBzdGF0ZSBhdCBhbnkgdGltZSBtYWtpbmcg
ZGV2aWNlIG1vZGlmeSBtZW1vcnkgaW4NCj4gYW55IHdheSBpdCB3YW50cy4NCj4NCldoZW4gVERJ
U1AgbWlncmF0aW9uIGlzIG5lZWRlZCwgdGhlIGFkbWluIGRldmljZSBjYW4gYmUgYW5vdGhlciBU
Vk0gb3V0c2lkZSB0aGUgSFYgc2NvcGUuDQpPciBhbiBhbHRlcm5hdGl2ZSB3b3VsZCBoYXZlIGRl
dmljZSBjb250ZXh0IGVuY3J5cHRlZCBub3QgdmlzaWJsZSB0byBIViBhdCBhbGwuDQpTdWNoIGVu
Y3J5cHRpb24gaXMgbm90IHBvc3NpYmxlLCB3aXRoIHRoZSB0cmFwK2VtdWxhdGlvbiBtZXRob2Qs
IHdoZXJlIEhWIHdpbGwgaGF2ZSB0byBkZWNyeXB0IHRoZSBkYXRhIGNvbWluZyBvdmVyIE1NSU8g
d3JpdGVzLg0KIA0KPiA+IEFuZCBmb3IgZnV0dXJlIHNjYWxlLCBoYXZpbmcgbmV3IFNJT1YgaW50
ZXJmYWNlIG1ha2VzIG1vcmUgc2Vuc2Ugd2hpY2ggaGFzDQo+IGl0cyBvd24gZGlyZWN0IGludGVy
ZmFjZSB0byBkZXZpY2UuDQo+ID4NCj4gPiBJIGZpbmFsbHkgY2FwdHVyZWQgYWxsIHBhc3QgZGlz
Y3Vzc2lvbnMgaW4gZm9ybSBvZiBhIEZBUSBhdCBbMV0uDQo+ID4NCj4gPiBbMV0NCj4gPiBodHRw
czovL2RvY3MuZ29vZ2xlLmNvbS9kb2N1bWVudC9kLzFJeW4tbDNObTB5bHMzcFphdWw0bFppVmo4
eDFzNzNFZDZyDQo+ID4gT3NtbjZMZlhjL2VkaXQ/dXNwPXNoYXJpbmcNCj4gDQo+IFllYSBza2lt
bWVkIHRoYXQsICJDb25zOiBOb25lIi4gQXJlIHlvdSAxMDAlIHN1cmU/IEFueXdheSwgZGlzY3Vz
c2lvbiB3aWxsDQo+IHRha2UgcGxhY2Ugb24gdGhlIG1haWxpbmcgbGlzdCBwbGVhc2UuDQoNCldl
IGNhbm5vdCBrZWVwIGRpc2N1c3NpbmcgdGhlIHJlZ2lzdGVyIGludGVyZmFjZSBldmVyeSB3ZWVr
Lg0KSSByZW1lbWJlciB3ZSBoYXZlIGRpc2N1c3NlZCB0aGlzIG1hbnkgdGltZXMgYWxyZWFkeSBp
biBmb2xsb3dpbmcgc2VyaWVzLg0KDQoxLiBsZWdhY3kgc2VyaWVzDQoyLiB0dnEgdjQgc2VyaWVz
DQozLiBkeW5hbWljIHZxIGNyZWF0aW9uIHNlcmllcw0KNC4gYWdhaW4gZHVyaW5nIHN1c3BlbmQg
c2VyaWVzIHVuZGVyIHR2cSBoZWFkDQo1LiByaWdodCBub3cNCjYuIE1heSBiZSBtb3JlIHRoYXQg
SSBmb3Jnb3QuDQoNCkkgY2FwdHVyZWQgYWxsIHRoZSBkaXJlY3Rpb24gYW5kIG9wdGlvbnMgaW4g
dGhlIGRvYy4gT25lIGNhbiByZWZlciB3aGVuIHRob3NlIHF1ZXN0aW9ucyBhcmlzZSB0aGVyZS4N
CklmIHdlIGRvbuKAmXQgd29yayBjb2hlc2l2ZWx5IHNhbWUgcmVhc29uaW5nIHJlcGV0aXRpb24g
ZG9lcyBub3QgaGVscC4NCg0K

