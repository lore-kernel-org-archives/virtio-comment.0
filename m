Return-Path: virtio-comment-return-1014-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 358FA985EFF
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Jan 2020 02:55:27 +0000 (UTC)
MIME-Version: 1.0
References: <20191125102048.10061-1-johannes@sipsolutions.net> <5ad544c27ac6aa479eac215f494ae8d2399b188c.camel@sipsolutions.net>
In-Reply-To: <5ad544c27ac6aa479eac215f494ae8d2399b188c.camel@sipsolutions.net>
From: Keiichi Watanabe <keiichiw@chromium.org>
Date: Tue, 21 Jan 2020 11:55:13 +0900
Message-ID: <CAD90VcY0T0+SXQtWAzD8pKt+TjHhFquYNDJDjpBmAcZNe4aJEQ@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH] reserve device ID for hwsim wireless simulation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Johannes Berg <johannes@sipsolutions.net>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Hi,

On Tue, Jan 7, 2020 at 9:40 PM Johannes Berg <johannes@sipsolutions.net> wr=
ote:
>
> Hi,
>
> > The Linux mac80211-hwsim module currently allows simulation of
> > multiple wireless radios on a shared medium, and has an existing
> > API for this to work through a userspace implementation of the
> > medium simulation (e.g. implemented by wmediumd).
> >
> > In order to simplify working with virtual machines and to enable
> > (time-compressed) simulation use cases, allocate a virtio device
> > ID to allow carrying this protocol over virtio in addition to
> > the current netlink sockets.
> >
> > Since device ID 28 was previously requested, use 29.
>
> I evidently forgot to request a TC vote on this before, hereby doing
> that.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/68

Is a TC vote for this issue in progress? I cannot find this issue in this l=
ist:
https://www.oasis-open.org/committees/ballots.php?wg_abbrev=3Dvirtio

I'm waiting for this issue resolved to request device ID 30 for video
devices in https://github.com/oasis-tcs/virtio-spec/issues/67

Best regards,
Keiichi

>
> Thanks,
> johannes
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>

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

