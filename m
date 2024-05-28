Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68219F4EB
	for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 05:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716875281; cv=none; b=mIRMwXh3C7irPRihbHO6Pf1sne+ayk8p3Z4f4itXgDsH7SZCEx2aSVPxZumh3IVg7vnSltRW8eUDa6/0aSI98Q1CnQE3IFc16mS+43+LgWiU3AXmAwywzm/+JZB5QNXb7ZeCn+VY9YdPOKkyGobdxKcbsxN8k43usne8ul1JLZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716875281; c=relaxed/simple;
	bh=mwfFGrFxxFRjJBbAVLsJJMLZrwLMCvNBVvHWe5lLNmk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L41FHiYGswe7tPJ5CsP7focH33ZFfAxmnQ4Q8jqgMl0eL1GwMiL3u5XY26Z+zkjy/cQAA0S78XPgM7cv6Fbq2AzAGwt8xf7o+fjTadAexv8xhqR8J39bb/BBnOVMFxZ4BbbB2YAXa/eIHIdyk0UTlosfhkh1mlFkcZicPgqBsk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxaEP74w; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxaEP74w"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f6bddf57f6so430539b3a.0
        for <virtio-comment@lists.linux.dev>; Mon, 27 May 2024 22:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716875280; x=1717480080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSkN0ohKYwZxI6JddG0Eq/uEpvoLAITCpFFuXs6DrFI=;
        b=WxaEP74wXqddYgeVpHA6q0FTSmL6NLHX32XysM30Nzlu8hjn7xDEirAu6asvF9VsGH
         wPL9GAS38CVCa3KFR0AS6CmwAw0Y1sB+FCALHTtqW83Oh0u5qgmykqMMl+phFX2+sRGk
         bHxaSENI0Ttj+CFpK6uJfyI9CqPKTGvJhOug1QA+OPBx55+l8YB0/BjGBpaJHB9UPcsp
         B8pODpqTBx7KilXPkjz4QHUtW98VUIEN/1pihwq7Vc5INRN+DWAqC34NS3RYrsHPPl2o
         y8+rXrhPsLBW9WzVgVuFRHEMffrb8Akt6St8Xc7QoBY2CRFO/4p/Xv3rInNUXAAe9vNS
         Lh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716875280; x=1717480080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSkN0ohKYwZxI6JddG0Eq/uEpvoLAITCpFFuXs6DrFI=;
        b=eeORC+HQa58XX8GiDzAyDbCgGCnOyA6KQHHprrn0VYNyuGNXHawylOH3AuqBKM85iw
         97b2TcdSe4Q7nuvr42NemlgbbRuv5BuN9DT46HGFK+YqM/xReeL/leOn5NlpDZmpjhQv
         ISBFfwKbGDgyNGJMpSo1pCGcMlX62lSOC+aS+PLQQFunwxpaCOzAEpA/5ImZ1yq2XKet
         uBhnZMwKdmXXNYAjzEWSwwH/M0QAr7KP5Nkl8fWE7YcI3PffZO7ZsDJpIVl0wuh4nX4t
         lwb1GAZNgnAEGoiL2nkRLnLotjzG5g8VFauHGaZTVtdiIhZqbwJWuKjOdEP4YDKEoueX
         J29w==
X-Gm-Message-State: AOJu0YxA4X5YIYe5tcgMZj/D9IS5JrP83dFCwU9VRWQUwcP/oywMV06D
	9Od3cb15aXhRVVQBS2XSPoZSprPavYd55d4g0vM+uPEcsAxgHRtM2MQ2NgBdPdMz2Q==
X-Google-Smtp-Source: AGHT+IEmp7+6+LqbvtOmAlp19UD3EZtmGfmvh6sPphc5Wa4if9Uk7vNUQzGA/P3QdPLmoz94PwN4PQ==
X-Received: by 2002:a05:6a00:8013:b0:6e7:3939:505e with SMTP id d2e1a72fcca58-6f8f2c6dd6cmr10453396b3a.2.1716875279540;
        Mon, 27 May 2024 22:47:59 -0700 (PDT)
Received: from devant.hz.ali.com ([47.89.83.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fbd3eb67sm5931570b3a.19.2024.05.27.22.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 22:47:59 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com,
	mst@redhat.com,
	hi@alyssa.is
Cc: virtio-comment@lists.linux.dev,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: [RFC PATCH 1/2] virtio-vsock: Add a `VIRTIO_VSOCK_F_MULTI_DEVICE` feature
Date: Tue, 28 May 2024 13:47:24 +0800
Message-Id: <20240528054725.268173-2-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240528054725.268173-1-niuxuewei.nxw@antgroup.com>
References: <20240528054725.268173-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The feature represents the users want to enable the multi-device feature
once it is provided by device.

Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
---
 device-types/vsock/description.tex | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
index 7d91d15..3fbc02a 100644
--- a/device-types/vsock/description.tex
+++ b/device-types/vsock/description.tex
@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
 \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
 \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
 \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
+\item[VIRTIO_VSOCK_F_MULTI_DEVICE (3)] multi-device is supported.
 \end{description}
 
 \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
@@ -34,6 +35,9 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
 VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
 VIRTIO_VSOCK_F_STREAM has also been negotiated.
 
+The driver SHOULD accept the VIRTIO_VSOCK_F_MULTI_DEVICE feature and allow
+multiple devices to be registered if offered by the device.
+
 \devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
 
 The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
@@ -45,6 +49,8 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
 VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the device MAY act as if
 VIRTIO_VSOCK_F_STREAM has also been negotiated.
 
+The device SHOULD offer the VIRTIO_VSOCK_F_MULTI_DEVICE feature.
+
 \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
 
 Socket device configuration uses the following layout structure:
-- 
2.34.1

