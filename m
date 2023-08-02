Return-Path: <virtio-comment-return-6966-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DD3C00528
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:44:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C65C21CA242
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:44:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AD4F1986689
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:44:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9B44098660F; Wed,  2 Aug 2023 11:44:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8719098662A;
	Wed,  2 Aug 2023 11:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvDnDOx8EDKIGKPsFS/HGhb5MPM8YvMsgCbSf6sUYcbfxwxQU54a4kxK1vJ6v/I3nEKPwgQGcHAwGHfjZuFyhFsAUJO/L5qjQYvJVE0MvWUmqtjUN6nigAzoTMid5dDXcCAGwRIu7OqeFNxmby8VSCtxQIoAxJ5qYrTmuIoCGc4PW9Zk5fZYcyABSuyZSiipzrm6CWhxs61nCm8Cgl/tk8JZV2dCGQx+nRXqbAcbHF224r4srpNJI3yR/9Fqewa+fIPad0Lj4Leug3hQXVjczMyVlUmGM1kFmyyICVpz9I/R0L/IfXZfwW75IAAvFb8kSj6Sxdy74+k3KMJ+DJNW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ujd95nf98Aat56VWtjhgv4xsuXzIK1ycmv92DMkYgO0=;
 b=FpDkOWzdhQdV1G9Kw3hAV+l4vGRDSbYbbufAR2oE5uLXyHlguSJzHos6B/73tljmLoPRUddWyDtC6+gstEcrfCjjNdVQRAEeofLIO2iOupQUR50PRXRihD+hQnbLyML7582tHvXDa9vQRISs0AgbNeaLRqag4GPbjdj04teoWeoINhTYfq776PHCMje6Ki8ymBWfjkptn5uHVuCHRlsjPE0RHiyn1RJLWHNqvf9nqC7GzVX/YaL8HkNI9CWGvbMVwlXHi0nNbVsyW2DQr132e01K9UHSalFc5jEwZTuQpzpw+9TtFyPZ/dvupCUPxmwJ3jUmRbHjsWniEdY6N6dSwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>
Thread-Topic: [virtio-comment] Re: [virtio] RE: [virtio-comment] proposal: use
 admin command (and aq) of the device to query config space
Thread-Index:
 AdnERrUyzvIBkM4LRwukraLndwiuSgA2AnqAAABG9JAAARbHAAAALBowAAPNDQAAAAhQYAAAbk0AAAAHLlA=
Date: Wed, 2 Aug 2023 11:44:46 +0000
Message-ID:
 <DM8PR12MB54804B56DDF38E56DF7FF4F4DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsDo8dKSwD=Uovo=ekussqQmA8kf90jzuRoDBZs2B-GTw@mail.gmail.com>
 <PH0PR12MB548134EA03AE48ACD6F422CADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvHjAkbQ1D_PNhObpZ00g3P=E7Bzj3RvBPpst6cCFTWcQ@mail.gmail.com>
 <PH0PR12MB5481ABF25620784987149809DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802071603-mutt-send-email-mst@kernel.org>
 <DM8PR12MB548071770075800FD9020D27DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20230802073700-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230802073700-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|CH3PR12MB7522:EE_
x-ms-office365-filtering-correlation-id: fdbb0c04-c1fd-49ef-caa6-08db934ddf1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 IlZ1Akn+yucUbudpWFTardN5fIrrKCPPTYz0L8LU+7UKg5YjLdI+V0kmnAqXUH5LZrFL4XKODr2gUkKG1Bckwoqt/YnwO3Y7QMRY2cPadadSRH+L1Jun5DM5QvV1v8QPe/RwJNG9DnTXGrjrk8gnBUNAYvQ4hVBWcdPfEKWBl36Q/OopSO9tgHhzWzRSW6X27xa4qch/iN7ODJshMYr1M2JXQtPlMWolhexMN9NWuMtkkRbp7hhQCjxydmBNdgqd3SyizYE3d/OwY8ugcSQoVo4e8Oi5S29sMTzgLDeH2yUo2FOP0TnuuYCRQbf47b8C89hSKY7mDDnik0lrkNMUorC5+7E6Uh7M1FLTb6VUgQ+mTEKR4AeQjuRkbRSifJUiicvK+uZ8iCPzspv8nkYktAUfudAKVCGd6E5k4ypHrywG5JEj3GscMBnni3wYDBoYKOX1DndcKqkkrHXmv5+lBX7KNnQF/SlJxtVJrrYyE7oRnyOc+adEZc07WL83Yy6fu74OxTf41+b5SNzP7tocgzlVXnA6MFUyTOA4nccE9TPvMhfVPqb33E2l8FXLayMCWsE+oZua62+64ng30DG6tar6qxoBmQkUaeOCgKYxaHndr3CfrTwHkIe7MHD53itn5pqHs93fvKW+41nL3eQJajXj2bbpVGgZ8Flo74pI/sc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(33656002)(86362001)(38070700005)(38100700002)(122000001)(6916009)(4326008)(316002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(8936002)(8676002)(41300700001)(5660300002)(52536014)(478600001)(54906003)(2906002)(6506007)(83380400001)(7696005)(9686003)(71200400001)(186003)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3JwLzRGV0lZdXNvUGh5c0xRT052MFp5a1d3OHlRalVtTFk0Zm8yTnlXZDVG?=
 =?utf-8?B?aG45My9RMEp6WnRBRXhJNWN4OFVHSVRzQVlhNndpd0VEUW9CWUVPS1F5aW5G?=
 =?utf-8?B?Q2dLRlpmQ0ZEL0grUFRuRWtaVTRVbG94ckxPZGpLVklHL0p5OUFqSkVSeVZL?=
 =?utf-8?B?c1B5VjN3L2l5RXUraUI5d0RLUVZ4MkY3UjU1SjdBR0g3K3hObnpoZktPaGpz?=
 =?utf-8?B?Y1B2eVNaK0h5N094L2FKUnU1WEhWb2I0U3VZdU9PRTFMVmJHTzNqelJ2ZFBU?=
 =?utf-8?B?MEUrWU05NHdkOUV5QmRUbnNOK2MybVBrQWJjUTcvN3hPbitxazA0V0ROSnJW?=
 =?utf-8?B?Z0tMODV3cTJWZU5kN2QxM0RCakhaeVpUakM0aENrSWFleG5yOC92bkRpY0Vz?=
 =?utf-8?B?a3l3ZDkyVW1pMWZwaXErWVg1SXlmRkZmb2pCYUZrMmdrOUx4UjZ4dC9OYk93?=
 =?utf-8?B?Y2YrZkZpSCtvamtaRUhLcXpSNFFNNFhUNFp5eUNHMW15cktYOHlOL1RHTFo3?=
 =?utf-8?B?QklrZS9qb0ZtVG9RUEw5QkovdmRNTE40eEZhMTRocGVoWStrZmtUeTZydXFL?=
 =?utf-8?B?a0pudE9TMk45dWlzVmtkdU12Z1c4STBERThEdXVNMitvYTk1b1RsblNVUU1P?=
 =?utf-8?B?ZE1sbHVuVm1oUVZQRE5PdTRUTjVHaEdVS3FJakU2MnNjSndEL28zM1V0bW94?=
 =?utf-8?B?aG4wbGkzMFp5SnlIdkgvbHBEYk9oY1V1RlVjSjJYbmxKSVFIRkoyR25nVWtX?=
 =?utf-8?B?RWdIbEIwRXFmOTN0NmJsbk1iNHpLNUpHSlJuTGg1S2pBYTNTbnVJVmszSnJo?=
 =?utf-8?B?UFNTTDE0d045OTMvZGlxb1NpWThaaU1pSXdHQmp0YXRUVUVBWjJRUGlIODVG?=
 =?utf-8?B?WmRDMzZEbnNENkV0NG5TcllvUUJXNDZWQTdUd0NjQjFtdHAxR0p0VnR2T1BK?=
 =?utf-8?B?M1FGYk5OLzZGQ1lQNlNsNTlKN2xPcjBDQ0dmVmVxeS8rQUE2Ykx0M29JYit2?=
 =?utf-8?B?UDZGL1BpNDFYREtXV1dJRU9uTU52UW9TZDAzdFZ2RTZTL0R2NVduZ0xmN0Zq?=
 =?utf-8?B?dXI1ZEJDUndEL0RUSE4rRjZydTRTd2xYeUd6cERyLzYyNUdpUHMvcTEyYita?=
 =?utf-8?B?QnFETXova0NjSlE2QVR6NkREdlowR0xBQXpZOEJxQnRLbWtidnVHKzFTa1Fh?=
 =?utf-8?B?ejViSnRITm82QUtSTFZzcUp5MXlWc1J4YUtIQ3lCVlZnd3lNR2UzYVNYZ1c1?=
 =?utf-8?B?aHZnYW4wcEdVREs2WmJBMEIzVnl0dUdwbUZaTFgwVTVhaDBPK2MyamlPNlFS?=
 =?utf-8?B?SktGcnZNY1djRGdVcE52SUw1U2NZTlNGbW5salcrWXErTEw1NW53c0xRQTBl?=
 =?utf-8?B?NzNuL3lYeEVaaXNyYkFuVEVuOVlGSWkxcVVqNm9QbGJ5ckk0WVI3TUdsRWo0?=
 =?utf-8?B?NWI5aWlaUi9FQXExR0grZElXNVU3a0V1aVNMZmpKalRMdjZmZExVSHU4VnBW?=
 =?utf-8?B?c2kxcEpqUGJLdmpEUW1HQzhZeWU4SG4wN2VRTEoyVmd6SWRDZ3ZrZTlXd3lP?=
 =?utf-8?B?aFY1a05xemQ4clVNZjVhdGRIdzNjSVZwdzg4TExHR3E0L01FUnhETXhyNWRQ?=
 =?utf-8?B?czZPT0JSOXVuazZiYWpLd1RmZVArVWJFaDJPaCtLYXp2SmRkRWNVZXArWVBL?=
 =?utf-8?B?MGgxOS9NMzFkNisrbGxZVTVMaGtFZHVuaXZpTVlxWTV1c0RzSDZRTGZlYWVZ?=
 =?utf-8?B?Zmk4cVJMN2hmL2xyRTh4N1o0K25QRm52allVMG52VjZTT0VLZzNhV0QwL0Fj?=
 =?utf-8?B?RjFuTnVxUGhZS3FVSVFPTXFvTlZUdEhsbGlsRW1CMndSN29FcEtiQldidEJy?=
 =?utf-8?B?T3JENjd0Q1lmVzNZTWVpeFdGY0JWK1RYS0Z4K0RHd0FhMUwwTW40QWVXMDhO?=
 =?utf-8?B?S0tkMjBscS9ONFBlaGw2V1VJVU9WNW5WclF5RUV2WkxobG1RR0lkek5nRGZl?=
 =?utf-8?B?N3czSVlnU052U2k5NGJoNUlPU2F5STN6R1VscEdoWXk4VmtENEFZakRmUWs2?=
 =?utf-8?B?YWR1c1FsSHlRWXNOQXB0MzJOVVZiYmdReVFtR0NsQWZ6T2wyLzRzaGdBOENG?=
 =?utf-8?B?UkFlSExhRzJtbFpacGlHVXpmYlNqVjRXTzRRaDJYUyt2ZUQ2UEVUZkZidWN0?=
 =?utf-8?Q?fEIwKtpL3Allp7cOs/A9mC8pDyxWrmX+y8fUpnLIHPMM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdbb0c04-c1fd-49ef-caa6-08db934ddf1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 11:44:46.7879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hMWzHh0VNwAUtDrCf+JU4lyzFjV1WsN7O1ylh+5LEteW8K9mZSKaarVYM8rVumycGi18n+UtlsLLja9MwUYqrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7522
Subject: RE: [virtio-comment] Re: [virtio] RE: [virtio-comment] proposal: use
 admin command (and aq) of the device to query config space

DQoNCj4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmcgPHZpcnRpby1j
b21tZW50QGxpc3RzLm9hc2lzLQ0KPiBvcGVuLm9yZz4gT24gQmVoYWxmIE9mIE1pY2hhZWwgUy4g
VHNpcmtpbg0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAyLCAyMDIzIDU6MDkgUE0NCg0KDQo+
ID4gU3VyZSwgZGV2aWNlIGNvbmZpZyBpcyB0aGUgcmVhbCBwYWluIHBvaW50IHdlIGFyZSB0cnlp
bmcgdG8gc29sdmUgZmlyc3QuDQo+ID4NCj4gPiBVc2luZyBjdnEgZm9yIHRob3NlIGRldmljZXMg
d2hvIGhhcyBpdCBzZWVtcyB0aGUgbW9zdCBvcHRpbWFsIGFwcHJvYWNoLg0KPiA+IElmIHdlIGxp
YmVyYXRlIG91cnNlbHZlcyBmcm9tIHNpbmdsZSBtb25vbGl0aGljIGNvbmZpZyBzcGFjZSBzdHJ1
Y3R1cmUgYW5kDQo+IG1vdmUgdG8gcXVlcnkgZGV2aWNlIGNhcGFiaWxpdGllcywgcmVzb3VyY2Vz
LCBjb25maWd1cmF0aW9uLCBhdCBmdW5jdGlvbmFsaXR5DQo+IGxldmVsLCBsaWZlIGlzIGxvdCBl
YXNpZXIuDQo+ID4gV2hhdCBhcmUgeW91ciB0aG91Z2h0cz8NCj4gDQo+IFNwbGl0dGluZyB0cmFu
c3BvcnQgYW5kIGRldmljZSBjb25maWcgaXMgZXhhY3RseSB3aGF0IEknbSB0YWxraW5nIGFib3V0
Lg0KPiBJIGFncmVlIHRyYW5zcG9ydCBzaG91bGQgcHJvYmFibHkgYmUgc3BsaXQgZnVydGhlciAt
IGl0IG9ubHkgbWFkZSBzZW5zZSBmb3IgbGVnYWN5DQo+IHNvIHdlIGRvbid0IG5lZWQgdG8gc3Bl
bmQgc3BlY2lmaWNhdGlvbiBlZmZvcnQgb24gbGVnYWN5Lg0KPiBzcGxpdHRpbmcgZGV2aWNlIGNv
bmZpZyB3b3VsZCByZXF1aXJlIGNoYW5nZXMgdG8gYWxsIGRldmljZXMgLSBJIGRvbid0IHNlZSBo
b3cgaXQncw0KPiB3b3J0aCB0aGUgZWZmb3J0Lg0KDQpNYXliZSBJIHdhcyBub3QgY2xlYXIgaW4g
bXkgaWRlYS4NCldlIGhhdmUgY2FubmVkIG91cnNlbHZlcyBhcyBjb25maWcgbWVhbnMgX29uZV8g
c3RydWN0dXJlLg0KRHVlIHRvIHRoaXMgdGhvdWdodCBwcm9jZXNzLCBhbGwgdGhlc2UgdHJhbnNw
b3J0IGFuZCB0aGluZ3MgbXVkZHkgdGhlIHZpZXcuDQoNCklmIG9uZSB0aGluayBvZiBmdW5jdGlv
bmFsaXR5LWJhc2VkIGNvbmZpZywgdGhlcmUgaXMgbm8gb25lIHN0cnVjdHVyZSwgaGVuY2Ugbm8g
bmVlZCB0byBsaW1pdCBvdXJzZWx2ZXMgdG8gaXQuDQpUYWtpbmcgY29uY3JldGUgZXhhbXBsZSwN
Cg0KV2UgaGF2ZSBzZXBhcmF0ZSBjb21tYW5kcyBmb3IsDQphLiBSU1MgY29uZmlnDQpiLiBmaWx0
ZXJzDQpjLiBub3RpZmljYXRpb24gY29hbGVzY2luZw0KDQpXaGVuIHlvdSBoYXZlIG1hdGNoaW5n
IGdldCBjb21tYW5kLCB0aGVuIGVhY2ggZnVuY3Rpb25hbGl0eSBncm93cyBieSB0aGVpciBvd24g
Z2V0IGNvbW1hbmQgYW5kIG5vIG5lZWQgdG8gcHV0IGluIHNpbmdsZSBib3ggb2Ygc2luZ2xlIGNv
bmZpZyBzdHJ1Y3R1cmUuDQoNCkV2ZXJ5IGRldmljZSB3aWxsIGJlIGFibGUgdG8gZ3JvdyB0byBk
eW5hbWljIG5lZWQgYXMvaWYgaXQgYXJpc2UuDQoNCg0KDQoNCg==

