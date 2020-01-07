Return-Path: virtio-comment-return-1006-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 37E05985D8B
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Jan 2020 12:40:20 +0000 (UTC)
Message-ID: <5ad544c27ac6aa479eac215f494ae8d2399b188c.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 07 Jan 2020 13:40:17 +0100
In-Reply-To: <20191125102048.10061-1-johannes@sipsolutions.net>
References: <20191125102048.10061-1-johannes@sipsolutions.net>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] reserve device ID for hwsim wireless
 simulation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Hi,

> The Linux mac80211-hwsim module currently allows simulation of
> multiple wireless radios on a shared medium, and has an existing
> API for this to work through a userspace implementation of the
> medium simulation (e.g. implemented by wmediumd).
>=20
> In order to simplify working with virtual machines and to enable
> (time-compressed) simulation use cases, allocate a virtio device
> ID to allow carrying this protocol over virtio in addition to
> the current netlink sockets.
>=20
> Since device ID 28 was previously requested, use 29.

I evidently forgot to request a TC vote on this before, hereby doing
that.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/68

Thanks,
johannes


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

