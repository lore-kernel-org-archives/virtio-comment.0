Return-Path: virtio-comment-return-739-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0B598985CB7
	for <virtio-comment@lists.oasis-open.org>; Tue, 28 May 2019 12:55:20 +0000 (UTC)
Date: Tue, 28 May 2019 08:55:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190528083838-mutt-send-email-mst@kernel.org>
References: <CANerMUUGMJ+x42s2ZzeUA7JZy4c1NMcwJrPBp6Jwwz6huRu9pQ@mail.gmail.com>
 <20190516144915.GA29808@stefanha-x1.localdomain>
 <CANerMUV_ng40kTk2A+fLbOyFKWvaUDA4S2KsVR-K4e0fDpWnRQ@mail.gmail.com>
 <20190520190526-mutt-send-email-mst@kernel.org>
 <CANerMUXQEwkvjwAhPc5qd1pgPNyEoW5SaBoO-o13SAX_Utj-gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANerMUXQEwkvjwAhPc5qd1pgPNyEoW5SaBoO-o13SAX_Utj-gw@mail.gmail.com>
Subject: Re: [virtio-comment] Clarifying section "2.6.12 virtqueue Operation"
 in virtio-v1.1
To: Ariel Adam <aadam@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Thanks for the patch!
It's reasonable to vote on this in this form since the intent is clear
and change proposed is small.

However people might miss this proposal as it's a reply to an old thread.
It's best to send a patch as a new thread not as a reply.
Also the mail subject should include [PATCH] so people know
it's a proposed change.


Some more minor comments for the future:


So it looks like you used some mailer that added an html format and this
one as attachment. List archives did not handle it correctly.
Take a look:
https://lists.oasis-open.org/archives/virtio-comment/201905/msg00018.html

One way to fix is to set up git send-email and have that
send the patches for you.


The mail subject should first include the section affected and then the change summary.
E.g.:

[PATCH] virtqueue operation: clarify text

On Tue, May 28, 2019 at 03:31:47PM +0300, Ariel Adam wrote:
> Sending the actual patch to the list (let me know if anything is missing):
> 
> 

It's best to add a description here, followed by
any extra text after --- below.

In particular it needs to include the link to the
issue, e.g.
Fixes: https://github.com/.....

We also usually include anyone who contributed to the patch
with a signature that implies that they agree to IPR rules.
Like this:
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>






> ---
>  0001-REVISION-update-to-wd02.patch | 20 ++++++++++++++++++++
>  split-ring.tex                     | 10 +++++-----
>  2 files changed, 25 insertions(+), 5 deletions(-)
>  create mode 100644 0001-REVISION-update-to-wd02.patch


Thus you would end up with something like:

	[PATCH] virtqueue operation: clarify text

	improve description of vitqueue operations for clarify

	Signed-off-by: Ariel Adam <aadam@redhat.com>

	---

	Sending the actual patch to the list (let me know if anything is missing):

	diff --git a/REVISION b/REVISION

	etc.

Note that [PATCH] is added by git format-patch automatically.
It's a good idea to use that too.

In case you want to send more revisions, you add a version
after PATCH: [PATCH v2]



> diff --git a/0001-REVISION-update-to-wd02.patch
> b/0001-REVISION-update-to-wd02.patch
> new file mode 100644
> index 0000000..ab090ec
> --- /dev/null
> +++ b/0001-REVISION-update-to-wd02.patch
> @@ -0,0 +1,20 @@
> +From 37057052e716c6c02c9391342cbc7263f44759f6 Mon Sep 17 00:00:00 2001
> +From: "Michael S. Tsirkin" <mst@redhat.com>
> +Date: Wed, 27 Mar 2019 18:19:19 -0400
> +Subject: [PATCH] REVISION: update to wd02
> +
> +Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> +---
> + REVISION | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/REVISION b/REVISION
> +index beec734..b1157d4 100644
> +--- a/REVISION
> ++++ b/REVISION
> +@@ -1 +1 @@
> +-virtio-v1.1-wd01
> ++virtio-v1.1-wd02
> +--
> +1.8.3.1
> +

This part seems unrelated.

> diff --git a/split-ring.tex b/split-ring.tex
> index 123ac9f..5148ac8 100644
> --- a/split-ring.tex
> +++ b/split-ring.tex
> @@ -567,11 +567,11 @@ \subsection{Virtqueue Operation}\label{sec:Basic
> Facilities of a Virtio Device /
>  the device.
> 
>  \begin{note} As an
> -example, the simplest virtio network device has two virtqueues: the
> -transmit virtqueue and the receive virtqueue. The driver adds
> -outgoing (device-readable) packets to the transmit virtqueue, and then
> -frees them after they are used. Similarly, incoming (device-writable)
> -buffers are added to the receive virtqueue, and processed after
> +the simplest virtio network device has two virtqueues: the
> +transmit virtqueue and the receive virtqueue. The driver adds
> +outgoing packets as device-readable buffers to the transmit virtqueue, and
> then
> +frees them after they are used. Similarly, device-writable buffers for
> incoming
> +packets are added to the receive virtqueue, and processed after
>  they are used.
>  \end{note}
> 
> -- 
> 1.8.3.1
> 
> 
> On Tue, May 21, 2019 at 2:06 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> 
> >
> > Can you please send the patch to the list?
> > We don't process pull requests at this point.
> >
> > On Mon, May 20, 2019 at 06:18:58PM +0300, Ariel Adam wrote:
> > > Sent a patch to split-ring.tex:
> > >
> > > https://github.com/oasis-tcs/virtio-spec/pull/44
> > >
> > > Thanks.
> > >
> > > On Thu, May 16, 2019 at 5:49 PM Stefan Hajnoczi <stefanha@redhat.com>
> > wrote:
> > >
> > >     On Wed, May 15, 2019 at 02:42:32PM +0300, Ariel Adam wrote:
> > >     > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/43
> > >     >
> > >     > We'd like to propose clarifying the usage of packets and buffers in
> > >     section
> > >     > "2.6.12 virtqueue operation" as described in the github issue
> > above.
> > >
> > >     Looks good to me, do you want to send a patch to content.tex?
> > >
> > >     Stefan
> > >
> >


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

