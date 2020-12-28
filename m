Return-Path: virtio-comment-return-1599-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4AAAD98630D
	for <virtio-comment@lists.oasis-open.org>; Mon, 28 Dec 2020 06:21:14 +0000 (UTC)
Date: Mon, 28 Dec 2020 07:21:04 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20201228072104.08339352.pasic@linux.ibm.com>
In-Reply-To: <20201227044431-mutt-send-email-mst@kernel.org>
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
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Sun, 27 Dec 2020 05:00:05 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Dec 25, 2020 at 08:38:35AM +0100, Halil Pasic wrote:
> >When driver is trying to set DEVICE_STOPPED, the device MUST not
> >process new avail requests and MUST complete all requests that is
> >currently processing before setting DEVICE_STOPPED.
>=20
> ...
>=20
> > Since we have a synchronous API setting DEVICE_STOPPED would also have =
to
> > block until all in-flight requests are completed.
>=20
> Judging from the surrounding discussion,
> when you say complete you seem to mean "use", and

My intention was merely to paraphrase Jason's proposal which says:

+When driver is trying to set DEVICE_STOPPED, the device MUST not
+process new avail requests and MUST complete all requests that is
+currently processing before setting DEVICE_STOPPED.

> I'm not sure how you define in flight, but
> it seems there could be many of these (up to a full queue?)

In the follow-on discussion 'in-flight' emerged as an alternative to
'all requests that is currently processing' form the proposed text.

A large part of the discussion is, IMHO, about finding precise
definitions, for what the quoted paragraph is trying to express.

> so waiting for all available buffers to be
> used might indeed require an asynchronous interface,
> which gets complex very quickly.
>=20
> However wouldn't it be possible for device to just cancel
> processing available buffers even if it started processing
> them? Some buffers could be in indeterminate state
> (e.g. we might not have a way to know how much data did
> device have time to write into a buffer).
>=20

Maybe Jason can answer this one.

> Making it clearer what does "complete" mean here might help.
>=20

I think what we are trying to accomplish here, is avoiding, having
non-standardised state in device (that can not be dropped) when
migrating.=20

I'm still struggling with wrapping my mind around the problem. AFAIU
migration and migratability is not really a feature of the virtio
standard, but can be a feature of it's implementation
(e.g. QEMU & KVM), where the standard does help a great deal by having
certain aspects of the operation and interaction nailed down.

Regards,
Halil=20

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

