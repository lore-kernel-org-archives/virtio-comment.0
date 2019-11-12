Return-Path: virtio-comment-return-910-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D23CB985DF0
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 Nov 2019 05:37:56 +0000 (UTC)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Tue, 12 Nov 2019 07:37:47 +0200
Message-Id: <20191112053748.1616272-1-yuri.benditovich@daynix.com>
Subject: [virtio-comment] [PATCH v4 0/1] define support for receive-side scaling
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org, mst@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

Changes from v3:
Minor fixes per v3 review.

Changes from v2 (resulted by v2 review):
Removed dependency of VIRTIO_NET_F_RSS on VIRTIO_NET_F_MQ
Added paragraph 'Device operation in multiqueue mode', common
for both RSS and MQ
indirection_table_length field changed to be indirection_table_mask
(which is indirection_table_length - 1)


Yuri Benditovich (1):
  virtio-net: define support for receive-side scaling

 conformance.tex |   2 +
 content.tex     | 234 +++++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 213 insertions(+), 23 deletions(-)

--=20
2.17.2


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

