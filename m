Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0712316D4E8
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186915; cv=none; b=FVhyq4p+2eFvqaNRjpmg4OhP7ZrOFgJPXGO+bxn3I85trJd/cBXEZJm8OWhQSIuat/Gz/xDbuNKY6YYWKq2u9bVZMhbVXpoupa7dBqLeh0Q2xmWAqJGBQN9OdcmpOrKZYfGpgU5+PaltFTXo10VAvTJb+UjFY67vcosI1hhgxX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186915; c=relaxed/simple;
	bh=iy+bTtiNYY5waTzhSu1gAnsO1+aURIOwtMvKBhDVhNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c7G3UwCnlwl97f1fCNF47hm/ghu5PCZhztA8j47jB8AOAGMPKrZoO4cciB7VtxRQKD+1KSHHDaXD5A1WcpPWAtf3x1k0zpR5WHmqAadbgvDJ3ARXxMv558eiGhXlMS/TtD+VIFCtbh7poVmY95BL6JTWo2/GaSgN9SoMecN77jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8FKs8Ae; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8FKs8Ae"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f4603237e0so585767b3a.0
        for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 03:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718186913; x=1718791713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PXdDDfwbLVBygEAXwllb6To1BERTMxPVBAwbCPA3X0=;
        b=M8FKs8Aeoa8QzK5g09iAjKrsZU/SL7RbPN6VNcBWGoYe6MgIHzMVHLSsPgzKIpXubD
         oY0St4eXOUkdfh7tpzVZ82uvY7OZTZDIXErOPH5p/9/0g4lIun9Helw920HdgauY1MHI
         emqtYAsjoozlxRD7APtSQFsyTmjK5qs9agGiH5ORWYSrD3ot9VBfB14uuqlTcZ2xOsKp
         ee9muUS9er9Gdp40zI041vwZ0Me2giKdFiUZfGwaO6nOUELCOHBJnd3l303zJSaeJFsY
         ru02B9SamwllYzIQswZkqAHwSJW7TVSzVMFcMfR+j5Gz4i0GN0ps4xc6N7Z8ELNpm2/E
         ZTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718186913; x=1718791713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PXdDDfwbLVBygEAXwllb6To1BERTMxPVBAwbCPA3X0=;
        b=sa4OukoTCT21YnhBBp8RIxm/mEYiU+pVPghk6YAGAcxhMwYitSB9xevT3M0T/OuiE6
         fCl6CPpqgFVH7rLwlsBojVZJp8JMBhTiMxBRt7P7Pdo/ekDdfjpEdv99efabjupcvLBN
         i75w80QBQxaKA4uRHG43j7I8uhP7s3DFheQD9Tu0TRHwHHfrQwLF1JvsbTJTOeHFma7X
         rHCX3f3r58maudmVGz2AymQhbRQG13br48FbReSo2b2IRh1OArZWRAXW6DVN35dNkHMu
         Y+k84SakcWJkFBxkdIS4eqKS/BkLeNdiukuFKtMWcTHeFZlk5T0E1Ou9ifGT+7UBxvmg
         5VPg==
X-Gm-Message-State: AOJu0YwjUGXUS/anvS7GtcG+a3IfMfV7uQt3M5ADRdHvtX42BA1/7A2E
	aLum21iuYlBljehC9lAYVqlEv1jEsF1xyt+mvzzcbDmq+R0vca8BGh/TSAFzBRcosw==
X-Google-Smtp-Source: AGHT+IEZTH6R3XpcfoIHpcAL6QjSQZuEPvDBelJ0t9tH1SrwxJZm3sqH9iz6XyXsfnU36j26usjl4Q==
X-Received: by 2002:a05:6a20:da9a:b0:1b5:977d:439 with SMTP id adf61e73a8af0-1b8a9b1ec74mr2695255637.5.1718186912990;
        Wed, 12 Jun 2024 03:08:32 -0700 (PDT)
Received: from devant.hz.ali.com ([47.89.83.81])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6f9af7662d7sm1195932a12.9.2024.06.12.03.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 03:08:32 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com,
	mst@redhat.com,
	fupan.lfp@antgroup.com
Cc: virtio-comment@lists.linux.dev,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: [RFC PATCH v2 2/2] virtio-vsock: Add an "index" field to the config
Date: Wed, 12 Jun 2024 18:07:44 +0800
Message-Id: <20240612100744.2443429-3-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240612100744.2443429-1-niuxuewei.nxw@antgroup.com>
References: <20240612100744.2443429-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds an "index" field to the `virtio_vsock_config`. The field is
required when the VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated.

(1) Do we really need the `index` instead of a `default_device`?

IMHO, the answer is yes.

The `index` is more generic than the `default_device`. It represents a sort
of priority, which might be used in the future. A possible case: If there
are two devices eligible to be selected, the priority will be one of
selection criteria.

From Stefano: This works very well with hotplung/hotunplug, since if we add
at runtime a device that is to become the default, we don't need to change
the configuration of the previous device.

(2) Why is the type of the `index` `le16`?

The type of `le16` supports up to 65536 devices, which is enough to cover
most cases.

v1 -> v2:
- Remove implementation details from commit message and documentation (Stefano).
- Rename the field from `order` to `index` (Stefano).
- Rewrite the introduction about the `index` field (Stefano).
- Add a case for sending message from the guest (Stefano).

Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
---
 device-types/vsock/description.tex | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
index 7e310f7..5d1fc5b 100644
--- a/device-types/vsock/description.tex
+++ b/device-types/vsock/description.tex
@@ -53,6 +53,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
 \begin{lstlisting}
 struct virtio_vsock_config {
 	le64 guest_cid;
+	le16 index;
 };
 \end{lstlisting}
 
@@ -78,11 +79,37 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
 \hline
 \end{tabular}
 
+The \field{index} field indicates index of a device, and is required
+while the VIRTIO_VSOCK_F_MULTI_DEVICES feature is negotiated. The device
+with the lowest index is considered as the default device.
+
+It is not required to specify a source CID explicitly when sending messages
+from the guest to its peer.
+
+\begin{enumerate}
+\item The VIRTIO_VSOCK_F_MULTI_DEVICES feature isn't negotiated: the source
+CID is set the CID of the only device in the guest.
+
+\item The VIRTIO_VSOCK_F_MULTI_DEVICES feature is negotiated: the source
+CID is set to the CID of the default device.
+\end{enumerate}
+
+The rules for \field{index} are:
+
+\begin{enumerate}
+\item It doesn't have to be continuous.
+
+\item It cannot have conflicts.
+\end{enumerate}
+
 \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
 
 \begin{enumerate}
 \item The guest's cid is read from \field{guest_cid}.
 
+\item The device's index is read from the \field{index} if the
+VIRTIO_VSOCK_F_MULTI_DEVICES feature is negotiated.
+
 \item Buffers are added to the event virtqueue to receive events from the device.
 
 \item Buffers are added to the rx virtqueue to start receiving packets.
-- 
2.34.1

