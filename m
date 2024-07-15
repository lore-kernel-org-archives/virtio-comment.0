Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F661CF92
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 16:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721062190; cv=none; b=XRcU5zSr3W0BQDv7pwg2eM8mUOHlSmp3t64WlroJd/BuVgAd5foaVYByxH0Db6SVShn7dGLeYef/NxSVsWqXqOD3SY6YPmBsejes0johEA6XWQ8DjWoTW1vxDytcM+f7HerAjE0MpSuYmOj68tBaxtD6iK6ybpjEqVQBY29jU5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721062190; c=relaxed/simple;
	bh=pbR2LRiF+xyQJsTJOqO1pw9aoPdwFsviasIyzYDuaTg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LVBS5rVnbyiJaOcCzvZbk8aFGQDKBG7oHfQ0YCjiqogn7abFmqKMAyGptpRvzJptPkalTx/iTP9Iugd75inDqyqwWotmhu9k8ic+iIgayCpO8zghhdUKFmBH7pJ9zlN9vEvV3dATW1s2u3B7sS0W386pmrFON79KFy1NIziy7aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GxWinb9f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GxWinb9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721062187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oUPKf8b7yKoTRWVi1rDFMmLbaIywOpZsUcFoZN4mxsE=;
	b=GxWinb9fbCmLkFr8JCaiW0wsfT3e9JQZ4qWp0fIYUxzRqohiUcp/OSESUfaXR2D81MXUoH
	Fxi+8Y+UhLY+vO04V1QsZalgD8eofwOCEePvQereAO8ojcG3GZ0aY+5mVAaXaSko812Nfc
	BMMJQrQRqgKHHus/YdFlrpxry8jdJTM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-6ViZOkx1PbiYmZKCVT2jIQ-1; Mon, 15 Jul 2024 12:49:46 -0400
X-MC-Unique: 6ViZOkx1PbiYmZKCVT2jIQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-367a058fa21so2654966f8f.1
        for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 09:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721062184; x=1721666984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUPKf8b7yKoTRWVi1rDFMmLbaIywOpZsUcFoZN4mxsE=;
        b=Qe1hWgcEhUI1QypFY1z8LIBlCiujml+UAkY/RG2Wo2QLaWF6GCb+gkzazuQHFzeIVF
         ZuRxMYcniDpArRNnjRVtyqRbEZVO08sut9Lj5wRC8LQk2ZqM7GXh5SNsfN2qCsYe9aCB
         YEMaPV+iskOj5qz1I4PqHvYYLBfqzhvh0w2mNDsVX8rQXcl0BtLsH7sGv+PwwJbneGU5
         cN8XfBgbIkMrRRQExu0Rs29sVErYgeACPLoOTaaWs4RrwSRdgw830UiRH/Lzah5ZghIz
         dHTCSDRjqf9D28VbmOkjUpmAf9IFKcQkS2wcTBHGGFWm/5jUscmjSfsJu06rsGH1yDtL
         7J6A==
X-Gm-Message-State: AOJu0YzqkKQUpahX39f5L0+y5qjsjxAxTLeEt0MGQmqr83VwFPHqZBkO
	sTTWW2OzPWDQkIWhZYJqxtAF7Vgp6siH667dFDnTiHJTpYVxQA672Lleqre2w4W7ZQWLuCWxVvr
	9d4P8EPmyF1o4BQq9wi7XW+MoM+wLsUOMOR1LkjJFkwc2wIS5Vhbl+HcutmYFSw+Pbxq/Kis2c5
	wUGWw/ip7qmCaZ76YRJN60b+IQrhAkMLPFmbKT2CVKKQ==
X-Received: by 2002:a05:6000:1fa3:b0:366:ea4a:17ec with SMTP id ffacd0b85a97d-367ff6e75c2mr11970138f8f.2.1721062184576;
        Mon, 15 Jul 2024 09:49:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0Fy/WSFCW/qH4Etkm2Le/JGiEN3dzZNgZz3nkYrjdtDQD1LaKU5lzk16i/V2gA2SKq7sjMw==
X-Received: by 2002:a05:6000:1fa3:b0:366:ea4a:17ec with SMTP id ffacd0b85a97d-367ff6e75c2mr11970112f8f.2.1721062184065;
        Mon, 15 Jul 2024 09:49:44 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:243:da88:7ff9:68fc:2f43:bcdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f23981fsm130159075e9.4.2024.07.15.09.49.42
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 09:49:43 -0700 (PDT)
Date: Mon, 15 Jul 2024 12:49:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH 3/9] admin: switch to tabularx
Message-ID: <29ebb999f6d3808edbf32cd6e95b69fefc1a6e34.1721062136.git.mst@redhat.com>
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
 admin.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/admin.tex b/admin.tex
index d60d6f1..35d614c 100644
--- a/admin.tex
+++ b/admin.tex
@@ -118,7 +118,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \field{opcode} specifies the command. The valid
 values for \field{opcode} can be found in the following table:
 
-\begin{xltabular}{\textwidth}{ |l||l|X| }
+\begin{tabularx}{\textwidth}{ |l||l|X| }
 \hline
 opcode & Name & Command Description \\
 \hline \hline
@@ -163,7 +163,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 0x8000 - 0xFFFF & - & Reserved for future commands (possibly using a different structure)    \\
 \hline
-\end{xltabular}
+\end{tabularx}
 
 The \field{group_type} specifies the group type identifier.
 The \field{group_member_id} specifies the member identifier within the group.
-- 
MST

