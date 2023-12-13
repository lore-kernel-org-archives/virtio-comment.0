Return-Path: <virtio-comment-return-8794-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD1CC4332F
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 06:54:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7AEF71318C7
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 06:54:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 757059866D8
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 06:54:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6AB9298669B; Wed, 13 Dec 2023 06:54:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5CF7D98669C
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Dec 2023 06:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1CL079ZMyFYd77Cph3WiAJdcHRXwdOU+MIBqqnnFivctjLZqNqrnlEiTOfONw84+8b9g0Eghc+43S7Yj3AqPsYInVTq6yuVt9em7VYyLpW0Ta8q07c+ir4kqppt5+/6UB5yEqY0dXQPs1+GzXu/bhkcDJfMbp0CHN6I2PsjwJG+Fsu/NSGY+lBWngdzGEKtEuGw13Gk25fPHp5Dey5lGiw6SgEohlvKYyfiPlVT7U/fufgRwTrkCfPFIU3JSz0j1qCyyq1woJCQYhpo1+KoiqEgV0jWukz8ovuMHa1x15YYPSNWwKl4BGOp3P3WLZAzjj/XfhfUaSSh6f52g4pGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DpNR0e2Kn3O5y7cLe5u4MVHbm4EfHoSM9Ifab0IfsA=;
 b=ZNKWZqX9sacym5aGY0FIOsEityUgOShceG74+jRJAK8/ZHn2p5NkB0bTiiZcsmvI7NS9UjTn0V/HIY1GHOww7EIqZt5eJPOKwkQzxAAHqekGNHCfGhbOcBAspaan7JykZVGudlEFrhYfDsrF753CwBJMnwCVpFT1XW/AIwHcmjS+cHF9Cc+OzPsWjAK9mZ8LVMnyGWU7q+aKBBuiJwoh0+byIcLVU4KpfChiQ3qAWEsh3KCRfAFOS9gQ3wMaQoCh8KjEMSQsnh4XZdI0ENYoibUU0k6icoDABMul1aJuxgsCK7Yki3Ihuxy3wJqKI+UBEvcDeCzcq2WniXBGHgFUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Thread-Topic: [virtio-comment] [PATCH 1/2] virtio-net: Fix receive buffer size
 calculation text
Thread-Index: AQHaE9Mwu3m2b4YySUGhX4hUIbhSbbCm96WAgAACmbA=
Date: Wed, 13 Dec 2023 06:54:40 +0000
Message-ID:
 <PH0PR12MB5481BAA0490F6269ADB39821DC8DA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110124040.2093394-1-parav@nvidia.com>
 <20231110124040.2093394-2-parav@nvidia.com>
 <1702449795.6038718-6-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1702449795.6038718-6-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB8696:EE_
x-ms-office365-filtering-correlation-id: ba5aaaa8-5537-4f01-3c13-08dbfba86112
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SaFHvi8Ns5oT3N0jMz151OC1WwIGf/cjUDWKdBigYH251BX0f8EMsOjWnqpaIlVfr7fD/52FX6ofNJox4TABLklHYhxXOcNfiyNXEWzCOXYO6ASzJym6qB5zwI30w2xg+qF+p0Bzw5Kw/LJGO732ZNyUnSf+tTeS0SP+X1Wv+eGxnVCkNcKfvWfiHrQQsCjrO/bDtwUnqAB+IUVGCB9GyT1BvzFTuvP2X/F4tU4US8/blOq1nVVlWhSY+7n50nZXj5lklqRs7cfLyHbnrhsHpi2ncdTyaYxQ56jtAuPfIXNkyjdaaJgSpgmeFkYn3KFjc5S+wBGwOopZkMbNPiPF/E9X74WQLE4Hwt6g0d4FysqbLnyeTjQraysi0H7jgAmKnJQw+IqYehonnva2uKDCc0jN1hvpKd26+bta31yURW8OzQH+0X+jycEf01qOsZRIPOQmTCYyehYy9Lxu+8Qzd5Aha8+hXqodAESuMNEDKt7zOhDAPeC04xTBczZpF5gYyij11tf/4S/A/YPt1w8cTKGScSaMGxd7HYf1ti3Nm5iY0BP9hCzduIU+QIDfY0Kb/F+LD+HIw61SMnc62uuElkIn3kpYgjSwXZ5+31taOk5Bm6ybYmNZaoPRcWbbc20LVFE68lExpicl5n6mqBV0JjfdQ84VvfInbLdpYxUxkU0420c/qOU//xsIzSI1BCCHcxc7tBHAXP+wzgZogLVkSw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(5660300002)(2906002)(71200400001)(86362001)(6506007)(54906003)(478600001)(7696005)(966005)(26005)(6916009)(55236004)(9686003)(316002)(76116006)(66946007)(4326008)(8676002)(33656002)(66476007)(66556008)(64756008)(66446008)(122000001)(38100700002)(8936002)(83380400001)(52536014)(38070700009)(55016003)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?g4oFWoHFjlWr54kFD4b/Djn+jGf7EnbkzOVCnXkQ85b63aP7x1C4uvb/GgkJ?=
 =?us-ascii?Q?Fbvmu7FMmYjPytLceXv5StuAt/17teDOdwY5Hp57stvuI0pz043foFUlzDT5?=
 =?us-ascii?Q?+J4SLnrJqZW2tmjq8b3iiaRMm6ZfPXF5ZU54maVesbFJk6t3t2qhNri4cCsO?=
 =?us-ascii?Q?36ozx+BJ/8WgNUHhZZD/wcfEWvCxwMt6DAR6a+elt08jv0f6/mTmv3MXoB2I?=
 =?us-ascii?Q?iO+FI34JfZQM/FrTC+Q86iGxwB5g9oUlmsEoS/8w4ztFo2ATGhRXhZwEom1c?=
 =?us-ascii?Q?BFy8o3YqImIF1HcwdexhJZRw3AjHGvbCE0qR8UzRJEkoGBeR9bkXJc/SXu6q?=
 =?us-ascii?Q?y0ZOXO89K0v7vu0UKnEtYeivOCDedfYu61xO3zqp07ASOedyvsdulsH10vbv?=
 =?us-ascii?Q?1ccs7q86B0ukNc+94vr4yH0gbwaIjs9NpbR+sd56nIAlwORTkbMUVk7LGO2+?=
 =?us-ascii?Q?oHMFjAT2j14HjlABWkWsk0ZiPkwrvX1GqRikysv0Tep76n9NvOKipuHGhoj0?=
 =?us-ascii?Q?omLimaIOuqm8bme+N6SCb8JP2+0bf3ZLeixFhyjjMIeaGUuo024lCiXwqyLT?=
 =?us-ascii?Q?ryC1ur43w9PcOeNMJqgkdEruhZeM/93/G1XpLCPpcWDjWOEDBzeUiiEfKp2i?=
 =?us-ascii?Q?JbvymeOqhTbSJpsh5FxqqCLZHWetcUXbnE6v/WPlmkj8eqUwqL8tnC4BIfyr?=
 =?us-ascii?Q?+n/eCEUv2czIQ0FxYbg77F9Nl2zBI4xdCQ0TFet1yalxwhm5bWGQxi9QII03?=
 =?us-ascii?Q?1x2jp1KkhUJbyrAquG8X1pThUP9AKRdcPqSf6SghiEOL0R/TzJkjcaAyL3O8?=
 =?us-ascii?Q?qVfjiI6i3M6V5K+XEEqCAsLDdOV1/z0a3Fgj3Wbvm+l9ME1hEmDQVhxEU1p8?=
 =?us-ascii?Q?e1IDqHUleHkNzXVxD2wnNYi+wJzjgUJyCYM5OHDIl7BfEvOAGe8afWd1m3kT?=
 =?us-ascii?Q?r98oHE9L/UZgCtBNgGWbUfOeqzBNvbLfW5O83nGao16Dmn5GSVIZ2AYzcl9i?=
 =?us-ascii?Q?INGTjIlY8zm8S8F3Ss1oYtLMJJSAUTkN+DCF/krCKZJ7hWgqsI8sH8hC8fuf?=
 =?us-ascii?Q?FmglugwX3OoL4usDeRVar3ftJmxPNzIIe4+Wlxcg0zgxtzadMT/CyW/JIPMK?=
 =?us-ascii?Q?xrO1MkgQq5Ahe8Hh3RWC9G+jTmktICiZPV6B8pKL+FZXuZGMz5/PD6qbti0N?=
 =?us-ascii?Q?mpK+YUp/TDPFwIZfFC3tsOXo/vm1mAyj30JmAwFpKouleFearyuJ6U5fgtjM?=
 =?us-ascii?Q?JAPF45rTbIxMd6sUjx9wY1f2P8bUgokH23xx3jAczn+6jZSPFjJx/XPdTZzv?=
 =?us-ascii?Q?f5tviiBR6y+TbQ+xBWGQ7M5S8A/deMOWxOAYzTIUoGklD8F77T5JY4vcKpFU?=
 =?us-ascii?Q?dQA7cmc7PB1bSqvvhiCHu+oTfHnYiKqIOUHIHcV5yzCROYuV+a21XNQaaYLf?=
 =?us-ascii?Q?sqb173xIzlhC2MWaNpb4VKrJ6AaKM2vlx63lVSQIdKCwRSJo1DC5VkSqQ/rm?=
 =?us-ascii?Q?uw4wHwPqmnvk7YR0Cjps6wU0aGzv5qKwTEbqnsmEX4QlfCH8k0zss5NN/YMt?=
 =?us-ascii?Q?i47kdNYUnCRPOEXOuG4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5aaaa8-5537-4f01-3c13-08dbfba86112
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 06:54:40.4132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nU338+9j4gGL9G4u1BVxj3316QvMEKVPsxr/Is/havIRiKakYxE87UcsP9/0H/45egwiz5jkvdgGhiGZSPK3NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8696
Subject: RE: [virtio-comment] [PATCH 1/2] virtio-net: Fix receive buffer size
 calculation text


> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Sent: Wednesday, December 13, 2023 12:13 PM
>=20
> On Fri, 10 Nov 2023 14:40:39 +0200, Parav Pandit <parav@nvidia.com>
> wrote:
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
> > ---
> >  device-types/net/description.tex | 25 ++++++++++++++++++-------
> >  1 file changed, 18 insertions(+), 7 deletions(-)
> >
> > diff --git a/device-types/net/description.tex
> > b/device-types/net/description.tex
> > index 96f7dc5..f5647d4 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -660,24 +660,35 @@ \subsubsection{Setting Up Receive
> > Buffers}\label{sec:Device Types / Network Devi  If the
> > VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> > VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_USO4 or
> > VIRTIO_NET_F_GUEST_USO6  features are used, the maximum incoming
> > packet -will be to 65550 bytes long (the maximum size of a -TCP or UDP
> > packet, plus the 14 byte ethernet header), otherwise
> > -1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
> > -making for 65562 or 1526 bytes.
> > +will of size 65589 bytes long (14 bytes of Ethernet header, plus 40
> > +bytes of the IPv6 header, plus 65535 bytes of maximum IPv6 payload
> > +including any extension header) otherwise 1514 bytes.
> > +When VIRTIO_NET_F_HASH_REPORT is not negotiated, the required receive
> > +buffer size is either 65601 or 1526 bytes.
> > +When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive
> > +buffer size is either 65609 or 1534 bytes.
> >
> >  \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types
> > / Network Device / Device Operation / Setting Up Receive Buffers}
> >
> > +If VIRTIO_NET_F_HASH_REPORT is not negotiated, the size of the field
> > +\field{struct virtio_net_hdr} is 12 bytes.
> > +
I realized just now, that above normative is incorrect due to optional VIRT=
IO_NET_F_MRG_RXBUF.
I will remove/reword it.

> > +If VIRTIO_NET_F_HASH_REPORT is negotiated, the size of the field
> > +\field{struct virtio_net_hdr} is 20 bytes.
>=20
> For the receive side, is these needed?
>=20
For uniformity between tx and rx I thought it is useful as it is not covere=
d anywhere else in the normative.

> Other is ok to me.
>=20
> Thanks


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

