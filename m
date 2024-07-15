Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D95F175AE
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 16:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721062196; cv=none; b=j89avKzml2jihKfqzUieTUXkVqMH5fYmt5Ek4MYY7ICSE/kg21y30lPHMyGoCrgIpRNgONW72YprzcZ6VNmqU17nTnuEuTEizb7Zbh5+gLoz3A2EHFJWKW+X42Ft42WanwT8rMAbRtspUXY5eyqArct0dg7wvSzRdT/P1QiJiDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721062196; c=relaxed/simple;
	bh=qE7CGmmKc7cI5Vfkqo096iDppabFJABT3P4kBM31ZdQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=I9lq/s0zR/xoCT+VOFoKQbrJcYCnWuwPARFznWduwWjEjlxV1VCiOg75lup7IL3b6HBXGUXa17cHX3d5Yc9u5JOWEuK67jyPj0CW48lmFqDIdd5VYLwdm2uTM0ix7p2WleiRUd0/HrZvXvRMLaLgmgHRGrqcQrd3y8B13ghyP6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UYcDmCfN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UYcDmCfN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721062193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Um5hyq6n/oQwZs+0Bn60Nh7O2zO/4S04VgaFAch2Yd8=;
	b=UYcDmCfN5yZJU4RoahNtSK4Qli8jHZswZErzN9rr4Wora7j/aF7iK8TlnaaLWeGUtnP4nW
	D52bLwG/jo+E6PUXLqgWOAsk5PI5m/rR5M2Os+k0QqFKnUW3JZh0ZcbDhFuyViD6asajdU
	S6u4Q/bOMiPPjD3VchyEzfPhjOOvSbo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-WvWNjTvfPRSh-ytzA3VG-A-1; Mon, 15 Jul 2024 12:49:52 -0400
X-MC-Unique: WvWNjTvfPRSh-ytzA3VG-A-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42671a6fb9dso29223765e9.3
        for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 09:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721062190; x=1721666990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um5hyq6n/oQwZs+0Bn60Nh7O2zO/4S04VgaFAch2Yd8=;
        b=lGmrImatewMUcCEktd7V6I+H2HGG7+sp5L0YeqIR+Y4+CixaY6tFVYRGYVE2/8UFwB
         WQWYnGu59HY8ZDVJc/tW18rnM75yWXNQ381ufvatOLqfZCNTKdpzk49/imslMM1rguO0
         tS2WLIhvwvAmXci9C+p4Fc697uz+cPF0Fvg6UILHFySduXJPp7tAZmMGIALooUGKV7g3
         FTtzYF6m3Xep0+lbcqF1SyCVcDZ8QHiDDJjqVpx7fp8w9TXH9+15FG8w77Yy/eR0mt3W
         GkaZF+K6CZtQcEpG5mMrwdsWrbyxN9EVqrIJX7GMIsPX0M1PbZLvponS4AybLsjPkiEK
         KAFQ==
X-Gm-Message-State: AOJu0Yz1GyRERd546+6fbwKAZJp0/Xqv5Ksv+w5xh78cMLjbHVw7MipZ
	2nPlHfIzuaH+R6CwJ6kRwTLZoTHsK14aPPBLo+l8ix8aKlKJx0L47+g12PHpvH0/LIiVy4je6qc
	GTpmwH8SzaVDY8eNqnMDJg62fcP30noR6iTSI6Oyp6obFT/j0NLDY/JYYkwAQ2KdqS1ZIhYsJB0
	OR2dGQuTItGPZC3VfzEPAp7Tde+2r4mAHw9qtUo7qVlA==
X-Received: by 2002:a05:600c:5112:b0:426:5ee5:3129 with SMTP id 5b1f17b1804b1-427b8888587mr1618405e9.2.1721062190672;
        Mon, 15 Jul 2024 09:49:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELIFVit8u7eSh0n5vp3p6Nk6X+ohNoCsIiPgZAbbyHkzJcf4Egzvb4iKAF7U8hsnseq+gvqA==
X-Received: by 2002:a05:600c:5112:b0:426:5ee5:3129 with SMTP id 5b1f17b1804b1-427b8888587mr1618205e9.2.1721062190162;
        Mon, 15 Jul 2024 09:49:50 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:243:da88:7ff9:68fc:2f43:bcdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0484dsm6975679f8f.110.2024.07.15.09.49.48
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 09:49:49 -0700 (PDT)
Date: Mon, 15 Jul 2024 12:49:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH 5/9] device-parts: switch to tabularx
Message-ID: <00f72154c624fbbe8c3da9dbdb4e4369c36b7f10.1721062136.git.mst@redhat.com>
References: <1130700f4ae71a93d9887af35cf105731219f057.1721062136.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1130700f4ae71a93d9887af35cf105731219f057.1721062136.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

xltabular seems to confuse htlatex. Switch to an older
tabularx which seems to be sufficient for our purposes.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 device-parts.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/device-parts.tex b/device-parts.tex
index e6047db..92b65f4 100644
--- a/device-parts.tex
+++ b/device-parts.tex
@@ -85,7 +85,7 @@ \subsection{Common device parts}\label{sec:Basic Facilities of a Virtio Device /
 \begin{table}
 \caption{Common device parts}
 \label{table:Basic Facilities of a Virtio Device / Device parts / Common device parts}
-\begin{xltabular}{\textwidth}{ |l||l|X| }
+\begin{tabularx}{\textwidth}{ |l||l|X| }
 \hline
 Type & Name & Description \\
 \hline \hline
@@ -104,7 +104,7 @@ \subsection{Common device parts}\label{sec:Basic Facilities of a Virtio Device /
 0x106 - 0x2FF & - & Common device parts range reserved for future \\
 \hline
 \hline
-\end{xltabular}
+\end{tabularx}
 \end{table}
 
 \subsubsection{VIRTIO_DEV_PART_DEV_FEATURES}
-- 
MST

