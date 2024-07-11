Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7191EEF8
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 19:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720724607; cv=none; b=DXqnpKW9G8cXBX6ZeinH3CJ32edutBf5QQy+XjjWNlho4MBWV25J2Sjh2Apjyg9ADAVoRbc0jLbTA5rO4x/jSjlKAaloNpMBK6SrdDs6SddqKOioBrsAjx8m4J8fekpNZ0673DTA39Jp8kKFm8pHxSUMjW+Nf7ea27JtNWZZsnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720724607; c=relaxed/simple;
	bh=Kanh6Zy0jvr3RTe7mOIYYe7zkVPlXP0K358YqhN48h4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R5OttNGMAH1V6BdqSI1Aj6GvPktDKgZP2EGZZ15nRdvAs2L9YGlCRZNKkJmnKBLfAOjeEv+WBDO52kZ/DiXVcHiFGI2bdps1eZxzpzEZz+ajlfOGnAx8wlNlnd3F+k6su/ZjIaU2RYE5itNUtCM7EZHL3veOUkBKgf4m4/Ks6lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DCbN12Fo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DCbN12Fo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720724604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=YsY+f+zz7tclHe6TyHiO/CEJL2auE+m8sJW1juMS384=;
	b=DCbN12FozuwD1LKmgXIZkSIlUNeS4eBvZeNlhoXYFULfIF05dl67xJJwcEuCuqvx/O5WqM
	Hdds6FP8U8qenc5sB9Xp9qF+PqHod8gpLAMg7S/kJX0jSinApgsl+P5PWs6g253chWnCrH
	9j1/0d6yiWrOg+FoiZ/Voq1RRynu4GI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-dUHZwNS5ML-oOXQPHPvA3w-1; Thu, 11 Jul 2024 15:03:23 -0400
X-MC-Unique: dUHZwNS5ML-oOXQPHPvA3w-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-36796a0687bso681169f8f.2
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 12:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720724601; x=1721329401;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsY+f+zz7tclHe6TyHiO/CEJL2auE+m8sJW1juMS384=;
        b=YTLtTRmd92oLwdT/tkwFbvh5WFjD2Gd0QZwuDFHR6ozpv7zWSE+8TwkUuazs5ah3/K
         yRd2qD5dqyAwI4n8fqfX1XOOX9Msu0ghM+uO51ynMjeLlLGXeR6eBrEenvYxP7MbAxUX
         pvHlqqN88wAFwT0zxK+ZDPHao17Bojt0VfF4JnnyOMZrX0OR3U/NNyr7+BHPIB2Oi3gT
         AMnoQE7A2QkG6Qhqmdut3lEMWpAY6SzZ7aQ5ta4lYvWjqs/RW4h2bor4IQMERH1n1DRw
         LPLNB6FIavuvuOQmeHBUzQokDyxcOn4psTdyF0MTjymBwhkQ60ceE9Vvau8rJMATBPU7
         d7Bg==
X-Gm-Message-State: AOJu0YySKcm26Hk5kpFxpUIStCgEC1Z0trsXMfqing5HT6LNPo7aiMA7
	2G0rSNvqgf1t8xiEgh+UqevtdKIzUl0XrKmUsxgqRf8K2Pr3OArBTbukbpSJ9N2bGrHvPzrcZDt
	m6L+0P7UND0DRUczgz91ynl3tBf2A9ZjJr6ntHT/VTc/c1EgtIim04kWfsFwe3dx3dgocw1WOpn
	DOzf6r60PRD5hAKjFWm5OQK4+uDymktWF64/+VTwKr7w==
X-Received: by 2002:a5d:53c8:0:b0:362:a01:5f1 with SMTP id ffacd0b85a97d-367ceadb075mr6018116f8f.70.1720724601461;
        Thu, 11 Jul 2024 12:03:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6nnqy38I1et8unv49i4ujXrNe6sVu/9fCuiU24Nrg24NajjU523QYIdp5s+SDlCDV7vx9zQ==
X-Received: by 2002:a5d:53c8:0:b0:362:a01:5f1 with SMTP id ffacd0b85a97d-367ceadb075mr6018099f8f.70.1720724600793;
        Thu, 11 Jul 2024 12:03:20 -0700 (PDT)
Received: from redhat.com ([2a02:14f:173:2166:83a4:d566:a055:a5a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367ebb77edasm4256969f8f.9.2024.07.11.12.03.19
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 12:03:20 -0700 (PDT)
Date: Thu, 11 Jul 2024 15:03:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH] can: drop a broken conformance link
Message-ID: <87a6c3c4463e9f304cdd5dd5fac2194a95a8bcd2.1720724591.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CAN device has a single device conformance section, drop
a link to a non-existent section, fixing a Latex error.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 device-types/can/device-conformance.tex | 1 -
 1 file changed, 1 deletion(-)

diff --git a/device-types/can/device-conformance.tex b/device-types/can/device-conformance.tex
index f944ffd..3725164 100644
--- a/device-types/can/device-conformance.tex
+++ b/device-types/can/device-conformance.tex
@@ -3,6 +3,5 @@
 A CAN device MUST conform to the following normative statements:
 
 \begin{itemize}
-\item \ref{devicenormative:Device Types / CAN Device / Feature bits}
 \item \ref{devicenormative:Device Types / CAN Device / Device Operation / CAN Message Transmission}
 \end{itemize}
-- 
MST

