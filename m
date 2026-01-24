Received: from k57.kb8c70eb.use4.send.mailgun.net (k57.kb8c70eb.use4.send.mailgun.net [204.220.184.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7FF13957E
	for <virtio-comment@lists.linux.dev>; Sat, 24 Jan 2026 00:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.220.184.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769213886; cv=none; b=sMjivX8n/xNkcIg4FnVxQyEcp9dVvjsfQfEti6shMzWsP/gGD4wLKXbNal5ngKEY4kO4/MgyNXLBvxZOlyGAguChLG3uyWEjllhwxtG9qdYWQG/p701euak9XeAjX0TPlzcg5948tHGytsMNl+EgNAJ3Z/9StrrP8I3nqCJVY+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769213886; c=relaxed/simple;
	bh=fkjDHg5fU7Y8iO7keexwsqOut5TtuHTpncwdypVBTso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZeBoDLV1JaGhsvCyQJFpqVh3OHL1gojkGuVyRG992SPRbMrbEPzceNcQj/4civyFkyYUaL8VyGvcuW8A+vMul4m3mkckx3AHFvaMesy0aT7Mq2ru4Q14in45nSqFCYhLY/lyFrYshebBen2DWA2bV1OjoLoezRTdEpmUsW8YpOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yodel.dev; spf=pass smtp.mailfrom=yodel.dev; dkim=pass (2048-bit key) header.d=yodel.dev header.i=@yodel.dev header.b=BRT5Xidd; arc=none smtp.client-ip=204.220.184.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yodel.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yodel.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yodel.dev header.i=@yodel.dev header.b="BRT5Xidd"
X-Mailgun-Sid: WyI2Y2U4MiIsInZpcnRpby1jb21tZW50QGxpc3RzLmxpbnV4LmRldiIsIjk3NjA3ZSJd
Received: from mail.yodel.dev (mail.yodel.dev [35.209.39.246]) by
 c28334f172dfb2b7305e8c426211204d93762a3a63414144eaaf84002b0bfe9e with SMTP id
 69740fbb9cedc9a4219f7720; Sat, 24 Jan 2026 00:18:03 GMT
X-Mailgun-Sending-Ip: 204.220.184.57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yodel.dev;
	s=rsa2048; t=1769213883;
	bh=2BTP1kVTXjb/aRK1fA6nRq7NIGAZ8+HybiCS2eA1hSY=;
	h=X-Mailgun-Dkim:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From:Reply-to:Subject:Date:Message-id:To:
	 Cc:Mime-version:Content-type:Content-transfer-encoding:In-reply-to:
	 References;
	b=BRT5XiddNjB2DLnhPy9X1+N0a4CtPZEPC+usaByOklDvBjvjMnMJK7iU+4b8v5pij
	 GNL0XgUAjr2DjifPg+cOEuDsvE1+TpLhUQdS6NdRSwDHqipKrEaXP2JuT6JbHmZWBp
	 l4R2xspVTWP9cSrC/EMThsdD0LvCyIsZwnQPulA5WOV2FZfygTnMxvxzeCNp9jjtl0
	 LihxsAK5xrm4xZFQNtZ6hjbHrNPKTw8E5ORfeQTNzstJqRRctC1NwhmrbZrzazU0og
	 zouBK9BPsB5sMeqXv1HGMuJrAE7Q43XdAMHSeLcon0MrQLRgbYywxQZlLR7Mu/Bpab
	 q0Y5IEEC3gWfA==
X-Mailgun-Dkim: no
X-Mailgun-Dkim: no
From: Yodel Eldar <yodel.eldar@yodel.dev>
To: virtio-comment@lists.linux.dev
Cc: Yodel Eldar <yodel.eldar@yodel.dev>
Subject: [PATCH] packed-ring.tex: Add comma and remove redundancy to improve readability
Date: Fri, 23 Jan 2026 18:17:40 -0600
Message-ID: <20260124001740.34803-1-yodel.eldar@yodel.dev>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A comma after "set" separates the prepositional phrase from the main
clause where both the prepositional object and subject of the main
clause are long descriptor flags, thereby improving readability.

Also, the second "is" refers to the same subject as the first and is,
therefore, redundant. Eliminating it improves the flow of the sentence.

Signed-off-by: Yodel Eldar <yodel.eldar@yodel.dev>
---
 packed-ring.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/packed-ring.tex b/packed-ring.tex
index 3ee55a1..f0b0cdd 100644
--- a/packed-ring.tex
+++ b/packed-ring.tex
@@ -271,8 +271,8 @@ \subsection{Indirect Flag: Scatter-Gather Support}
 are reserved and are ignored by the device.
 Buffer ID is also reserved and is ignored by the device.
 
-In descriptors with VIRTQ_DESC_F_INDIRECT set VIRTQ_DESC_F_WRITE
-is reserved and is ignored by the device.
+In descriptors with VIRTQ_DESC_F_INDIRECT set, VIRTQ_DESC_F_WRITE
+is reserved and ignored by the device.
 
 \subsection{In-order use of descriptors}
 \label{sec:Packed Virtqueues / In-order use of descriptors}
-- 
2.52.0

