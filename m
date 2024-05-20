Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F62364D6
	for <virtio-comment@lists.linux.dev>; Mon, 20 May 2024 09:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716197388; cv=none; b=iE/UQaQ5dt+4qEX4o9LgUZMylrKODf/mrmS0MJQKpg6PUke/XVaHTebM1cH0h9RLn8Xurbp+WVqna5DVuHyZ6K+NCT3+FCEJNBz9SUV5COZIJ6k7sbVlge6OBTEvnCUtGAf1UEBV4s73wJt9QHwE95t4HrPUWIgTxjNmJY49SEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716197388; c=relaxed/simple;
	bh=7ctcgPh15jjSCGoZki0JEOj3XUWS5LIlzI1E4luHZY8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=HDtAGIcWtAXtD1Wd5HrbEIxurDT94KFo3oDPo1Hk+dCFVsuhrla+2GjVLoCrkfirOWwe1qYWmk28HJW6726WNquzzrg+h7VqWKp3BPcqWtZeRXgsG3tjVYZoBL+Kcw/QryZ0SFu7ERLdX9/x9JJ8rLWG36fL7cjtBO+yO6WyEvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G7ickD81; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G7ickD81"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6f1239a2e83so1318986a34.3
        for <virtio-comment@lists.linux.dev>; Mon, 20 May 2024 02:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716197385; x=1716802185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2GKgbFqqGJPcT/JmvLIyjTk8WBY1efHY0YB4KJ2vnDk=;
        b=G7ickD81CX615jvsjXF0MoOB7XIjbG8x/mLmUaXhpfWgKp5e3JNt8Nbqoj9EuJ5I9n
         9Vj/2of166vYoqtVR0XqE1xynD4WPJIBFQE4qnNY5BWZ7IT1mQCVQiJCoe+7zPtLVCIq
         ECngzcVpFD+6RmedbRQOsoyk+eOQbznCItqOxswKTCB0xQ08leS5/bYS1JPDvatxylwY
         zZHVDEqlCysst2lSSgMj1hU6bBKascFNjrgDLR8l2H/cSKJKMdlIjDSqvnRl8/T7GMIH
         s8LRFrk6Szm8UZXznABofC8ERkxwA137bG7YEHneubkhU+9IUOtRu86NQjBNW0g94BbP
         97YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716197385; x=1716802185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GKgbFqqGJPcT/JmvLIyjTk8WBY1efHY0YB4KJ2vnDk=;
        b=R1NTkEgG3fHZidJ1dDaR7vN71M1/uCwbprRZKt6WEDLBIiqZ+VIbUqJrPu16QBVL0D
         VBHzSRvNrjBesf+e5i8OQSkVGQXRjyIxcyA/dILozuY6lBbkJWCvrBIZVOdlpNz07uyW
         HCdLwfMaS0+nrsojkZ/7X7lzmhkqiNkoiX4s5aACS2a/wVj7n0cX2MRd94IgszWE74PA
         1SjGQlaHVrysTs0fitjPpDHNpEpvT6tJ98zj2df5eFT2RJlCsj39+jarXrYqIsrBtyf8
         I43FLuPf3VlWmek9WLDfqmfJ6YHZgsjwT5nHyqBFotoutxG3ikfPo9WJW8mA2yRrVExK
         IVjw==
X-Gm-Message-State: AOJu0Ywy4Ney2M7DI9vTFNNsIfHL0PWzGkeuvpviME5e8SYhxPv1oUtc
	xxJQ0yGoBLdAwNlL2rcLItrgwFx5+p5AW1/pVSlLm5bhWDTI0ZklVDvV8v6vdZp1tBEl4wgVHxf
	i
X-Google-Smtp-Source: AGHT+IEElCMvpUMXJVxl+nEnCx7mTgQuupenCOvsZLzIQGoeZY6teHCmqYpqB21sjAjnOLx2TrCWUA==
X-Received: by 2002:a05:6830:1d76:b0:6f1:2ff2:d89b with SMTP id 46e09a7af769-6f12ff2da75mr14441715a34.21.1716197384958;
        Mon, 20 May 2024 02:29:44 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6340a6327fcsm18738958a12.14.2024.05.20.02.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 02:29:44 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: virtio-comment@lists.linux.dev,
	virtio-dev@lists.linux.dev
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH V3 Resend] virtio-transport: Clarify requirements
Date: Mon, 20 May 2024 14:59:40 +0530
Message-Id: <3543c631e29d35a667ca9d9e912d1a6db1feb0ce.1716197180.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The virtio documentation currently doesn't define any generic
requirements that are applicable to all transports. They can be useful
while adding support for a new transport.

This commit tries to define the same.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2->V3:
- Minor fixes.
- Added Reviewed by from Alex.

V1->V2:
- Lot of changes after discussions with Alex and Cornelia.
- Almost a rewrite of the first commit.
- Add Transport normative sections.

 commands.tex    |  3 +-
 conformance.tex | 14 +++++++++
 content.tex     | 78 +++++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 92 insertions(+), 3 deletions(-)

diff --git a/commands.tex b/commands.tex
index 25ea8ee3bc78..b64b14424bd2 100644
--- a/commands.tex
+++ b/commands.tex
@@ -7,7 +7,8 @@
 % How we format a field name
 \newcommand{\field}[1]{\emph{#1}}
 
-% Mark a normative section (driver or device)
+% Mark a normative section (driver or device, or transport)
+\newcommand{\transportnormative}[3]{#1{Transport Requirements: #2}\label{transportnormative:#3}}
 \newcommand{\drivernormative}[3]{#1{Driver Requirements: #2}\label{drivernormative:#3}}
 \newcommand{\devicenormative}[3]{#1{Device Requirements: #2}\label{devicenormative:#3}}
 \newcounter{clausecounter}
diff --git a/conformance.tex b/conformance.tex
index dc00e84e75ae..4a873169ce63 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -11,6 +11,10 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 
 Conformance targets:
 \begin{description}
+\item[Transport] A transport MUST conform to one conformance clauses:
+  \begin{itemize}
+    \item Clause \ref{sec:Conformance / Transport Conformance}.
+  \end{itemize}
 \item[Driver] A driver MUST conform to four conformance clauses:
   \begin{itemize}
     \item Clause \ref{sec:Conformance / Driver Conformance}.
@@ -66,6 +70,14 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
   \end{itemize}
 \end{description}
 
+\conformance{\section}{Transport Conformance}\label{sec:Conformance / Transport Conformance}
+
+A transport MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{transportnormative:Virtio Transport Options / Virtio Transport Requirements}
+\end{itemize}
+
 \conformance{\section}{Driver Conformance}\label{sec:Conformance / Driver Conformance}
 
 A driver MUST conform to the following normative statements:
@@ -93,6 +105,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Packed Virtqueues / Supplying Buffers to The Device / Sending Available Buffer Notifications}
 \item \ref{drivernormative:General Initialization And Device Operation / Device Initialization}
 \item \ref{drivernormative:General Initialization And Device Operation / Device Cleanup}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Transport Requirements}
 \item \ref{drivernormative:Reserved Feature Bits}
 \end{itemize}
 
@@ -172,6 +185,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Packed Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Packed Virtqueues / Scatter-Gather Support}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Shared Memory Regions}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Transport Requirements}
 \item \ref{devicenormative:Reserved Feature Bits}
 \end{itemize}
 
diff --git a/content.tex b/content.tex
index 0a62dce5f65f..a79993b5ed69 100644
--- a/content.tex
+++ b/content.tex
@@ -631,8 +631,82 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
 
 \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
 
-Virtio can use various different buses, thus the standard is split
-into virtio general and bus-specific sections.
+Devices and drivers can use different transport methods to enable
+interaction, for example PCI, MMIO, or Channel I/O. The transport
+methods define various aspects of the communication between the device
+and the driver, like device discovery, exchanging capabilities,
+interrupt handling, data transfer, etc. For example, in a host/guest
+architecture, the host might expose a device to the guest on a PCI bus,
+and the guest will use a PCI-specific driver to interact with it.
+
+The standard is split into sections describing general virtio
+implementation and transport-specific sections.
+
+\section{Virtio Transport Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements}
+
+\transportnormative{\subsection}{Virtio Transport Requirements}{Virtio Transport Options / Virtio Transport Requirements}
+The transport MUST provide a mechanism for the driver to discover the
+device.
+
+The transport MUST provide a mechanism for the driver to identify the
+device type.
+
+The transport MUST provide a mechanism for communicating virtqueue
+configurations between the device and the driver.
+
+The transport MUST allow multiple virtqueues per device. The number of
+virtqueues for a pair of device-driver are governed by the individual
+device protocol.
+
+The transport MUST provide a mechanism that the device and the driver
+use to access memory for implementing virtqueues.
+
+The transport MUST provide a mechanism for the device to notify the
+driver and a mechanism for the driver to notify the device, for example
+regarding availability of a buffer on the virtqueue.
+
+The transport MAY provide a mechanism for the driver to initiate a
+reset of the virtqueues and device.
+
+The transport SHOULD provide a mechanism for the driver to read the
+device status. The transport MUST provide a mechanism for the driver to
+change the device status.
+
+The transport MUST provide a mechanism to implement config space between
+the device and the driver.
+
+\devicenormative{\subsection}{Virtio Transport Requirements}{Virtio Transport Options / Virtio Transport Requirements}
+
+The device MUST keep any data associated with a device-initiated
+transaction accessible to the driver until the driver acknowledges the
+transaction to be complete.
+
+The device MUST NOT access the contents of a virtqueue before the
+driver notifies, in a transport defined way, the device that the
+virtqueue is ready to be accessed.
+
+The device MUST NOT access or modify buffers on a virtqueue after it has
+notified the driver about their availability.
+
+The device MUST reset the virtqueues if requested by the driver, in a
+transport defined way, if the transport provides such a method.
+
+\drivernormative{\subsection}{Virtio Transport Requirements}{Virtio Transport Options / Virtio Transport Requirements}
+
+The driver MUST acknowledge device notifications, as mandated by the
+transport.
+
+The driver MUST NOT access virtqueue contents before the device notifies
+about the readiness of the same.
+
+The driver MUST NOT access buffers, after it has added them to the
+virtqueue and notified the device about their availability. The driver
+MAY access them after the device has processed them and notified the
+driver of their availability, in a transport defined way.
+
+The driver MAY ask the device to reset the virtqueues if, for example,
+the driver times out waiting for a notification from the device for a
+previously queued request.
 
 \input{transport-pci.tex}
 \input{transport-mmio.tex}
-- 
2.31.1.272.g89b43f80a514

