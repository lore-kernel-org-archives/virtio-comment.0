Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB39AD5E
	for <virtio-comment@lists.linux.dev>; Fri, 30 May 2025 00:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748566333; cv=none; b=GD3aP4pRMODlV06iFa8SxhLYuDuOQSRL/gty0yrtwtetFZzrJeR2NGZ8NBW7iuLShyWI8C7IEYfmdMIcCIS7PG6ZdO92EN73i3T7aGlDYdDxJYTb9ag6B/fHkPcFCB+tbNTEh4s09AnZIAL2aPVDJEs7Mz60tWEV4ptedZQhIW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748566333; c=relaxed/simple;
	bh=kdouTO6JpYaG2U5d6vrzPEOXnrNPVnBPpiUqZl0bMbY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Fb+tofq66Sfd4wmP41Hq34U6YYvW3nQb3zVZ0W+nrPVRvBSsatTRCTHC6Go4XhNFSP5vkqQP9I9I3CaNI2ufe6Zc8oJd/y3Xz5etdLPp2Sgl8H+g+F7w8sH/oW720vBfI5WPfJvOgaaEHRirkwGBLDzHnY1jcj2+3mGPEFgfm6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoZUrBDF; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoZUrBDF"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4769bbc21b0so15635781cf.2
        for <virtio-comment@lists.linux.dev>; Thu, 29 May 2025 17:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748566329; x=1749171129; darn=lists.linux.dev;
        h=content-transfer-encoding:autocrypt:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S6sT12Nr6EWCqjJxLYxE1sVeggp3TnRCcH4gA4iJJiQ=;
        b=GoZUrBDFfNCSWc1tJ+Dg72j7fXa0AGnuaQYwn3QwB0j4jSmT4UbgGIb9iXYm0VKQGl
         UEgnRLdgNfmX4c2gDKUILjhRFbWuJfiNhO8mZcqCLC7jOI34/7RA2ZK+z3cSd6gkBEWe
         wiUQk1SYhjIS3p4k4tU/eNjruxwwhBt2UzOHNTzBISZatvUwvnF6u7LFo9J+5XfHh7nI
         pju7mEdaXztgsDzRL1Y5U2t14CNc7NdO3PwSwUbj+apaex4ghgIgP4VSZ3qe5a9QlMAG
         IU35VRl7bECKhe1p79ufFDEXMu1xp2ACt3jYQsajYapM0v/NvFzwh+EM13PjeHtIiLfA
         8XMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748566329; x=1749171129;
        h=content-transfer-encoding:autocrypt:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S6sT12Nr6EWCqjJxLYxE1sVeggp3TnRCcH4gA4iJJiQ=;
        b=dAuyoAxA4qizV+RozA0jAzW3OUry/7DrNUcBiTThYA7t5cO+D9l1b0qIlF9CZYBbgE
         6KHk1bhjBD6YTlmCTrsP87WFC/MDtIsb3Avjd14YZR+Jg5ua27lpYi+Tz4Us5NmG4rGw
         qs6TyaWi4//Gd17X8M4deBCxbL1lZmhfSuXAH48Sv/yspDacUtGfHUtuuHHyj2J7BPRH
         ukcHz1kSa/EKagLHXCuBO3Ts1DCBb2iEyUQeoYOjvsqYAlCxzGtdn3HFrMLe8LUKQ0r7
         RuIlBo+pqFOeL8ms0ARy/DV8tJV4dVQ25sWZZ8m+WsmiWdoNq2/fWS6YHF6WGYe587WK
         5xiQ==
X-Gm-Message-State: AOJu0YzBYb6inNGrXOLyQOcHij+r5i4fDS7iV724Awa47UqGAhfQ0gt4
	lijtI/GBdmcjGi8eymfV6wPeDbfEsWh2LUQ8EXOXQvVON5107kKOnNNdzwDKdQ==
X-Gm-Gg: ASbGnctwTjOJwtT948LHZr/EIkUeumwiUxHSFt3JYbUE5x1YF+MVf8u7blnuDJVzgJL
	8LAG16G7YrcMGpA/YayxNKVfTCTBpyKlCyBAFe7p7lJft6+Ip4zCz8jzcCm49bAQcy8ONMt/C4q
	W8clqUPLpqYPa/110P5rDbnri9/QM2WMju+AhDu/pfWaZ+8PoXXJKRYcknz+uWLhKnfVTez8s1Z
	QCEKe7hR2BANiqJ3D8FSrV2NNjQlJi4H5wVVJgiulrSa82/GUmbq0ZkwOnmpTss4En3AyhucoyZ
	FT/n3jpVIDsRcbye4TaHAGh8eLZzxHQHcbi8+SYpdIZiKUxrzxYpGFUr
X-Google-Smtp-Source: AGHT+IH8PdXE9Toe1RQ2qYBhXZyXPPJvffNf4HUX49mXoifH9Ue8zhdQlgKUIjpMulvNF4x6mhP3gQ==
X-Received: by 2002:a05:622a:229f:b0:491:20d6:75ff with SMTP id d75a77b69052e-4a44005ae51mr27515401cf.31.1748566329140;
        Thu, 29 May 2025 17:52:09 -0700 (PDT)
Received: from [10.138.10.6] ([89.187.178.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f8b61sm154815085a.26.2025.05.29.17.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 17:52:08 -0700 (PDT)
Message-ID: <ebeef135-1b87-4834-ad8d-5bb76554baa2@gmail.com>
Date: Thu, 29 May 2025 20:52:07 -0400
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Demi Marie Obenour <demiobenour@gmail.com>
Subject: [PATCH] Add interrupt remapping support
Content-Language: en-US
To: virtio-comment@lists.linux.dev
Cc: devel@spectrum-os.org, Alyssa Ross <hi@alyssa.is>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This adds interrupt remapping to the virtio-IOMMU device.  This is
needed to support deprivileged userspace drivers on x86_64 and other
platforms where interrupt remapping is the job of the IOMMU.  It is not
needed on AArch64 and must not be supported on that platform.
---
 device-types/iommu/description.tex | 70 +++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index f8cbe88..0a3bcab 100644
--- a/device-types/iommu/description.tex
+++ b/device-types/iommu/description.tex
@@ -3,7 +3,8 @@ \section{IOMMU device}\label{sec:Device Types / IOMMU Device}
 The virtio-iommu device manages Direct Memory Access (DMA) from one or
 more endpoints. It may act both as a proxy for physical IOMMUs managing
 devices assigned to the guest, and as virtual IOMMU managing emulated and
-paravirtualized devices.
+paravirtualized devices.  On some platforms, it is also responsible for
+interrupt remapping.
 
 The driver first discovers endpoints managed by the virtio-iommu device
 using platform specific mechanisms. It then sends requests to create
@@ -74,6 +75,13 @@ \subsection{Feature bits}\label{sec:Device Types / IOMMU Device / Feature bits}
   whether endpoints that are attached to a domain are in bypass
   mode.
 
+\item[VIRTIO_IOMMU_F_IRQ_MAP_UNMAP (7)]
+  Interrupt remapping is available. This is architecture specific
+  and MUST NOT be negotiated on architectures such as AArch64 where
+  interrupt remapping is not handled by the IOMMU.  If this feature
+  is negotiated, all interrupts from endpoints that are not in
+  bypass mode are initially disabled.
+
 \end{description}
 
 \drivernormative{\subsubsection}{Feature bits}{Device Types / IOMMU Device / Feature bits}
@@ -531,6 +539,66 @@ \subsubsection{MAP request}\label{sec:Device Types / IOMMU Device / Device opera
 range mapped with VIRTIO_IOMMU_MAP_F_WRITE but not
 VIRTIO_IOMMU_MAP_F_READ.
 
+\subsubsection{IRQ MAP request}\label{sec:Device Types / IOMMU Device / Device operations / IRQ MAP request}
+
+\begin{lstlisting}
+struct virtio_iommu_req_irq_map {
+  struct virtio_iommu_req_head head;
+  le32  domain;
+  le64  msi_address;
+  le32  msi_payload;
+  le32  vector_id;
+  le32  vcpu_id;
+  le32  flags;
+  u8    reserved[4];
+  struct virtio_iommu_req_tail tail;
+};
+\end{lstlisting}
+
+Map a host MSI to a guest MSI directed at the given vCPU.  vCPUs range from 0 to
+$2^{32} - 2$ inclusive.  $2^{32} - 1$ is reserved and means ``no vCPU'',
+effectively disabling the interrupt.  Any previous mapping of the MSI is overwritten.
+
+This request takes effect immediately.  It is the device's job to flush caches if
+necessary.  However, any interrupts that are pending remain pending.
+
+The set of permitted values for \field{msi_address} and \field{msi_payload}
+is architecture-dependent.  Invalid values include, but are not limited to:
+
+\begin{itemize}
+\item Values that are not in the architecture-dependent range of MSI addresses.
+\item Values that have bits set that are ignored by the physical IOMMU.
+\item Values that have reserved bits set.
+\item Values that would cause the MSI to not be subject to interrupt remapping,
+      and which the host must therefore block for its own security.
+\end{itemize}
+
+This request is only available when VIRTIO_IOMMU_F_IRQ_MAP_UNMAP has been negotiated.
+
+\drivernormative{\paragraph}{IRQ MAP request}{Device Types / IOMMU Device / Device operations / IRQ MAP request}
+
+The driver SHOULD set undefined \field{flags} bits to zero.
+
+The driver SHOULD NOT send IRQ MAP requests on a bypass domain.
+
+The driver SHOULD NOT choose values for \field{msi_address} or \field{msi_payload}
+that are invalid for the CPU architecture.
+
+The driver SHOULD NOT choose a \field{vcpu_id} that corresponds to a vCPU that does
+not exist and is not $2^{32} - 1$.
+
+\devicenormative{\paragraph}{IRQ MAP request}{Device Types / IOMMU Device / Device operations / IRQ MAP request}
+
+If \field{msi_address} or \field{msi_payload} is invalid for the CPU architecture,
+the device SHOULD reject the request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
+
+If \field{domain} does not exist, the device SHOULD reject the request and
+set \field{status} to VIRTIO_IOMMU_S_NOENT.
+
+If \field{vcpu_id} does not correspond to a CPU that is running in the guest
+and is not $2^{32} - 1$, the device SHOULD reject the request and set
+\field{status} to VIRTIO_IOMMU_S_NOENT.
+
 \subsubsection{UNMAP request}\label{sec:Device Types / IOMMU Device / Device operations / UNMAP request}
 
 \begin{lstlisting}
-- 
Sincerely,
Demi Marie Obenour
