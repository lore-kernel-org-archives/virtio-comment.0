Return-Path: virtio-comment-return-1003-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0E97B9841DA
	for <virtio-comment@lists.oasis-open.org>; Sun,  5 Jan 2020 10:28:36 +0000 (UTC)
Date: Sun, 5 Jan 2020 05:28:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200105052521-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB2067B366EB434CD282F6589BC5270@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20200103152244.GF277936@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200103152244.GF277936@stefanha-x1.localdomain>
Subject: Re: [virtio-comment] [PATCH] virtio-net: Add an optional device
 control over the receive buffers length
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Jan 03, 2020 at 03:22:44PM +0000, Stefan Hajnoczi wrote:
> On Mon, Dec 30, 2019 at 01:59:17PM +0000, Vitaly Mireyno wrote:
> > @@ -2916,6 +2933,15 @@ \subsection{Device configuration layout}\label{s=
ec:Device Types / Network Device
> >  If the driver negotiates the VIRTIO_NET_F_STANDBY feature, the device =
MAY act
> >  as a standby device for a primary device with the same MAC address.
> > =20
> > +A driver SHOULD accept the VIRTIO_NET_F_RXBUF_MIN_LEN feature if offer=
ed.
> > +
> > +If VIRTIO_NET_F_RXBUF_MIN_LEN feature has been negotiated, the driver =
MUST
> > +set \field{min_rx_buf_len}.
> > +
> > +A driver MUST NOT modify \field{min_rx_buf_len} once it has been set.
>=20
> When must the driver set the fields?  I guess it makes no sense to set
> this field after starting rx (i.e. populating the rx virtqueue)...  The
> spec should be explicit about this.

If we are going to keep it static then I think the best time is
before features ok.


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

