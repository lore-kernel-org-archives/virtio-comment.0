Return-Path: <virtio-comment-return-2417-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0EAD59862A7
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Nov 2021 12:06:44 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <cover.1638192251.git.qemu_oss@crudebyte.com>
References: <cover.1638192251.git.qemu_oss@crudebyte.com>
Date: Tue, 30 Nov 2021 13:06:31 +0100
Message-ID: <875ys9j1a0.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v2 0/2] Add VIRTIO_RING_F_LARGE_INDIRECT_DESC
Content-Type: text/plain
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, virtio-comment@lists.oasis-open.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Nov 29 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> This is a follow-up of:
> https://lists.oasis-open.org/archives/virtio-comment/202111/msg00059.html
>
> These two patches introduce a more fine graded control over the maximum
> length of an indirect descriptor table.
>
> Associated Github Task:
> https://github.com/oasis-tcs/virtio-spec/issues/122
>
> v1 -> v2:
>
>   * "active/pending message(s)" -> "vring slot(s)"
>     NOTE: I decided to use the term "vring slot(s)" over the previously
>     suggested term "buffer(s)" as I found tha latter too ambiguous in this
>     context. [patch 1]
>
>   * "... but does not oppose a limit to the actual bulk data size
>     being transmitted."
>     ->
>     " ... but does not oppose a limit to the actual bulk data size
>     being transmitted when indirect descriptors are used." [patch 1]
>
>   * Add common configuration field "queue_indirect_size" and make it
>     mandatory as of revision 3. [NEW patch 2]

Now you have me confused: 'revision' is a ccw transport concept, but you
only add support on the pci transport? It's fine to leave out ccw (and
mmio) for now, but you should not talk about revision 3...

>
> Christian Schoenebeck (2):
>   Add VIRTIO_RING_F_LARGE_INDIRECT_DESC
>   Add common configuration field "queue_indirect_size"
>
>  content.tex    | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  split-ring.tex |  7 ++++++-
>  2 files changed, 62 insertions(+), 1 deletion(-)


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

