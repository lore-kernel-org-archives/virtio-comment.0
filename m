Return-Path: <virtio-comment-return-2350-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 91FC19862EF
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 Nov 2021 07:42:22 +0000 (UTC)
From: Lei He <helei.sig11@bytedance.com>
Date: Mon, 15 Nov 2021 15:41:51 +0800
Message-Id: <20211115074152.43427-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Subject: [virtio-comment] [V2 PATCH 0/1] Introduce virtio asymmetric crypto service
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: mst@redhat.com, virtio-comment@lists.oasis-open.org
Cc: xin.zeng@intel.com, arei.gonglei@huawei.com, pizhenwei@bytedance.com, helei.sig11@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

V1 -> V2:
- Rename the 'ASYM service' to 'AKCIPHER service'.
- Added stateless mode for AKCIPHER service.
- Added hyperlinks to the corresponding RFC documents for the terms
ASN.1, DER, and some details involved in the RSA and ECDSA.
- Fixed several grammatical and format errors.
- Roll back irrelevant changes in V1.

V1:
- Introduced ASYM service type.

Lei He (1):
  virtio-crypto: introduce akcipher service

 virtio-crypto.tex | 310 ++++++++++++++++++++++++++++++++++++++++++++++++++=
+++-
 1 file changed, 305 insertions(+), 5 deletions(-)

--=20
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

