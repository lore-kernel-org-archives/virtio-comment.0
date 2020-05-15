Return-Path: virtio-comment-return-1245-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 01666986050
	for <virtio-comment@lists.oasis-open.org>; Fri, 15 May 2020 13:27:58 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
Date: Fri, 15 May 2020 15:27:48 +0200
Message-Id: <20200515132751.62332-1-david@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH 0/3] virtio-spec: Add virtio-mem device specification
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: David Hildenbrand <david@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Add the specification for virtio-mem devices. The latest Linux kernel
implementation (v4) can be found at [1], the latest QEMU implementation
(1) can be found at [2].

[1] https://lkml.kernel.org/r/20200507140139.17083-1-david@redhat.com
[2] https://lkml.kernel.org/r/20200506094948.76388-1-david@redhat.com

David Hildenbrand (3):
  conformance: make driver conformance list easier to read and maintain
  conformance: Reference RPMB Driver Conformance
  Add virtio-mem device specification

 conformance.tex |  47 ++++-
 content.tex     |   1 +
 virtio-mem.tex  | 452 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 497 insertions(+), 3 deletions(-)
 create mode 100644 virtio-mem.tex

--=20
2.25.4


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

