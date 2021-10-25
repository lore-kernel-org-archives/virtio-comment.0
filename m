Return-Path: <virtio-comment-return-2319-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0A0E09860F6
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Oct 2021 03:31:47 +0000 (UTC)
From: Lei He <helei.sig11@bytedance.com>
Date: Mon, 25 Oct 2021 11:30:44 +0800
Message-Id: <20211025033045.82123-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH 0/1] Introduce virtio asymmetric crypto service
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: mst@redhat.com, virtio-comment@lists.oasis-open.org
Cc: xin.zeng@intel.com, arei.gonglei@huawei.com, pizhenwei@bytedance.com, Lei He <helei.sig11@bytedance.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi,

In this patch, we try to support a new class of crypto service "ASYM",
include several asymmetric algorithms.

And we also developed sample code of this feature:
for guest side(Linux):
  https://github.com/pizhenwei/linux/tree/virtio-crypto-asym

for QEMU side:
  https://github.com/pizhenwei/qemu/tree/virtio-crypto-asym

Introduce a new class "akcipher backend" and a new built-in RSA
algorithm(implemented by nettle/hogweed) into QEMU, and test the
full feature from guest, works fine.

Lei He (1):
  virtio-crypto: introduce asym service

 virtio-crypto.tex | 214 ++++++++++++++++++++++++++++++++++++++++++++++++++=
+++-
 1 file changed, 210 insertions(+), 4 deletions(-)

--
2.11.0


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

