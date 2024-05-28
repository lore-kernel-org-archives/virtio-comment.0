Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F173EA83
	for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 05:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716875283; cv=none; b=SCfWJSi29XFw6sbkRWp1wzip8afvoxK4aSGiC6rAEHzvN4YyODSZDJFE8DPkqqtKI5p67hFxt90KCuvHQWFeUfj7qT5KMffhbgOw1QrkP060IlK404eN77SmKI9DzBLhOs0iCUjODtbGFMIptFZSs65u7Axvq40Z2bF+JNlNqbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716875283; c=relaxed/simple;
	bh=zRIYvKIZKLQInPBk48quYVrnSlEUlB/DhojLj1Uf17A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RGP/cDOgmjZoWxwuG5IPFIRkk6aBPT21t/8bYUnJtUYe6TGqatYG4J49dwe02LhAc8OW4E4m3APj+3iO57ovLUzxf367mWHqpKrEEBgIg+baSOJOh6Qbyj0mZAg4TGwFhqICuepiSLKXouvA5hqC/VZ/vMKaIJ4Ta7rJqsfPjtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwVgtb2q; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwVgtb2q"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6fcbd812b33so338887b3a.3
        for <virtio-comment@lists.linux.dev>; Mon, 27 May 2024 22:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716875281; x=1717480081; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BLdpBUWPKvhqHqvAGBQRbbtoRUz+rJkOzqDOV3ojiA=;
        b=EwVgtb2q561MP+vhefD5kUdmhBQconV3a7JKm5UXszautX32IkyueQAxNtGS2hy5rk
         o9UCixDXunng+fL2rvh1TxDtKLBtdBC+DhDpk3dNskQAFMwwOmt9CfBgb2LQOi8d+CDT
         2pTJrS44CZPdNA6C6fhWz0YcywvBzp5PXxSh9eJNW/Ko/4XQ7xzsxelYtcvvRe2rB2+M
         gEtfeJdTOSSAYIAVhzH/8oHBR5Q4jWf04IRNdQ7okvZTMZBQ83bdwZImZWp0jKoEHbyR
         RNFo95H0x7jKYlt/dlvFCjj/xqxDpCCgzP7JM94vcdPa6IXHlG5jz7zob1iScaPpTx5K
         r2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716875281; x=1717480081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BLdpBUWPKvhqHqvAGBQRbbtoRUz+rJkOzqDOV3ojiA=;
        b=nxB1V5RuKFst95Tmn1W63PIh35G+B6ubl2ZgQQtGuBXtdDYwdKg0AcvDrBxgn/pAdx
         PBQEUpjNBAF/bKC9N8pt5KF6BeYmL8bxb4UT+i/rxMa8fIdyva4+7/Pyhn6tRa/+kSfy
         LQTXfHOuCcdfuteVndpR0uNPuk1VEeHtCx++eyPRo8FSE+RExt1AjEqI4WAj0pX+USRs
         omlvTtnrV3Q/aenISJull7tO26Teyq/vWUOLm8wvmr4jdrq70X6LfBBqtBZFMOlCI+N9
         CtVGmF+2HeW2GsCI8OY45f+Av0h1TyGGMZrzUYQ5MR3XImTx3/qoBOJNNjr8VO+lPW9S
         jQig==
X-Gm-Message-State: AOJu0YwEGKjX917gLgaTp6n/EIFxqGwgHF4rROlZcL6j6QGx5KsbuBdo
	x6as7Few1XIs1KWyFdKlB80yhB7v3Jn23QrQjkXSOrtJEn4yDlM9
X-Google-Smtp-Source: AGHT+IG0RiGsHXq0HlLGWtbP4FFnOknsWNalIHRB308L8BKGdOGkXNuoyOsfoII4bctc4ZVWqc4rqQ==
X-Received: by 2002:a05:6a00:39a2:b0:6f8:fe77:8a0a with SMTP id d2e1a72fcca58-6f8fe778b79mr11168667b3a.32.1716875281534;
        Mon, 27 May 2024 22:48:01 -0700 (PDT)
Received: from devant.hz.ali.com ([47.89.83.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fbd3eb67sm5931570b3a.19.2024.05.27.22.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 22:48:01 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com,
	mst@redhat.com,
	hi@alyssa.is
Cc: virtio-comment@lists.linux.dev,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: [RFC PATCH 2/2] virtio-vsock: Extend the spec with an `order`
Date: Tue, 28 May 2024 13:47:25 +0800
Message-Id: <20240528054725.268173-3-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240528054725.268173-1-niuxuewei.nxw@antgroup.com>
References: <20240528054725.268173-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new field, named `order`, to the `virtio_vsock_config`.

There are two questions about the field that are valuable to discuss:

(1) Do we really need the `order` instead of a `default_device`?

IMHO, the answer is yes.

The `order` is more generic than the `default_device`. The device with the
lowest order is the default device. Moreover, the `order` field determines
the sequence of devices in the list. The device list is the same every time
the system starts.

The device with lower order means it is more important. Also, it means it
has more likely to be used. Those devices are placed in the front of the
list for performance purposes.

Last but not least, the `order` represents a sort of priority, which might
be used in the future. For example, assuming that if there are two devices
that are eligible to be used, the kernel will return a device with higher
priority.

(2) Why is the type of the `order` `le16`?

The maximum number of devices, in the implementation on the kernel, is 16
for performance reasons. The users could compile the kernel to support more
devices. The type of `le16` supports up to 65536 devices, which is enough
to cover most cases.

Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
---
 device-types/vsock/description.tex | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
index 3fbc02a..dc3bd66 100644
--- a/device-types/vsock/description.tex
+++ b/device-types/vsock/description.tex
@@ -58,6 +58,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
 \begin{lstlisting}
 struct virtio_vsock_config {
 	le64 guest_cid;
+	le16 order;
 };
 \end{lstlisting}
 
@@ -83,11 +84,26 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
 \hline
 \end{tabular}
 
+The \field{order} field is required while the multi-device feature is
+enabled. A list is used to organize devices. The field is used to determine
+the order of the device in the list. The device with the lowest order is
+the default one when no CID is specified.
+
+The rules are:
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
 
+\item The device's order is read from the \field{order}.
+
 \item Buffers are added to the event virtqueue to receive events from the device.
 
 \item Buffers are added to the rx virtqueue to start receiving packets.
-- 
2.34.1

