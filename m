Return-Path: <virtio-comment-return-2616-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CBF4798642F
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Jan 2022 12:57:37 +0000 (UTC)
From: David Stevens <stevensd@chromium.org>
Date: Mon, 24 Jan 2022 21:56:23 +0900
Message-Id: <20220124125625.3706347-1-stevensd@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH 0/2] Add alternative to deflate-on-oom
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: David Stevens <stevensd@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

This series provides an alternative to deflate-on-oom, by adding a
feature flag that lets the driver assume that all memory in the balloon
will be made available when necessary. To allow the device to better
fulfil that assumption, this series also adds an event queue for the
driver to send OOM events to the device.

Currently, if deflate-on-oom is not provided, then the guest driver does
not know when, or even if, the memory in the balloon will ever be
returned. Because of this, the Linux virtio balloon driver effectively
unplugs memory in the balloon when deflate-on-oom is not provided.
However, this can lead to compatibilty issues with userspace, since very
few userspace programs actually handle hotplug of memory, and Linux's
uAPIs aren't really even suited to potentially high frequency plugging
and unplugging memory. With this alternative to deflate-on-oom, systems
which cannot use deflate-on-oom can still run unmodified Linux programs
in the guest.

Since this series is already adding an event queue, it also adds an
event the guest can use to inform the host of an allocation failure when
trying to inflate the balloon. This provides an explicit signal that
inflation may take a long time or fail altogether, which the device can
then handle as it sees fit (e.g. abort the inflation attempt and tell
the program making resource management decisions that it wasn't able to
free enough memory from the guest).

David Stevens (2):
  virtio-balloon: add an event queue
  virtio-balloon: add a responsive host feature

 conformance.tex |  2 ++
 content.tex     | 75 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

--=20
2.35.0.rc0.227.g00780c9af4-goog


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

