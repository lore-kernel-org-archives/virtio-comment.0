Return-Path: <virtio-comment-return-2451-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A67FF98656F
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Dec 2021 14:05:53 +0000 (UTC)
From: "Longpeng(Mike)" <longpeng2@huawei.com>
Date: Thu, 9 Dec 2021 22:05:43 +0800
Message-ID: <20211209140543.1876-1-longpeng2@huawei.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] content: reserve virtio device ID for QingTian Box devices
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: arei.gonglei@huawei.com, Longpeng <longpeng2@huawei.com>
List-ID: <virtio-comment.lists.oasis-open.org>

From: Longpeng <longpeng2@huawei.com>

Huawei Cloud is one of the famous public cloud providers, and its
hypervisor is named QingTian. We plan to support the QingTian Box
that provides some guest-aware features ( for high performance,
security, etc. ) in the future, and at least one of them is already
in development. It needs data transmission based on the Virtio, so
we want to reserve a device id ( 43 ) for the QingTian Box.

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index 899df5f..2a6f9de 100644
--- a/content.tex
+++ b/content.tex
@@ -2893,6 +2893,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 42         &   RDMA device \\
 \hline
+43         &   QingtianBox \\
+\hline
 \end{tabular}
=20
 Some of the devices above are unspecified by this document,
--=20
1.8.3.1


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

