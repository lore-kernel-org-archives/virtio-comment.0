Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0532A175AE
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 16:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721062199; cv=none; b=Qw3JskTLEfVsgTSUBCFouJH0y0yD7TizKVUO7fIpxU1+cXxnDvmf1P2WvvV39Ghd03FIZVcIevLEZo0ahW+KvxObZKU06rfhOKpcm+GGaHhA/ol/EYR2GJDLQtQH57NJrchokW24wEC2ZrSWSGpdON4z+iJ4u2Rzh7G3BM2qk8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721062199; c=relaxed/simple;
	bh=YiOayE76VuWc4rknezYUUYqU6XaeNRwjXW/Tqa9b84Y=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=EJfqJaTNpKeXnMGcDRXD1xggmoAB+cNL3t9jPAwev1UsE83P1hZu1siOCfYYmOx5kRs9ddYAb8iButmykBII12aF6PZtFbTyjCmbC1cVMfoXIVmT9lMRcZxQBeCv5VPRUQ/p8HCQUkRNSV0BKAq+Y24ox9weWSqrqiwBXIZvyHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fTRV4hmJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fTRV4hmJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721062196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GlDWW474y2L1d2RMuOeyWj7nXQ3t4dGUxc6gYI1sbUQ=;
	b=fTRV4hmJEVDcjSk2eB1t77zXmXpm/OQ7PgKKM7AxgQUcFEhJL8UrSudn0joblXy5s83sVP
	LVXtOP+pv7x5kbB7uuF6NXKQkHqLHKKsK551G224xdFSZnLX+CsPGT2duilLLa0CeSzyc5
	NotQwjWV2BCC6ryWX1TQAts4LpTmzA0=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-G_GXzNhHPUuV_a3wugh3eg-1; Mon, 15 Jul 2024 12:49:55 -0400
X-MC-Unique: G_GXzNhHPUuV_a3wugh3eg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52e982ad660so4488070e87.0
        for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 09:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721062194; x=1721666994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GlDWW474y2L1d2RMuOeyWj7nXQ3t4dGUxc6gYI1sbUQ=;
        b=IE7xzAGbbUxknKY8bv+8iiDspH4wtFTFXlS3llC0TBv8l2FRymT4pVIGHvAYa7aV9H
         yqX2nSYKycw6BhmAd1b43TIxAqdZeCwQycABW/i+xHIfXQJiGqSqmaTytIDWPKUg7n2N
         kA7Vce2OXkn+EpFL6Jpz7PsW9rduvmRwdZX2lKlrU/lKm4MpT2eOLPhF3bB8Nx1Obz/V
         TNsqwTWXp1uM181TQAdiKUhNZCYwX2DZQ0Tv/cQjxRiC2Uv53/0U0I9ke60KqhGq/vHZ
         MBX3PGBesoKfX20WiJPAX6X6vlXRQllWfwudWOYGqIso5b0x3Xa7dkdQWGsJFSnZ/W4e
         xZ7A==
X-Gm-Message-State: AOJu0YykYR4mURXo88oJeWoJuq92fr/LbM2L0OX+wabNzs7eJ+qLdBiz
	DghDjJFJjJ8Kqin9HhkUT88rHHeUEoKqd5mqeg2u755qagpyAr+FS79C4A+qPCzVRosmrs+ZNbA
	IYDUE6Rlt6vI3osEtYHHXyXDPkTAKrSMl6oBXskEchnep+g5brHZAgsxyl2nRN+wpqMC3v+024v
	sekSV/hiW1pyJ3woOR+jkrdFEsDTrRb5STUTQ0uUdTrQ==
X-Received: by 2002:a05:6512:10d2:b0:52e:9ba5:9853 with SMTP id 2adb3069b0e04-52ede19f843mr64962e87.24.1721062193812;
        Mon, 15 Jul 2024 09:49:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2eAh45QwIRWMy5Dhsmh6hR299NcbATm6OP8i/bhXwwm08yB/1sDSRVNt8CSjeDkmvte3aBg==
X-Received: by 2002:a05:6512:10d2:b0:52e:9ba5:9853 with SMTP id 2adb3069b0e04-52ede19f843mr64928e87.24.1721062193038;
        Mon, 15 Jul 2024 09:49:53 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:243:da88:7ff9:68fc:2f43:bcdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f25a962sm127101665e9.12.2024.07.15.09.49.51
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 09:49:52 -0700 (PDT)
Date: Mon, 15 Jul 2024 12:49:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH 6/9] admin-cmds-resource-objects: switch to tabularx
Message-ID: <3f7be88a42af0a384621ef07b65c7a31755ef42e.1721062136.git.mst@redhat.com>
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
 admin-cmds-resource-objects.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/admin-cmds-resource-objects.tex b/admin-cmds-resource-objects.tex
index d0a6647..e0bbb4a 100644
--- a/admin-cmds-resource-objects.tex
+++ b/admin-cmds-resource-objects.tex
@@ -65,7 +65,7 @@ \subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio D
 
 Following generic resource objects are defined which are described separately.
 
-\begin{xltabular}{\textwidth}{ |X||X|X| }
+\begin{tabularx}{\textwidth}{ |X||X|X| }
 \hline
 Resource object type & Name & Description \\
 \hline \hline
@@ -74,7 +74,7 @@ \subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio D
 0x001-0x1ff & - & Generic resource object range reserved \\
 \hline
 \hline
-\end{xltabular}
+\end{tabularx}
 
 When the device resets, it starts with zero resources of each type; the driver
 can create resources up to the published \field{limit}. The driver can
-- 
MST

