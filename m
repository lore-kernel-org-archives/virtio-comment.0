Return-Path: <virtio-comment-return-2826-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 01F599866EB
	for <virtio-comment@lists.oasis-open.org>; Fri, 18 Mar 2022 16:03:37 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <2293264.5yAKUOBhjF@silver>
References: <4735344.EBYxvr1mta@silver> <2620465.pcdoKKQM6k@silver>
 <87fsngsnn8.fsf@redhat.com> <2293264.5yAKUOBhjF@silver>
Date: Fri, 18 Mar 2022 17:03:30 +0100
Message-ID: <874k3vs0x9.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v3 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Mar 18 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 17. M=C3=A4rz 2022 14:40:27 CET Cornelia Huck wrote:
>> On Wed, Mar 16 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wrot=
e:
>> > This new feature flag allows to decouple the maximum amount of
>> > descriptors in indirect descriptor tables from the Queue Size.
>> >=20
>> > The new term "Queue Indirect Size" is introduced for this purpose,
>> > which is a transport specific configuration whose negotiation is
>> > further specified for each transport with subsequent patches.
>> >=20
>> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
>> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> > ---
>> >=20
>> >  content.tex     | 32 ++++++++++++++++++++++++++++++--
>> >  packed-ring.tex |  2 +-
>> >  split-ring.tex  |  8 ++++++--
>> >  3 files changed, 37 insertions(+), 5 deletions(-)
>> >=20
>> > diff --git a/content.tex b/content.tex
>> > index c6f116c..685525d 100644
>> > --- a/content.tex
>> > +++ b/content.tex
>>=20
>> (...)
>>=20
>> > @@ -1051,6 +1051,10 @@ \subsubsection{Common configuration structure
>> > layout}\label{sec:Virtio Transport>=20
>> >  present either a value of 0 or a power of 2 in
>> >  \field{queue_size}.
>> >=20
>> > +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the device MUST
>> > provide the +Queue Indirect Size supported by device, which is a
>> > transport specific
>> "supported by the device", or maybe "it supports"?
>
> Article "the" is missing here, yes. Both "the device" or "it" would be fi=
ne.

Yes; just use whichever you prefer :)

>
>> > +configuration. It MUST allow the driver to set a lower value.
>>=20
>> Maybe "It MUST allow the driver to specify a lower maximum size." ?
>
> That exact phrase was actually suggested by you (2021-12-14 18:20). I hav=
e no=20
> strong opinion on that. I find the existing "to set a lower value" clear=
=20
> enough and a less complicated wording though.

Heh :) I do not really have a strong opinion here (hence the "maybe".)

>> I'm not sure whether we would actually need some normative statements in
>> the sections below, but probably not.
>
> Like what would you potentially miss here?

That we MUST also negotiate the value if we negotiate the feature. But
as I wrote, we probably don't need to be that explicit.


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

