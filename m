Return-Path: <virtio-comment-return-7873-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF53CC001DF
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 10:38:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1CEAB749EC
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 10:38:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EBB2298692D
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 10:38:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D4E7698692A; Fri, 20 Oct 2023 10:38:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C44DD98692B
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Oct 2023 10:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 3M9dODoDO_yUUxkJVmH-6g-1
From: Cornelia Huck <cohuck@redhat.com>
To: Jasper Haag <jasper@bedrocksystems.com>,
 virtio-comment@lists.oasis-open.org
Cc: Awais Masood <awais@bedrocksystems.com>, Gordon Stewart
 <gordon@bedrocksystems.com>, "Michael S. Tsirkin" <mst@redhat.com>
In-Reply-To: <CA+c=0WfFVugbBN_fTeQb0RP6U+kQNO+uuC1L2wyb2rVAWeniaQ@mail.gmail.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <CA+c=0WfFVugbBN_fTeQb0RP6U+kQNO+uuC1L2wyb2rVAWeniaQ@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 20 Oct 2023 12:38:47 +0200
Message-ID: <878r7xd1e0.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [virtio-queue] CLARIFICATION: "free
 descriptors" External

On Thu, Oct 12 2023, Jasper Haag <jasper@bedrocksystems.com> wrote:

> To whom it may concern,
>
> BedRock Systems is working to formally model VIRTIO Queues and formally
> verify our implementation of VIRTIO Queues <
> https://github.com/bedrocksystems/vml/tree/main/devices/virtio_base>. One
> question which we've been unable to answer solely using the Standard text
> relates to "free descriptors" - as referred to within "2.7.13 - Supplying
> Buffers to The Device" <
> https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.ht=
ml#x1-6400013>.
> In particular, the text states:
>
> | 2.7.13 - Supplying Buffers to The Device
> | The driver offers buffers to one of the device=E2=80=99s virtqueues as =
follows:
> |     1. The driver places the buffer into free descriptor(s) in the
> descriptor table, chaining as necessary (see 2.7.5 The Virtqueue Descript=
or
> Table).
> |      .....
> |
> | 2.7.13.1 - Placing Buffers Into The Descriptor Table
> | A buffer consists of zero or more device-readable physically-contiguous
> elements followed by zero or more physically-contiguous device-writable
> elements (each has at least one element).
> | This algorithm maps it into the descriptor table to form a descriptor
> chain:
> | for each buffer element, b:
> |     1. Get the next free descriptor table entry, d
> |     2. Set d.addr to the physical address of the start of b
> |     3. Set d.len to the length of b.
> |     4. If b is device-writable, set d.flags to VIRTQ_DESC_F_WRITE,
> otherwise 0.
> |     5. If there is a buffer element after this:
> |         a. Set d.next to the index of the next free descriptor element.
> |         b. Set the VIRTQ_DESC_F_NEXT bit in d.flags.
> | In practice, d.next is usually used to chain free descriptors, and a
> separate count kept to check there are enough free descriptors before
> beginning the mappings.
>
> However, the term "free descriptor" doesn't appear to be defined anywhere
> within the Standard text. What characterizes such a "free descriptor", an=
d
> does the use of the term "free descriptor" imply that the Driver MUST NOT=
 <
> https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.ht=
ml#x1-50003>
> use the same descriptor within multiple chains?
>
> I look forward to hearing your clarification.

My guess is that this is mostly a case of a bit of sloppyness in a very
old part of the spec. A better term might be "free entries in the
descriptor table" (or even "unused entries..."), although that would be
a bit unwieldy. Maybe we should add some text like "free entries in the
descriptor table, henceforth referred to as 'free descriptors'".

Michael, what do you think?


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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

