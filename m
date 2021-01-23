Return-Path: virtio-comment-return-1661-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B6EA198656A
	for <virtio-comment@lists.oasis-open.org>; Sat, 23 Jan 2021 02:48:12 +0000 (UTC)
Date: Sat, 23 Jan 2021 03:48:01 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20210123034801.1d8a53ce.pasic@linux.ibm.com>
In-Reply-To: <20210122114212.416880ad.cohuck@redhat.com>
References: <20210118163804.437098-1-cohuck@redhat.com>
	<20210118164132.GC9899@work-vm>
	<20210119034008.735f80ad.pasic@linux.ibm.com>
	<20210119184506.3bd7061d.cohuck@redhat.com>
	<20210119195252.595870b1.pasic@linux.ibm.com>
	<7f4fdfd2-edf2-d291-180a-41ffc3c3955e@redhat.com>
	<20210122114212.416880ad.cohuck@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH RFC v2] clarify device reset
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, 22 Jan 2021 11:42:12 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> > > We could work around that by making a positive statement. Not telling=
,
> > > when the driver MUST NOT consider the reset completed, but tell when =
the
> > > driver SHOULD consider the reset completed. =20
>=20
> That could be
>=20
> "The driver SHOULD consider a driver-initiated reset complete when it
> reads the device status as 0."

Sounds good to me!

>=20
> > >
> > > The MUST NOT does not buy much to the driver. It knows, what is
> > > certainly wrong, but it still does not know what is right. What the
> > > driver needs is a criterion when the reset is certainly completed (so
> > > it can free up resources for example). =20
>=20
> Any further comments before I put together a v3 (without the RFC)?
> I also need to open a github issue for this.

No further comments. I think we are heading in the right direction.

Regards,
Halil

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

