Return-Path: <virtio-comment-return-7965-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340C5C25B47
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 03:32:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 57D1D2A825
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 03:32:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4BE4F986A4A
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 03:32:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 40B7E986A3E; Thu, 26 Oct 2023 03:32:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 30025986A3F
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 03:32:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5N9S4iKIR9cf0SsGwxdfIyAAwUZLfaTKmVdLf9bnE4jbIVp77Bz0PKZ0WV1mV50lEDEm/RURXpX9jlLOqjvKmcBW0MwSlHs0dmn1hRWmKDiu/lN+oVu45irjHat12MBx82dIcRHBxv8NCQ7+nASvVdSmVsRHMyaPqXkuF89Tj7pdGnBfziU7UXQflJczZ9GGWatavjst7aui+/ArsXPXyvCZTqzHtBbt3HiG9JUkS/zBTW5STvtKnoBAi5Tsi7loTM9jpqYX7dP/NrVihR7xohvGYYO7MXioMvEXQtc3jbJ7uXp+vKBjkzwumz4GnTApFxoDGDgBsl5IOS54lC3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJCFWvCrp6znDXia6SlDnf01CHornzAUTot1a7WEOu8=;
 b=DdYj8dB7l4+pHjs+eTSmcP0o7qTcGkmI/G1bIIaCOqIe63w3+KlRLImq5/sUNcG7Zl21sPIKC3O8OoTXv2Qe04RP86zDDS+AlSsj8dfMp1HZqbfC5/AbzHEW/27n6JR6iHGtmnXMONJWtGlk1czW8m6vtc8kzhqQlvtHauMDxdBT7Ki2nEFNoTUFCugX9x6BBFegsxBFPX+Y7cH+GeleLd5Z4M4sbikfQ9mY5ggsLj9WzG6jolhn0bXthkEec99tI31eDlyVtXEGHuIa5N+68j5bP7wNmnWV9WGwsn+lhkeCkM7s7gVQ7605AjjnDSnDvP9e09pciqCTL5qx+xVhGA==
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
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIAAFBIAgAABIMCAB3K1AIAADNZggAGZtoCAAFHP0IABBk6AgABdlBCAABa1gIAAEtKggAANSQCAAABWsIAAAkKAgAEdodA=
Date: Thu, 26 Oct 2023 03:32:33 +0000
Message-ID:
 <DM8PR12MB54805404238A1AE67BCAADF0DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
References:
 <CACGkMEsJVxPuxCGjKs3R-kaVGfDMNjtAovM7PpBt3TVd8HON0g@mail.gmail.com>
 <PH0PR12MB5481DD16B25251BAC25AA908DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthURdu4UNYXPseA-5g6mci2CFDP_UKKC1qFy+n7NHAKg@mail.gmail.com>
 <PH0PR12MB5481BBC4E48145A02C8963ABDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3nC8G3Xo2EaunQ4k4rnB27UQMUvruXaf81_sZF7w-cQ@mail.gmail.com>
 <PH0PR12MB548120210DC4AC23382D8A99DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025041653-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B91F71A81D1B57401968DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025061755-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548162B95B329056FFCFB247DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062455-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231025062455-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|LV2PR12MB5894:EE_
x-ms-office365-filtering-correlation-id: cfed749e-0edd-4a83-0cb1-08dbd5d43140
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Dekwe6OkSpt05zG9dOVEoulIsOvDP7A4NMACw7r5m7kyHlMQU785CFjjjTGsrrkrbCeiczFXJ1BZZOvLgqXjv7+hNxZB4lH/Lt+QUXh+6sdPW189aj7WnHlRRxQaSINQu279qbL7Be1u3vMd9OTvh43jmh/XWV0rZowIYMAnK51BferoxVvz7SnrOx42anv+4Hvjtfbyi1wbkWHu4f0Egn5RXncbXzCfB1VaB/VdJLiOLwIo8sMBzqRhs3FLvoaMjEz+IOPl1pRVxD995qcNIPqf3AdbeuSAWSJ0lf4/5abhHj5PcSUE1y9kniXs4Rj0+pYguvfW4GAqJs7JKHpUqADKHVkI2MT5QfnvNaBnuf5/En+kjlc82aNdhpHrVz3L1uefjq1Os4xGHar3qAqfEjk8QbPPnO+xG62M//wfBDvy6MWhqvl2KDtd7QjWbLmxWI7/Ph1dJ2ny5qngjdhw3ZEneS6KX78FLRGgbqwnQJh5/CukajM3r0rEZZq1WL6Ule7H4PJ/eH/kUEkIsKTcGQdnpdnlULG60ZQWgwTrEyQb5g4cY6XG9HGL16CV/Y/cMbcOoLIBVfmOAwps8X+2/0xe9bSbQ3m15lQ7LPIlkLNQbAuunUZPzB2EdGcR06z+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(26005)(6506007)(55016003)(66556008)(478600001)(66946007)(6916009)(66446008)(71200400001)(66476007)(76116006)(64756008)(54906003)(38070700009)(122000001)(38100700002)(7696005)(8676002)(107886003)(2906002)(83380400001)(5660300002)(33656002)(86362001)(316002)(41300700001)(9686003)(52536014)(4326008)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?J4w26ltEx6BUz+OFbuLllTqG8l/jQ8bGHDlIZa4cnR6O3CsZt8s/xBi7i0KE?=
 =?us-ascii?Q?TuGagelPCaASLwfEDLu3EXsh4w733i/dWPb0uKAqqyRa58t6atE3KBSwAt16?=
 =?us-ascii?Q?rYGa1vKd+qOrxthr4lvwOLNJVk5eBDHYT3molYmZniHvrQOereqYl3Q7e1xV?=
 =?us-ascii?Q?lbKYpCQTXDhUdzDelgZfpx/kHRXHMX1z9zugJL1ZoHUJQatd9zrnCOr7EbE4?=
 =?us-ascii?Q?96gtX5inABXHVZN14zPonpTlKvGCYWpFQW8QzISZmwG3FekEhv+/qrmraCCm?=
 =?us-ascii?Q?9UqiRJqrKebzLiGUbwH9F3EUxbnCA32uX0ZOcvRNkTEVxLxJJNvwMoRp1iTw?=
 =?us-ascii?Q?AaVDk7mqOP4SDOrS7bruiduLMwkXSkeApD1NMVjO88Mwm5T7Kub4MquVP11a?=
 =?us-ascii?Q?IPo5Rc0NKxPLLzbo7WK3D3cjMG0rhUWe2G01RQfOE4ykHmYYii3qc2dfvSrp?=
 =?us-ascii?Q?Xx7+0DXp+hkhtZWOscFu3qBmF5j+tmSVZ9b6JxjhFH6Pcp1JS9FFwE3oIcdQ?=
 =?us-ascii?Q?4UxHo+4pVemYxXpowYA+/oSUrKx4o7YbNuoPrXVhE7aNnKyzd/6lSh4K1pHQ?=
 =?us-ascii?Q?SMQXwptb0KBYNONFYSokdEv2JVoEpQa6GWBarTlfEhjC1Q6v02ttKTuq/5cM?=
 =?us-ascii?Q?EdO3LZ30Oj1nRRcxO7x3/4q5t+BoH/IHj8Kk3Wbn2ZHHOqt1d3G/bNRBIgEr?=
 =?us-ascii?Q?n2jjr/8c676JsE50pQXT7rP0TW6v/DPsfuBE5LvbtxcaQGmm5d3bbog92RPn?=
 =?us-ascii?Q?mN12JVrqUcc8ryIPp0A5BE4IpV0IcMRdTpZDEeUY4qsg3DKqTpogLIsTTNRO?=
 =?us-ascii?Q?9ulHXfodEa0iAwvy1cE3pM+LSKUNcuS6T4B9i8Lv0XmqERi6L3pF41e6xjsG?=
 =?us-ascii?Q?Y/VZWuGiIdQkf+I7A+RJbdV3pQCCcTna539FfYiNnbv3WyFLM6R0sQJ9Ws+q?=
 =?us-ascii?Q?Nck6c1ZhsQ8KMXsezT3v5owxUHMCteciLgboKpF8s1q+rirxcPx/VybcUzlG?=
 =?us-ascii?Q?+AYGnwLnEoBrZgjflt3WtoHM/fzjG4G5oscESb40YL9R0emYCaZMCAvK5JPN?=
 =?us-ascii?Q?oNwAj3AWhsDL9CZdP3DCwS2Wbu6uYmxJ74Zh5+XWcxSm601Uk9LyKNTiJ1Um?=
 =?us-ascii?Q?rsEww5TZTk4gSrAuNIqSMsquDusHbbgYff7Bzb8b2OuzVPI7wjUfu31t8CXY?=
 =?us-ascii?Q?bXg6vR1+32yF9nKlSw50UMS5inKmC52H4o0OXvSfP6CTRab3AexaIs7iY6aA?=
 =?us-ascii?Q?BqcErS8+IWk5ZyJcamIKAFwUXIbsR+H25BDRWB2UB3/0y+15y7mu9axnbolY?=
 =?us-ascii?Q?J9ZJq76KfgzJ0N/k92ATblRggIwmf0V/enTjlDm9+K5FsXINcu+6iHijlerZ?=
 =?us-ascii?Q?B3vwtdxqGTOqV3y6RX76KJL3FMwQrl45OZG+z73VBBvu/NWrX6yZPt/M3xjR?=
 =?us-ascii?Q?8BoXOn/i9Uh/GyCmowr+nrfsyFvIOSMJ6Kws5yMQjy9cfbBiMDl1bYDqQxMh?=
 =?us-ascii?Q?ZyX2MuetxomlB9b41RMysCn7Agpc0XjD9dz/Q3JDyQIy83F8FGjEHcng9RHL?=
 =?us-ascii?Q?zyznpYq7WyEO5vbo6kU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfed749e-0edd-4a83-0cb1-08dbd5d43140
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 03:32:33.8629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kh2m3WrB0RoHK/UyIG/yMzJrY0cxU9Ah/MY0jzxfobv9hP3dZY+7DG5N4tDtnzYKxA5ff2OxSSshv/ROMjHE8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5894
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, October 25, 2023 3:59 PM
>=20
> On Wed, Oct 25, 2023 at 10:22:03AM +0000, Parav Pandit wrote:
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, October 25, 2023 3:50 PM
> > >
> > > On Wed, Oct 25, 2023 at 09:50:02AM +0000, Parav Pandit wrote:
> > > > Hence, I believe device context as defined now is still reusable
> > > > as common
> > > building block.
> > > > For non-passthrough, such hypervisor can simply ignore the fields
> > > > which it is
> > > not interested in.
> > >
> > > Interesting. So a hypervisor encounters a field it does not
> > > recognize. How does hypervisor know that a field is safe to ignore?
> >
> > In v2 all the supported fields are published in a query command.
> > If hypervisor wants to know the precise fields of interest, when the de=
vice
> reports unknown field, it can make its decision to ignore or fail to work=
.
>=20
> It really can't make any decisions here. Some fields are safe to ignore, =
some are
> not but how can you tell?
If there are unknown fields that can appear, hypervisor can avoid operating=
 this device.
It does not have to be attributed as mandatory/optional fields.

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

