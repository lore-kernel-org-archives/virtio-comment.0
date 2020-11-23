Return-Path: virtio-comment-return-1535-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 505969861E1
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Nov 2020 18:03:21 +0000 (UTC)
Date: Mon, 23 Nov 2020 19:02:30 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20201123190230.1fe0ac91.pasic@linux.ibm.com>
In-Reply-To: <20201123093538-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB20674853EEEB69E982B02C8BC5EE0@BN6PR1801MB2067.namprd18.prod.outlook.com>
	<BN6PR1801MB2067CCC5F29DB0AA634E96B2C5E00@BN6PR1801MB2067.namprd18.prod.outlook.com>
	<20201123093538-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH v9] virtio-net: Add support for the
 flexible driver notification structure.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, 23 Nov 2020 09:38:26 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> I see the reaction is generally positive.
>=20
> I had a thought meanwhile - how about changing
> "virt queue number" to "virt queue id" in the notification
> description? we can then explain that the id can be vq number
> or retrieved from config space.
>=20
> Thoughts?
> Can be a patch on top does not have to delay vote on this one.

I agree that we should do some cleanup on top. Please also see
my other email.=20

My first impression the 'virtqueue id' idea was very positive, but
after some more thought I lost confidence. My concern is that the
potentially arbitrary device generated device unique virtqueue id is
only used for guest->host notification, and only iff the feature
VIRTIO_F_NOTIF_CONFIG_DATA was negotiated. In all other cases
the virtqueue is still identified by the vq number. AFAIU
VIRTIO_F_NOTIF_CONFIG_DATA is currently PCI only (although,
I think it can work with any transport).

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

