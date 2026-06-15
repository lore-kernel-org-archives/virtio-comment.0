Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AD93D3D1C
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jun 2026 09:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514673; cv=none; b=IiDLCufXBdE+ComJhuG3nEQ3bAYVM3WvTZ4pEqt0zz9NgAas2+dZrDTaCiupzm1jkY+MWxg9onR5GcLBH9ZvtUysc4wEf7SjfTjtlT5LJGgom7TkompKyHs8p9M2OmmxYu93JxkG6nzkOY11BHw+JW7dHXOfwDWs0Ic1J2g/tAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514673; c=relaxed/simple;
	bh=xVeZpTpm5egX0KeRI7uo6Oq0ijD2+ea0FxlCrZJ+2L8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S94zQi6gdnnVCX0utco+pdPutZGvEaZmyqHgX3kBwNhr/cZ0XzeoYCirxB5WxATDmHBdaXigvHpwfFrXSWNOYD44JSZ7FxbAeZmRAup4Dh9NAEpK9JPLIyiVmiYOCicHH2Vb987013XkCUA2WCgKJrS5mgO6UteDMaBBRB4QAQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VwbmXSb0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VwbmXSb0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAF3C328D;
	Mon, 15 Jun 2026 02:11:02 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.37.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E68203F915;
	Mon, 15 Jun 2026 02:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781514667; bh=xVeZpTpm5egX0KeRI7uo6Oq0ijD2+ea0FxlCrZJ+2L8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VwbmXSb0accj3hGjHxONVY3pVNcX+W3xeo4EPQuZOz0ZoGGbQMjgizMWg+xeng21p
	 JL9vM391fRfYK0IvfCUnPPEvRXhRKtb2uTUxJdH9Xn2YDuk3RTGkYCTIVA/+lRWg91
	 oRd4NzxsOU+gpk57TpKxo+h0ZFH7/I0yrmOfNuvA=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: virtio-comment@lists.linux.dev
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>,
	Bill Mills <bill.mills@linaro.org>
Subject: [PATCH v2 5/6] virtio-msg: add conformance entries in conformance chapter
Date: Mon, 15 Jun 2026 11:10:27 +0200
Message-ID: <ca492390940886dcd21d837b0c9e88e821920358.1781514628.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781514628.git.bertrand.marquis@arm.com>
References: <cover.1781514628.git.bertrand.marquis@arm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add entries for conformance of Virtio over Message for Driver, Device
and bus.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Bill Mills <bill.mills@linaro.org>
---
 conformance.tex | 97 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 2 deletions(-)

diff --git a/conformance.tex b/conformance.tex
index 9af31e2c0ff6..3955da42baca 100644
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
@@ -147,6 +148,37 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
 \end{itemize}
 
+\conformance{\subsection}{Virtio Over Messages Driver Conformance}\label{sec:Conformance / Driver Conformance / Virtio Over Messages Driver Conformance}
+
+A Virtio Over Messages driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Revisions / Driver Limits}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Versioning and Forward Compatibility / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Configuration Semantics Profiles / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Error Signaling / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Endianness / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Common Message Format / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Overview / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Device Information / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Device Features / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Finalizing Initialization / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Driver Notifications / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Device Notifications / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / Mandatory / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_DEVICE_INFO / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_DEVICE_FEATURES / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_DRIVER_FEATURES / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_CONFIG / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_CONFIG / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_DEVICE_STATUS / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_DEVICE_STATUS / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_VQUEUE / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_VQUEUE / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_RESET_VQUEUE / Driver}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_AVAIL / Driver}
+\end{itemize}
+
 \input{device-types/net/driver-conformance.tex}
 \input{device-types/blk/driver-conformance.tex}
 \input{device-types/console/driver-conformance.tex}
@@ -241,6 +273,34 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
 \end{itemize}
 
+\conformance{\subsection}{Virtio Over Messages Device Conformance}\label{sec:Conformance / Device Conformance / Virtio Over Messages Device Conformance}
+
+A Virtio Over Messages device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Revisions / Device Limits}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Versioning and Forward Compatibility / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Configuration Semantics Profiles / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Device Feature Blocks / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Error Signaling / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Endianness / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Common Message Format / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Ordering / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Device Features / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Finalizing Initialization / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Device Notifications / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / Mandatory / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_DEVICE_INFO / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_CONFIG / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_CONFIG / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_DEVICE_STATUS / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_DEVICE_STATUS / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_VQUEUE / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_VQUEUE / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_RESET_VQUEUE / Device}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_SHM / Device}
+\end{itemize}
+
 \input{device-types/net/device-conformance.tex}
 \input{device-types/blk/device-conformance.tex}
 \input{device-types/console/device-conformance.tex}
@@ -265,6 +325,39 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
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
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / Runtime Notifications / Bus}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Hotplug and Removal / Bus}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_AVAIL / Bus}
+\end{itemize}
+
+If a Virtio Over Messages bus implementation supports optional bus messages, it
+MUST also conform to the corresponding normative statements:
+
+\begin{itemize}
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Bus Messages / GET_DEVICES / Bus} (if BUS_MSG_GET_DEVICES is supported)
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Bus Messages / PING / Bus} (if BUS_MSG_PING is supported)
+\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Bus Messages / EVENT_DEVICE / Bus} (if BUS_MSG_EVENT_DEVICE is supported)
+\end{itemize}
+
 \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
 non-transitional, see \ref{intro:Legacy
-- 
2.53.0

