Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B738B270EDF
	for <virtio-comment@lists.linux.dev>; Tue, 25 Aug 2026 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787655086; cv=none; b=DpF8ouSE3oUS73JYgjev2TeyTwo14HJyBEYle99JytTKdmnUMIMMCUkhrCnhZGY7hJhVBHHTXjEWQJM44eiJNaiRyfmVPVaEiov03N5RnbknXeiIawQxZ39p8UcH/8YAO8TJRxZu4rjpQExmS8qFF3dWJkjvhNOPyP3PNkT3KCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787655086; c=relaxed/simple;
	bh=8jVgwqBkhySK9OmPTg3SsnTvheAcfdwFon2a1IeML94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qaD+j9sqdXZzBPXVjV5L2RFyYleV++wBG96Cm+EEMrgyFPv+3YbfTyiTdMU2OJkWh1h1VN/qe1J8GTOuNWw2/DFaWLkqJ2bZun2oMckf1yiBB2ZOjlIze4TriFwZPvr+Fp62UiVEJAel1ZBjcaOkop8efjQ/p+MueuCbmMDTLsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ixJad2+W; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ixJad2+W"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787655079; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=NsNOj5Aw5vrBRwnw7qf86WcxEm8qilJm+RUV0jWT64E=;
	b=ixJad2+WSsVW/vVmVnoqV54jyZOblw/iFsrUzYhcJMZEBNK6UQ697VGP825sq0KmxbY1/iyj+f5lQybzvMIorrxTupUDj0qrPQLJcQg8WDs/WiF8q82Sse6Kn0gldI/sROkLDYeqa7cbgmHzKigkJkpDKr/qmwjgeD72uGW0eiI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R961e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=zhangjianming@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X9djL.x_1787655075;
Received: from localhost.localdomain(mailfrom:zhangjianming@linux.alibaba.com fp:SMTPD_---0X9djL.x_1787655075 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 25 Aug 2026 18:51:17 +0800
From: zhangjianming@linux.alibaba.com
To: virtio-comment@lists.linux.dev
Cc: mst@redhat.com,
	david@redhat.com,
	alexander.duyck@gmail.com,
	cohuck@redhat.com,
	yvugenfi@redhat.com,
	Zhang JianMing <zhangjianming@linux.alibaba.com>
Subject: [PATCH RFC] balloon: add VIRTIO_BALLOON_F_PAGE_REPORTING_HOLD
Date: Tue, 25 Aug 2026 18:50:46 +0800
Message-Id: <20260825105046.811-1-zhangjianming@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0.windows.1
In-Reply-To: <43fe2f5c-6c0c-4279-8e55-42ddd9daf637.zhangjianming@linux.alibaba.com>
References: <43fe2f5c-6c0c-4279-8e55-42ddd9daf637.zhangjianming@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhang JianMing <zhangjianming@linux.alibaba.com>

Define a new balloon feature bit which lets the driver announce that it
will retain reported pages after the reporting request has been
acknowledged, instead of returning them to the guest free page lists
immediately, and reuse them only when needed.

The current text of the Free Page Reporting section already allows the
driver to "reuse the reported free pages when needed" after
acknowledgement, but the device cannot observe whether a given driver
will return the pages immediately or keep them. The new bit makes this
explicit and negotiated, in the same informational spirit as
VIRTIO_BALLOON_F_PAGE_POISON. It adds no new driver obligation and
requires no new device action.

Motivation: on guests whose memory manager touches every freed page
(e.g. Windows), pages returned to the guest free lists immediately
after a report are dirtied again within seconds, and the host-side
benefit of the report is lost. Retaining reported pages inside the
driver preserves it; measurements and a reference QEMU patch were
posted to the virtio-comment list on 2026-08-17.

Signed-off-by: Zhang JianMing <zhangjianming@linux.alibaba.com>
---
Hi all,

Following up on the proposal from 2026-08-17 ("virtio-balloon:
proposal - free page reporting hold") with a concrete spec change, now
as a patch against the current master.

Additional notes beyond the commit message:

- Feature bit number: bit 6 is the next free bit in the current
  master. I am aware of the balloon DEVICE_INIT* series discussed on
  this list in April/May; if any of those lands first and takes bit
  6, this patch should be renumbered accordingly; happy to rebase.

- Implementation status: a reference QEMU patch (property
  "free-page-reporting-hold", default off, requires
  free-page-reporting) was included with the original proposal. A
  Windows virtio-balloon driver prototype retains reported pages and
  releases them gradually under memory pressure.

Comments welcome, in particular on the bit number, the feature name,
and whether the device normative statement is strong enough.

---
 device-types/balloon/description.tex | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
index a1d9603..4a367bf 100644
--- a/device-types/balloon/description.tex
+++ b/device-types/balloon/description.tex
@@ -48,6 +48,10 @@ guest memory statistics to the host.
     Configuration field \field{poison_val} is valid.
 \item[ VIRTIO_BALLOON_F_PAGE_REPORTING(5) ] The device has support for free
     page reporting. A virtqueue for reporting free guest memory is present.
+\item[ VIRTIO_BALLOON_F_PAGE_REPORTING_HOLD(6) ] A hint to the device, that
+    the driver will retain the reported pages after the reporting request
+    has been acknowledged, instead of returning them to the guest free page
+    lists immediately. The driver will reuse such pages only when needed.
 
 \end{description}
 
@@ -598,6 +602,11 @@ pages are reported is up to the driver.
 
 \end{enumerate}
 
+If the VIRTIO_BALLOON_F_PAGE_REPORTING_HOLD feature has been negotiated,
+the driver may retain the reported pages after the reporting request has
+been acknowledged, instead of returning them to the guest free page lists
+immediately, and reuse them only when needed.
+
 \drivernormative{\paragraph}{Free Page Reporting}{Device Types / Memory Balloon Device / Device Operation / Free Page Reporting}
 
 Normative statements in this section apply if the
@@ -629,6 +638,11 @@ If the VIRTIO_BALLOON_F_PAGE_POISON feature has not been negotiated, the
 device MAY modify the contents of any page supplied in a report request
 before acknowledging that request by using the reporting_vq descriptor.
 
+If the VIRTIO_BALLOON_F_PAGE_REPORTING_HOLD feature has been negotiated,
+the device MUST NOT assume that a reported page is returned to the guest
+free page lists at any particular time after the reporting request has been
+acknowledged.
+
 If the VIRTIO_BALLOON_F_PAGE_POISON feature has been negotiated, the device
 MUST NOT modify the the content of a reported page to a value other than
 \field{poison_val}.
-- 
2.23.0.windows.1

