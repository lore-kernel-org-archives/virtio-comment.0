Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E8577F2F
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716303813; cv=none; b=u4GXbHs6xPc6sUcj5pknCwPkdHZwTEGjv4wZxH7BCJBsoc1gkZMEcY68ZAOLWD09m03v+Qk0MFjdo3QCjjO1PGC0NYDOXGaLwUNijM5uKQaGFqFrTb6gKNTeIKQ4Us2j1OqdfJa42j2uks5L5o6q21ebmtAzFN6x0MBx7G3U3XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716303813; c=relaxed/simple;
	bh=ORc/fRZlll+hbQcaMiJaj1Njm6AYQ312CfSfFvKFzHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W6/6LBY2k6WEAOwRzrJQPo1ypkGrhqgTL6T7LRxTwYq7hw+H3ErBvq8MWPWyiyFtHZLIGyI8cCZ3UG5B9YaJ0ac0sotD/RnNmmmMNWMFgt+8K/ODswxp7p88hASRgIYmBI+NF7kEGoIvPlWB+3FJenLxq9euGFwYBAPoJrohlq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HmCR1+AY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HmCR1+AY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716303811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=uhllqskYkZ/s1fb9Ge76OI21FU95CxniRcmJ9dZ2ieI=;
	b=HmCR1+AYCrZErcQ0fCpl7T10uio8jRgSV8lqoWfFrUeG2jK24GvLHvWV/RF+hSCgHr1FmO
	rQTX2SXB0PkKvBqAw5KG1jziFqsMZQdIK2266cNoS7L109fWpJGqqaaJKJukAS+Pm3ym57
	Kxk37cpXlm0oL5Yz7ZzavyHTuZoheUM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-MXqnMn4_NLu8VqH7BAKOyw-1; Tue, 21 May 2024 11:03:30 -0400
X-MC-Unique: MXqnMn4_NLu8VqH7BAKOyw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a55709e5254so2839466b.3
        for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 08:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716303809; x=1716908609;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhllqskYkZ/s1fb9Ge76OI21FU95CxniRcmJ9dZ2ieI=;
        b=b6dsMD0QehHqZDkpzK2xlVisTYY/QerTGOx1fItrkBvQ7HakZM+8R8eEdZ7ROIDqGu
         bKshUEGjjqEL7/H3cb2A2+6k38WYtNTgw8smdXXRn3p96etm+VvUh3ZNrs1I8PQth+re
         CjIKwv3d/rwbQWjcpJ1TSNjLQtrm9TwzI+pcULwXPKOXwHrbBGj7LXYwpIHRrkZC79jO
         /TqGhwDlfj4S77gbPTSBud5oktq8EP+pt7A1NI87r6t/vkVIMLfF61S63WlHNpGsCZH4
         Q3CNsdLCbntYOu/kTOuWvac0fw3k/pFmpg55L1LrhpXoCVJDvl976D8Ur8g07yJ4240/
         9iQw==
X-Gm-Message-State: AOJu0YxrWCBfqd8gx68DhQfcEBsDpfWsJfRWgznRjiJCJn8nnDsmBZ5v
	Gw4RR526M7tp54/wQRlo73x+NCTuOt61UDrj627pNaTfcdWYdTMH82VDncJ0bKIlp9WNpDB6sr9
	GNqha9SKxn+ojY5bbRfWwS4zQAIROnyXd1LYTh4T0n0yps83xirFlc0Q/acieCXIyDnwocontR5
	fSF6FbWxQAmrafMWM4us3dLQDoSK4+g5d5c8LWTnEXmya9mlUCLzw=
X-Received: by 2002:a17:906:365a:b0:a59:b4e8:d91b with SMTP id a640c23a62f3a-a5a2d57a376mr2119499766b.23.1716303808853;
        Tue, 21 May 2024 08:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc6hXdOxHLknnAyN54Vzq3ptze1SgjN6H89azPCzFMUNqLERpZ5zcLWp9WmlvpaGAE57wszA==
X-Received: by 2002:a17:906:365a:b0:a59:b4e8:d91b with SMTP id a640c23a62f3a-a5a2d57a376mr2119493266b.23.1716303807691;
        Tue, 21 May 2024 08:03:27 -0700 (PDT)
Received: from fedora (lmontsouris-659-1-55-176.w193-248.abo.wanadoo.fr. [193.248.58.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b177f0sm1616711066b.209.2024.05.21.08.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 08:03:27 -0700 (PDT)
Date: Tue, 21 May 2024 17:03:25 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: anton.yakovlev@opensynergy.com, mvaralar@redhat.com
Subject: [PATCH v1 Resend] virtio-sound: add latency_bytes definition
Message-ID: <Zky3vZU+P37H4VPb@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This commit aims at providing a better definition of latency_bytes. To
do so, this commit defines latency_bytes as is defined in Crosvm.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
Changelog:
v0 -> v1:
 * specify that the delay is due to the device implementation.
---
 device-types/sound/description.tex | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
index 54c9c8e..a138e5b 100644
--- a/device-types/sound/description.tex
+++ b/device-types/sound/description.tex
@@ -694,7 +694,10 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
 \begin{description}
 \item[\field{status}] contains VIRTIO_SND_S_OK if an operation is successful,
 and VIRTIO_SND_S_IO_ERR otherwise.
-\item[\field{latency_bytes}] indicates the current device latency.
+\item[\field{latency_bytes}] indicates the current additional delay caused by
+the device's implementation. For playback, this is the amount of bytes that
+must be consumed before the current request can be played. For capture, this is
+the latency in terms of bytes that the capture buffer was recorded.
 \end{description}
 
 Since all buffers in the queue (with one exception) should be of the size
-- 
2.41.0

