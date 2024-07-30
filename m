Received: from mxde.zte.com.cn (mxde.zte.com.cn [209.9.37.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F0418E1A
	for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 02:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.9.37.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722305914; cv=none; b=QmfDLWpKmGEfiukkKT+zKUOiASC6CEFTHoaRM43SyFSHV6FXTwtbSIkkcQQUv03JVl3bl82zgg5fMqzi2kuojL8n79wgFc6WH17Id2PG3EuByNqVbFeHdU+hSqXpVSs/KJ8s6S2wAsjs41XkP+qF5JtVZ/hBbDJT0tMx+UyyuCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722305914; c=relaxed/simple;
	bh=u73bRDFu5p1Hp+Ozm3YXjd5XrJmKLAzP4PvFWMT+6JE=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=axi2FG/ZT4xokTJ9uM5ZbOQ+em5oQk5vKxkWVZ8hOGNC/k3vwM6+tskMgex4xlxNc+KdVir6iXUTXM35c+llw65gnAQPKIhxt7tWghYzlZf1/rjEt3eR5J01Nv9JoIvn6FjT7laGT/vOyIz/J8VkY5u7dfeW7LvNnBcynKlWI9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=209.9.37.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4WXzRL6Ljgz5TCGC
	for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 10:18:22 +0800 (CST)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4WXzR81Hr0z8XrX6
	for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 10:18:12 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4WXzQy6KZtz4xVbs
	for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 10:18:02 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl2.zte.com.cn with SMTP id 46U2Hvb8095035
	for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 10:17:57 +0800 (+08)
	(envelope-from tan.hu@zte.com.cn)
Received: from mapi (szxlzmapp01[null])
	by mapi (Zmail) with MAPI id mid16;
	Tue, 30 Jul 2024 10:17:58 +0800 (CST)
Date: Tue, 30 Jul 2024 10:17:58 +0800 (CST)
X-Zmail-TransId: 2b0366a84d56ffffffffdea-1ace0
X-Mailer: Zmail v1.0
Message-ID: <20240730101758667R0RC516SBxdCsM2K3dzNk@zte.com.cn>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
From: <tan.hu@zte.com.cn>
To: <virtio-comment@lists.linux.dev>
Cc: <liu.jie97@zte.com.cn>, <zhang.yajun@zte.com.cn>
Subject: =?UTF-8?B?W1JGQyBQQVRDSF0gVklSVElPX0ZfUEFDS0VEX1JJTkdfQkFUQ0g6IGFkZCBzdXBwb3J0IGZvciBiYXRjaCBmZXRjaGluZyBwYWNrZWQgcmluZyBkZXNjcmlwdG9ycyBvbiBkZXZpY2Vz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 46U2Hvb8095035
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 66A84D6D.002/4WXzRL6Ljgz5TCGC

From: Tan Hu <tan.hu@zte.com.cn>

In scenarios where a hardware backend is used, it is costly for the hardware
to obtain the ring descriptors by submitting DMA requests. At present, much
improvement has been achieved through the packed ring mechanism.

A further optimisation that could be considered is to read the descriptors
in a batch for the hardware which is fine if the driver initiates each
request with only one descriptor.

However, if the driver uses multiple descriptors in a single request,
when the hardware initiates a DMA operation to read descriptors
in a batch (e.g., 16 descriptors at a time), the internal bus on the CPU
side may split the memory read request into smaller requests by cacheline
size, which may cause the device to read subsequent descriptors of a request
before the the first descriptor.

In the current specification when the driver make use of a batch
of descriptors as part of a single request, the memory barrier before each
descriptor is omitted except for the first one. Thus, in the case of the
previously described, the device may see a valid first descriptor with
an invalid subsequent descriptor (it’s flag field is valid, but other fields
such as addr are invalid because no memory barrier is implemented)
associated with it.

Therefore, a new feature negotiation bit is added to address this issue.
If this feature bit is negotiated when using packed virtqueues, when the
driver uses a batch of descriptors in a single request, it must perform a
suitable memory barrier before updating the descriptor flags of each
descriptor. This allows the hardware to read the descriptors in a batch
to improve performance.

Signed-off-by: Tan Hu <tan.hu@zte.com.cn>
---
 content.tex     | 7 +++++++
 packed-ring.tex | 5 +++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 0a62dce..6709de6 100644
--- a/content.tex
+++ b/content.tex
@@ -872,6 +872,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
 	handling features reserved for future use.

+  \item[VIRTIO_F_PACKED_RING_BATCH(42)] This feature indicates that the device support
+  the batch fetching of packed ring descriptors.
+
+  If this feature bit is negotiated when using packed virtqueues, when the driver uses a
+  batch of descriptors in a single request, it MUST perform a suitable memory barrier
+  before updating the descriptor flags of each descriptor.
+
 \end{description}

 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
diff --git a/packed-ring.tex b/packed-ring.tex
index 9eeb382..8c2d52d 100644
--- a/packed-ring.tex
+++ b/packed-ring.tex
@@ -560,8 +560,9 @@ \subsubsection{Placing Available Buffers Into The Descriptor Ring}\label{sec:Bas
 general the driver MAY make use of a batch of descriptors as part
 of a single request. In that case, it defers updating
 the descriptor flags for the first descriptor
-(and the previous memory barrier) until after the rest of
-the descriptors have been initialized.
+(and the previous memory barrier if VIRTIO_F_PACKED_RING_BATCH
+has not been negotiated) until after the rest of the descriptors
+have been initialized.

 Once the descriptor \field{flags} field is updated by the driver, this exposes
 the descriptor and its contents.  The device MAY
-- 
2.41.0
