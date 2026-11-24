Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555208;
	b=JMjIiimVh6mm3dLJrcn3jo5zW4qIBHS7muj3MYizKwLbW/fLqOuwuE/9mD3z9maKjYGR
	 163so/KS8ojs6PdK43EsumvOK3Wq/qHtmt35g9LzQ68dxY/25HUcMQtY8haQJlwYGoZ7j
	 MWvwbk6nrKGU5EYlFakTU2RxKGS+hPHAj9XInsvNUh1oycI1ZVRFFb08LjBd0ZbR9GQ2m
	 CxlA/eb4NjZXT69t9KxPHmbykA5jfd8QKzVCwfoBfSLHpP9VNBOkNL7R8mSf3MQr9gLHT
	 FiQPMFZ+YH7ibL2Vitc6nnyX01EJilCYqc7S+sKIUDCO3BLy1qMi4LDqHjxy+oXIfVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555208;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=tjjSJqy4EQ/tSOYJPm+M74iKPlHp1azmw8FBTlS3E80=;
	b=EFEQ30JM4MMqayqvZF4nB+MUZrE6jFVdJRYeZI6u6BoAzHlJ7T5yHBgIteMIiLDvatJ8
	 /xBK3gv1ijExPwTro0Nd3rbhzmp5jb3vCK3ciJoiLRhUgaThWXyn6A0yVPB7nWHv0PP3z
	 QhPCn9MfOEmTfdC2TwMuUYfHl0K5rcawuLU24if9dHWxJnejUmB4lIm2zkaoCIU25oBX9
	 6OurhzxH3eml/KWXV5XYHoT2elGV/msNaY7RtT32wS3aOavDHCfIxDoJZN/EbjTZjGlPS
	 eGOUrtGOV3HLvYTbmRxT+6Mao+iMcdj34Z6myYP8wQvIP9fC/QA+uqjtoA88kQskkPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=invisiblethingslab.com;
	spf=pass smtp.mailfrom=invisiblethingslab.com;
	dkim=pass header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3 header.b=GkVJxtkL;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hyRRDuXu;
	arc=none smtp.remote-ip=202.12.124.144
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D526606A336
	for <virtio-comment@lists.linux.dev>; Tue, 24 Nov 2026 21:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D526606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3 header.b=GkVJxtkL;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hyRRDuXu
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 4B8FE1D0059B
	for <virtio-comment@lists.linux.dev>; Tue, 24 Nov 2026 16:20:06 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 24 Nov 2026 16:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm3; t=1795555206; x=1795641606; bh=tjjSJqy4EQ/tSOYJPm+M7
	4iKPlHp1azmw8FBTlS3E80=; b=GkVJxtkL+Lcp+20IGGtIueTQPEI+7Hjh7hZqg
	jv3OtflhNWxfNkDc/z8Xb618gZoGs5YHs3MRUB6Jg1hjUzcHj6UQWbihzCu0adh/
	FXAlMW80/edblPmgrEIr7vNVtjw7J+SMxLZ8Xp3i1n6BjIhlB2uCmHncy3OitunW
	81A5mP81Y9B2A2KtZlB7/FSnSO0nNxyWXMR6WNBQKHCKMK2ykGDNn+5pOSXw1Gvu
	+YUgw75wzmusCiLQx+95VEgnjdbQPy8nQBAgI6rzZxhfQ2BwSca6HJGpGu2ghwrS
	PE9dmdQmQVTzJZQjE5Xd5ptrDAPHLxT+5nffryKH9SftxM5Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795555206; x=1795641606; bh=t
	jjSJqy4EQ/tSOYJPm+M74iKPlHp1azmw8FBTlS3E80=; b=hyRRDuXuqmaz/+Glp
	V5OdP6fwdgfPNfbDfctAx6gMuSQU6uNPm3zoN8f5Y2NjvQLXw32IFsfOmwZDhaDw
	8s5U2r8tzWkuljMwQiMLmMoZjVEoKsaDT8cFS7oTg9APRGs3SYZkuoI98xofbnaF
	QlUebU7MKRQOLGk+HfG0MhT5cWVQGIJtAP5U4/PW7Zb2JqvLH69IBLwg38nRU4te
	31Vi5qAGOC/gG1vitG2KylRB1tj7Qn9b+8cujtWbgLjymf+cpDhRVcrZXHf9k0uQ
	dvoKms3SAB4zeuxGPgW+rV0RpqWg4hB/dHxSUGXFoJjtjuy2FgpTmwnImRabYEjl
	xFalg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795555206; d=invisiblethingslab.com;
	mf=PHZhbEBpbnZpc2libGV0aGluZ3NsYWIuY29tPg==;
	rt=PHZpcnRpby1jb21tZW50QGxpc3RzLmxpbnV4LmRldj4=;
	s=fm3:rsa-sha256:SQSsrYJUyZD5EZTV5hUnwv3+0YUzZGgckB3rg1opOC8TccO
	HC6efrO2de7JB6M6nPttz4hWTJU52fPRyrM80fBsE2sV7w/zDHlqG2ZIpSYi2JB2
	oNQLvfLGdxi/8XmlDagBHev+EQ40gvaQkoveSVaKQi/nNFQzmyTKPKCt6NPEub2Y
	JBnOO0ZcBcoXF9kptl28QjWEHN58/mXKIQAbyN+ssT4mnzjBVgUwHeJO2G6mOOd4
	e2kenbpfRrWXFUwlbRw+8nWzFto0W43S6uIgixqRlyng8kYGhuJA2iLU1ge6AwHK
	qey2erUqqhPzX8ccUo6qVzUdw1DR84zxfxqKVGA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:hyYe19xN/jMI69FIEmTsuWmP6JV3+XG5ZEsIu2d+YiM=:BqAvVZXyUr+3jU0Jq0CmqO8IsTTaFKARwipyFEEeRSU=;
X-ME-Sender: <xms:hf8Fa_BSdHipHwqMvQ9xIrITvMhO-j5ZSyV4ZQFDzhfWpEeofHItvg>
    <xme:hf8FayHXFtlthYBy27KkQ1OT4rOkMlUKFG8yDaQvgzX3vrQRRJdj9m70JK5YdE0sF
    -KtAsjxTrrv5RoDwQHJa0uqvnE0xQV8q0Cx7-m9LIYcN_zq-4k>
X-ME-Received: <xmr:hf8Fa_B3E1ixlzPI_iCFmHRUxCGddFHuLMiwefE-SSfZAkpNjNzk41IbuSF2SEN9yTn7IBbkxYBgPD0gwpgD3a0o1PdKdNgZHMkO4iocZAZ3dw3zdl0nWysduZDTVQ>
X-ME-Proxy-Cause: dmFkZTFhd1MZhb7L/VBDERGU63cUsWpu5QPR/VqE4czhodowi7gihOoMynOA1ztjI9FiTf
    JVRDBOZk5cF4NfYlfILRqqRUv6TnSyPaxO0/0K85+o6cP6CnrgwO44QE47CpCMqnyqio57
    xaBr6cmZJ+MkVgrhr9gwgrqtByZRlNrVTtlgRRckb4uDrSzCwItFMEhAEDo/1V4gJpp6EI
    R0g+ySORQ4v2Yc+KRDe5PyZLExKAsDgftPTH+JoBAVWEDX5a28De7So4UIkUhlxEza0M7V
    S2vBGo55v2rL5Jt9uPIBIp7DRPy3unYhhwPfHkRz2I21fadGA+Ad7BFfan5tyMx7a4kfEE
    6kAAekUuuln3O/SW7FH52b4QosoYBsrdRlCEDA75OWHacehaz1j2b630nlmfpP/eGJ+waV
    EahIIh/jjlEXRsaMKhT6Nb1f6G1Dohh/aZs/hdgHuHmcG78CjqTx/B/qpsUFpDPhKkUAKv
    cvnXXaqAFhTWsGesCwWi8ZJwNwHPQEyi8XAjuHHeboRsQCpcD4T+w+rgqJevH0nERW1t5X
    HobuvPmDa/VrqQcxK0WrLGw2r6i32VCXhj/U4VV7UNVWA9UBxz/9yK2n+Wah0il3ccpuTi
    Rd1mxw//u4q8cN4hbg8CZyPNoQlWW6wtq3HyBWdGLtQjsxk2qqhHzZ2Qy1Ug
X-ME-Proxy: <xmx:hf8Fa4mywN_ibwB-J3nmSerbbITiJSKl55wPnZsdZiT4ZrF-KCDQsg>
    <xmx:hf8Fa1Py3CXb_McR4ib1iQGEmhvaLSmuVqMKANWsN20Ag55czT1b4Q>
    <xmx:hf8Fa982UNhm0jXQRtDvyUif42ap_B2Rt6-oS1hE86srWN1g3uq_BQ>
    <xmx:hf8Fa_EfyLZrZn93eCRCRB7HwlGDuEjQ6E3I5ve1O1Uzeg8isMcMYA>
    <xmx:hv8Fa8o9ZJ-QHnf2CkE-nrJIThLVoYsT425Exwnq8FvlAcASk_GNBV3M>
Feedback-ID: i001e48d0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 16:20:03 -0500 (EST)
From: Val Packett <val@invisiblethingslab.com>
To: virtio-comment@lists.linux.dev
Cc: Val Packett <val@invisiblethingslab.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Sergio Lopez <slp@redhat.com>,
	Parav Pandit <parav@nvidia.com>,
	dmitry.osipenko@collabora.com,
	mst@redhat.com,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Alyssa Ross <hi@alyssa.is>,
	Demi Marie Obenour <demiobenour@gmail.com>
Subject: [PATCH v3 1/3] virtio-gpu: document individual blob_flags
Date: Tue, 24 Nov 2026 18:19:27 -0300
Message-ID: <20261124211931.809982-2-val@invisiblethingslab.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124211931.809982-1-val@invisiblethingslab.com>
References: <20261124211931.809982-1-val@invisiblethingslab.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blob_flags field of virtio_gpu_resource_create_blob has been rather
underdocumented. Describe what each flag actually means and which kinds
of blob resources it is expected to work with.

Signed-off-by: Val Packett <val@invisiblethingslab.com>
---
 device-types/gpu/description.tex | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index ac3b427725f6..ea6fae4667e1 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -671,7 +671,22 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 
 The driver MUST inform the device if the blob resource is used for
 memory access, sharing between driver instances and/or sharing with
-other devices. This is done via the \field{blob_flags} field.
+other devices. This is done via the \field{blob_flags} field:
+
+  \begin{itemize*}
+  \item VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE indicates that the resource may be
+  memory-mapped with VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB. \field{blob_mem} MUST
+  be VIRTIO_GPU_BLOB_MEM_HOST3D, as MAP_BLOB makes no sense with other kinds
+  of blob resources.
+  \item VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE indicates that the resource may be
+  shared between multiple virtio-gpu contexts. The device MAY only support this
+  flag with certain values of \field{blob_mem}; historically, this has only
+  worked with host-only blobs.
+  \item VIRTIO_GPU_BLOB_FLAG_USE_CROSS_DEVICE indicates that the resource may
+  be shared with other virtio devices via VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID.
+  The device MAY only support this flag with certain values of \field{blob_mem}.
+  Requires VIRTIO_GPU_F_RESOURCE_UUID.
+  \end{itemize*}
 
 If VIRTIO_GPU_F_VIRGL is set, both VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D
 and VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D may be used to update the
-- 
2.56.0

