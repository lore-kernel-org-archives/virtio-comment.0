Return-Path: virtio-comment-return-993-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AFB9B985EEC
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Dec 2019 07:16:00 +0000 (UTC)
Date: Fri, 13 Dec 2019 02:15:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191213021253-mutt-send-email-mst@kernel.org>
References: <20191203183212.1721642-1-yuri.benditovich@daynix.com>
 <20191203152148-mutt-send-email-mst@kernel.org>
 <471210655.12237442.1575436801606.JavaMail.zimbra@redhat.com>
 <20191211113112-mutt-send-email-mst@kernel.org>
 <CAOEp5OdzmRTrZoC78kSoWS4g=XP2DNW-q0Y8jAsAWUDw9_u6Ew@mail.gmail.com>
 <20191211130633-mutt-send-email-mst@kernel.org>
 <CAOEp5OcxWEHr5d0TkxBv4-W=EGC2tfuWA6QObkA=NL56SzQZOg@mail.gmail.com>
 <20191212023645-mutt-send-email-mst@kernel.org>
 <CAOEp5OdcjrC01OOB1c0uCJdBTM8G=5CgtvXg+5urKCH0knwHCQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOEp5OdcjrC01OOB1c0uCJdBTM8G=5CgtvXg+5urKCH0knwHCQ@mail.gmail.com>
Subject: Re: [virtio-comment] Re: [PATCH] virtio-net: define feature of
 per-packet RSS hash delivery
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: Yuri Benditovich <ybendito@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Dec 13, 2019 at 06:34:39AM +0200, Yuri Benditovich wrote:
>=20
> So there are 2 possible profiles of devices that 'do not have RSS' but
> deliver hash:
> 1. The device is in general can do RSS, but has only one pair of
> queues and does only hash calculation
> 2. The device has multiple queues but is configured to do auto
> steering and we want also hash from it.
>=20
> My impression is that case 2 is rather academic one (at least looking for=
ward).
> Do you agree?

I am not sure I agree. auto mq is much easier to configure than RSS
so I image it's useful even if one wants hash.

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

