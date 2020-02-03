Return-Path: virtio-comment-return-1043-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 119D4985CE1
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Feb 2020 09:52:30 +0000 (UTC)
Date: Mon, 3 Feb 2020 04:52:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200203044835-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB206715ABAA0A9B46DFED0037C5040@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB206715ABAA0A9B46DFED0037C5040@BN6PR1801MB2067.namprd18.prod.outlook.com>
Subject: Re: [virtio-comment] [PATCH] virtio-net: Add support for the
 flexible driver notification
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Vitaly Mireyno <vmireyno@marvell.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jason Wang <jasowang@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jan 30, 2020 at 04:56:15PM +0000, Vitaly Mireyno wrote:
> The main motivation is to support virtio on the existing
> silicon, where this is the only way. Hopefully more use-cases
> would arise that would find this useful.=20

So there's some silicon out there that just happened
to use exactly the virtio format, except for a couple
of bits in the notification? Interesting.
And what are these bits actually set to in this hardware? Just curious ...

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

