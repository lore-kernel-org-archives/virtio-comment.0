Return-Path: virtio-comment-return-1749-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2B8189864A8
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Mar 2021 11:06:49 +0000 (UTC)
Date: Tue, 16 Mar 2021 12:06:34 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20210316120634.5810ebfc.cohuck@redhat.com>
In-Reply-To: <0bd20def-b7fe-0bb7-a660-e5745b727289@redhat.com>
References: <20210315025846.6539-1-jasowang@redhat.com>
	<20210315162432.14f5476a.cohuck@redhat.com>
	<0bd20def-b7fe-0bb7-a660-e5745b727289@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH] virtio-pci: introduce
 VIRITO_F_QUEUE_STATE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, lulu@redhat.com, rob.miller@broadcom.com, stefanha@redhat.com, pasic@linux.ibm.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, 16 Mar 2021 10:53:37 +0800
Jason Wang <jasowang@redhat.com> wrote:

> =E5=9C=A8 2021/3/15 =E4=B8=8B=E5=8D=8811:24, Cornelia Huck =E5=86=99=E9=
=81=93:
> > On Mon, 15 Mar 2021 10:58:46 +0800
> > Jason Wang <jasowang@redhat.com> wrote:
> > =20
> >> This patch adds the ability to save and restore virtqueue state via a
> >> new field in the common configuration infrastructure.
> >>
> >> To simply the implementation, no new device status is introduced. For
> >> device, the requirements is not to forget the queue state after
> >> virtio reset and clear the virtqueue state upon ACKNOWLEDGE. For
> >> driver, it must set the virtqueue state before setting DRIVER_OK.
> >>
> >> To save a virtqueue state, the driver then need:
> >>
> >> 1) reset device
> >> 2) read virtqueue statue
> >>
> >> To restore a virtqueue state, the driver need:
> >>
> >> 1) reset device
> >> 2) perform necessary setups (e.g features negotiation)
> >> 3) write virtqueue state
> >> 4) set DRIVER_OK
> >>
> >> The main user should be live migration.
> >>
> >> Signed-off-by: Jason Wang <jasowang@redhat.com>
> >> ---
> >>   content.tex                 | 38 +++++++++++++++++++++++++++++++++++=
++
> >>   virtqueue-state-packed-le.c |  7 +++++++
> >>   virtqueue-state-split-le.c  |  4 ++++
> >>   3 files changed, 49 insertions(+)
> >>   create mode 100644 virtqueue-state-packed-le.c
> >>   create mode 100644 virtqueue-state-split-le.c
> >>

> >> @@ -964,6 +988,10 @@ \subsubsection{Common configuration structure lay=
out}\label{sec:Virtio Transport
> >>   present either a value of 0 or a power of 2 in
> >>   \field{queue_size}.
> >>  =20
> >> +If VIRTIO_F_QUEUE_STATE has been negotiated, a device MUST NOT clear
> >> +the queue state upon reset and MUST reset the queue state when
> >> +ACKNOWLEDGE has been set through \field{device status} bit. =20
> > What happens if a driver tries to read the queue status outside of this
> > window? Should it get zeroes? Unpredictable values? =20
>=20
>=20
> I'm not sure having normative like this can help. Can we leave it to=20
> device? I had a driver normative to clarify when should driver read or=20
> write to the value.

Ok, a normative statement is probably not that useful, if a driver
operating outside of the spec gets to keep the pieces when it breaks.

>=20
>=20
> > =20
> >> +
> >>   \drivernormative{\paragraph}{Common configuration structure layout}{=
Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common=
 configuration structure layout}
> >>  =20
> >>   The driver MUST NOT write to \field{device_feature}, \field{num_queu=
es}, \field{config_generation}, \field{queue_notify_off} or \field{queue_no=
tify_data}.
> >> @@ -981,6 +1009,13 @@ \subsubsection{Common configuration structure la=
yout}\label{sec:Virtio Transport
> >>  =20
> >>   The driver MUST NOT write a 0 to \field{queue_enable}.
> >>  =20
> >> +If VIRTIO_F_QUEUE_STATE has been negotiated, a driver SHOULD set the
> >> +state of each virtqueue through \field{queue_state} before setting th=
e
> >> +DRIVER_OK \field{device status} bit and SHOULD NOT write to
> >> +\field{queue_state} after setting the DRIVER_OK \field{device status}
> >> +bit. If a driver want to get the virtqueue state, it MUST first reset
> >> +the device then read state from \field{queue_state}. =20
> > What should the driver do with a 'fresh' device? Does it need to start
> > out with a reset, read the (zero) state, and then write it back? =20
>=20
>=20
> If 'fresh' means a normal probe procedure, in this case we don't need to=
=20
> get the virtqueue state. What we need is to set a proper state.=C2=A0 For=
=20
> split virtqueue, the driver should write 0 (as last_avail_idx). For=20
> packed virtqueue, the driver shoudl write:
>=20
> {.last_avail_idx =3D 0, .last_avail_wrap_counter=3D1, .used_idx=3D0,=20
> used_wrap_counter=3D1}.

Yes, that was what I had been thinking of.

So, I think the driver won't get a useful state if it reads the state
after reset for a previously unused device (the device statement only
says that it MUST NOT clear the state after reset)? Do we need to add a
sentence that a driver needs to do that initial setup of the state for
a device it has not used previously?

>=20
> If 'fresh' means start device after migration, we need to set the=20
> virtqueue state to what source gives us:
>=20
> in src:
>=20
> 1) reset device
> 2) read virtqueue states
> 3) pass virtqueue states to dst
>=20
> in dst:
>=20
> 1) receivce virtqueue states from src
> 2) reset device
> 3) perform necesssary setup ( feature neogitaion etc.)
> 4) set the virtqueue states we received from src.
>=20
> Btw, it looks to me we need to clearify that "The driver MUST write to=20
> queue_state after FEATURE_OK but before DRIVER_OK)

Yes, I agree.


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

