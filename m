Return-Path: <virtio-comment-return-2828-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0481F9866EB
	for <virtio-comment@lists.oasis-open.org>; Fri, 18 Mar 2022 16:10:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <11686863.Z9n2BMzBuM@silver>
References: <4735344.EBYxvr1mta@silver> <3040881.qp741xram0@silver>
 <87cziksm5h.fsf@redhat.com> <11686863.Z9n2BMzBuM@silver>
Date: Fri, 18 Mar 2022 17:10:34 +0100
Message-ID: <871qyzs0lh.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH v3 4/4] Add CCW configuration field
 "indirect_num"
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Mar 18 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 17. M=C3=A4rz 2022 15:12:42 CET Cornelia Huck wrote:
>> On Wed, Mar 16 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wrot=
e:

>> > +Since revision 3, \field{indirect_num} exists, which is supposed to
>> > reflect the +Queue Indirect Size (i.e. the maximum length of indirect
>> > descriptor tables) +supported by device for this queue.
>>=20
>> It still depends on the feature flag, though.
>>=20
>> Maybe
>>=20
>> "If revision 2 or lower is set, struct vq_config_block extends up to
>> \field{max_num}.
>>=20
>> If revision 3 or higher is set, struct vq_config_block extends to
>> \field{max_indirect_num}. If VIRTIO_RING_F_INDIRECT_SIZE is negotiated,
>> \field{indirect_max_num} contains the maximum Queue Indirect Size
>> (i.e. the maximum length of indirect descriptor tables) supported by the
>> device for this queue; otherwise, its contents are unpredictable."
>
> Maybe rather something like this instead:
>
> "Actual size of struct vq_config_block depends on the virtio-ccw revision=
.
>
> If revision 2 or lower is set, struct vq_config_block extends up to
> *including* \field{max_num}.
>
> If revision 3 or higher is set, struct vq_config_block extends up to
> *including* \field{max_indirect_num}. If VIRTIO_RING_F_INDIRECT_SIZE is=
=20
> negotiated, \field{indirect_max_num} contains the maximum Queue Indirect =
Size
> (i.e. the maximum length of indirect descriptor tables) supported by the
> device for this queue; otherwise, its contents are *undefined*."

Hm, I was coming from the driver's perspective here. But "undefined"
probably captures "junk in there, do not use" better.

Ack on your other points.

>> We should include a device normative statement:
>>=20
>> "The device MUST NOT offer VIRTIO_RING_F_INDIRECT_SIZE, unless at least
>> revision 3 is set, and therefore \field{max_indirect_num} respectively
>> \field{indirect_num} are available."
>
> Oh, you are suggesting two different names for those two fields?=20
> "max_indirect_num" vs. "indirect_num". If yes, why?

The "max_indirect_num" goes with the "max_num": this is the maximum
value that the device supports (the "maximum maximum", in a way :).
"indirect_num" is the actual upper limit while the device is in use.

>
> Otherwise about adding that normative statement in general here: sure, ma=
kes=20
> sense.


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

