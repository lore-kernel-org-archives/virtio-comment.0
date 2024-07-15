Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F876175AE
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 16:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721062192; cv=none; b=sOl7SfveA9vxpY1Vu5DrhRHDA2uyingLd6NOgO+qJNNbVcrKWK/iKKnNOnnOxue/l5+heNMPEHvnR+Tvl5/3rdcm8SsBSXGl8GDy/uUHpng5iUOBUrbLRyyCRQua0RmcrnRPCdvzP+QGU57Bd51cEmaM0/uuav/6YXQd5tH4Fh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721062192; c=relaxed/simple;
	bh=jF0s4BAXge+MgqaIh6MQFWErXoJ/tuCddz/Vn0QDjeE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=p+10VaPQ3eHcYpAY1aLj7FVLZpTy0HBiVr1Gy7XSYUl2A4xhuXRBGgsVPwtlQvubVqSIF6bJlHa1MUrFMTLDCwscNLVRVplW85Jx/VOqtRptJEfTaHTr0kvkm8gqaeZAFuwryBx2Pes8Wj+SbNpo8HIaYBDWoIGssyxgJL/BXeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hp/cyH0B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hp/cyH0B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721062190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AOodb0JtV8t1/+X/xH3h7+HrRz8RI6EhqtBNGEGBnJQ=;
	b=hp/cyH0BV9h0yp0IbkbPTtgZ1LVwt0RqqONvZvc+T7McmHhSjqanznkESBHLCPLNUk6F6d
	axbWGLAFjh5ATfphhIBVf3D6t85bMiQkZ8uZHtmFBZMxzfx3yAGudU93iexdb8ijJEp1z/
	NP0lBwt+inMqzGWX66s/KOzPr4u5xTE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-ulI_BY48OyyJUP62ottJ2w-1; Mon, 15 Jul 2024 12:49:48 -0400
X-MC-Unique: ulI_BY48OyyJUP62ottJ2w-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-426654e244dso32232705e9.3
        for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 09:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721062187; x=1721666987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOodb0JtV8t1/+X/xH3h7+HrRz8RI6EhqtBNGEGBnJQ=;
        b=isgo+scyMaex+4Um8nCwZMhLg6nR7FrD9+XIWcih2mFO+BnVyRSXPDx7Wg/F9hyGiQ
         ghCCB3ZFaWsEnYqSIfrhf3jREgEdZZhh37hYlSr8GAt0qO1uJCbaMoVtGr4wXTIGiP4r
         xEM98ohGC9kFB0fjiuqEoN1i0KsRg27rl1/+W4tHjoJNBXDUCmRJPbojNnhgxDL8pyOp
         09E1YN+F7MS5MESv+Sqazn96GAOo9tVdN0TIV8/lSGqizvlmtWenbRxJXAbowDOu7aMw
         YauUSVJmNx49mGMxaclH2NUl1R9NLxtj9Zajxn/r5JvJarHpSiEN/8IAN2ZzIEbCPbCt
         ZV9A==
X-Gm-Message-State: AOJu0YzDEIx2LKaG01+eqZYiDyd0P0JST+5grXdeRtfUk/en1nJeKTCS
	L0lC3ojoY7Fmx7EE9H2Gui1fc5uBY9zoLkcL8Fgidtis5WQ5Mdzeh86vgTV5SZZlKbPaz9nQ0RW
	X1S4O15F/9jPQmmnKlDZCC2JtvBiQWq/0oEJtMeEWqMgV75b8HLBm4Rz8rFHJGXmAkRwpVxL8/E
	IINkSvsGAOj00kMcnvPvvxDtwzzPZIKpof6GOZxRuLAA==
X-Received: by 2002:a05:600c:458c:b0:426:54c9:dfed with SMTP id 5b1f17b1804b1-427b88c6befmr1502285e9.28.1721062187484;
        Mon, 15 Jul 2024 09:49:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaOJY4q0N0aCL7cyEgatjUZxix36n5LudZy3LGl2Tcld1Da2dE7v2mpmu8rzCeMAumF8fJzg==
X-Received: by 2002:a05:600c:458c:b0:426:54c9:dfed with SMTP id 5b1f17b1804b1-427b88c6befmr1502115e9.28.1721062186956;
        Mon, 15 Jul 2024 09:49:46 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:243:da88:7ff9:68fc:2f43:bcdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e81f0dsm93079375e9.12.2024.07.15.09.49.45
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 09:49:46 -0700 (PDT)
Date: Mon, 15 Jul 2024 12:49:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH 4/9] admin-cmds-device-parts: switch to tabularx
Message-ID: <bd3cf4e620485271d777f9cfc51d1ae9ee1b8169.1721062136.git.mst@redhat.com>
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
 admin-cmds-device-parts.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
index ad3f8e3..e64b756 100644
--- a/admin-cmds-device-parts.tex
+++ b/admin-cmds-device-parts.tex
@@ -297,7 +297,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 \begin{table}[H]
 \caption{Device parts order}
 \label{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order/ Device parts order}
-\begin{xltabular}{\textwidth}{ |l|l|X| }
+\begin{tabularx}{\textwidth}{ |l|l|X| }
 \hline
 Part name & Optional & Mandatory preceding parts \\
 \hline \hline
@@ -317,7 +317,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
                              VIRTIO_DEV_PART_DEVICE_STATUS, VIRTIO_DEV_PART_VQ_CFG \\
 \hline
 \hline
-\end{xltabular}
+\end{tabularx}
 \end{table}
 
 \devicenormative{\subparagraph}{Device parts}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts}
-- 
MST

