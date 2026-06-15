Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37CA3AEB32
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jun 2026 09:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514670; cv=none; b=I1KNeyPXjvu41Exkgucs8Uyr6so1qPapthM6EjE5pspmgv0/1iqwfDjT3g3w4rT23oMKRA7+0vDh9aLcxEshp/URZiiQLQbuHS0443xamkD5QwI1WVBZtJbLJm3DoogVqNW46dm9MgY6Bx/LhTw3wv0v/cBfed9TfiJ96uKfmsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514670; c=relaxed/simple;
	bh=1U5lC0QKCoR52NS3dSVjopPybcGk1QjpUh6FwwhzCzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tzjrpFZIfIZh5s2QZV4WA+0kC8juwwstoIR/UNOGTXookos/EpvcdFolmvl1CbS+COKJC+JMTVLGRlI4+BG2j413IzEwDjmJFcMSquDrULA9mOLnJ9yrVEVCCMAKaJS6BjNA1TSEc4QK7tieHrj2qH+Mb1ruvoxrayotIi92spI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AKPJVEoX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AKPJVEoX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C73951BF3;
	Mon, 15 Jun 2026 02:11:00 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.37.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C76543F915;
	Mon, 15 Jun 2026 02:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781514665; bh=1U5lC0QKCoR52NS3dSVjopPybcGk1QjpUh6FwwhzCzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AKPJVEoXoL3KTUVuz4bjj47LJiJPjpWbPxwzZW8W6fcNI9vOM5EP7qUAA4uUq8rB3
	 /VJhQ+hx/E4XSjJj94WD6k2+tZa/v09Ry071DoTH67JMrEThHm3z8Ad91Wm9GTlo/L
	 n/uFv5IN+mkgNX9X+hOh5LexDmBMqYdPIXJnLglw=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: virtio-comment@lists.linux.dev
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>,
	Bill Mills <bill.mills@linaro.org>
Subject: [PATCH v2 4/6] virtio-msg: link virtio-msg content
Date: Mon, 15 Jun 2026 11:10:26 +0200
Message-ID: <c6c960231ef3610ab9e7e562950537f66a632157.1781514628.git.bertrand.marquis@arm.com>
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

Add the new transport layer into the content table

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Bill Mills <bill.mills@linaro.org>
---
 content.tex | 1 +
 1 file changed, 1 insertion(+)

diff --git a/content.tex b/content.tex
index 243ce2dde36b..79e99a5801b9 100644
--- a/content.tex
+++ b/content.tex
@@ -693,6 +693,7 @@ \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
 \input{transport-pci.tex}
 \input{transport-mmio.tex}
 \input{transport-ccw.tex}
+\input{transport-msg.tex}
 
 \chapter{Device Types}\label{sec:Device Types}
 
-- 
2.53.0

