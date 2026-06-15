Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26EF3D5C07
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jun 2026 09:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514665; cv=none; b=s5Gz8VHrCvOB3SKfcheYK57HwOGdWELDt53nmBEfsq0HrO9uQ3qbmOcEa9qx7W3e8vfLZzjq1tDE/IeQLmJGUSz4Yi3D74/U1PfCHFfW5ZtANCms0XPXtEeTQ96NYZFLcKPg21Er00oau5kRQHC1EQTk6HzO+m4O0iNe45QucLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514665; c=relaxed/simple;
	bh=yyJpLBGEiW5qO7JmqRFAZ8Wup6OL4uFvubAJmukBAMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j/veBrvGN/ud0ueuz9lrlYRmv2lsPsXwmZB/acrGHNig9nsXjfLv+b9G7LLE4FvhrG1zWEQgegZhsK/8v6GRkxFu68h0ryjSbEHlD9PhLs7aV18BTuH6BkpxeoeIQQfg7FTqeRsiSnLLmOr3PBvQ8vToF6KG1Z4SBuRvdQ/KKNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=imxr5jK0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="imxr5jK0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FED6328D;
	Mon, 15 Jun 2026 02:10:56 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.37.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D6133F915;
	Mon, 15 Jun 2026 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781514660; bh=yyJpLBGEiW5qO7JmqRFAZ8Wup6OL4uFvubAJmukBAMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=imxr5jK0knqYaGe16p2G+ragfzr8zm9vd9ShvUJpqTkKzrlSNkOp3GTC0JsEnrI11
	 u9xN80PTy5FEhMbjuUpL91zxClqyIND2Zzd8CM/KKHSVWmMkJClMe+xTb04BtDYhfJ
	 r/+SzyDwAOo+hCwSBegntUj0Wrsyt0NRso+aYd30=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: virtio-comment@lists.linux.dev
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>,
	Bill Mills <bill.mills@linaro.org>
Subject: [PATCH v2 2/6] virtio-msg: Add the FF-A bus bibliography reference
Date: Mon, 15 Jun 2026 11:10:24 +0200
Message-ID: <d83fbd736249207386be22d1313ccf745592d190.1781514628.git.bertrand.marquis@arm.com>
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

Reference the Virtio Message Bus over FF-A specification through the
normative bibliography using a distinct FFA-BUS citation tag.

Attribute the DEN0153 document to Arm.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Bill Mills <bill.mills@linaro.org>
---
 introduction.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/introduction.tex b/introduction.tex
index 9a9cbde5fede..635e267cee04 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -92,6 +92,9 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:I2C}\textbf{[I2C]} &
 	I2C-bus specification and user manual,
 	\newline\url{https://www.nxp.com/docs/en/user-guide/UM10204.pdf}\\
+	\phantomsection\label{intro:FFA-BUS}\textbf{[FFA-BUS]} &
+	Arm, Virtio Message Bus over FF-A, DEN0153,
+	\newline\url{https://developer.arm.com/documentation/den0153/0101/}\\
 	\phantomsection\label{intro:SCMI}\textbf{[SCMI]} &
 	Arm System Control and Management Interface, DEN0056,
 	\newline\url{https://developer.arm.com/docs/den0056/c}, version C and any future revisions\\
@@ -350,4 +353,3 @@ \section{Constant Specifications}\label{sec:Constant Specifications}
 either VIRTIO_FLD_A or VIRTIO_FLD_B.
 
 \newpage
-
-- 
2.53.0

