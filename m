Return-Path: virtio-comment-return-986-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C652C985DCE
	for <virtio-comment@lists.oasis-open.org>; Wed, 11 Dec 2019 15:33:46 +0000 (UTC)
Date: Wed, 11 Dec 2019 10:33:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191211101541-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: [virtio-comment] thoughts on: virtio: skipping used buffers without IN_ORDER
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Hello!
At the moment, if a device uses multiple buffers, it has
to write out a descriptor per buffer. The only exception is
with IN_ORDER where device can skip buffers, with driver
keeping track of IDs.

IN_ORDER is however quite limited in what it can do.  It's not a good
fit for storage, and probably not for RX networking.

It's not hard to extend IN_ORDER so it doesn't apply to specific rings.
A harder question is still writing a single descriptor in this case. One
somewhat easy fix it just to allow descriptors to include multiple IDs.
E.g. address is ignored in used descriptors, we can fit 4 extra IDs in
there. For descriptors where we don't care about the length,
we can stick a couple more IDs on top of that.

I can't say it's all very elegant. Also, is that enough of a win?
We can still end up with multiple descriptors.

More thoughts?

Thanks,
--=20
MST


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

