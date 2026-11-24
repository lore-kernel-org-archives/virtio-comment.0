Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517593;
	b=o3YcikuyjoVWB9AHOrSdNXxWPOaJnewmDGrQodKYZMFUlg82h+n+el2qVTi59mrwPnzu
	 rf8glpHpIsdYj+NF232kMW93AWR/RCO6p6jd7ASa+KYVnrzK0X/b74BTK22XpAT+YGp/w
	 +nUi8y0XbhF9x073Q1+BcGCUL0S4R/UKIsgttToJzLiqxzum5vp+wbq7pImJUOg0H9coJ
	 +kLhUPrdu/CG0LTG3sQU9GSpTdPUNBnC4L3LgJjelfCM5Wf28nUu2iHlTVCzzyrSku1/g
	 YK+k531mmn7KvFn6p3jpBYJxSdGrN7petyevlinaAregEdSpaGuboH5LnHVNXfd1I8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PSG/+Q5cOfLWVqM/cxEGsQS+3Tm+w356vAdH6/SaUIY=;
	b=RUZbuM2jkOcPmON+zppfd1RWlLptIHo4Btn3165Epb8eqhxhMxqDvVOR7hi+AsizOmg1
	 W7c0a7F5T9urmnMu8G85Hwuf8AUpw0dYrB8msjXdM0aFN2H/MliHUJOJ/G2k8XOiBTUvV
	 6Mjz589SgMG+TAJpsx0Ajsl4a9a3E3kQGBwQiUiL4GxZqdW5tKDj2tObtCY7pAFC/xmxS
	 5ujMNtOfNzxJAjaOnzewqq8fBHf58XFebtskoDh/Yq0oLi36u089Vy6fTMwnHAXigDdOe
	 Y+uCauwDDkH/qwxhtAfXUaPOcq0WG0nq5HLszi3DTGDmqvVUBxOrJIy1JIC8i0CU/Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SxQ05lNV;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2D0606A31E
	for <virtio-comment@lists.linux.dev>; Tue, 24 Nov 2026 10:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E2D0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SxQ05lNV
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so3132315f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 24 Nov 2026 02:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795517591; x=1796122391; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PSG/+Q5cOfLWVqM/cxEGsQS+3Tm+w356vAdH6/SaUIY=;
        b=SxQ05lNV8X7od4tVjVWtNmoyFIy3o/rUy3tskdiZaA5MAebF7172EPjGPDXfwrkDWJ
         ax6czNnw6dJXB+Sm0zN7nMmNsxl4BW0EinFVsixkz1DVnG+DagkJKaeep7vRwfxihFog
         5+Wr7BtotmK97GpZ7bCNHzZ8sJgWWTE2PSPGF5ECjt7jGzzwOslPfFm+ADoNEFYXQfa2
         f/DTaMtuZEeYvPmxe5IX0DRWdy294mn2g7nVXpNoA+za4KaRTJTHplk/SR1LAzaSRhK5
         jJVoCxEtWjr9+helxeW4uEIyq1digAuHMK187yVZ739d7rtw8wvlUCxgZSCp9J4cd6cK
         FaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517591; x=1796122391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSG/+Q5cOfLWVqM/cxEGsQS+3Tm+w356vAdH6/SaUIY=;
        b=QdE2idw9Oswe8CCqyLdmvwFA2n5/8SRWO3Tr1K1nGZlVOfwcSWLKYR4tS2uCQOjZWW
         PqAvR+O8uHtQxczS1YUHlCIE3q4H/ZmAhyAwJC5Y7Ss+X9HkVk4gx5366YWTDCnchIZw
         OahUkr+H/2INy43hXqDNqlA+GOKZigGZbQlHD88YhewkOmcKfuTEVeQMKyzvoEdGkzXa
         NXcLkvptcvsOW84z7RLbN6tgk5HTZP/NLVYRIuJ9vBJ6SKDFWJEu2jyh1ll/59ZahbuW
         rwxSQR5JEwui4E5WWFzvF2ex86WWMlavnvdq5Y/chEcKjclsLu9bM2vOPvRkC0q8JdI7
         umpA==
X-Gm-Message-State: APuU4Z8/DDfs+HqSJ0c8x/0HX966JuizqQZBhsfUryhC/13JoJrOWvxE
	ytYJ2sOKMsiAYF0ulVdWauNrm0+xuQK07jwwFhJanple0cdVd7DBS70FUgQUa+Oj
X-Gm-Gg: AZFdTZfpW1ZNzHWSE5bAZEpd6xHtIv7wpAGObLIxQCgJUq603v/E8A7WtsYJWHgmBss
	xGzKWq5Fw5T8JH7irzt6G8yNVdAEE1zkFYoXZAlHsANB1LipkiFeSURds4Z3dMyuHvlxpq9hY0c
	h68iI1VyTeKvzm+TfjtT7+r37JdXqAUtw5K/s0nLdR29bUWnDsp0YKZRdcgepTB7OXtNuySoC/G
	dekZHbDzpDURiuz84XjeRH7BceOAqj4PEgQpPYf+moRQBsthaxV7l/ONxF0p4J90KwghBpNuum0
	JI8BNIefszJ+edfKBC0n7aIPQGf0podF5lWw7OrmmQvZCTCNP7t1dfWrdMT40a5xY3WFIscQ904
	rypSlITBjnS3QEBFzP1sQh61YHWhkdvyvGC1MkFV9FpwRYDGw/V1B5n3HdGtlnhQkqlTW9ADu9O
	x8vdzEPCJyJhuZCqZpDfH6lmFfym3sLSFgR9NvBPPrXVGFReu25EoeMUNLKDe7d03VNeTu8AzS3
	7Z2KoIkuz70Ue2NgWGVjBeeXlb5l35VrvXl0CBYFD1sXTpxVCEWPwvhl2gXb8qia0Jr7jcQdeI6
	veeNdy+TXbVSL4gWA9M3P3Gjr/T46S2gAt7URu5VqbZ7ZwyWiZjV8hiihfo5cGkdWHFUfQ==
X-Received: by 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id 5b1f17b1804b1-4bb8880fe46mr291285835e9.11.1795517590496;
        Tue, 24 Nov 2026 02:53:10 -0800 (PST)
Received: from build-server.. ([62.96.37.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm262097985e9.4.2026.11.24.02.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:10 -0800 (PST)
From: Mikhail Malyshev <mike.malyshev@gmail.com>
To: virtio-comment@lists.linux.dev
Cc: Val Packett <val@invisiblethingslab.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Sergio Lopez <slp@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Parav Pandit <parav@nvidia.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Vadim Rozenfeld <vrozenfe@redhat.com>
Subject: [PATCH] virtio-gpu: add VIRTIO_GPU_F_CURSOR_SIZE
Date: Tue, 24 Nov 2026 10:53:08 +0000
Message-ID: <20261124105308.2212634-1-mike.malyshev@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cursor resource is 64x64. A guest on a high-DPI display scales its
pointer beyond that: Windows asks for a 96x96 pointer at 300% scaling
and a 160x160 one at 500%. When the driver cannot hand the device a
cursor of that size, the guest draws the pointer into the framebuffer
itself, so every pointer move becomes a guest redraw and a scanout
update instead of a cursorq command. Hosts can show larger cursors:
Intel display engines, for example, have 256x256 cursor planes.

Let the device advertise the largest cursor it takes, in a new
configuration field made valid by a new feature bit, following
VIRTIO_GPU_F_BLOB_ALIGNMENT. When the feature has been negotiated, the
width and the height of a cursor resource can each be any value up to
that size. Without the feature nothing changes: the cursor stays 64x64.

Signed-off-by: Mikhail Malyshev <mike.malyshev@gmail.com>
---

Notes:
    Bit number: bits 6 and 7 are proposed in Val Packett's pending series
    "virtio_gpu: add F_CREATE_GUEST_HANDLE and F_BLOB_CTX_ID_FIX" [1], so
    this takes 8. Neither of those adds a configuration field, so
    max_cursor_size goes right after blob_alignment either way.
    
    Implementations: a QEMU device change (the feature, the field and a
    max_cursor_size property, up to 256) and a change to the Windows
    viogpudo driver have been run together on an Intel host. With a 4K
    display at 300% scaling, Windows hands the driver 96x96 pointer shapes,
    and the host shows them at full size on its hardware cursor plane. Both
    still use bit 6 and will follow the number agreed here. Neither is
    posted yet. There is no Linux driver change yet.
    
    This patch was written with the help of an AI coding assistant,
    Anthropic's Claude, directed and reviewed by me, and I take
    responsibility for it as for any patch I sign off.
    
    [1] https://lore.kernel.org/virtio-comment/20260903021442.423274-1-val@invisiblethingslab.com/

 device-types/gpu/description.tex        | 23 ++++++++++++++++++++++-
 device-types/gpu/device-conformance.tex |  1 +
 device-types/gpu/driver-conformance.tex |  1 +
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index ac3b427..0002777 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -39,6 +39,9 @@ \subsection{Feature bits}\label{sec:Device Types / GPU Device / Feature bits}
   synchronization timelines supported.  Requires VIRTIO_GPU_F_VIRGL.
 \item[VIRTIO_GPU_F_BLOB_ALIGNMENT (5)] configuration field
   \field{blob_alignment} is valid. Requires VIRTIO_GPU_F_RESOURCE_BLOB.
+\item[VIRTIO_GPU_F_CURSOR_SIZE (8)] configuration field
+  \field{max_cursor_size} is valid, and a cursor resource can be
+  larger than 64x64.
 \end{description}
 
 \subsection{Device configuration layout}\label{sec:Device Types / GPU Device / Device configuration layout}
@@ -55,6 +58,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / GPU Device / D
         le32 num_scanouts;
         le32 num_capsets;
         le32 blob_alignment;
+        le32 max_cursor_size;
 };
 \end{lstlisting}
 
@@ -73,6 +77,8 @@ \subsubsection{Device configuration fields}
 \item[\field{blob_alignment}] specifies the minimal alignment, in bytes,
   required by the device for resource blobs.  The value is a power of
   two.  Minimum value is 1, maximum value is 4294967296.
+\item[\field{max_cursor_size}] specifies the maximum width and the
+  maximum height, in pixels, of a cursor resource.  Minimum value is 64.
 \end{description}
 
 \subsubsection{Events}
@@ -184,7 +190,9 @@ \subsubsection{Device Operation: Multihead setup}
 \subsubsection{Device Operation: Configure mouse cursor}
 
 The mouse cursor image is a normal resource, except that it must be
-64x64 in size.  The driver MUST create and populate the resource
+64x64 in size.  If VIRTIO_GPU_F_CURSOR_SIZE has been negotiated, its
+width and its height can instead be any value up to
+\field{max_cursor_size}.  The driver MUST create and populate the resource
 (using the usual VIRTIO_GPU_CMD_RESOURCE_CREATE_2D,
 VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING and
 VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D controlq commands) and make sure they
@@ -866,6 +874,19 @@ \subsubsection{Device Operation: cursorq}\label{sec:Device Types / GPU Device /
 
 \end{description}
 
+\drivernormative{\paragraph}{Device Operation: cursorq}{Device Types / GPU Device / Device Operation / Device Operation: cursorq}
+
+If VIRTIO_GPU_F_CURSOR_SIZE has been negotiated, the driver MUST NOT
+send VIRTIO_GPU_CMD_UPDATE_CURSOR for a resource whose width or height
+is larger than \field{max_cursor_size}.
+
+\devicenormative{\paragraph}{Device Operation: cursorq}{Device Types / GPU Device / Device Operation / Device Operation: cursorq}
+
+If VIRTIO_GPU_F_CURSOR_SIZE has been negotiated, the device MUST load
+the cursor from the whole resource in VIRTIO_GPU_CMD_UPDATE_CURSOR
+whenever its width and its height are both at most
+\field{max_cursor_size}.
+
 \subsection{VGA Compatibility}\label{sec:Device Types / GPU Device / VGA Compatibility}
 
 Applies to Virtio Over PCI only.  The GPU device can come with and
diff --git a/device-types/gpu/device-conformance.tex b/device-types/gpu/device-conformance.tex
index 782ef81..9e1b3e0 100644
--- a/device-types/gpu/device-conformance.tex
+++ b/device-types/gpu/device-conformance.tex
@@ -5,4 +5,5 @@
 \begin{itemize}
 \item \ref{devicenormative:Device Types / GPU Device / Device Initialization}
 \item \ref{devicenormative:Device Types / GPU Device / Device Operation / Device Operation: Command lifecycle and fencing}
+\item \ref{devicenormative:Device Types / GPU Device / Device Operation / Device Operation: cursorq}
 \end{itemize}
diff --git a/device-types/gpu/driver-conformance.tex b/device-types/gpu/driver-conformance.tex
index 9ef708e..ebf180a 100644
--- a/device-types/gpu/driver-conformance.tex
+++ b/device-types/gpu/driver-conformance.tex
@@ -5,4 +5,5 @@
 \begin{itemize}
 \item \ref{drivernormative:Device Types / GPU Device / Device Operation / Device Operation: controlq}
 \item \ref{drivernormative:Device Types / GPU Device / Device Operation / Device Operation: controlq (3d)}
+\item \ref{drivernormative:Device Types / GPU Device / Device Operation / Device Operation: cursorq}
 \end{itemize}
