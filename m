Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433F019D89B
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 03:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644958; cv=none; b=dInYksU4mCqNUpjcWMvvUSX3GpyEpDYFqqnXHL6chR7xcEtDfv29/JJcseMF+jvS3bSpc+/e+t0TXJcC0DEyATLp4aNqYevS39fvmB/TxzhtNZrjH2vX5hPncuHRGNqlZB3VgAMaInc2irRbQKL6UE0gxopdL7KIvQfiWgzMyJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644958; c=relaxed/simple;
	bh=C505k4noE4vx5ymRCHKWRZbvS1UnAByyWD9/RQPzaXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=paoA9uSj5ciXxYI8BaZliHGxCdwgl2mTRNwlK0FQd7hT7vtQT9kU8BL46G/5CGTReuFlo7y91EprqcG5G0Gn1ZjUIZtxKQa139Fg+/S/u0YAUHhFWkX6Zz91dvyXGc1JGLLOYqQ0BpbtmwjfBn/gXj5bpHtxq+qBPppvu2LMleM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BPCWgWr/; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BPCWgWr/"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f67fa9cd73so11813795ad.0
        for <virtio-comment@lists.linux.dev>; Wed, 05 Jun 2024 20:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1717644952; x=1718249752; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oj9/p73STpeR1Wo3Z2HafjcovRh79kQgreC9WxFxO4U=;
        b=BPCWgWr/EU4IhBnSJozZcrxAQszq0lb3ZKAjQm4NM5TIyP8T6PgK/h3F2fPAPvyCif
         sNJGs9rgh6A0Ini5ZuQVkzbhzTrjGnO647dA5H0z7irSdfL80bawt10XkL8cqVhGOPPE
         gEsHN/9lLzUVuMIYBjPrjrjchohran5236fUmBqh56SpwVvWrQW+lAVQLZA4eN3P5KPS
         mNyJaFwreHGraXIDxyYBHlw0oOP7hdyPrJKLJ/R4oFgUEZyk9okxW1+KbpTjqgW4CWWg
         HxiCULIzn3KiEOfxSuBlT/7WLme3F+xa1VoZsus5BQA1pP/W7IsgZckxnfFx7o53HBbP
         AeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717644952; x=1718249752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oj9/p73STpeR1Wo3Z2HafjcovRh79kQgreC9WxFxO4U=;
        b=ZQhHbaj12y+gljP/p8IQGZtgi5XDpJUiq4dpTEQ8wOWWCVqN7+W39s4+Z+33mZ8y1J
         DhRdxi/daECTARRes5ERrnhGPW1vLY8lf57pI1PSNWUqVARavMwulzXWVvYoikMUlb4j
         oin0WP89+BJwEMdXTVTpszHpiHdTmKyBkdW1naHpxRzBuDojbwM/iXQ3w1M+hwN8in0/
         fFwzhHaKC61OgTJbfLk5n4sfeELq7c0EZnhFjrxtAp0S2DxkZYwy9kqRbxcr8uOCQno9
         1/a5+oHVvJFAeSwSnmzy7CyycgVw/93f1kpF+G4ezOOIZkdwvuY65khS+cC7CnX0Ve0Y
         nyag==
X-Gm-Message-State: AOJu0Yz4XHI9OOvLBdRzHgTcEjLoqQe/KxierVAFcRjyqxDFDx/3kBsi
	yvUkRBb2ySkCp/n2/MByFb92DM3gUoUsJpEgdZ1xbuSOdBTHcXYV2lLSbI2SJseKFXu+Nv4r9j0
	ddNw=
X-Google-Smtp-Source: AGHT+IEqSu+dZGRPVseiRtMn6zDPjc/tfiHSTc9CNt67e//iySUOPE2FSoLwooj25nBFgpoLPvt98w==
X-Received: by 2002:a17:902:d50c:b0:1f6:a542:1e26 with SMTP id d9443c01a7336-1f6b8f072f5mr22235035ad.27.1717644952038;
        Wed, 05 Jun 2024 20:35:52 -0700 (PDT)
Received: from always-zbook.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76c6efsm3107135ad.94.2024.06.05.20.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 20:35:51 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: virtio-comment@lists.linux.dev
Cc: david@redhat.com,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v2 1/2] balloon: introduce 6 memory statistics
Date: Thu,  6 Jun 2024 11:35:43 +0800
Message-ID: <20240606033544.400000-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240606033544.400000-1-pizhenwei@bytedance.com>
References: <20240606033544.400000-1-pizhenwei@bytedance.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Note that virtio balloon statistics are OS independent, the names are
not completely the same as Linux or Windows. For example, 'reclaim' is
more general than 'steal' (on linux) and 'repurpose' (on windows) for
a modern operating system.

Expose more memory statistics of the virtual memory subsystem from
guest, it's helpful to analyze the memory performance and pressure
from host side.

More, once the memory pressure gets critical, a task hits ALLOC STALL,
and reclaims pages in batch directly. So the ALLOC STALL count is not
the same as direct reclaim count.

Now we have a metric to analyze the memory performance:
- y: counter increases
- n: counter does not changes
- h: the rate of counter change is high
- l: the rate of counter change is low

OOM: VIRTIO_BALLOON_S_OOM_KILL
STALL: VIRTIO_BALLOON_S_ALLOC_STALL
ASCAN: VIRTIO_BALLOON_S_SCAN_ASYNC
DSCAN: VIRTIO_BALLOON_S_SCAN_DIRECT
ARCLM: VIRTIO_BALLOON_S_RECLAIM_ASYNC
DRCLM: VIRTIO_BALLOON_S_RECLAIM_DIRECT

- OOM[y], STALL[*], ASCAN[*], DSCAN[*], ARCLM[*], DRCLM[*]:
  the guest runs under really critial memory pressure

- OOM[n], STALL[h], ASCAN[*], DSCAN[l], ARCLM[*], DRCLM[l]:
  the memory allocation stalls due to cgroup, not the global memory
  pressure (for Linux).

- OOM[n], STALL[h], ASCAN[*], DSCAN[h], ARCLM[*], DRCLM[h]:
  the memory allocation stalls due to global memory pressure. The
  performance gets hurt a lot. A high ratio between DRCLM/DSCAN shows
  quite effective memory reclaiming.

- OOM[n], STALL[h], ASCAN[*], DSCAN[h], ARCLM[*], DRCLM[l]:
  the memory allocation stalls due to global memory pressure.
  the ratio between DRCLM/DSCAN gets low, the guest OS is thrashing
  heavily, the serious case leads poor performance and difficult
  trouble shooting. Ex, sshd may block on memory allocation when
  accepting new connections, a user can't login a VM by ssh command.

- OOM[n], STALL[n], ASCAN[h], DSCAN[n], ARCLM[l], DRCLM[n]:
  the low ratio between ARCLM/ASCAN shows that the guest tries to
  reclaim more memory, but it can't. Once more memory is required in
  future, it will struggle to reclaim memory.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 device-types/balloon/description.tex | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
index a1d9603..7ef4e3f 100644
--- a/device-types/balloon/description.tex
+++ b/device-types/balloon/description.tex
@@ -305,6 +305,12 @@ \subsubsection{Memory Statistics}\label{sec:Device Types / Memory Balloon Device
 #define VIRTIO_BALLOON_S_CACHES   7
 #define VIRTIO_BALLOON_S_HTLB_PGALLOC 8
 #define VIRTIO_BALLOON_S_HTLB_PGFAIL  9
+#define VIRTIO_BALLOON_S_OOM_KILL       10
+#define VIRTIO_BALLOON_S_ALLOC_STALL    11
+#define VIRTIO_BALLOON_S_ASYNC_SCAN     12
+#define VIRTIO_BALLOON_S_DIRECT_SCAN    13
+#define VIRTIO_BALLOON_S_ASYNC_RECLAIM  14
+#define VIRTIO_BALLOON_S_DIRECT_RECLAIM 15
         le16 tag;
         le64 val;
 } __attribute__((packed));
@@ -399,6 +405,24 @@ \subsubsection{Memory Statistics Tags}\label{sec:Device Types / Memory Balloon D
 
 \item[VIRTIO_BALLOON_S_HTLB_PGFAIL (9)] The number of failed hugetlb page
   allocations in the guest.
+
+\item[VIRTIO_BALLOON_S_OOM_KILL (10)] The count of OOM killer invocations
+  increases when the kernel invokes the OOM killer. The OOM killer selects a task
+  to terminate in order to free up memory.
+
+\item[VIRTIO_BALLOON_S_ALLOC_STALL (11)] The count of stalls on memory allocation.
+
+\item[VIRTIO_BALLOON_S_ASYNC_SCAN (12)] The amount of memory scanned asynchronously
+  by the kernel background task (in bytes).
+
+\item[VIRTIO_BALLOON_S_DIRECT_SCAN (13)] The amount of memory scanned directly by
+  the running task (in bytes).
+
+\item[VIRTIO_BALLOON_S_ASYNC_RECLAIM (14)] The amount of memory reclaimed
+  asynchronously by the kernel background task (in bytes).
+
+\item[VIRTIO_BALLOON_S_DIRECT_RECLAIM (15)] The amount of memory reclaimed
+  directly by the running task (in bytes).
 \end{description}
 
 \subsubsection{Free Page Hinting}\label{sec:Device Types / Memory Balloon Device / Device Operation / Free Page Hinting}
-- 
2.43.0

