Return-Path: virtio-comment-return-1759-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F0089864AB
	for <virtio-comment@lists.oasis-open.org>; Wed, 17 Mar 2021 12:57:57 +0000 (UTC)
Date: Wed, 17 Mar 2021 13:57:40 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20210317135740.6a3383b3.cohuck@redhat.com>
In-Reply-To: <94ca35e8-0353-59bd-b753-cf2e549d89de@redhat.com>
References: <20210315025846.6539-1-jasowang@redhat.com>
	<20210315162432.14f5476a.cohuck@redhat.com>
	<0bd20def-b7fe-0bb7-a660-e5745b727289@redhat.com>
	<20210316120634.5810ebfc.cohuck@redhat.com>
	<94ca35e8-0353-59bd-b753-cf2e549d89de@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH] virtio-pci: introduce
 VIRITO_F_QUEUE_STATE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, lulu@redhat.com, rob.miller@broadcom.com, stefanha@redhat.com, pasic@linux.ibm.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, 17 Mar 2021 11:43:53 +0800
Jason Wang <jasowang@redhat.com> wrote:

> =E5=9C=A8 2021/3/16 =E4=B8=8B=E5=8D=887:06, Cornelia Huck =E5=86=99=E9=81=
=93:
> > On Tue, 16 Mar 2021 10:53:37 +0800
> > Jason Wang <jasowang@redhat.com> wrote:
> > =20
> >> =E5=9C=A8 2021/3/15 =E4=B8=8B=E5=8D=8811:24, Cornelia Huck =E5=86=99=
=E9=81=93: =20
> >>> On Mon, 15 Mar 2021 10:58:46 +0800
> >>> Jason Wang <jasowang@redhat.com> wrote:

> >>>>    \drivernormative{\paragraph}{Common configuration structure layou=
t}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Com=
mon configuration structure layout}
> >>>>   =20
> >>>>    The driver MUST NOT write to \field{device_feature}, \field{num_q=
ueues}, \field{config_generation}, \field{queue_notify_off} or \field{queue=
_notify_data}.
> >>>> @@ -981,6 +1009,13 @@ \subsubsection{Common configuration structure =
layout}\label{sec:Virtio Transport
> >>>>   =20
> >>>>    The driver MUST NOT write a 0 to \field{queue_enable}.
> >>>>   =20
> >>>> +If VIRTIO_F_QUEUE_STATE has been negotiated, a driver SHOULD set th=
e
> >>>> +state of each virtqueue through \field{queue_state} before setting =
the
> >>>> +DRIVER_OK \field{device status} bit and SHOULD NOT write to
> >>>> +\field{queue_state} after setting the DRIVER_OK \field{device statu=
s}
> >>>> +bit. If a driver want to get the virtqueue state, it MUST first res=
et
> >>>> +the device then read state from \field{queue_state}. =20
> >>> What should the driver do with a 'fresh' device? Does it need to star=
t
> >>> out with a reset, read the (zero) state, and then write it back? =20
> >>
> >> If 'fresh' means a normal probe procedure, in this case we don't need =
to
> >> get the virtqueue state. What we need is to set a proper state.=C2=A0 =
For
> >> split virtqueue, the driver should write 0 (as last_avail_idx). For
> >> packed virtqueue, the driver shoudl write:
> >>
> >> {.last_avail_idx =3D 0, .last_avail_wrap_counter=3D1, .used_idx=3D0,
> >> used_wrap_counter=3D1}. =20
> > Yes, that was what I had been thinking of.
> >
> > So, I think the driver won't get a useful state if it reads the state
> > after reset for a previously unused device (the device statement only
> > says that it MUST NOT clear the state after reset)? =20
>=20
>=20
> Yes.
>=20
>=20
> > Do we need to add a
> > sentence that a driver needs to do that initial setup of the state for
> > a device it has not used previously? =20
>=20
>=20
> I'm not sure whether we need to treat the device which has not been used=
=20
> separatedly. Technically, when VIRTIO_F_QUEUE_STATE is neogitated,=20
> driver can teach the device to start from non 0 index (though it was not=
=20
> the way how Linux did right now).

Basically, the driver needs to be aware that there simply will not be
any usable state, and it needs to skip the getting and instead set some
initial values it deems reasonable. If that's obvious, I don't think we
need to spell it out.


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

