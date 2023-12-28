Return-Path: <virtio-comment-return-8871-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C811C47072
	for <virtio-comment@archiver.kernel.org>; Thu, 28 Dec 2023 07:46:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D55FD6A113
	for <virtio-comment@archiver.kernel.org>; Thu, 28 Dec 2023 07:46:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA604986419
	for <virtio-comment@archiver.kernel.org>; Thu, 28 Dec 2023 07:46:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BF62F983EB6; Thu, 28 Dec 2023 07:46:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B17049863B2
	for <virtio-comment@lists.oasis-open.org>; Thu, 28 Dec 2023 07:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R871e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VzNkGAr_1703749574;
From: Heng Qi <hengqi@linux.alibaba.com>
To: virtio-comment@lists.oasis-open.org
Cc: Jason Wang <jasowang@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Date: Thu, 28 Dec 2023 15:46:12 +0800
Message-Id: <1703749573-2786-2-git-send-email-hengqi@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1703749573-2786-1-git-send-email-hengqi@linux.alibaba.com>
References: <1703749573-2786-1-git-send-email-hengqi@linux.alibaba.com>
Subject: [virtio-comment] [PATCH v7 1/2] virtio-net: correct conditions for devices to validate packet checksum

There is a historical error in virtio spec:
  "If VIRTIO_NET_F_GUEST_CSUM is not negotiated, the device *MUST* set flags to zero
   and SHOULD supply a fully checksummed packet to the driver."

Currently in Linux and virtio-related implementations, the device validates
the packet checksum and sets DATA_VALID regardless of whether
VIRTIO_NET_F_GUEST_CSUM is negotiated.

Please refer to the following summary and thread[1] for details and reasons:

Summary:
1. GUEST_CSUM at virtio spec 0.95 is intended to be compatible with partially
checksummed packets (NEEDS_CSUM <-> CHECKSUM_PARTIAL). So GUEST_CSUM is mapped
to NETIF_F_RXCSUM.
GUEST_CSUM only indicates whether the driver handles partially checksummed packets.
When XDP is loaded, the offload of GUEST_CSUM will be disabled, which means that
packets have NEEDS_CSUM set will be dropped, but packets have DATA_VALID set will
still be received because NETIF_F_RXCSUM still exists.

2. When DATA_VALID was added to Linux in 2011[2] and virtio1.0, it was actually expected
that rx checksum offload (the driver can set CHECKSUM_UNNECESSARY) had nothing to do
with whether GUEST_CSUM was negotiated. But due to an error, below desctiption was
added incorrectly:
  "If VIRTIO_NET_F_GUEST_CSUM is not negotiated, the device *MUST* set flags to zero
   and SHOULD supply a fully checksummed packet to the driver."

3. We now hope to correct this error. Let the setting of DATA_VALID not be controlled by
whether GUEST_CSUM is negotiated, but only controlled by whether rx checksum offload is
enabled on the OS side. The state of this rx checksum offload is also not aware of the device.

4 NETIF_RXCSUM corresponding to rx checksum offload should be added to dev->hw_features.
When the user turns off rx checksum offload through ethtool -K, neither NEEDS_CSUM nor
DATA_VALID should be taken care of, that is, all packets will be CHECKSUM_NONE.

5. GUEST_FULLY_CSUM is added to disable the offload of GUEST_CSUM:
When a packet have NEEDS_CSUM set is received, it is either dropped or a fully checksummed
packet is calculated.
When the corresponding offload of the GUEST_FULLY_CSUM is disabled, it is as if only
GUEST_CSUM was negotiated.

[1] https://lists.oasis-open.org/archives/virtio-comment/202312/msg00135.html
[2] 10a8d94a9574 ("virtio_net: introduce VIRTIO_NET_HDR_F_DATA_VALID")

Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
 device-types/net/description.tex | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index aff5e08..a5210f2 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -723,8 +723,7 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   \field{num_buffers} is one, then the entire packet will be
   contained within this buffer, immediately following the struct
   virtio_net_hdr.
-\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
-  VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
+\item The VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
   set: if so, device has validated the packet checksum.
   In case of multiple encapsulated protocols, one level of checksums
   has been validated.
@@ -783,7 +782,7 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 packet together, such that at least \field{num_buffers} are
 observed by driver as used.
 
-If VIRTIO_NET_F_GUEST_CSUM is not negotiated, the device MUST set
+If VIRTIO_NET_F_GUEST_CSUM is not negotiated, the device MAY set
 \field{flags} to zero and SHOULD supply a fully checksummed
 packet to the driver.
 
@@ -842,8 +841,7 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 not less than the length of the headers, including the transport
 header.
 
-If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
-device MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in
+The device MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in
 \field{flags}, if so, the device MUST validate the packet
 checksum (in case of multiple encapsulated protocols, one level
 of checksums is validated).
-- 
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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

