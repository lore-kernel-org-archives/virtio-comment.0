Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA1920468C
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514572; cv=none; b=aTzZjC51lwTTvDN7zo67bOu9Lpvq4z7/d+1qWcqOkaDy+Jww6Syp8DmIURSwsbMJlNq6Fv/QP6s7YcwD+yKIv1zl5V1fyQjPBawauGgA0je+l+f6+B1wyWlIbRR7l0Wu5G1SJ7AzMXxJ7XI/x99lSnaTQf4kOLdxejOZiFqSNXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514572; c=relaxed/simple;
	bh=uBWwln4800XEHSuEWnK+fOdZWX+mIdGHy34X0Onh//w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=TPpLJrGHywevJTcOWvnRWYoKgmgDAypviuJIsCMcqMKoHXMR7icn0IT2FYfff1K/bAPNwH5Hbmmd5janMLP7QnJBGB562GzjxFXz5wDFr1gPY48Ll6Yxho0XFr+xfyiq9nF6VgR6hOxURAXDIEro4/B201bCoSuHKYxD4SkilD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TRh09nd1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TRh09nd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=86sDacNv7DL+bMWRc9AnG+Pxzdpx1Ydn5kUkZhOoe/k=;
	b=TRh09nd1GY0FFPn2B5AI6CBkOTqmjwXcQb2zFReTGGo+NsBbyoawkBNLBvObzT9fe2mYNn
	YoxUBBkGuk7Jhkmov4ZvV8VdXWMrTmqCYcm5nSe9+Hhsi6VLeQ7kFqIYs5KjdFEdpYftnE
	fh78/8/gIVZEAwxLkmRRgJFZJa2v34Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-wXZPgghQN7m11KDK_QJixQ-1; Tue, 01 Apr 2025 09:36:08 -0400
X-MC-Unique: wXZPgghQN7m11KDK_QJixQ-1
X-Mimecast-MFC-AGG-ID: wXZPgghQN7m11KDK_QJixQ_1743514567
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39c184b20a2so943275f8f.1
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 06:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514567; x=1744119367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86sDacNv7DL+bMWRc9AnG+Pxzdpx1Ydn5kUkZhOoe/k=;
        b=gTOuHYmpYxfo+0eSktgYAeVhloWyxmGviKt9sADAIP58IIbVGz3nDgHFU8VlXOdvE1
         l4AWnw7V9Aa454ypb1JOZRuo/+Jf9L3E+TVILPWOTocVk97oMRvHvJaT9C6Y+DRddVjV
         GVgsB0DxgqxTZo4GwWd/WEhAwhjEFo9W/Hdb3o/S+OW1E+++Vhf8uaV8Ocz2ePhX32Bc
         1nPoc+kRapvgEzDkW2Cs2XAMWC63v96BXPnCMF8XGhQsu7oves1kzR+cNMj0qgbN8C3C
         j1zbj/kHLzWhfnEHZBKRU+AgdLjZCzM5T2OBnWW6xlPvrlgsOnNx6sv5Bpzd+iXZf1EW
         OMsA==
X-Gm-Message-State: AOJu0YwjarsuiH1NjlGIyF8xxGSBtk8wBaGRHeb5jyMiXMVp7ry8POrW
	hXpw36Ct5kMKqBQ+NtxAoOI2FlCtDP53qp402tJWt9gVZSelcJ6ULQYz4rfC2rAvS78PrLDWGp8
	FYNdcfEbg0vlBWHt6JNZQI7ii6f8vFfo8HcDjbmKchKBb8b4zLUrqJ+MhWn0pWBSRJL+u+rY62R
	ReWwZySByC69xptjxSyPwCzuD3fMXlirUPMyb97Dsxw9jfRgnv
X-Gm-Gg: ASbGncukI6II6RoBGLqwDhK5zChgDYEvdGDVZ/jCn/Te/P+nJVB6qNjfPuzuf2wFZlh
	EIdSJQK13zlehAc8p8nY6+XwE/ty7A+Uax1goma5ZAeH52Y4ZVo4GvpPge2Tkzi+eBovwu5fFOW
	QSeM3k+j14MgGkDFx3qbgX7kxvwy9kXjZQ2wfKvhv7gzTsUaCQkfKkbKpHOrbCVufDko6E8HFX/
	N1/5/UadTHemRkPZ1946UQQHVv2hHtl3j6EE4PQkqbRN/G/o1NDmObGR03SR+DlxrkwMWFXW+dS
	AUYzsE3vqElc+1zrBnQ=
X-Received: by 2002:a5d:584d:0:b0:39c:e0e:b27a with SMTP id ffacd0b85a97d-39c120e2a6fmr9256985f8f.23.1743514566746;
        Tue, 01 Apr 2025 06:36:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/IHhbXVltRoCysSr37HIttge0/UMnJi73uaj5GYUBb+dQrFD1F7ZVDJidv4079ofV7PSIOA==
X-Received: by 2002:a5d:584d:0:b0:39c:e0e:b27a with SMTP id ffacd0b85a97d-39c120e2a6fmr9256949f8f.23.1743514566264;
        Tue, 01 Apr 2025 06:36:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e33asm14320923f8f.66.2025.04.01.06.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:36:05 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Parav Pandit <parav@nvidia.com>,
	cohuck@redhat.com,
	mst@redhat.com,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH 10/13] gpu: editorial: Fix spelling errors
Date: Tue,  1 Apr 2025 15:35:10 +0200
Message-ID: <20250401133543.801184-11-mvaralar@redhat.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250401133543.801184-1-mvaralar@redhat.com>
References: <20250401133543.801184-1-mvaralar@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w1myE1Id7g_lwoXZngYTLdhRCauZa5DLA5oEsRqaGkI_1743514567
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Parav Pandit <parav@nvidia.com>

Fix spelling errors.

Branch: virtio-1.4
Fixes: fed64230bf31 ("Add virtio gpu device specification.")
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/205
Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
Link: https://lore.kernel.org/r/20240916030835.68178-5-parav@nvidia.com
(cherry picked from commit ec1845bd5a0261a65e29137f949ba03bf2fb44e2)
Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 device-types/gpu/description.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index 66e4873..ba4ea76 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -166,7 +166,7 @@ \subsubsection{Device Operation: Multihead setup}
 
 \devicenormative{\subsubsection}{Device Operation: Command lifecycle and fencing}{Device Types / GPU Device / Device Operation / Device Operation: Command lifecycle and fencing}
 
-The device MAY process controlq commands asyncronously and return them
+The device MAY process controlq commands asynchronously and return them
 to the driver before the processing is complete.  If the driver needs
 to know when the processing is finished it can set the
 VIRTIO_GPU_FLAG_FENCE flag in the request.  The device MUST finish the
@@ -345,7 +345,7 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 display).
 
 The \field{enabled} field is set when the user enabled the display.
-It is roughly the same as the connected state of a phyiscal display
+It is roughly the same as the connected state of a physical display
 connector.
 
 \item[VIRTIO_GPU_CMD_GET_EDID] Retrieve the EDID data for a given
-- 
2.42.0

