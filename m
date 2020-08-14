Return-Path: virtio-comment-return-1404-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B3D13985DAA
	for <virtio-comment@lists.oasis-open.org>; Fri, 14 Aug 2020 01:54:51 +0000 (UTC)
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 13 Aug 2020 18:54:45 -0700
Message-Id: <20200814015447.1151-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH 0/2] Blob resources v5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: kraxel@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

New additions to the blob spec.  This is to preserve the possibility
of a swapper in the kernel.  Based on UUID the patches.

This doesn't require ATTACH_BACKING / DETACH_BACKING since we're probably
not going to swap-in/swap-out zero-copy guest memory (especially if comes
from a guest dedicated heap, which is best for 3D/video apps) in the
event we do write a swapper.

Implementation should be on virtio-dev/dri-devel shortly.

Gurchetan Singh (2):
  virtio-gpu: add resource create blob
  virtio-gpu: add support for mapping/unmapping blob resources

 virtio-gpu.tex | 169 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 165 insertions(+), 4 deletions(-)

--=20
2.24.1


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

