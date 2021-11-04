Return-Path: <virtio-comment-return-2328-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 457B6986450
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 Nov 2021 08:09:40 +0000 (UTC)
Date: Thu, 04 Nov 2021 16:09:32 +0800
From: Lei He <helei.sig11@bytedance.com>
Message-ID: <2CEFE53F-F3D3-4110-9F13-F162953DC6B1@bytedance.com>
Mime-version: 1.0
Subject: [virtio-comment] PING: [PATCH 0/1] Introduce virtio asymmetric crypto service
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable
To: mst@redhat.com, virtio-comment@lists.oasis-open.org
Cc: xin.zeng@intel.com, arei.gonglei@huawei.com, pizhenwei@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

PING!

=EF=BB=BF-----Original Message-----
From: Lei He <helei.sig11@bytedance.com>
Date: Monday, October 25, 2021 at 11:30 AM
To: <mst@redhat.com>, <virtio-comment@lists.oasis-open.org>
Cc: <xin.zeng@intel.com>, <arei.gonglei@huawei.com>, <pizhenwei@bytedance.c=
om>, Lei He <helei.sig11@bytedance.com>
Subject: [PATCH 0/1] Introduce virtio asymmetric crypto service

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

     virtio-crypto.tex | 214 ++++++++++++++++++++++++++++++++++++++++++++++=
+++++++-
     1 file changed, 210 insertions(+), 4 deletions(-)

    --
    2.11.0




This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

