Return-Path: virtio-comment-return-1668-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EB6BB9861BF
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Jan 2021 07:05:24 +0000 (UTC)
Date: Mon, 25 Jan 2021 15:05:09 +0800
From: Haozhong Zhang <haozhong@zhan9.net>
Message-ID: <20210125070509.7t2etiwn5fz5iw6n@HZ-MBP-HOME.local>
References: <20210125055202.29001-1-jasowang@redhat.com>
 <20210125063103.hxj7hbwyixcyt4m3@HZ-MBP-HOME.local>
 <0f96efd1-251e-fbb4-8f8c-2de4a58883e6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0f96efd1-251e-fbb4-8f8c-2de4a58883e6@redhat.com>
Subject: Re: [virtio-comment] [PATCH V2] virtio-net: introduce admin control
 virtqueue
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="znanbql25rfg5chh"
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

--znanbql25rfg5chh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/25/21 14:45, Jason Wang wrote:
>=20
> On 2021/1/25 =E4=B8=8B=E5=8D=882:31, Haozhong Zhang wrote:
> > On 01/25/21 13:52, Jason Wang wrote:
> > > When implementing virtual devices like SR-IOV or sub-function. We're
> > > suffering from several issues:
> > >=20
> > > - There's no management interface for management device to
> > >    configure features, attributes for a virtual device
> > > - Per virtual device control virtqueue could be very expensive as the
> > >    number of virtual devices could be very large
> > > - Virtualize per virtual device's control virtqueue could be very
> > >    challenge as we need the support of DMA isolation at queue level
> > >=20
> > > So this patch introduces the feature of VIRTIO_NET_CTRL_ADMIN_VQ. Thi=
s
> > > allows the device to implement a single admin control virtqueue to
> > > manage the features and attributes for a specific virtual device.
> > >=20
> > > The idea is simple, a new virtual device id is introduced on top of
> > > the existing virtio_net_ctrl structure. This id is transport or devic=
e
> > > specific to uniquely identify a management or virtual device.
> > >=20
> > > With this, we get a way of using management device (PF) to configure
> > > per virtual device features and attributes. And since the admin
> > > control virtqueue belongs to management device (PF), the DMA is
> > > naturally isolated at device level instead of the queue level for per
> > > virtual device control vq.
> > >=20
> > > When the admin cvq is offered by management device and normal cvq is
> > > offered by virtual device. A new command class is introduced decide
> > > whether or not to accept commands from normal cvq for a virtual
> > > device.
> > >=20
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > > Changes from V1:
> > > - use 'virtual device' instead of 'function'
> > > - introuce trust command
> > > - clairfy that the admin cvq could be used to configure management
> > >    device itself
> > > ---
> > >   content.tex | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++=
---
> > >   1 file changed, 56 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/content.tex b/content.tex
> > > index 620c0e2..989b4f6 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -2940,6 +2940,9 @@ \subsection{Feature bits}\label{sec:Device Type=
s / Network Device / Feature bits
> > >   \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through contr=
ol
> > >       channel.
> > > +\item[VIRTIO_NET_F_ADMIN_CTRL_VQ(56)] Admin control channel is
> > > +    available.
> > > +
> > >   \item[VIRTIO_NET_F_HASH_REPORT(57)] Device can report per-packet ha=
sh
> > >       value and a type of calculated hash.
> > > @@ -3840,11 +3843,12 @@ \subsubsection{Processing of Incoming Packets=
}\label{sec:Device Types / Network
> > >   \subsubsection{Control Virtqueue}\label{sec:Device Types / Network =
Device / Device Operation / Control Virtqueue}
> > >   The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
> > > -negotiated) to send commands to manipulate various features of
> > > -the device which would not easily map into the configuration
> > > -space.
> > > +negotiated but VIRTIO_NET_F_ADMIN_CTRL_VQ is not negotiated) to send
> > > +commands to manipulate various features of the device which would no=
t
> > > +easily map into the configuration space.
> > >   All commands are of the following form:
> > > +is not negotiated:
> > >   \begin{lstlisting}
> > >   struct virtio_net_ctrl {
> > > @@ -3864,6 +3868,29 @@ \subsubsection{Control Virtqueue}\label{sec:De=
vice Types / Network Device / Devi
> > >   do except issue a diagnostic if \field{ack} is not
> > >   VIRTIO_NET_OK.
> > > +When both VIRTIO_NET_F_CTRL_VQ and VIRTIO_NET_F_ADMIN_CTRL_VQ are
> > > +negotiated, the driver can use the admin control virtqueue of the
> > > +management device to manipulate features of individual virtual devic=
es
> > > +where the control virtqueue is not easily implemented. The definitio=
n
> > > +of management device and virtual device is transport or device
> > > +specific. E.g in the case of PCI SR-IOV, the management device is
> > > +implemented via the physical function (PF), then the virtual device =
is
> > > +the virtual function (VF) in this case.
> > > +
> > > +All commands are of the following form:
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_net_admin_ctrl {
> > > +        u32 virtual_device_id;
> > > +        struct virtio_net_ctrl ctrl;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +The \field{virtual_device_id} is an unique transport or device speci=
fic
> > > +identifier for a virtual device or management device. E.g for the ca=
se
> > > +of PCI SR-IOV, it's the PCI function id. Management device MUST
> > > +reserve 0 for \field{virtual_device_id} to identify itself.
> > > +
> > Hi Jason,
> >=20
> > One question about the valid scope of virtual_device_id. Consider a
> > case, that
> >=20
> > 0. A VF with PCI address "xx:yy.z" exists
> > 1. The virtio driver commits an admin command with virtual_device_id
> >     "xx:yy.z" admin queue
> > 2. Before the device processes the command, the virtio driver disables
> >     PF SRIOV, then re-enables it, and then creates a VF with the same
> >     address as "xx:yy.z".
> >=20
> > Now, should the command committed in step 1 still be considered as
> > valid after step 2? If not, shall there be a flush or abort operation
> > to allow the driver to drop commands between step 1 and 2? Or simply
> > let the driver just wait until all admin commands have been processed.
>=20
>=20
> Good point. My understanding is:
>=20
> From device level: the effect of the command ties to the lifecycle of the
> device (e.g VF). So if virtual device (VF) is destroyed (e.g SR-IOV is
> disabled), the command won't be effective any more even if it is re-creat=
ed
> later. And if the virtual device is destroyed during processing the admin
> command, the management device (PF) must fail the command.
>=20
> From driver level: The driver should synchronize between the admin contro=
l
> vq processing and virtual devices create/destroy to avoid unexpected
> results.
>
> Does this make sense?
>=20
> I think we can clarify this in the spec.

I guess the above virtual device destroy also includes the case that
the virtual device is already in NEEDS_RESET status. If so, all make
sense. I think the driver can synchronize easily, for example by just
waiting all commands targeted to that VF failed.

Haozhong

--znanbql25rfg5chh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEg0qRRYSsK3+7NmVVJmP5Ya+80fwFAmAObaEACgkQJmP5Ya+8
0fzkpxAAmeiIEW8IdWm5+I665WPC+jEVA1siyxoz1L9QD3Dmg7RAgkdKtr+iSpoE
EJU1PnpMyrK6uoNxImSs3gf7XTyZnP2VS6H8GkzeJErKLufdVKR5O3L44UH5HYtW
Qcc2Tt6HM/FmuyuwYKuQu3KF+QWMAR/mHd+hxMeFB7qdGee/LYMV2qiWrlLyxP7X
rVyf9fX0vOcP8ubIkqrjItMLMcoAW2Bg7eEEphR/FTxjg8aES60x1ZZRtDkhWQHI
8GjBCFLAAcfCMm2Yiusnxa3aJWC/I4DBmDvLE5/HyaRufrXt+7TRuIpdXK35XL0N
QyHWmE+cmMcV/VDZ5xgtcIJbHFpzFm/jANsC2H3oh/ce7RawauFDLu+BM/7Bvhx7
SaLirKsxGAdxV/1acBJoHC1kpj81rj48r1xnyQFUu37P/9iDtUV4byfZsBQolGtV
7DbINft4v7TajcYf7bjs0rsYJad8JkouJ0LTLjyifbJQXajTFg0AagtgFVGb9LtE
zWltRaL+RyWEJAcWrxetRnblTl4PFKgkR9fis5VymCr7nG3Hjuj+Bze2/Jdbv51x
MZ4tb2woufPmnl5qRbx7W0GD+pnYQlyC7JeQ7SRrZM+1tasyZ1Lg6c7e61pYyOZa
az0WYYdaeM3qzrukI1ci94Oc+33e/PTYNninkr9x8dadLmeFRRo=
=Jv9B
-----END PGP SIGNATURE-----

--znanbql25rfg5chh--

