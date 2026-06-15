Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F223CF206
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jun 2026 09:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514674; cv=none; b=BOGvs5w2YiTpFh9vQ4Q7VkZLYawP+YtTtiyf69/Lx/DxoTj60unl9OFHEWH4DzwP/2EM4D/Tv3OtEzrA3Mvce2laGomfbGlsToFGfLIbzMVLjfVu+EOWikOcMXsNZcaI0VWR8tocZotopz9tdS09mV1lYQWNN+XgTVf9iRu7gM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514674; c=relaxed/simple;
	bh=T6K/9mzVmrnxA5yVt5ceO8G5Ag60Ad77r14MC95SvCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mrRVN0KZpwxkRt/+ilZfCC7ZfDlKLaOpWcSPL4Dorne6IoGkJhJtqGZG1DW3jOX8ZUvW/H9XVGybJwPN1km3wS3Km6mqyxfCWoSmRe9H38afv4x544PY7oz5w6/TPjnMsXQMXQBNn3VKN47SeURT6tzO6iS4Hvh7z3DfsMf+iL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=X6Q2unqJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="X6Q2unqJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F41093295;
	Mon, 15 Jun 2026 02:11:04 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.37.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04DA43F915;
	Mon, 15 Jun 2026 02:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781514669; bh=T6K/9mzVmrnxA5yVt5ceO8G5Ag60Ad77r14MC95SvCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X6Q2unqJpfxZhPvT+V92rCdYnko/weS2V0+WdeK9avXup0scghCtuI6djuf1FebtM
	 wD2UkN/c3kf0p7xSD5hpdBWUzNwH2DuVfObsu3p6zPvxvvS29h3FUIghzHQHM2ha8X
	 COpMnIr2kOSPYZaOK1xVErpY1sRenPSwmHa1rRnA=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: virtio-comment@lists.linux.dev
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>,
	Bill Mills <bill.mills@linaro.org>
Subject: [PATCH v2 6/6] virtio-msg: add message transport to core references
Date: Mon, 15 Jun 2026 11:10:28 +0200
Message-ID: <a5fde8f90fc6e8bcd05361359b0c0de8472feef7.1781514628.git.bertrand.marquis@arm.com>
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

The Virtio Over Messages transport is added by this series, so the
transport-neutral parts of the specification need to refer to it
alongside the existing PCI, MMIO, and Channel I/O transports.

Update the basic device facilities chapter to include Virtio Over
Messages in the list of bus-specific transport sections. Extend the
VIRTIO_F_ADMIN_VQ text to describe how message-based devices expose
administration virtqueues through transport-provided device information.

Update the introduction to describe message-based transports as one of
the virtio transport classes.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Bill Mills <bill.mills@linaro.org>
---
 content.tex      | 17 ++++++++++++-----
 introduction.tex |  2 +-
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/content.tex b/content.tex
index 79e99a5801b9..0bcbeb50c965 100644
--- a/content.tex
+++ b/content.tex
@@ -2,7 +2,9 @@ \chapter{Basic Facilities of a Virtio Device}\label{sec:Basic Facilities of a Vi
 
 A virtio device is discovered and identified by a bus-specific method
 (see the bus specific sections: \ref{sec:Virtio Transport Options / Virtio Over PCI Bus}~\nameref{sec:Virtio Transport Options / Virtio Over PCI Bus},
-\ref{sec:Virtio Transport Options / Virtio Over MMIO}~\nameref{sec:Virtio Transport Options / Virtio Over MMIO} and \ref{sec:Virtio Transport Options / Virtio Over Channel I/O}~\nameref{sec:Virtio Transport Options / Virtio Over Channel I/O}).  Each
+\ref{sec:Virtio Transport Options / Virtio Over MMIO}~\nameref{sec:Virtio Transport Options / Virtio Over MMIO},
+\ref{sec:Virtio Transport Options / Virtio Over Channel I/O}~\nameref{sec:Virtio Transport Options / Virtio Over Channel I/O}
+and \ref{sec:Virtio Transport Options / Virtio Over Messages}~\nameref{sec:Virtio Transport Options / Virtio Over Messages}). Each
 device consists of the following parts:
 
 \begin{itemize}
@@ -933,11 +935,16 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
   \item[VIRTIO_F_ADMIN_VQ(41)] This feature indicates that the device exposes one or more
   administration virtqueues.
-  At the moment this feature is only supported for devices using
-  \ref{sec:Virtio Transport Options / Virtio Over PCI
+  Devices using \ref{sec:Virtio Transport Options / Virtio Over PCI
 	  Bus}~\nameref{sec:Virtio Transport Options / Virtio Over PCI Bus}
-	  as the transport and is reserved for future use for
-	  devices using other transports (see
+	  expose administration virtqueues using the transport-specific
+	  fields defined by that transport. Devices using
+	  \ref{sec:Virtio Transport Options / Virtio Over Messages}~\nameref{sec:Virtio Transport Options / Virtio Over Messages}
+	  expose administration virtqueues through the device information
+	  reported by that transport.
+
+  For devices using other transports, this feature is reserved for
+	  future use (see
 	  \ref{drivernormative:Basic Facilities of a Virtio Device / Feature Bits}
 	and
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
diff --git a/introduction.tex b/introduction.tex
index 635e267cee04..8795cf389477 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -20,7 +20,7 @@ \chapter{Introduction}
 \item[Standard:] Virtio makes no assumptions about the environment in which
   it operates, beyond supporting the bus to which device is attached.
   In this specification, virtio
-  devices are implemented over MMIO, Channel I/O and PCI bus transports
+  devices are implemented over MMIO, Channel I/O, PCI bus, and message-based transports
 \footnote{The Linux implementation further separates the virtio
 transport code from the specific virtio drivers: these drivers are shared
 between different transports.
-- 
2.53.0

