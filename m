Return-Path: virtio-comment-return-1608-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 37B4D986382
	for <virtio-comment@lists.oasis-open.org>; Tue, 29 Dec 2020 09:04:32 +0000 (UTC)
Date: Tue, 29 Dec 2020 04:04:27 -0500 (EST)
From: Jason Wang <jasowang@redhat.com>
Message-ID: <661905925.40710498.1609232667286.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201228072749-mutt-send-email-mst@kernel.org>
References: <20201222075005.69d1cc6e.pasic@linux.ibm.com> <20201222165431.3f49de29.cohuck@redhat.com> <3cf88dc9-4053-0f24-854f-6cc6df2aaac4@redhat.com> <20201225083835.62efb230.pasic@linux.ibm.com> <20201227044431-mutt-send-email-mst@kernel.org> <20201228072104.08339352.pasic@linux.ibm.com> <30369ca4-6621-ea70-abbf-01c62666044b@redhat.com> <20201228072749-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>



----- Original Message -----
> On Mon, Dec 28, 2020 at 03:01:57PM +0800, Jason Wang wrote:
> >=20
> > On 2020/12/28 =E4=B8=8B=E5=8D=882:21, Halil Pasic wrote:
> > > On Sun, 27 Dec 2020 05:00:05 -0500
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >=20
> > > > On Fri, Dec 25, 2020 at 08:38:35AM +0100, Halil Pasic wrote:
> > > > > When driver is trying to set DEVICE_STOPPED, the device MUST not
> > > > > process new avail requests and MUST complete all requests that is
> > > > > currently processing before setting DEVICE_STOPPED.
> > > > ...
> > > >=20
> > > > > Since we have a synchronous API setting DEVICE_STOPPED would also
> > > > > have to
> > > > > block until all in-flight requests are completed.
> > > > Judging from the surrounding discussion,
> > > > when you say complete you seem to mean "use", and
> > > My intention was merely to paraphrase Jason's proposal which says:
> > >=20
> > > +When driver is trying to set DEVICE_STOPPED, the device MUST not
> > > +process new avail requests and MUST complete all requests that is
> > > +currently processing before setting DEVICE_STOPPED.
> > >=20
> > > > I'm not sure how you define in flight, but
> > > > it seems there could be many of these (up to a full queue?)
> > > In the follow-on discussion 'in-flight' emerged as an alternative to
> > > 'all requests that is currently processing' form the proposed text.
> > >=20
> > > A large part of the discussion is, IMHO, about finding precise
> > > definitions, for what the quoted paragraph is trying to express.
> > >=20
> > > > so waiting for all available buffers to be
> > > > used might indeed require an asynchronous interface,
> > > > which gets complex very quickly.
> >=20
> >=20
> > Some part of the virtio has enforced an asynchronous interface during
> > reset:
> >=20
> > For MMIO the spec said:
> >=20
> > """
> >=20
> > To stop using the queue the driver MUST write zero (0x0) to this QueueR=
eady
> > and MUST read the value back to ensure synchronization.
> >=20
> > """
> >=20
> > For PCI it said:
> >=20
> > """
> >=20
> > After writing 0 to device_status, the driver MUST wait for a read of
> > device_status to return 0 before reinitializing the device.
> >=20
> > """
>=20
> Absolutely. It's ok for simple things.
> However doing anything major like waiting for IO
> in a tight loop is a problem.

It's mainly used for Qemu. And driver can choose to cancel the stop by
trying to clear the bit. Does this work?


>=20
>=20
>=20
> >=20
> > > >=20
> > > > However wouldn't it be possible for device to just cancel
> > > > processing available buffers even if it started processing
> > > > them? Some buffers could be in indeterminate state
> > > > (e.g. we might not have a way to know how much data did
> > > > device have time to write into a buffer).
> > > >=20
> > > Maybe Jason can answer this one.
> >=20
> >=20
> > For networking device, it should be possible (packet could be dropped o=
r
> > duplicated). But I'm not sure it works for other device. E.g for the bl=
ock
> > devices that needs to communicate with a remote backend. Waat's more
> > important, my understadning is that the intermediate state is something
> > that
> > we need to avoid (hard to be migrated anyhow).
>=20
> The difficulty is on the device side though, so why not say: if it wants =
to
> flush IO that's up to it.

Do you mean to introduce a device specific way to flush IO? If yes, it
actually introduces a new intermediate state implicitly:

1) device is stopped
2) device is stopped and IO is flushed

This looks more complicated than a single new state:

1) device is stopped and IO is flushed

Thanks

>=20
> >=20
> > >=20
> > > > Making it clearer what does "complete" mean here might help.
> > > >=20
> > > I think what we are trying to accomplish here, is avoiding, having
> > > non-standardised state in device (that can not be dropped) when
> > > migrating.
> > >=20
> > > I'm still struggling with wrapping my mind around the problem. AFAIU
> > > migration and migratability is not really a feature of the virtio
> > > standard, but can be a feature of it's implementation
> > > (e.g. QEMU & KVM), where the standard does help a great deal by havin=
g
> > > certain aspects of the operation and interaction nailed down.
> >=20
> >=20
> > It looks like a must (at least from the level of semantics) for designi=
ng
> > software API for vDPA. Using a standard spec may help to avoid subtle
> > misunderstanding of different vendors.
> >=20
> > Thanks
> >=20
> >=20
> > >=20
> > > Regards,
> > > Halil
> > >=20
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

