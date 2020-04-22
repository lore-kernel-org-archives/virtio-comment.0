Return-Path: virtio-comment-return-1184-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6E6BC985EE8
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Apr 2020 00:55:37 +0000 (UTC)
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 21 Apr 2020 17:55:29 -0700
Message-Id: <20200422005531.15085-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH 0/2] Blob resources + host visible memory
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: kraxel@redhat.com, olvaffe@gmail.com, marcheu@chromium.org
List-ID: <virtio-comment.lists.oasis-open.org>

Dear all,

I'm excited to share with you an exciting development in the field
of virtualized graphics: blob resources. Blob resources represent
the evolution of virtio-gpu from the OpenGL resource model to the
VK resource model. Details are in the spec.

Proof of concept kernel[1] and virglrenderer[2] implementations exist,
so it's a good time to formalize the spec, so we can parallelize the
efforts.

Enumerations follow the current virtio-gpu trend and start at 1, where
0 is an invalid value.

Blob resources were developed in collaboration by Gerd Hoffman,
Chia-I-Wu and Gurchetan Singh.

Open questions:
   - TRANSFER_BLOB along with reusing previously hypercalls for
     convenience?
   - Anything else people want?

Possible required changes:
   - Refactoring Pixman dependency in QEMU for blob resources in
     2D hosts?

Possible future work:
   - Emulated coherent `blob_mem` type for QEMU/vhost-user
   - A `blob_mem` type for guest-only resources imported in
     cache-coherent FOSS GPU/display drivers using udmabuf-like
     mechanisms.
   - Display integration involving the blob model.

These spec patches are based on David Steven's UUID patches (hopefully
those will land soon?).

[1] https://gitlab.freedesktop.org/virgl/drm-misc-next/-/commits/resource-b=
lob
[2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/374

Gurchetan Singh (2):
  virtio-gpu: add resource create blob
  virtio-gpu: add support for mapping/unmapping blob resources

 virtio-gpu.tex | 172 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 168 insertions(+), 4 deletions(-)

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

