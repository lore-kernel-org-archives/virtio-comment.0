Received: from k57.kb8c70eb.use4.send.mailgun.net (k57.kb8c70eb.use4.send.mailgun.net [204.220.184.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AF8218AAF
	for <virtio-comment@lists.linux.dev>; Sat, 24 Jan 2026 04:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.220.184.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769230415; cv=none; b=g9NBmRbu12/eraVFFyeSE6jsorDidEFZM2V5+GrqoBRxDMP4TAWrtH1uq+BQzokAhzBV6p3OfES71L0LJtaC84538wDvZeNv1eNOvMLCYFkW+RSNd77moE6ccXb0KiDspbqdUFWXWtlOxyrmqMRMPOgcL8GatH8eAy33Xgqb4BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769230415; c=relaxed/simple;
	bh=1/yfc1GJl097iLdgzttZjDcTmkUxf+uxQAoRTbYPdeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fhxmymx+AlMzIo90JvRuRslGOMB+kjwnl2uc+7DzKcx4ex3B0OvWtL3oB4c5mXD4FVFhFAc/GrpisuKlM4pSECNApx17ARzT3L25njTm/DssKD0uGvmctVKcvID6JfdTHBaWtDlDggVKKQ77zsBPsA1gDjNcG0NbGPlfxKeW1dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yodel.dev; spf=pass smtp.mailfrom=yodel.dev; dkim=pass (2048-bit key) header.d=yodel.dev header.i=@yodel.dev header.b=KTLwctdf; arc=none smtp.client-ip=204.220.184.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yodel.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yodel.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yodel.dev header.i=@yodel.dev header.b="KTLwctdf"
X-Mailgun-Sid: WyI2Y2U4MiIsInZpcnRpby1jb21tZW50QGxpc3RzLmxpbnV4LmRldiIsIjk3NjA3ZSJd
Received: from mail.yodel.dev (mail.yodel.dev [35.209.39.246]) by
 c00faf5081a5e8ee9c8cea6e4278783c047f120d0971b52ec5e35c2c3c495551 with SMTP id
 6974504d586fde70340e90a0; Sat, 24 Jan 2026 04:53:33 GMT
X-Mailgun-Sending-Ip: 204.220.184.57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yodel.dev;
	s=rsa2048; t=1769230412;
	bh=fJ8z4mme4soXsshHVzjE6rYYb7Zme/4iEWgJXe8B1II=;
	h=X-Mailgun-Dkim:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From:Reply-to:Subject:Date:Message-id:To:
	 Cc:Mime-version:Content-type:Content-transfer-encoding:In-reply-to:
	 References;
	b=KTLwctdf7oq3tJeB582PDxUy5U+P/hDVJ9NaYFydNktNFmYl8yLmB84XIspyo9x5j
	 mMIzDZ0/cYN2S92FoTkiQ4+X0AOz/nzzZABb8/YEEI5jUQ/VPSoqhApdoLAEwyH7x2
	 3pLl9mJKRr7VPPkrk4x+siHkqALfsDtaVdZJAeOznCAs+IaTyJoDXB9KKcHkj6ZBvP
	 n4BzB9Hh1EV2+lxDhwp51+/w03nzcah90Nm11V5awOQ86TsAicyMq7OJU+dcP2Wm/L
	 A9PFeITG414CVa2Sg2ydaQQbdqr/NoL/JFe1jNyn6jsWXLCUHaSGJjMb0GPOwtTqi4
	 ejA4tqUBRsgiQ==
X-Mailgun-Dkim: no
X-Mailgun-Dkim: no
From: Yodel Eldar <yodel.eldar@yodel.dev>
To: virtio-comment@lists.linux.dev
Cc: Yodel Eldar <yodel.eldar@yodel.dev>
Subject: [PATCH] packed-ring.tex: Fix Change Event Wrap Counter description
Date: Fri, 23 Jan 2026 22:53:25 -0600
Message-ID: <20260124045325.111454-1-yodel.eldar@yodel.dev>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The description for the Descriptor Ring Change Event Wrap Counter in
section 2.8.10, Driver and Device Event Suppression, incorrectly
restates the description for the Change Event Offset; instead, refer
to it as a single-bit wrap counter.

Signed-off-by: Yodel Eldar <yodel.eldar@yodel.dev>
---
 packed-ring.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/packed-ring.tex b/packed-ring.tex
index 3ee55a1..d53818a 100644
--- a/packed-ring.tex
+++ b/packed-ring.tex
@@ -346,8 +346,8 @@ \subsection{Driver and Device Event Suppression}
 size). Event will only trigger when this descriptor is
 made available/used respectively.
 \item [Descriptor Ring Change Event Wrap Counter] If Event Flags set to descriptor
-specific event: offset within the ring (in units of descriptor
-size). Event will only trigger when Ring Wrap Counter
+specific event: single-bit wrap counter.
+Event will only trigger when Ring Wrap Counter
 matches this value and a descriptor is
 made available/used respectively.
 \end{description}
-- 
2.52.0

