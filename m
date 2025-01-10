Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8819B1C5F1D
	for <virtio-comment@lists.linux.dev>; Fri, 10 Jan 2025 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736503366; cv=none; b=PcjInaAACqQyUgcH9I1qY3MzWUiDO0/nOgayjvBePssAl/Dpskk3JYedi/MXuPuQrt5BRtZk2z5LLW2qaFnX1vsRLX30/PybesSCMg10sYGC3fjjsuM+2pieXye1vqiqcTtSJJ8Gr0jwU6ghYImZoDJyQnLIKikwr4Vv5ac+B/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736503366; c=relaxed/simple;
	bh=Hq61xiQXX5hez8QJjUdhNsD1N87fPGVOlQADcLyflfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oWyYsaaGlMspgrKPdjAL0HmQgUfpooS0rbD+dNhR6T3gnbhxGvUljwOzCriLzGSTGEUDVsgGw4p17iT6GQ7MBObgKK1reakX3FP0TfmeidCN10x7yqkG0Ae3XWgjWf7vRox6rt4RdYDWZcUApMUeS6ETV5LCW+PFNvV+NZi7bcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=TAIvf3P1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="TAIvf3P1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2156e078563so26576025ad.2
        for <virtio-comment@lists.linux.dev>; Fri, 10 Jan 2025 02:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736503364; x=1737108164; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RnLwk/CRtO5G/zkH3vdNMqpHufNjiVN0w65qRDD4hV4=;
        b=TAIvf3P1K/y6UJ/KwFEh4qmFfK5DuCExXTHQMhDR7NOpeT+x4m35gDF9/Oztg3ZBUT
         H2pxYmoFTyN1xSXpypODUns6MJedPZ7o0/dYihVRiyzIETYJx5rs1CeIhxEj66zxB5A0
         fBUaBJz+FX8yPHXTxEe1ZQ71JRpSZzesBT58u0cnbKFYzz53R52jtVWSM/OqbMg4u5UX
         lQFpuoNm+IjrtzEBRspNvMOV/p0Jyzzkh35wI9roe/v6+JxEolFrc1EAlc7uBonnmrht
         t6lFV2hZdkZlGvL0XNzOIq9Jc9kVaKUDdKGkevVtrOf4+WJVVOBmrIMgMoaiWRrvPO+s
         JnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736503364; x=1737108164;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnLwk/CRtO5G/zkH3vdNMqpHufNjiVN0w65qRDD4hV4=;
        b=oCLGeM/EhVfcQsymC6iN0dIsJBOu6korHVm55uBNIfUGwOnlUqo6B66Yp0lCdfm5Bx
         hc6bSnZNWaeMQ53aodNol8QbnkXZ29iJkPZPgZkP5Ce6XkapMy5Sue3+vyB6osbCJe1F
         1T0Ug7gH82HOwEsw7pS+Qn8KMtTJZ/pv3Q0TtOap9aKztKa4ltBcQN05idE5mVtiF001
         42KTSGqzVnJEU/IRWHq8q8pAzMKECZariABGoy7wCdZicXJ4+di/b1oWOd3ry+zDLS7I
         STwSys9JhYsZwCK8HrF1XLa9isf0Acc325f8xdQZJvpprkc0vfKg148mcshq5sJx8PFE
         x1fw==
X-Gm-Message-State: AOJu0YxHnP4Bq5o1+qbh0OUGQh2iz/gCV1mD47UOLPK6y6/9amd7hRBh
	SvK9pRU0UPUYvRHEC1HTFKkjFe5sUaT4WopIOwcxNtG5xIdOybsiVvzp4ZxaGA0=
X-Gm-Gg: ASbGncvnaRgegDAPCpuB/wMb5BdRCD/Jzw6+FRKWguYjcoIjzFNqEs6eJRi5LfM+veI
	Xw1By6Mp0/TRX323j5XFnvCdsKBNh4CUAhag6bduuS/1E3pT0ie1+wGMyW6sqhzG6JaKUMfFg49
	mmCIhAYZbJ6buWqmffIdLhBLDhtgTB3ZynmrbFluhYsddPjj2sy7+Cf9fUok3E4yU6rEL5LkRKR
	K8PnAocjlNwaD68PpdnICxRP7xyHuewrGg9koGSfmokWHpGvVyXk0BhyOE=
X-Google-Smtp-Source: AGHT+IF1g3kZ91s2U3RrBLQX+Able/2+3I4JtFaTHxK79uPpHAygiCRxp69V2MDGGvgoBY+3FhkDxg==
X-Received: by 2002:a05:6a00:1797:b0:728:eb62:a132 with SMTP id d2e1a72fcca58-72d21f4b09cmr12076730b3a.15.1736503363835;
        Fri, 10 Jan 2025 02:02:43 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72d4067f84csm1262896b3a.142.2025.01.10.02.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 02:02:43 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 10 Jan 2025 19:02:35 +0900
Subject: [PATCH v3] virtio-net: Ignore num_buffers when unused
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-reserved-v3-1-2ade0a5d2090@daynix.com>
X-B4-Tracking: v=1; b=H4sIADrwgGcC/22MwQ6DIBAFf8VwLg0sFaGn/kfTA4W17qFqoCEa4
 78XPdmkx3l5MwtLGAkTu1YLi5gp0dAXUKeK+c71L+QUCjMQcJEAmkcsRsbAQ221aGWjABQr9zF
 iS9Oeuj8Kd5Q+Q5z3cpbb+ieSJZdcWe9qrY2xXtyCm3uazn54s62S4Wg2BxOKGdC29imcESb8m
 Ou6fgG1PZA12wAAAA==
To: virtio-comment@lists.linux.dev
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Parav Pandit <parav@nvidia.com>, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3

If VIRTIO_NET_F_MRG_RXBUF has not been negotuated, vhost_net and QEMU
leaves num_buffers uninitialized while the specification tells to set it
to one.

Let drivers ignore the field to make them compatible with
vhost_net/QEMU, in a way similar to hdr_len field, which is also
marked as unreliable due to implementation bugs.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v3:
- s/MUST/SHOULD/ (Michael S. Tsirkin)
- Link to v2: https://lore.kernel.org/r/20241227-reserved-v2-1-de9f9b0a808d@daynix.com

Changes in v2:
- Corrected the change description to tell vhost_net and QEMU leaves
  num_buffers uninitialized where it used to tell they set it to zero.
- Restored statements that require devices to set num_buffers to one.
- Link to v1: https://lore.kernel.org/r/20241226-reserved-v1-1-39ca566889c0@daynix.com
---
 device-types/net/description.tex | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 76585b0..7c065f6 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -863,6 +863,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 This is due to various bugs in implementations.
 \end{note}
 
+If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver SHOULD ignore
+\field{num_buffers}.
+\begin{note}
+This is due to bugs in implementations.
+\end{note}
+
 If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
 VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
 rely on the packet checksum being correct.

---
base-commit: b495841a8e80d12c1130f8868f4128866291142d
change-id: 20241226-reserved-d5960f173223

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>

