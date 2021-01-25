Return-Path: virtio-comment-return-1666-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 17F5D9861BF
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Jan 2021 06:31:59 +0000 (UTC)
Date: Mon, 25 Jan 2021 14:31:03 +0800
From: Haozhong Zhang <haozhong@zhan9.net>
Message-ID: <20210125063103.hxj7hbwyixcyt4m3@HZ-MBP-HOME.local>
References: <20210125055202.29001-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210125055202.29001-1-jasowang@redhat.com>
Subject: Re: [virtio-comment] [PATCH V2] virtio-net: introduce admin control
 virtqueue
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fbdgrxfhychg34vw"
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

--fbdgrxfhychg34vw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/25/21 13:52, Jason Wang wrote:
> When implementing virtual devices like SR-IOV or sub-function. We're
> suffering from several issues:
>=20
> - There's no management interface for management device to
>   configure features, attributes for a virtual device
> - Per virtual device control virtqueue could be very expensive as the
>   number of virtual devices could be very large
> - Virtualize per virtual device's control virtqueue could be very
>   challenge as we need the support of DMA isolation at queue level
>=20
> So this patch introduces the feature of VIRTIO_NET_CTRL_ADMIN_VQ. This
> allows the device to implement a single admin control virtqueue to
> manage the features and attributes for a specific virtual device.
>=20
> The idea is simple, a new virtual device id is introduced on top of
> the existing virtio_net_ctrl structure. This id is transport or device
> specific to uniquely identify a management or virtual device.
>=20
> With this, we get a way of using management device (PF) to configure
> per virtual device features and attributes. And since the admin
> control virtqueue belongs to management device (PF), the DMA is
> naturally isolated at device level instead of the queue level for per
> virtual device control vq.
>=20
> When the admin cvq is offered by management device and normal cvq is
> offered by virtual device. A new command class is introduced decide
> whether or not to accept commands from normal cvq for a virtual
> device.
>=20
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
> Changes from V1:
> - use 'virtual device' instead of 'function'
> - introuce trust command
> - clairfy that the admin cvq could be used to configure management
>   device itself
> ---
>  content.tex | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 56 insertions(+), 3 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index 620c0e2..989b4f6 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2940,6 +2940,9 @@ \subsection{Feature bits}\label{sec:Device Types / =
Network Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
> =20
> +\item[VIRTIO_NET_F_ADMIN_CTRL_VQ(56)] Admin control channel is
> +    available.
> +
>  \item[VIRTIO_NET_F_HASH_REPORT(57)] Device can report per-packet hash
>      value and a type of calculated hash.
> =20
> @@ -3840,11 +3843,12 @@ \subsubsection{Processing of Incoming Packets}\la=
bel{sec:Device Types / Network
>  \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Devic=
e / Device Operation / Control Virtqueue}
> =20
>  The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
> -negotiated) to send commands to manipulate various features of
> -the device which would not easily map into the configuration
> -space.
> +negotiated but VIRTIO_NET_F_ADMIN_CTRL_VQ is not negotiated) to send
> +commands to manipulate various features of the device which would not
> +easily map into the configuration space.
> =20
>  All commands are of the following form:
> +is not negotiated:
> =20
>  \begin{lstlisting}
>  struct virtio_net_ctrl {
> @@ -3864,6 +3868,29 @@ \subsubsection{Control Virtqueue}\label{sec:Device=
 Types / Network Device / Devi
>  do except issue a diagnostic if \field{ack} is not
>  VIRTIO_NET_OK.
> =20
> +When both VIRTIO_NET_F_CTRL_VQ and VIRTIO_NET_F_ADMIN_CTRL_VQ are
> +negotiated, the driver can use the admin control virtqueue of the
> +management device to manipulate features of individual virtual devices
> +where the control virtqueue is not easily implemented. The definition
> +of management device and virtual device is transport or device
> +specific. E.g in the case of PCI SR-IOV, the management device is
> +implemented via the physical function (PF), then the virtual device is
> +the virtual function (VF) in this case.
> +
> +All commands are of the following form:
> +
> +\begin{lstlisting}
> +struct virtio_net_admin_ctrl {
> +        u32 virtual_device_id;
> +        struct virtio_net_ctrl ctrl;
> +};
> +\end{lstlisting}
> +
> +The \field{virtual_device_id} is an unique transport or device specific
> +identifier for a virtual device or management device. E.g for the case
> +of PCI SR-IOV, it's the PCI function id. Management device MUST
> +reserve 0 for \field{virtual_device_id} to identify itself.
> +

Hi Jason,

One question about the valid scope of virtual_device_id. Consider a
case, that

0. A VF with PCI address "xx:yy.z" exists
1. The virtio driver commits an admin command with virtual_device_id
   "xx:yy.z" admin queue
2. Before the device processes the command, the virtio driver disables
   PF SRIOV, then re-enables it, and then creates a VF with the same
   address as "xx:yy.z".

Now, should the command committed in step 1 still be considered as
valid after step 2? If not, shall there be a flush or abort operation
to allow the driver to drop commands between step 1 and 2? Or simply
let the driver just wait until all admin commands have been processed.

Thanks,
Haozhong


>  \paragraph{Packet Receive Filtering}\label{sec:Device Types / Network De=
vice / Device Operation / Control Virtqueue / Packet Receive Filtering}
>  \label{sec:Device Types / Network Device / Device Operation / Control Vi=
rtqueue / Setting Promiscuous Mode}%old label for latexdiff
> =20
> @@ -4308,6 +4335,32 @@ \subsubsection{Control Virtqueue}\label{sec:Device=
 Types / Network Device / Devi
>  according to the native endian of the guest rather than
>  (necessarily when not using the legacy interface) little-endian.
> =20
> +\paragraph{Setting Trust for Virtual Device}\label{sec:Device Types / Ne=
twork Device / Device Operation / Control Virtqueue / Setting Trust for Vir=
tual Device}
> +
> +If the VIRTIO_NET_F_ADMIN_CTRL_VQ is negotiated, the management device
> +can accept operations via the control vq from the trusted virtual
> +device.
> +
> +\begin{lstlisting}
> +#define VIRTIO_NET_ADMIN_CTRL_TRUST 0
> + #define VIRTIO_NET_ADMIN_CTRL_TRUST_ENABLE 0
> +\end{lstlisting}
> +
> +\devicenormative{\subparagraph}{Setting Trust for Virtual Device}{Device=
 Types / Network Device / Device Operation / Control Virtqueue / Setting Tr=
ust for Virtual Device}
> +
> +If the VIRTIO_NET_F_ADMIN_CTRL_VQ has been negotiated, the device MUST
> +support VIRTIO_NET_ADMIN_CTRL_TRUST class
> +command. VIRTIO_NET_ADMIN_CTRL_TRUST_ENABLE turns trust for the
> +control virtqueue of a specific virtual device on and off. The command
> +specific data is one byte containing 0(off) or 1(on).  When trust is
> +off the device MUST fail any operations from the control virtqueue of
> +the virtual device. The management device MUST NOT trust any virtual
> +devices after reset.
> +
> +\drivernormative{\subparagraph}{Setting Trust for Virtual Device}{Device=
 Types / Network Device / Device Operation / Control Virtqueue / Setting Tr=
ust for Virtual Device}
> +
> +A driver SHOULD negotiate VIRTIO_NET_F_ADMIN_CTRL_VQ if the device
> +offers it.
> =20
>  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>  Types / Network Device / Legacy Interface: Framing Requirements}
> --=20
> 2.25.1
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



--fbdgrxfhychg34vw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEg0qRRYSsK3+7NmVVJmP5Ya+80fwFAmAOZaIACgkQJmP5Ya+8
0fx8gQ//UKNyZ0g7p5FyuU2mOFyXR80CpJCfmTIEHxX9X10ZNuK9XkNJDLZe5cYt
3LvVnssVgb1GvDJYJg03bOA9hmeW9xhDurT6ySPVdB3Lad3fSS4ifK4M6Xhun9Pv
qMncl4VbyM/J0PJbLPvF1/W2ObW6oedqmX2loGpgbjZY/Wse2Yw9j6wj0EXYpPSr
0DblmGpM/AV3tb2hfl+PrSOzivLUIbHXQRsRevDaTO68m15YFNpTcyVcqMrpAF02
qBwaRaINCiGI+avlt8OWOg7JSbmFDizCW8YZdHJF6mq/Wb7ZGeKLF1fcpvfgjyit
IWNHocnlgS37W8Y3g1tU48OgxubDpDJ/y7FZCGHYQfu9HLvxNfmEx8tW9fXos7v6
NC0OoqEl+GVRaxTeQ0FzpODpzD/hdEP9K4akSh5Xtn+UGN790Kdw+3QyrsxYV1X+
1OrRFG9nrHHXbYJZt11HHMpEeZxYRKKJG06NiHbnA7NSoxbbkz+ek5602fmnSIOO
CvaKDFikbwZdYJRJzUcASxh6q4+0jrYIPyn83g1saA7v+Mrm4UvPfQxYdBzN9TnP
o6AeI1RLmAJqv2SI3Gx1ju+kOexn5qcTvamDAPmstBbyZwLKy7wk1qxSiP1OkQzM
gLe22c6h90Opr4J0rl2bYAX6DKH+mwreXcgu2kLkO2B8CzeD6fA=
=6eqj
-----END PGP SIGNATURE-----

--fbdgrxfhychg34vw--

