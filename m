Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19432E62C6
	for <virtio-comment@lists.linux.dev>; Mon, 26 Jan 2026 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445160; cv=none; b=Hl/t0IY68apdhTH0R2jiC4PnhJi8ZKzcAg53lDDOqT4fwJV1TG/yEa9lIs/5ux/wjM1VH2Rj+myMArTOwuh9i+fnIbaTTNrzyyvMU9JU6uTMyGqqQwI+13fQO5Krq0utueTSNKbiD6VW4XxTZ/CpM8y32lieePRrqVAySoR8ZXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445160; c=relaxed/simple;
	bh=Bqy/BZ3j945r+QSy4PATdJAg9zIHMLU3q1VFsr1kz84=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GYQfxpUQuTyM3+ZzCdkFPnWSTofZvAbnO94GGHB9EW9H3mSuN2gQedrSOYIEo9PbJ4L3uuVBSwcnbpULXa18cVi5LWDQpVfDxYpYyd+TS6R29gk4GEB76mQ5ihAprThp1HcvFH2ZUlqKFYgdKv4wmphaHnpVwzKXOZzx2SFvZO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xx0fE8Hf; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xx0fE8Hf"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c5320536bfso551055285a.1
        for <virtio-comment@lists.linux.dev>; Mon, 26 Jan 2026 08:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769445157; x=1770049957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5/S6ge3GVPZz1z7anHv22qBdPIR+ip1HDhLw0DLosk=;
        b=Xx0fE8HfO04yd/ArIuAH88SeLcI13D5p6iX30yTmHNa3Jw7xlz5eEt8GzubvLs7kja
         PeCe8D2qqqPYQrqekCynSK6EyQsiqsR0tZ56/HX9JUCHMirrm49zacDzmB9rVKsoQJgN
         QzcSRI0TzjNXDKo5Wx6NVRXhV0IPBw3BRnQ0JHHZqGkA+FrBPW2+K6xmsMEXL0WhsUHd
         I8GISK31QG7E4EPEUN6LEjDR7RmBXGJ4lPkk9YNbrURj5BfGFbWV/VaredE/uc+PsKw7
         UE6oEVkGB5ck48aGwSNq75AmiVFFNBYVh2iUDE/brinqoHWvLv/zS2LBzNrFZ+ZwbthE
         LPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769445157; x=1770049957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N5/S6ge3GVPZz1z7anHv22qBdPIR+ip1HDhLw0DLosk=;
        b=Wog2olob/eOsmmcxjqGOR4XTTPqf3FyuLEmbDKOki30TZJjiF4BNUvrrHiLXkyPTQr
         JTfFHJA02iEPctv8whUJXXr66OfsLkucvA96DlnRazdsx8UcE463l7xU4vYeyXyT+6g9
         X6NdZby5Hu823fZ1HXE38NPcWcQD/CyurPpme237mVf29xrTrdX+o3UbNugdy8vXYGC0
         bVSIk+e04DXM4ycJ2tExB+cenVqF1jhhdLkJ3IWZNSf1QEDFoMgF65vJDjag4xE26MaF
         LD36jPXOfqHgblVxAZQS6oGmN2L6m6pqSJmlJrbz62YQGHtJhvRhK9Lu4V82CGeSRZzC
         0EsA==
X-Gm-Message-State: AOJu0YwuZogJiihof9CEQHhYDf2sy5bhVM8KsW2xfkq9wRXRWg5oUbav
	mtytVsXhKw7uQOwcT6Cj39PiokymU3rHwkz9C8Wxga+x7+MEwi3Uzvh2EyVjk8CnJWDgVvgQf9+
	U1c9b
X-Gm-Gg: AZuq6aId+laPC6DrAGCEkMSumFwXoRUfvH1RWiQ/w+dUaJMxZ5dbMKV61oBAiltUhBh
	y5v1Oqug0XbBKArc/bm/gU1gFAXPZt0l7jQZCuxdZCBVvh9sWITptJTrBVuir3r4r5hsrSNT724
	TJtivtbE6tTMg967oGNjvg7ZQiWQySmkWcBwgtDqIZcPm1avBsm/Fk/Z50ioHJNqCLIaF5O9NUV
	7OzoYe4WDEsjdSFWG9x3jC8rfVKD1qgD2h3FxQEdP55MbnsqTeaCt0oaoMJtoHtUtoMhM1dgKKN
	AF1MkPJpz1ccQBANAhIMwgFk/Z+OwmPeFWL6Qpkgq9YKwo/CQqvBtSfffqvow5xlkyVlmlcWrqa
	EkWxg/uDDZ794NHAKneeTUW7iJwho78dRT/epwS1Tp+1jV60d3QOHEJ/H37d8P1hNi4UThre0F0
	kh1bonRUT7hRYHda6+AREB8y7rugZ7C/BileSvPIAmbmA+RRP2HCYm9LA=
X-Received: by 2002:a05:620a:2801:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8c6f96dd424mr607660885a.73.1769445157315;
        Mon, 26 Jan 2026 08:32:37 -0800 (PST)
Received: from rocky.home (pool-108-48-78-67.washdc.fios.verizon.net. [108.48.78.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e37d1d6dsm1042321285a.17.2026.01.26.08.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:32:36 -0800 (PST)
From: Bill Mills <bill.mills@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>,
	Bill Mills <bill.mills@linaro.org>
Subject: [PATCH v1 4/4] virtio-msg: add conformance entries in conformance chapter
Date: Mon, 26 Jan 2026 11:32:30 -0500
Message-Id: <20260126163230.1122685-5-bill.mills@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126163230.1122685-1-bill.mills@linaro.org>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bertrand Marquis <bertrand.marquis@arm.com>

Add entries for conformance of Virtio over Message for Driver, Device
and bus.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Bill Mills <bill.mills@linaro.org>
---
 conformance.tex | 105 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 103 insertions(+), 2 deletions(-)

diff --git a/conformance.tex b/conformance.tex
index 9af31e2..7d5d00f 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -14,7 +14,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item[Driver] A driver MUST conform to four conformance clauses:
   \begin{itemize}
     \item Clause \ref{sec:Conformance / Driver Conformance}.
-    \item One of clauses \ref{sec:Conformance / Driver Conformance / PCI Driver Conformance}, \ref{sec:Conformance / Driver Conformance / MMIO Driver Conformance} or \ref{sec:Conformance / Driver Conformance / Channel I/O Driver Conformance}.
+    \item One of clauses \ref{sec:Conformance / Driver Conformance / PCI Driver Conformance}, \ref{sec:Conformance / Driver Conformance / MMIO Driver Conformance}, \ref{sec:Conformance / Driver Conformance / Channel I/O Driver Conformance} or \ref{sec:Conformance / Driver Conformance / Virtio Over Messages Driver Conformance}.
     \item One of clauses
 \ref{sec:Conformance / Driver Conformance / Network Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / Block Driver Conformance},
@@ -45,7 +45,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item[Device] A device MUST conform to four conformance clauses:
   \begin{itemize}
     \item Clause \ref{sec:Conformance / Device Conformance}.
-    \item One of clauses \ref{sec:Conformance / Device Conformance / PCI Device Conformance}, \ref{sec:Conformance / Device Conformance / MMIO Device Conformance} or \ref{sec:Conformance / Device Conformance / Channel I/O Device Conformance}.
+    \item One of clauses \ref{sec:Conformance / Device Conformance / PCI Device Conformance}, \ref{sec:Conformance / Device Conformance / MMIO Device Conformance}, \ref{sec:Conformance / Device Conformance / Channel I/O Device Conformance} or \ref{sec:Conformance / Device Conformance / Virtio Over Messages Device Conformance}.
     \item One of clauses 
 \ref{sec:Conformance / Device Conformance / Network Device Conformance}, 
 \ref{sec:Conformance / Device Conformance / Block Device Conformance}, 
@@ -73,6 +73,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
   \end{itemize}
+\item[Bus] A bus implementation MUST conform to clause \ref{sec:Conformance / Bus Conformance / Virtio Over Messages Bus Conformance} when providing Virtio Over Messages.
 \end{description}
 
 \conformance{\section}{Driver Conformance}\label{sec:Conformance / Driver Conformance}
@@ -147,6 +148,42 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
 \end{itemize}
 
+\conformance{\subsection}{Virtio Over Messages Driver Conformance}\label{sec:Conformance / Driver Conformance / Virtio Over Messages Driver Conformance}
+
+A Virtio Over Messages driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Revisions / Driver Limits}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Versioning and Forward Compatibility / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Configuration Generation Count / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Endianness / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Common Message Format / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Overview / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Device Information / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Device Features / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Device Configuration / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Virtqueue Configuration / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Status Information / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Finalizing Initialization / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Driver Notifications / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Device Notifications / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Configuration Changes During Operation / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Virtqueue Changes During Operation / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Reset / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / Mandatory / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_DEVICE_INFO / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_DEVICE_FEATURES / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_DRIVER_FEATURES / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_CONFIG / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_CONFIG / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_DEVICE_STATUS / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_VQUEUE / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_RESET_VQUEUE / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_CONFIG / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_AVAIL / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_USED / Driver}
+\end{itemize}
+
 \input{device-types/net/driver-conformance.tex}
 \input{device-types/blk/driver-conformance.tex}
 \input{device-types/console/driver-conformance.tex}
@@ -241,6 +278,43 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
 \end{itemize}
 
+\conformance{\subsection}{Virtio Over Messages Device Conformance}\label{sec:Conformance / Device Conformance / Virtio Over Messages Device Conformance}
+
+A Virtio Over Messages device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Revisions / Device Limits}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Versioning and Forward Compatibility / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Configuration Generation Count / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Feature Blocks / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Error Signaling / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Endianness / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Common Message Format / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Device Features / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Device Configuration / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Virtqueue Configuration / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Status Information / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Finalizing Initialization / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Device Notifications / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Configuration Changes During Operation / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Virtqueue Changes During Operation / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Reset / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / Mandatory / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_DEVICE_INFO / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_DEVICE_FEATURES / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_DRIVER_FEATURES / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_CONFIG / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_CONFIG / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_DEVICE_STATUS / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_DEVICE_STATUS / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_VQUEUE / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_VQUEUE / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_RESET_VQUEUE / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_SHM / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_CONFIG / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_USED / Device}
+\end{itemize}
+
 \input{device-types/net/device-conformance.tex}
 \input{device-types/blk/device-conformance.tex}
 \input{device-types/console/device-conformance.tex}
@@ -265,6 +339,33 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/media/device-conformance.tex}
 \input{device-types/rtc/device-conformance.tex}
 
+\conformance{\section}{Bus Conformance}\label{sec:Conformance / Bus Conformance}
+
+A bus implementation MUST conform to the relevant bus normative statements.
+
+\conformance{\subsection}{Virtio Over Messages Bus Conformance}\label{sec:Conformance / Bus Conformance / Virtio Over Messages Bus Conformance}
+
+A Virtio Over Messages bus implementation MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Relationship between bus and transport / Bus Messages}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Relationship between bus and transport / Transport Message Forwarding}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Revisions / Advertising Transport Parameters}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Revisions / Message Size}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Versioning and Forward Compatibility / Bus}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Device Numbers / Assignment}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Error Signaling / Bus}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Common Message Format / Bus}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Ordering / Bus}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Device Discovery / Bus}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Driver Notifications / Bus}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Device Notifications / Bus}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Hotplug and Removal / Bus}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_AVAIL / Bus}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Bus Messages / GET_DEVICES / Bus}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Bus Messages / PING / Bus}
+\end{itemize}
+
 \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
 non-transitional, see \ref{intro:Legacy
-- 
2.34.1

