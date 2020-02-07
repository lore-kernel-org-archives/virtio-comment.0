Return-Path: virtio-comment-return-1053-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1F8B3986105
	for <virtio-comment@lists.oasis-open.org>; Fri,  7 Feb 2020 07:40:47 +0000 (UTC)
From: David Stevens <stevensd@chromium.org>
Date: Fri,  7 Feb 2020 16:40:31 +0900
Message-Id: <20200207074033.172289-1-stevensd@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH v3 0/2] Cross-device resource sharing
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dylan Reid <dgreid@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Zach Reizner <zachr@chromium.org>, Keiichi Watanabe <keiichiw@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, Alex Lau <alexlau@chromium.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Pawel Osciak <posciak@chromium.org>, Gurchetan Singh <gurchetansingh@chromium.org>, Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, David Stevens <stevensd@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi all,

This is the next iteration of patches for adding support for sharing
resources between different virtio devices. In addition to these
patches, the most recent virtio-video patchset includes a patch for
importing objects into that device [1].

[1] https://markmail.org/message/wxdne5re7aaugbjg

Changes v2 -> v3:
* Replace references to guest/host
* Remove unnecessary paragraph and field in exported object section
* Recommend RFC4122 version 4 UUIDs
* Represent UUID as u8[16] instead of le64 pair

David Stevens (2):
  content: define what an exported object is
  virtio-gpu: add the ability to export resources

 content.tex      | 12 ++++++++++++
 introduction.tex |  4 ++++
 virtio-gpu.tex   | 29 +++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)

--=20
2.25.0.341.g760bfbb309-goog


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

