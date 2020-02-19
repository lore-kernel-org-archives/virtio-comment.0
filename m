Return-Path: virtio-comment-return-1063-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2D2EC985EA8
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Feb 2020 07:53:46 +0000 (UTC)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Wed, 19 Feb 2020 09:53:36 +0200
Message-Id: <20200219075337.23191-1-yuri.benditovich@daynix.com>
Subject: [virtio-comment] [PATCH v4 0/1] Define VIRTIO_NET_F_HASH_REPORT feature
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org, mst@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

Changes from v3:
Rebased to latest master branch
Changes feature number to 57 (as 58 is under discussion)
Minor changes according to v3 review

Yuri Benditovich (1):
  virtio-net: Define per-packet hash reporting feature

 content.tex | 347 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 229 insertions(+), 118 deletions(-)

--=20
2.17.1


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

