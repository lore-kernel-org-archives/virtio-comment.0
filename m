Return-Path: <virtio-comment-return-8942-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7368BC4706C
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 03:45:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B1C902B244
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 03:45:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 874B3986608
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 03:45:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5FE89986556; Tue, 16 Jan 2024 03:45:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3539B986561
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Jan 2024 03:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvkJKXyR62lUWw8zVX2EroRh96CDNFtPfdryrXGyPJoydU/t7BPXYnYXUA4/ipWgeJ7sRehMx3t5XsSmFFNnB3pDwGNEMZkeKGtu7By+u4cCH4lMDbUNzY+7/nEgsDX9Lbd5hhZ3dfBnpCSfJZHg6Hd4Ds4CuM/glI+Daoz/t1VuGLVluJRN6shrmOlrOURZarmJgE3aOgAZIpYiNnmVPSXRTc1GtTOFvlY6L8oKxsaDdcg5APr5SJXFL8KIBrcaJ9Ae706Pu6xI/PWNC9W9my1eRPZZQlM/G+LG3njHgW9FW7Q8iErLlaQuiSjxco0Bhl0vHKC1S4biggeW6hWTeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0EP/t9won6edUZ6INFtkHnOp/R0Doa0NVQq27iIO0A=;
 b=a4OH6di/2e4EAEtb8MWs0bGd0lwigp1qXB/YFEIBmwS7t3SekBVO+QZnr4gLYXjdm4uVhgGnRWqaDY4mzHNr23b6UsVLHmsDktpK/Gb0lxGy9+RSXqLghb+0v0eJtoeLtRAhTRzSjH4s+u1vUCj3yCSgxlWFLHEVe4snfXDRQOMegic9w/VOAzwWIhttRxyW5slKbZw7fhd7If9OI6aoNICjaLmRJdAOt6ImLACRMm1fHzNJZO7dNkG5+V9Z/UntL2OEFMFuo6ZCraV4nEsQfgJxLgNw3D/uddlAUto0iaO+lCfujBcm2XISTJfzHDCQ2HnSkRtAVdCk9p227KG83A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "yuri.benditovich@daynix.com"
	<yuri.benditovich@daynix.com>
Thread-Topic: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation
 text
Thread-Index: AQHaR5W52J2qfmVC+UWFja2twvUrIrDbFOyAgAC4IFA=
Date: Tue, 16 Jan 2024 03:45:04 +0000
Message-ID:
 <PH0PR12MB548114CE959557968F5124D9DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240115093141.3539316-1-parav@nvidia.com>
 <20240115093141.3539316-2-parav@nvidia.com> <87r0iimtrg.fsf@redhat.com>
In-Reply-To: <87r0iimtrg.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM6PR12MB4974:EE_
x-ms-office365-filtering-correlation-id: 83294fce-22e0-4959-f86f-08dc1645866a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hZBu+pXai5dYLRookBoCWx8b8HMHejNnRdMME8rBpffQartGSUFAii2UdHE6kQazYfys5RQlXVCaKBDv7TvhSdWKgZAt+UcENMFH95UXWYA7Xtnt7AkLx8KVhvm0T6KGtyC1z7RfLi/kUoP5tvLh3vo8HBeTzItvRZTMYXqq10DjljWzQwrb3IINLABVhYoOdMfACObBIV1n8SMlFVe33srgK81ywsoOUPY9vv91b2adbvNsIk87OLCXwvfv9z/U4ErIkMjLWsMCYiXcjV6KLLunSThrCZXeKT7efBHubKfgx2sD6S/z0DhyZwEvfyucczapburYZBf4TzuNkbpKqfc9dnxZXwgagg+TsXd6W+SOLNghCPVb7z1D3ktt9yWCesoV/XvUphCp3Q+ggPVaS2aDROZVmyy8MgaS+QMUyH5WBbl4I1odfJo2YVunp53gIae6HPhMtss1HAONLCITPEPSexhMj4JREX3r4OR/tt2x89QvKRndrkm4TYKrxKGN5i/uoulgHIFjilqxCCZtzEf8UPW/sJK/6Q7u0aIoZuW8YsA7lEJ5eo6pO5Ii6PsjWUD84KohDSVvG5uwqmYVywKUhY7QDwbkoV5ZNCMx3+dqHqfhHqIrvq1phXZr/Eb9Hfsz3gck0o9fGwm6grzqhKSAx8KGBcausen3aEQ2Uehu/HO3vAHc4t5QJgcPuT8lPAH7S6GznKcaMFdKd3fMEA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(396003)(136003)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(66946007)(66476007)(76116006)(66556008)(66446008)(110136005)(38100700002)(64756008)(55016003)(316002)(54906003)(9686003)(86362001)(6506007)(7696005)(8676002)(4326008)(8936002)(41300700001)(38070700009)(478600001)(83380400001)(26005)(966005)(52536014)(71200400001)(33656002)(2906002)(5660300002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0hx5+kvJanwxv0qDEMkaRcXC+84xPh4FoKiLumtJhuhJN7eYdttBSoz17jqN?=
 =?us-ascii?Q?So0eehvO0eotFLdilIBps4wqPFjBuKGaPo3ERz0w+FgL9YVOivCn3qjuaA8x?=
 =?us-ascii?Q?RdxGTv/eKZAXnF2SO01eb0kKZzVSX/y1yixHAcFIu5taJyZZsnZi1ffLVagK?=
 =?us-ascii?Q?vJdVV1/YNiu8OSi1szsEe6pUskir/Xo6GvoAyiAqfGHphqEA8SixeOXQpmdW?=
 =?us-ascii?Q?ryEMytCnM32rgXUnm1xy2gN2QKoTa+gxfMJoK6W8ZxK7zifYh7ih0DeJ7XUX?=
 =?us-ascii?Q?ESCFoeEkKPQH3PITaJRMwsD9nrFzq/sQDNM1czYAv0RcIhJBykEXJSHI1pF6?=
 =?us-ascii?Q?f4VJ6NNH6WCj18sxww1MoJIpNVqGoefHhUJ660nvSLe6KpuD1261BN3pJLpo?=
 =?us-ascii?Q?hIP6VGgXEU8fPOrmbeRHfrH6cRsZCzltgUWgMbvPs9vN1AuZdTfD03tKXcXN?=
 =?us-ascii?Q?LwBnQmpFgazlBNf0JZMTqlFwmcGkBZYsqXQpSECT52aN01f7F1iEF7Oug/qO?=
 =?us-ascii?Q?faaDMjSZ77ZAMY1foHuCaTENW70JX2aoc2FuswXFBDYsPjybnnkOE66fCLHH?=
 =?us-ascii?Q?9+sp8nHzAMOZvV7lHb1FNEMcA+zs0Gggx5BpJLk+uc/m09PXxmZ+A1Y4YnAi?=
 =?us-ascii?Q?bcjdcTeayAkneP5I23WIKDjrwmZu89OjmgDetuEKJ2QFhuiaa1HstfeGAhrg?=
 =?us-ascii?Q?C/tWVm8a/mq8/8ORbDIp7Efc7Wx9PE2CNq4I3xv7q+v8wvIK4xH4Q+dg3XJf?=
 =?us-ascii?Q?u6f+2pGsuVVP+N0XV05wb6f3BmgDpaQzrSCnPQnNCrjQtR0tzgvXTzb0Bbhh?=
 =?us-ascii?Q?UJ1IW296WMHTz81zIITM1pcNGtdFaCY8T1UpR6X5stQs7tJIUJTPIBtH0LYa?=
 =?us-ascii?Q?XokPjr+0x4ZhdqeObJ5pZVT/Wm9AdH4dmG+Hs91vscrZc3o670xF3rXajVRV?=
 =?us-ascii?Q?aHDcYXI1M6wyTf/4AVGJelNmb+oV+zzqj9xiGdHcBDPXdEwihLuXszfUKYqq?=
 =?us-ascii?Q?RSWTLNW2KqHeYUg3s/bKwbLh5EDftfW1hoDztImL8hi4V7xaIs7kL8ngccJH?=
 =?us-ascii?Q?IPtDrYNmomr45rM/ggYLJ5+OL4KjhwXiNgxz/00JKw3nUtrXFM1D1QRq6Vm6?=
 =?us-ascii?Q?QmH5XWI1kWgRQUWVrZIzfvXUXYphr/YfjTbDVp2OoCeX7CPygchsOOUPAHj5?=
 =?us-ascii?Q?ZIf9CzAzWGXGw63Ydu5qJMxaw3uTdgT0tz4Xe1F9GYtysC0tDDoRHWtRsUvE?=
 =?us-ascii?Q?0LhWXrEgybY+vgP8bmJnmNU6UpsIN1uo8qLxjPcEmLXgcR2lbFEMGqt5s5JE?=
 =?us-ascii?Q?7dD5pMP1BG6HG4hzSssjNVfU9VxF5w93oS/zyb+rhpwBChMji/fPebxZ4PbP?=
 =?us-ascii?Q?QKbhK5PrhHQOMnrJKD7P2PK4RMt9t/V6otHstH1tRVKfaO6fIYk4AtSDR/fD?=
 =?us-ascii?Q?eC2aCHUjvnBfvtXS6vrpXyjJ8xz07k5QrxumpLQ5rhi+wGWf6t75SX0tVV4W?=
 =?us-ascii?Q?dadofD6OHTdUZozDSqp3dHaeu7C6BlFmC+IVfF/hwVQALy+EU8lc7UCfCOpq?=
 =?us-ascii?Q?4s8CR4hTneA7nLVw6uY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83294fce-22e0-4959-f86f-08dc1645866a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 03:45:04.3048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I/QoTTey7QhDRL+RKcviBngdscI4+B80ZeIGtvaFWxD8IJunUnQAZ0OSLP7NbcOTG0I3TBKyy6NdJRGMgQUTKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4974
Subject: [virtio-comment] RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation
 text



> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Monday, January 15, 2024 10:14 PM

> On Mon, Jan 15 2024, Parav Pandit <parav@nvidia.com> wrote:
>=20
> > Receive buffer size calculation is based on the following negotiated
> > features.
> >
> > The text has wrong calculation for IPv6 and also it has missed
> > VIRTIO_NET_F_HASH_REPORT.
> >
> > The problem of igorance of VIRTIO_NET_F_HASH_REPORT is reported in
> > [1], however fix for ipv6 payload length must also be considered.
> >
> > Since for the both the fixes touching same requirements, a new issue
> > is created as [2].
> >
> > This patch brings following fixes.
> >
> > 1. Fix annotating struct virtio_net_hdr as field 2. Fix receive buffer
> > calculation for guest GSO cases to consider
> >    ipv6 payload length
> > 3. small grammar corrections for article 4. reword the requirement to
> > consider the virtio_ndr_hdr which is
> >    depends on the negotiated feature, hence first clarify the
> >    struct virtio_net_hdr size
> >
> > [1] https://github.com/oasis-tcs/virtio-spec/issues/170
> > [2] https://github.com/oasis-tcs/virtio-spec/issues/183
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/170
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> >
> > ---
> > changelog:
> > v1->v2:
> > - addressed comments from Cornelia
> > - rephrase buffer size wording without explicit length of virtio_net_hd=
r
> >   at 3 places.
> > - replaced otherwise to ', otherwise'
> > - rephrase non normative to write as driver normative
> > ---
> >  device-types/net/description.tex | 23 ++++++++++++++++-------
> >  1 file changed, 16 insertions(+), 7 deletions(-)
> >
> > diff --git a/device-types/net/description.tex
> > b/device-types/net/description.tex
> > index aff5e08..53a56ee 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -657,10 +657,13 @@ \subsubsection{Setting Up Receive
> > Buffers}\label{sec:Device Types / Network Devi  If the
> > VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> > VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_USO4 or
> > VIRTIO_NET_F_GUEST_USO6  features are used, the maximum incoming
> > packet -will be to 65550 bytes long (the maximum size of a -TCP or UDP
> > packet, plus the 14 byte ethernet header), otherwise
> > -1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
> > -making for 65562 or 1526 bytes.
> > +will be 65589 bytes long (14 bytes of Ethernet header, plus 40 bytes
> > +of the IPv6 header, plus 65535 bytes of maximum IPv6 payload
> > +including any extension header), otherwise 1514 bytes.
>=20
> Hm, I wonder if we should still mention that
>=20
> "\field{struct virtio_net_header} will be prepended to this, which is eit=
her 20
> or 12 bytes long, depending on whether VIRTIO_NET_F_HASH_REPORT is
> negotiated or not."
>
Ah I lost that in this change. I will add it. Good point.
=20
> > +When VIRTIO_NET_F_HASH_REPORT is not negotiated, the required
> receive
> > +buffer size is either 65601 or 1526 bytes.
> > +When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive
> > +buffer size is either 65609 or 1534 bytes.
> >
> >  \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types
> > / Network Device / Device Operation / Setting Up Receive Buffers}
> >
> > @@ -669,18 +672,24 @@ \subsubsection{Setting Up Receive
> Buffers}\label{sec:Device Types / Network Devi
> >    \begin{itemize}
> >      \item If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> VIRTIO_NET_F_GUEST_UFO,
> >  	VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 are
> negotiated, the driver SHOULD populate
> > -      the receive queue(s) with buffers of at least 65562 bytes.
> > +      the receive queue(s) with buffers of at least 65609 bytes if
> > +      VIRTIO_NET_F_HASH_REPORT is negotiated, and of at least 65601
> bytes if not.
> >      \item Otherwise, the driver SHOULD populate the receive queue(s)
> > -      with buffers of at least 1526 bytes.
> > +      with buffers of at least 1534 bytes if VIRTIO_NET_F_HASH_REPORT
> > +      is negotiated, and of at least 1526 bytes if not.
> >    \end{itemize}
> >  \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST be at
> > -least the size of the struct virtio_net_hdr.
> > +least size of \field{struct virtio_net_hdr}, i.e. 20 bytes if
> > +VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
> >  \end{itemize}
> >
> >  \begin{note}
> >  Obviously each buffer can be split across multiple descriptor elements=
.
> >  \end{note}
> >
> > +The driver MUST consider size of field \field{struct virtio_net_hdr}
> > +20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if
> not.
> > +
>=20
> Requiring the driver to consider the size of something to be its actual s=
ize
> seems a bit odd :) I don't think we need this, as the length can be deriv=
ed
> from looking at the definitions, and is already spelled out explicitly, i=
f you
> consider my suggestion above.
We need this because tx side also needs to refer to the virtio_net_hdr in p=
atch 2 to be same as that of the rx side.
And hence, this normative sets base line for tx side too. Relying on rest o=
f the receive packet normative is not enough.

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

