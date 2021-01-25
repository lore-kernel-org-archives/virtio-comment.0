Return-Path: virtio-comment-return-1664-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C72229861BF
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Jan 2021 04:08:32 +0000 (UTC)
Date: Sun, 24 Jan 2021 23:08:08 -0500 (EST)
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1136488155.49478472.1611547688847.JavaMail.zimbra@redhat.com>
In-Reply-To: <cda56ec7-27dd-3c0d-ac7d-814a01512ff1@redhat.com>
References: <20210122082325.17298-1-jasowang@redhat.com> <20210122111136.7a0b7ccd.cohuck@redhat.com> <cda56ec7-27dd-3c0d-ac7d-814a01512ff1@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] virtio-net: introduce admin control
 virtqueue
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>



----- Original Message -----
>=20
> On 2021/1/22 =E4=B8=8B=E5=8D=886:11, Cornelia Huck wrote:
> > On Fri, 22 Jan 2021 16:23:25 +0800
> > Jason Wang<jasowang@redhat.com>  wrote:
> >
> >> When implementing multiple (sub)functions virtio device like SRIOV or
> >> sub-function. We're suffering from several issues:
> >>
> >> - There's no management interface for management function (PF) to
> >>    configure features, attributes for a (sub)function
> >> - Per (sub)function control virtqueue could be too expensive as the
> >>    number of (sub)functions could be very large
> >> - Virtualize per (sub)function control virtqueue could be very
> >>    challenge as we need the support of DMA isolation at queue level
> >>
> >> So this patch introduces the feature of VIRTIO_NET_CTRL_ADMIN_VQ. This
> >> allows the device to implement a single admin control virtqueue to
> >> manage per (sub)function features and attributes.
> >>
> >> The idea is simple, a new function id is introduced on top of the
> >> exist virtio_net_ctrl structure. This id is transport or device
> >> specific to uniquely identify a (sub)function.
> >>
> >> With this, we get a way of using management function (PF) to configure
> >> per (sub)function features and attributes. And since the admin control
> >> virtqueue belongs to management function (PF), the DMA is naturally
> >> isolated at (sub)function level instead of the queue level for per
> >> (sub)function control vq.
> >>
> >> Signed-off-by: Jason Wang<jasowang@redhat.com>
> >> ---
> >>   content.tex | 23 +++++++++++++++++++++++
> >>   1 file changed, 23 insertions(+)
> >>
> >> diff --git a/content.tex b/content.tex
> >> index 620c0e2..98592a4 100644
> >> --- a/content.tex
> >> +++ b/content.tex
> >> @@ -2940,6 +2940,9 @@ \subsection{Feature bits}\label{sec:Device Types=
 /
> >> Network Device / Feature bits
> >>   \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through contro=
l
> >>       channel.
> >>  =20
> >> +\item[VIRTIO_NET_F_ADMIN_CTRL_VQ(56)] Admin control channel is
> >> +    available.
> >> +
> >>   \item[VIRTIO_NET_F_HASH_REPORT(57)] Device can report per-packet has=
h
> >>       value and a type of calculated hash.
> >>  =20
> >> @@ -3864,6 +3867,26 @@ \subsubsection{Control Virtqueue}\label{sec:Dev=
ice
> >> Types / Network Device / Devi
> >>   do except issue a diagnostic if \field{ack} is not
> >>   VIRTIO_NET_OK.
> >>  =20
> >> +\subsubsection{Admin Control Virtqueue}\label{sec:Device Types / Netw=
ork
> >> Device / Device Operation / Control Virtqueue}
> >> +
> >> +When VIRTIO_NET_F_ADMIN_CTRL_VQ is negotiated, the driver can use the
> >> +control virtqueue to manipulate features of individual function where
> >> +the control virtqueues is not easily implemented in each function.
> > What is a 'function' in the context of the virtio-net device? I don't
> > think that this term is universal across transports.
>=20
>=20
> Good point. It might have well definition only in PCI.
>=20
> I wonder whether we can use "virtual device" here? It avoids transport
> specific terminology. And we can explain "virtual device" in one or two
> sentences here.
>=20
> Thanks


Something like:

When VIRTIO_NET_F_ADMIN_CTRL_VQ is negotiated, the driver can use the
admin control virtqueue of the management device to manipulate
features of individual virtual devices where the control virtqueue is
not easily implemented. The definition of management device and
virtual device is totally transport specific. E.g in the case of PCI
transport, the management device is usually the physical function (PF),
and the virtual device is the virtual function (VF).

Thanks

>=20
>=20
> >
>=20
>=20
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>=20
>=20


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

