Return-Path: virtio-comment-return-1027-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A1FE1986037
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Jan 2020 12:08:19 +0000 (UTC)
Date: Thu, 23 Jan 2020 07:08:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200123065325-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB2067B366EB434CD282F6589BC5270@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20200120112311-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB206708783E23525AE1CB1D5AC50C0@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20200123014153-mutt-send-email-mst@kernel.org>
 <99c01a11-cff7-03c6-4e4b-fc05e5a31405@redhat.com>
 <20200123023750-mutt-send-email-mst@kernel.org>
 <36a7addf-50b5-e7df-6be6-ced54cf017e6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <36a7addf-50b5-e7df-6be6-ced54cf017e6@redhat.com>
Subject: [virtio-comment] Re: [EXT] Re: [virtio-comment] [PATCH] virtio-net: Add an optional
 device control over the receive buffers length
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jan 23, 2020 at 06:00:30PM +0800, Jason Wang wrote:
>=20
> On 2020/1/23 =E4=B8=8B=E5=8D=883:46, Michael S. Tsirkin wrote:
> > > > So linux can switch between skb and XDP mode. In skb mode buffer si=
ze
> > > > varies, it works by merging multiple buffers. In XDP a single buffe=
r
> > > > is made big enough to hold the whole packet. Length is fixed.
> > > >=20
> > > > If we are in XDP mode but buffer was added while in skb mode,
> > > > or vice versa, we recover generally by copying data to
> > > > the correct buffer. This is a temporary slowdown -
> > > > better than dropping packets.
> > > >=20
> > > > So let's assume the device ratio is 1.
> > > > I guess while in XDP mode, we'll write XDP buffer length into
> > > > this field. But in skb mode, we can make the buffer smaller.
> > > > This implies driver needs to change the min_rx_buf_len?
> > > I'm not sure I get here. The header room should be invisible from dev=
ice
> > > point of view I think.
> > >=20
> > > Thanks
> > >=20
> > In fact I am confused. We have this comment:
> >=20
> >                  /* This happens when rx buffer size is underestimated
> >                   * or headroom is not enough because of the buffer
> >                   * was refilled before XDP is set. This should only
> >                   * happen for the first several packets, so we don't
> >                   * care much about its performance.
> >                   */
> >=20
> > but what does ensure that num_buf =3D=3D 1 except for the first several
> > packets?
>=20
>=20
> We disable GUEST_TSO, GUEST_UFO, for XDP and the minimal packet is 1500.

did you mean minimal buffer? that's the part I don't see.
what sets buffer size to 1500?

> So
> it should be fine unless guest MTU is greater than 1500.
>=20
> If guest MTU is greater than 1500 it could be a problem which needs to be
> fixed.
>=20
>=20
> >=20
> > We seem to be calling add_recvbuf_mergeable which in turn uses ewma
> > to estimate the packet size, but it seems that XDP never updates ewma s=
o
> > the size will be whatever it happened to be, no?
>=20
>=20
> It looks to me we can't use EWMA which may cause packet size under
> estimation. Sticking to MTU should be fine.
>=20

So I'm not seeing things, it's a bug right?

> >=20
> > I guess we need a counter in this slow path so we can notice it
> > happening ...
>=20
>=20
> Right, this could be added.
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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

