Return-Path: virtio-comment-return-1179-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 833FA9842BE
	for <virtio-comment@lists.oasis-open.org>; Mon, 13 Apr 2020 11:46:16 +0000 (UTC)
Date: Mon, 13 Apr 2020 07:46:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200413074049-mutt-send-email-mst@kernel.org>
References: <6774E3D0-4DA4-4CAA-B4D8-370982260E62@amazon.com>
MIME-Version: 1.0
In-Reply-To: <6774E3D0-4DA4-4CAA-B4D8-370982260E62@amazon.com>
Subject: Re: [virtio-comment] Seeking guidance for custom virtIO device
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: "Eftime, Petre" <epetre@amazon.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Apr 10, 2020 at 09:36:58AM +0000, Eftime, Petre wrote:
> If not, what is the path to having our device live somewhere in the
> virtio world?

Basically submit a spec patch, address review comments, eventually
ask for a TC vote to include it. Reserving an ID is a helpful
first step for many people since that lets you write
guest and host patches.

> If there is no reason to include our device in the spec
> proper, we at least want to reserve an identifier for it, to prevent
> accidental collisions with other devices. I see that there are other
> devices which are rather specialized and not yet formalized listed in
> the spec, but I don't fully graps what steps I need to take in order
> to get an ID. Would submitting a patch with the ID be enough?

Almost.
https://github.com/oasis-tcs/virtio-spec#use-of-github-issues
see text beginning with:
"To request a TC vote on resolving a specific comment:"

https://github.com/oasis-tcs/virtio-spec#providing-feedback
is also helpful.

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

