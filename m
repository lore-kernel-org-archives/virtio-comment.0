Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9B72040BD
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514572; cv=none; b=hkhHSX4uiZnQorytYbxWaszp3uatbKDc2vcpI67YJApLZ5nM/RMd1+oYbP5cl3TwAYHzuY1ImOwrFuUummUKjQEWohmNUTCfneqC+bgOvQue4hZzsBTBQsjg3ZG1eCAZGGlxMOHbjSCB1bGmEEMJ8+96dhsr0WpiFvmNOcbooNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514572; c=relaxed/simple;
	bh=FQVvlv/uSovQIJrIGWonsMA6QB5DpwjfNz8r2klNal0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A4q0oMWPzxMbWYtWj02PW3BxwVlCR8EaeCt+wDRF+BovZ18RTrbK0vJuJnBs1oFIT8Zq7iLVp4J1WR1ZEaZgIUHYGCtdkUUYNWModvWySptaYKHUDBtcRapt8skw/fHJOpAApZbHdAjHgjEcHjajDRSKIez5Zs/wfSBXWdUXmgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZhTkZjit; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZhTkZjit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7vAVWd4w+4BhWFPCXjrT6Kcbt1HTgmiTs1rioU3m46o=;
	b=ZhTkZjit/W9T6/UhQMbVMQ1Q/NngTq99kkGdcVdZQPgkDbKfiUQu9wPfGp6o5IXmBVuDaG
	pr6EdE3LFzMdEOtOtucMBKu/7lATUKK52YntcohoImrarissyygFSjol1pWmrRaJ1odD+g
	lsZ0zUokwJ3uGzXnyBfdFYuevEK3q5w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-HhGo3AIhOyKSzm-J2W5zAg-1; Tue, 01 Apr 2025 09:36:07 -0400
X-MC-Unique: HhGo3AIhOyKSzm-J2W5zAg-1
X-Mimecast-MFC-AGG-ID: HhGo3AIhOyKSzm-J2W5zAg_1743514566
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39143311936so2112981f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 06:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514566; x=1744119366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vAVWd4w+4BhWFPCXjrT6Kcbt1HTgmiTs1rioU3m46o=;
        b=l/2r4enJeGupWyZCDGuNMcPuUcj34Fr6UM1PFkiy6aFdOci8AZrrJHbjuqxsAgjRNp
         TV2jA+kAJh/juLWDFgUA+LGl6C4O24MuiinxX8XLDVP5G+4vaQs1uhOe1QuqgZ66gDqP
         YRyU9pdSMwFriZtueDleqxJb59Jlga5v+gurNjPAE9PkvfSefhRgfQhysnE9ON4imauh
         L2B8ofCbQ1HgOKvo5Fa/oRY2e1Kp3hr4SBH+Aswxn//vs5sWcWW9adqWzW6DzAIvKJaS
         tUnK718bAZmd+R+/MIwIVj55HqleSNd5jxUUGkds37f9uqorulV1Z0wUTnPKr0D4DQZ8
         3JTw==
X-Gm-Message-State: AOJu0YzVfM/NhkPefuywkR4nEdocwGDfe3AaIIPjtGYn4EcDrY+Df7QW
	QvrtWlICTQ5YBJqp1vspsADMGxVBeeXSt3YpoMCPLYqWX4co6O7XRNXDk1PIfwSDtHEi8e+Aw0V
	/Uiwe+37be0VIkYCzOQk8B7cuHCrbhh9LwxvuWtX2D3D4PUgBPqMw6CuS8Gxcc622qM3LeV5Nky
	yVeslO33RMdwm6IoHrAk3cQOSH67jFeuOQeiYP+XAxLdPjY0mY
X-Gm-Gg: ASbGnctXvneVWFG3gqmWAjLJV5OLbXUJUK3wSil9pcnkvpX8zmdmsdJLewle0IOBddF
	XEXn880c0Bzlea8XQkEhRY+bEAqEkjEBynEey8UxjwHlmTzi3RGLKnBIJSPvnjG/J5OnSYugzeY
	17qvpThmFY8OkyN2tuQ9ljxhd8hX+Igaq6UzRu8j8nR1TicuBaCKp72C9aoQ25kJZC1bNCi4nk5
	MrOKtCtcBpkf86lrh9ZjbBHll+4vFz6ek238pc8Iy23DPbPsBA7puQhIgUt+YiIblnrw7bPnHnX
	AnZ37R1M046cZnc5uIo=
X-Received: by 2002:a05:6000:40df:b0:391:6fd:bb65 with SMTP id ffacd0b85a97d-39c23646ffdmr2482895f8f.9.1743514565881;
        Tue, 01 Apr 2025 06:36:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx2qQp3eFiV/34h+wM/mBS3Bxn3wUlYx0nXW6PEnl6J3IlNgiPSAv+sxP6iWfaJditr8EnUg==
X-Received: by 2002:a05:6000:40df:b0:391:6fd:bb65 with SMTP id ffacd0b85a97d-39c23646ffdmr2482864f8f.9.1743514565465;
        Tue, 01 Apr 2025 06:36:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4498sm14489629f8f.99.2025.04.01.06.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:36:05 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Martin=20Kr=C3=B6ning?= <martin.kroening@eonerc.rwth-aachen.de>,
	cohuck@redhat.com,
	mst@redhat.com,
	parav@nvidia.com,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH 09/13] virtio_pci_cap64: specify offset_hi, length_hi endianness
Date: Tue,  1 Apr 2025 15:35:09 +0200
Message-ID: <20250401133543.801184-10-mvaralar@redhat.com>
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
X-Mimecast-MFC-PROC-ID: acQTUEDOVm__WxacQAFAyVjZgfCD94ohEKluNihK7p0_1743514566
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Kröning <martin.kroening@eonerc.rwth-aachen.de>

While the capability introduction says "This virtio structure capability uses little-endian format,"
it might be preferrable to be explicit about the endianness of offset_hi and length_hi.

Signed-off-by: Martin Kröning <martin.kroening@eonerc.rwth-aachen.de>
Reviewed-by: Parav Pandit <parav@nvidia.com>
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/196
Message-Id: <DF89BB0F-6BA4-4DAB-AEC3-03AAF858EC8E@eonerc.rwth-aachen.de>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 9b3129fe72360a78e76b6dd890d3abc5a45fa915)
Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 transport-pci.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/transport-pci.tex b/transport-pci.tex
index a5c6719..95b08b8 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -252,8 +252,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
 \begin{lstlisting}
 struct virtio_pci_cap64 {
         struct virtio_pci_cap cap;
-        u32 offset_hi;
-        u32 length_hi;
+        le32 offset_hi;
+        le32 length_hi;
 };
 \end{lstlisting}
 
-- 
2.42.0

