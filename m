Return-Path: virtio-comment-return-1639-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 572C39860FE
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 Jan 2021 12:01:01 +0000 (UTC)
Date: Thu, 14 Jan 2021 13:00:46 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20210114130046.45f228ba.cohuck@redhat.com>
In-Reply-To: <c5ea9953-7494-2944-3cd6-dda4661eebca@redhat.com>
References: <20201218042302.8884-1-jasowang@redhat.com>
	<20201221223338.7b5a21e6.pasic@linux.ibm.com>
	<bbd75f21-4a17-f3df-3c0e-3633a93d0599@redhat.com>
	<20201222075005.69d1cc6e.pasic@linux.ibm.com>
	<ed5c4298-cdd4-55d7-20c6-e57d4f92f752@redhat.com>
	<20201222131404.61e4a136.cohuck@redhat.com>
	<7da54d5b-0787-c78f-4b35-6a4f7ed2f5bf@redhat.com>
	<20201222165431.3f49de29.cohuck@redhat.com>
	<3cf88dc9-4053-0f24-854f-6cc6df2aaac4@redhat.com>
	<20201225083835.62efb230.pasic@linux.ibm.com>
	<20201227044431-mutt-send-email-mst@kernel.org>
	<20201228072104.08339352.pasic@linux.ibm.com>
	<30369ca4-6621-ea70-abbf-01c62666044b@redhat.com>
	<20201229143511.403fdefd.pasic@linux.ibm.com>
	<dd36fe91-1dc0-6998-4e2a-0f9a8ae47bdf@redhat.com>
	<20210111191609.50fa58f7.cohuck@redhat.com>
	<a8544ac8-4b4b-79b8-4345-5fc4f584f719@redhat.com>
	<20210112131319.39014c19.cohuck@redhat.com>
	<c5ea9953-7494-2944-3cd6-dda4661eebca@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, 13 Jan 2021 10:52:32 +0800
Jason Wang <jasowang@redhat.com> wrote:

> On 2021/1/12 =E4=B8=8B=E5=8D=888:13, Cornelia Huck wrote:
> > On Tue, 12 Jan 2021 11:27:20 +0800
> > Jason Wang <jasowang@redhat.com> wrote:
> > =20
> >> On 2021/1/12 =E4=B8=8A=E5=8D=882:16, Cornelia Huck wrote: =20
> >>> On Wed, 30 Dec 2020 16:15:47 +0800
> >>> Jason Wang <jasowang@redhat.com> wrote:
> >>>    =20
> >>>> On 2020/12/29 =E4=B8=8B=E5=8D=889:35, Halil Pasic wrote: =20
> >>>>> On Mon, 28 Dec 2020 15:01:57 +0800
> >>>>> Jason Wang <jasowang@redhat.com> wrote:
> >>>>>       =20
> >>>>>> Some part of the virtio has enforced an asynchronous interface dur=
ing reset:
> >>>>>>
> >>>>>> For MMIO the spec said:
> >>>>>>
> >>>>>> """
> >>>>>>
> >>>>>> To stop using the queue the driver MUST write zero (0x0) to this
> >>>>>> QueueReady and MUST read the value back to ensure synchronization.
> >>>>>>
> >>>>>> """ =20
> >>>>> I read the MMIO quote like a single read is sufficient to ensure
> >>>>> synchronization. I.e. it does not require a loop which waits for
> >>>>> the read to yield the expected value.
> >>>>>       =20
> >>>>>> For PCI it said:
> >>>>>>
> >>>>>> """
> >>>>>>
> >>>>>> After writing 0 to device_status, the driver MUST wait for a read =
of
> >>>>>> device_status to return 0 before reinitializing the device.
> >>>>>>
> >>>>>> """ =20
> >>>>> Yes, this does sound like a loop. And that's what Linux does. But t=
his
> >>>>> is transport (PCI) specific. On a spec level, a reset is a distinct
> >>>>> operation from setting device status (to 0). =20
> >>>> I'm not sure or it looks unclear to me for this point.
> >>>>
> >>>> E.g the device reset is mentioned in "Device Status Field" belongs t=
o
> >>>> "Basic Facilities of a Virtio Device". But there's no "Device Reset"=
 in
> >>>> "Basic Facilities of a Virtio Device". =20
> >>> I think it should be, just to make clear what a driver-initiated rese=
t
> >>> of a device actually resets (and that the method for doing so is
> >>> transport-specific.) =20
> >>
> >> Then we need some clarifications in the spec. It would be easily imply
> >> that reset is part of device status after reading "Basic Facilities of=
 a
> >> Virtio Device". =20
> > I can try to come up with a patch. =20
>=20
>=20
> Thanks

Attempt here:

https://lists.oasis-open.org/archives/virtio-comment/202101/msg00020.html


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

