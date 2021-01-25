Return-Path: virtio-comment-return-1670-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A06F69861C0
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Jan 2021 10:23:12 +0000 (UTC)
Date: Mon, 25 Jan 2021 18:22:59 +0800
From: Haozhong Zhang <haozhong@zhan9.net>
Message-ID: <20210125102259.s2zmjc24exe6qicv@HZ-MBP-HOME.local>
References: <20210125055202.29001-1-jasowang@redhat.com>
 <20210125063103.hxj7hbwyixcyt4m3@HZ-MBP-HOME.local>
 <0f96efd1-251e-fbb4-8f8c-2de4a58883e6@redhat.com>
 <20210125070509.7t2etiwn5fz5iw6n@HZ-MBP-HOME.local>
 <c5ee736e-13ab-5a43-3227-6dc2dda3eae5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c5ee736e-13ab-5a43-3227-6dc2dda3eae5@redhat.com>
Subject: Re: [virtio-comment] [PATCH V2] virtio-net: introduce admin control
 virtqueue
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2mcgn5x2gzxlj7wf"
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

--2mcgn5x2gzxlj7wf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/25/21 15:48, Jason Wang wrote:
>=20
> On 2021/1/25 =E4=B8=8B=E5=8D=883:05, Haozhong Zhang wrote:
> > On 01/25/21 14:45, Jason Wang wrote:
> > > On 2021/1/25 =E4=B8=8B=E5=8D=882:31, Haozhong Zhang wrote:
> > > > On 01/25/21 13:52, Jason Wang wrote:
> > > > > When implementing virtual devices like SR-IOV or sub-function. We=
're
> > > > > suffering from several issues:
> > > > >=20
> > > > > - There's no management interface for management device to
> > > > >     configure features, attributes for a virtual device
> > > > > - Per virtual device control virtqueue could be very expensive as=
 the
> > > > >     number of virtual devices could be very large
> > > > > - Virtualize per virtual device's control virtqueue could be very
> > > > >     challenge as we need the support of DMA isolation at queue le=
vel
> > > > >=20
> > > > > So this patch introduces the feature of VIRTIO_NET_CTRL_ADMIN_VQ.=
 This
> > > > > allows the device to implement a single admin control virtqueue t=
o
> > > > > manage the features and attributes for a specific virtual device.
> > > > >=20
> > > > > The idea is simple, a new virtual device id is introduced on top =
of
> > > > > the existing virtio_net_ctrl structure. This id is transport or d=
evice
> > > > > specific to uniquely identify a management or virtual device.
> > > > >=20
> > > > > With this, we get a way of using management device (PF) to config=
ure
> > > > > per virtual device features and attributes. And since the admin
> > > > > control virtqueue belongs to management device (PF), the DMA is
> > > > > naturally isolated at device level instead of the queue level for=
 per
> > > > > virtual device control vq.
> > > > >=20
> > > > > When the admin cvq is offered by management device and normal cvq=
 is
> > > > > offered by virtual device. A new command class is introduced deci=
de
> > > > > whether or not to accept commands from normal cvq for a virtual
> > > > > device.
> > > > >=20
> > > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > > ---
> > > > > Changes from V1:
> > > > > - use 'virtual device' instead of 'function'
> > > > > - introuce trust command
> > > > > - clairfy that the admin cvq could be used to configure managemen=
t
> > > > >     device itself
> > > > > ---
> > > > >    content.tex | 59 +++++++++++++++++++++++++++++++++++++++++++++=
+++++---
> > > > >    1 file changed, 56 insertions(+), 3 deletions(-)
> > > > >=20
> > > > > diff --git a/content.tex b/content.tex
> > > > > index 620c0e2..989b4f6 100644
> > > > > --- a/content.tex
> > > > > +++ b/content.tex
> > > > > @@ -2940,6 +2940,9 @@ \subsection{Feature bits}\label{sec:Device =
Types / Network Device / Feature bits
> > > > >    \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through =
control
> > > > >        channel.
> > > > > +\item[VIRTIO_NET_F_ADMIN_CTRL_VQ(56)] Admin control channel is
> > > > > +    available.
> > > > > +
> > > > >    \item[VIRTIO_NET_F_HASH_REPORT(57)] Device can report per-pack=
et hash
> > > > >        value and a type of calculated hash.
> > > > > @@ -3840,11 +3843,12 @@ \subsubsection{Processing of Incoming Pac=
kets}\label{sec:Device Types / Network
> > > > >    \subsubsection{Control Virtqueue}\label{sec:Device Types / Net=
work Device / Device Operation / Control Virtqueue}
> > > > >    The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ=
 is
> > > > > -negotiated) to send commands to manipulate various features of
> > > > > -the device which would not easily map into the configuration
> > > > > -space.
> > > > > +negotiated but VIRTIO_NET_F_ADMIN_CTRL_VQ is not negotiated) to =
send
> > > > > +commands to manipulate various features of the device which woul=
d not
> > > > > +easily map into the configuration space.
> > > > >    All commands are of the following form:
> > > > > +is not negotiated:
> > > > >    \begin{lstlisting}
> > > > >    struct virtio_net_ctrl {
> > > > > @@ -3864,6 +3868,29 @@ \subsubsection{Control Virtqueue}\label{se=
c:Device Types / Network Device / Devi
> > > > >    do except issue a diagnostic if \field{ack} is not
> > > > >    VIRTIO_NET_OK.
> > > > > +When both VIRTIO_NET_F_CTRL_VQ and VIRTIO_NET_F_ADMIN_CTRL_VQ ar=
e
> > > > > +negotiated, the driver can use the admin control virtqueue of th=
e
> > > > > +management device to manipulate features of individual virtual d=
evices
> > > > > +where the control virtqueue is not easily implemented. The defin=
ition
> > > > > +of management device and virtual device is transport or device
> > > > > +specific. E.g in the case of PCI SR-IOV, the management device i=
s
> > > > > +implemented via the physical function (PF), then the virtual dev=
ice is
> > > > > +the virtual function (VF) in this case.
> > > > > +
> > > > > +All commands are of the following form:
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_net_admin_ctrl {
> > > > > +        u32 virtual_device_id;
> > > > > +        struct virtio_net_ctrl ctrl;
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +The \field{virtual_device_id} is an unique transport or device s=
pecific
> > > > > +identifier for a virtual device or management device. E.g for th=
e case
> > > > > +of PCI SR-IOV, it's the PCI function id. Management device MUST
> > > > > +reserve 0 for \field{virtual_device_id} to identify itself.
> > > > > +
> > > > Hi Jason,
> > > >=20
> > > > One question about the valid scope of virtual_device_id. Consider a
> > > > case, that
> > > >=20
> > > > 0. A VF with PCI address "xx:yy.z" exists
> > > > 1. The virtio driver commits an admin command with virtual_device_i=
d
> > > >      "xx:yy.z" admin queue
> > > > 2. Before the device processes the command, the virtio driver disab=
les
> > > >      PF SRIOV, then re-enables it, and then creates a VF with the s=
ame
> > > >      address as "xx:yy.z".
> > > >=20
> > > > Now, should the command committed in step 1 still be considered as
> > > > valid after step 2? If not, shall there be a flush or abort operati=
on
> > > > to allow the driver to drop commands between step 1 and 2? Or simpl=
y
> > > > let the driver just wait until all admin commands have been process=
ed.
> > >=20
> > > Good point. My understanding is:
> > >=20
> > >  From device level: the effect of the command ties to the lifecycle o=
f the
> > > device (e.g VF). So if virtual device (VF) is destroyed (e.g SR-IOV i=
s
> > > disabled), the command won't be effective any more even if it is re-c=
reated
> > > later. And if the virtual device is destroyed during processing the a=
dmin
> > > command, the management device (PF) must fail the command.
> > >=20
> > >  From driver level: The driver should synchronize between the admin c=
ontrol
> > > vq processing and virtual devices create/destroy to avoid unexpected
> > > results.
> > >=20
> > > Does this make sense?
> > >=20
> > > I think we can clarify this in the spec.
> > I guess the above virtual device destroy also includes the case that
> > the virtual device is already in NEEDS_RESET status.
>=20
>=20
> We can provide that, but in your case the virtual device is going to be
> destroyed soon, I'm not sure how much it can help.
>=20
>=20
> > If so, all make
> > sense. I think the driver can synchronize easily, for example by just
> > waiting all commands targeted to that VF failed.
>=20
>=20
> Before disabling SR-IOV, PF driver needs to send the notification to VF
> drivers to sync admin cvq commands with its shutdown.

I think this notification can be used by the driver as a "barrier":
- all commands for this VF before the barrier that have not been
  completed can be ignored (e.g., if a failure status is later
  returned for such a command, the driver will not need to do anything
  as the device has been destroyed)
- all commands for this VF after the barrier are for the new (or
  re-enabled) VF.

Then the driver would not need to busy wait for all commands before
the barrier to complete before it can perform other operations on that
VF (e.g., disable/re-enabling...).

> I'm not sure which way
> is more easier either of your proposal should work:
>=20
> 1) busy wait for the completion of the command
> 2) let the PF to deal with the possible failure
>=20
> Thanks
>=20
>=20
> >=20
> > Haozhong
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
- Haozhong Zhang


--2mcgn5x2gzxlj7wf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEg0qRRYSsK3+7NmVVJmP5Ya+80fwFAmAOnAAACgkQJmP5Ya+8
0fz5Ag/+KwPLHnx88imM6MobupezrkoxKxyth3u5UhS5MqZyjklqueFG0Cuxw1nJ
i7nsjWxaKwP3Vs9RnbK+RpO7a35lhUky0U1W0P6oZqFzcsiRzrMBByePLQnS7tDN
zDhuZ0KR48CDvDL6rLUqav4hReqc9Wukrb7EZsfNp8beZVfTfPgYCBscwiGl3Vow
DjfrBI4AV4QssWvq1hu9wKSrPEp8j/RIHAM99sr6WHj3LcN2ggJHaFjNmqH9HUsC
8SC5sJWNJjtu6oCVdy1yIyibFrMHIaOaixT/+uW1YYziWqp+EcmcUVHIAjVpUT96
Y4ZjnO2/JQIYAYQuKCmIKEZgEkGuVut8d70t0kQtG1JSBqO+iNJN9yblBxx6qXxr
2n8sPytEZujMyugoOaO5ju+3Jz1CUuArsdbMzySZdxgm6zfj/czv0RFjlhzblbP8
0HUetxL91uZZ0nSuOYDSOK3NlFHdDAF6uCLwWRUUMQ7L6QRpyN1cB7us1w6Y4WDd
lZFYiVovbyZeS7qDY/urvhqXX75bNgk0W4aTdTHv3VSlfN5u95XSJl3i3fbxiPKG
UZmnYUfxe8l6ZHhogrSRWNXg1uenV4faKQfIMqeKnr1+gZqpUSmbrOzZKHYFaJ5I
goGT+cSPlQTgtGHQax79K8TzWQdx0j0exCA7TWYr09qCjdy6qi0=
=VaWX
-----END PGP SIGNATURE-----

--2mcgn5x2gzxlj7wf--

