Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5E83D45F2
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jun 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514661; cv=none; b=kCSNzrAGewEV6MNXpsezAgtcSkYHRIBTMG4AbJlV50t5Y0kSKgUXesszI38NzQA3QVeu8m81qF3FOgMEevOkORID8kj1VfIEdz8El6oiDqyboxOGCK4XwSwOoSv8hepqCp8dlfgKj1kMwS07Rv6X+x8A+n8bdh4/v3neugT64Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514661; c=relaxed/simple;
	bh=KL/rQ90wz4ihHRKzV7VlmDIkitLz/cjR0XMjV4luwtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bzIUIo7HWeMrGa5SC5o+xdNw8b7L9w39bmDQ+YF9p5Ry0XuAt/jSWmCgZFKek384xR9QkCptsH5Sz+MuF8lvQYGIAy5pzLDCPkDRRZ7+8/vAJU3SHBo/ckSbGkgXhaAtb/KSS4FuK2Ckn/KABvotLo9o94+x0hV0DX12TP46qh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tcJeL2uJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tcJeL2uJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19B3E1BF3;
	Mon, 15 Jun 2026 02:10:54 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.37.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22F913F915;
	Mon, 15 Jun 2026 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781514658; bh=KL/rQ90wz4ihHRKzV7VlmDIkitLz/cjR0XMjV4luwtY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tcJeL2uJzePrCXt0CENvtIZ+wt3reXNlOV7t9ekZxUGEiA/sIFZ7IFKrgukuItJnb
	 VIwclINE08H4uUWWFuh/bB43iySZBl7mId1R4DXwO6HVvARqbGvauyCDR9uwcF7tSE
	 u9v5bJL1oATiteFxl532eVtKwgEBCI1miEFAeK7M=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: virtio-comment@lists.linux.dev
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>,
	Bill Mills <bill.mills@linaro.org>
Subject: [PATCH v2 1/6] virtio-msg: add new command for bus normative
Date: Mon, 15 Jun 2026 11:10:23 +0200
Message-ID: <998059c704fffafbceb9804045b9ffe6cf7a64b2.1781514628.git.bertrand.marquis@arm.com>
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

Add a new command to have a standard way to define virtio-msg bus
normative statements.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Bill Mills <bill.mills@linaro.org>
---
 commands.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/commands.tex b/commands.tex
index 25ea8ee3bc78..122a97f89b10 100644
--- a/commands.tex
+++ b/commands.tex
@@ -7,9 +7,10 @@
 % How we format a field name
 \newcommand{\field}[1]{\emph{#1}}
 
-% Mark a normative section (driver or device)
+% Mark a normative section (driver, device, or bus)
 \newcommand{\drivernormative}[3]{#1{Driver Requirements: #2}\label{drivernormative:#3}}
 \newcommand{\devicenormative}[3]{#1{Device Requirements: #2}\label{devicenormative:#3}}
+\newcommand{\busnormative}[3]{#1{Bus Requirements: #2}\label{busnormative:#3}}
 \newcounter{clausecounter}
 \newcommand{\conformance}[2]{
 	\stepcounter{clausecounter}
-- 
2.53.0

