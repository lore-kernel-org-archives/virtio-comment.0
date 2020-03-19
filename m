Return-Path: virtio-comment-return-1147-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F2987985DC1
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Mar 2020 02:18:35 +0000 (UTC)
From: David Stevens <stevensd@chromium.org>
Date: Thu, 19 Mar 2020 11:18:21 +0900
Message-Id: <20200319021823.57219-1-stevensd@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v4 0/2] Cross-device resource sharing
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dylan Reid <dgreid@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Zach Reizner <zachr@chromium.org>, Keiichi Watanabe <keiichiw@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, Alex Lau <alexlau@chromium.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Pawel Osciak <posciak@chromium.org>, Gurchetan Singh <gurchetansingh@chromium.org>, Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, David Stevens <stevensd@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi all,

This is the next iteration of patches for adding support for sharing
resources between different virtio devices. The corresponding Linux
implementation is [1].

In addition to these patches, the most recent virtio-video patchset
includes a patch for importing objects into that device [2].

[1] https://markmail.org/thread/bfy6uk4q4v4cus7h
[2] https://markmail.org/message/wxdne5re7aaugbjg

Changes v3 -> v4:
 - Add virtio-gpu feature bit
 - Move virtio-gpu assign uuid command into 2d command group
 - Rename virtio-gpu uuid response

David Stevens (2):
  content: define what an exported object is
  virtio-gpu: add the ability to export resources

 content.tex      | 12 ++++++++++++
 introduction.tex |  4 ++++
 virtio-gpu.tex   | 29 +++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)

--=20
2.25.1.481.gfbce0eb801-goog


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

