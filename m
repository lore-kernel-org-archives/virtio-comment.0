Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82763EB812
	for <virtio-comment@lists.linux.dev>; Fri, 15 May 2026 09:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836483; cv=none; b=nM0rkGash6DNwDZacVQrYtA2gSmDHfXkbsIbxBQWM5jD7uPsEBtIs2i4uY94KZKVIKtpIaLTTvH6BoaSU/B0hZ3F2eCa+UEM8Bb7QZoVdaBA9GmMWy0TDSxdTmEHkvfPCZYmUvuj5lxkCSDDQ4y0tafhtsN9FUpCN5a1JJDQDb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836483; c=relaxed/simple;
	bh=BZsiTEt+yrXuKgHEOl4T3x9Fn7YGM1YqIxR/VRTVW1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P6dKms/DkqjbCN+8TgM6IpoidHAt1PotjU8EVOhHOk/DxovMsFcfLs+O+wqpOpr2lsiAUaqd6LUy3zQ+7xV4oYYoLZYAgqxgv8IOgQlxVzJqy0fp3Pz9ceKLpT50yKlD6e9A2p/RtkulHUjBRE/rXMeLa+ICBx6dzTQHDeoUdEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sSKZ+VhQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sSKZ+VhQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48d102471a4so87392885e9.2
        for <virtio-comment@lists.linux.dev>; Fri, 15 May 2026 02:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778836480; x=1779441280; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VjXgtDe16Sd3fMkrSP76earBCIzwPWAy0E9WCTuqnpQ=;
        b=sSKZ+VhQ5fJSiXRgjSeGRnSK+BkvYtTv5jjPbXTSQXg9YOMv/L+TEGbNxW8fVZEW9I
         AWMADaO71mbVmj8njXdnlVF1WjxPQzP+ecTBVIPKF784zVULxhYp/PU8EctjaQmMgDHm
         3ESKntpyfPmrMfDFRV+AzuqdUn7OoXpPZoHOoQv5WOi+eXk1Ahm/CsJW9L98D3MYgomJ
         C3mycGzicyP/76mkPV3FBUr9yYD+uM4O2//R4lAS+0GW5ZHrq6GddmiDyg9aQXoDV3Mh
         I0VsfYQoAOh9qsq/PeDIPEXBROg5ysihOskS5WJWuuLWu5Ug/7oP3BWG3FUX4HYK/jV0
         uXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836480; x=1779441280;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjXgtDe16Sd3fMkrSP76earBCIzwPWAy0E9WCTuqnpQ=;
        b=GvrSW7iEIoX5SvIcptUm6dOKCcBTtybRI/rtL2E5y3/fEXdjQMlyp4DLwGs5Y94/Qe
         Vmcx8Rq09zhI8X3HcnJwjtbJqvvCtXar1l1TBTYH4SV91l0Mvl3jUDwvqjWFyW8HQob8
         JzAdU1YMuPymPH8G+JeWAcfg9x+NRNsJBM8Un3zt5jTaSTEMGuhALaBSBmKvC6NFQm60
         hOL3tyVM6m4Pn1/rcKrAs6s8d/vMq+/c57hXT8YbKaAaGZlROhWIhL//YRQCxwC0ObjI
         0jDVe8TfTajAdFKXu1uN0FUqwIzO/+MzCyVMlt51GchtgLNvgSBNOOtnMINkhHlmACdm
         /ahA==
X-Gm-Message-State: AOJu0Yw5oqmRBIfyv+jkEc1kGAise51m0zKdXQ4SpKcr+aHBpay1uKVg
	wc2MjJTEKrYn+0ZR7LXGvODH8OcLWIQB9KVXv3ooqvQaFwEl6YGauNAmMPCxP2U5veY=
X-Gm-Gg: Acq92OHhi3G12rxMQLVjdmQSRRzGRYV/N5AW5qrLWQoL9rGqiXtNfRUJznp0jDcFC5V
	+oxUy0Uq4TB7AtTjrlv8szuB1zJtwWt+YMsGeMqVAWLGCj3sTIdAG2a8/ZxmAIUaeU9kIJ66V1D
	PO/rEjn4XW0zzuh/9MnxTNW2vjmewhQepd8lBG0b/B/WnhbzunQZHJZTAyLe8GE59Sn+ZSI6hc8
	tkcFBjLEnQLV2I8tZ+YkgeQZawzZA9MtM2pOshhJ8bTEB1tCjjI1PAn6XuZhGM8BIXByuQ11ydM
	slFsKUFRnx8QSZeMDEvKs3PdML33PqU7LrTqxT+FNIV9huUKPN1prSD7iGU8a8zixuz0avAIj7p
	co2Mbr1zvXH7miNMmGAl+pZwLL0z2IUUcpjrXIrvqPU0UJHHTXmJjfMedFbiOlY023OLg14n1V6
	0LcmxfQVUwMqAMcTQr6yWTjBCErGpLU/bmxFrT4iJhIKEXKVtectSpT/IPacep2atmrvRo5V4D2
	bDf/CFNWX6/IC0oGW4RhhMKjAD5gO7IMYstfR8Ge2nRenbI3vm+8QCk7A==
X-Received: by 2002:a05:600c:4685:b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-48fe5fd494dmr41821855e9.1.1778836479930;
        Fri, 15 May 2026 02:14:39 -0700 (PDT)
Received: from satan.lan (ppp-2-86-144-251.home.otenet.gr. [2.86.144.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab52a6sm45668425e9.10.2026.05.15.02.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:14:39 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 12:14:31 +0300
Subject: [PATCH v2] gpu: add missing controlq (3d) struct listings
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-virtio-gpu-missing-structs-v2-1-c45dec740af7@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPbjBmoC/43NTQ7CIBCG4as0rB0D9DeuvIfpglBKJ1FoZijRN
 L272BO4fL7F++2CHaFjcat2QS4jYwwF+lIJu5jgHeBULLTUnaxlAxkpYQS/bvBCZgweONFmE8N
 kh7lvTT/VvRQlsJKb8X3GH2Pxgpwifc6vrH7rX9msQEHXNloNtdauM/cnBkPxGsmL8TiOL9X8m
 kbFAAAA
X-Change-ID: 20260304-virtio-gpu-missing-structs-dc8f75a7d370
To: virtio-comment@lists.linux.dev
Cc: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3992;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=BZsiTEt+yrXuKgHEOl4T3x9Fn7YGM1YqIxR/VRTVW1w=;
 b=owEBbQKS/ZANAwAKAXcpx3B/fgnQAcsmYgBqBuP/4ZjK4erzjJuNXrndgKMmuHTyNkSMAP6IT
 vZL+rfMB0iJAjMEAAEKAB0WIQTMXBtORKBW84dwHRB3Kcdwf34J0AUCagbj/wAKCRB3Kcdwf34J
 0AnHEACRdyJMdT/W4b6yQVHjyIHuc5pf2FsSWj8g9O6oifivz79t+cXv3+N5cRWj3yZPNIeH1XG
 h+zQm02xZpM46yVgLwshbgSeSbUiSYiKnqvxU2I6OPX/oC8czqmEobqkBitcUqxpZkDyERcALyP
 ps49gqYtZuv7GSff+BvZ4vh6fE8RgbyoZo69M5jrv8A17oufHAGlS9LaeqcxA7jB22v06VsV2JJ
 dy6ZHgBDzLlM69rFxF5RaHTKC+QeMqqDLqR6azqJK1JEG/9hC3MToRa4zyI9P6E5pbfB5jghZaP
 ttzgRF/4F+PyyD1BeSKQ5FZUwrOyv9L91iAZSuQ7iRxaukqufNmePq973bBbTzONUTRnzalcH7m
 YxHVojkxJMDeNyYRp2QiEUrsNwPH/+jwjqgG5O7uCw4/+GMT6s/9d8bwtNbjXQWNgcdYtugBeqa
 4UhB9CKRydETM/pg+oJziofiVRgBUKyfc7vuBHM/XH1+LeNND2StYkbixLkD74s+Ja1MhDBrmcy
 UtWIDGbHkkM8FO9Q7Kz/eFT/4htpve07/Sim/ZN4tPAetHXZ3RQHM/QYqCmDbupFJKLzvaxYf5w
 TeSrV2e6fxCWb9uZVLMVMSMe4cXg/COUIKbDLWSOjXrhKBZvzohUx/ydWNIV2Qj71n8D9IkVdmb
 hZCAsmk0oDqZx8Q==
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1

Lifted from include/uapi/linux/virtio_gpu.h with adjustments.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/239
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
Changes in v2:
- s/destroyes/destroys (thanks Matias)
- Link to v1: https://lore.kernel.org/virtio-comment/20260304-virtio-gpu-missing-structs-v1-1-654218322e6a@linaro.org
---
 device-types/gpu/description.tex | 75 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index ac3b427725f6036ca069b398fdde712cab833225..b61f298cfb82d2577f7e0452662c5b92a92bcb1e 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -749,21 +749,94 @@ \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / GPU Dev
 If the lower 8-bits of the \field{context_init} are zero, then the type of
 the context is determined by the device.
 
-\item[VIRTIO_GPU_CMD_CTX_DESTROY]
+\item[VIRTIO_GPU_CMD_CTX_DESTROY] destroys a context.
+  Request data is \field{struct virtio_gpu_ctx_destroy}.
+  Response type is VIRTIO_GPU_RESP_OK_NODATA.
+
+\begin{lstlisting}
+struct virtio_gpu_ctx_destroy {
+        struct virtio_gpu_ctrl_hdr hdr;
+};
+\end{lstlisting}
+
 \item[VIRTIO_GPU_CMD_CTX_ATTACH_RESOURCE]
 \item[VIRTIO_GPU_CMD_CTX_DETACH_RESOURCE]
   Manage virtio-gpu 3d contexts.
+  Request data is \field{struct virtio_gpu_ctx_resource}.
+  Response type is VIRTIO_GPU_RESP_OK_NODATA.
+
+\begin{lstlisting}
+struct virtio_gpu_ctx_resource {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le32 resource_id;
+        le32 padding;
+};
+\end{lstlisting}
 
 \item[VIRTIO_GPU_CMD_RESOURCE_CREATE_3D]
   Create virtio-gpu 3d resources.
+  Request data is \field{struct virtio_gpu_resource_create_3d}.
+  Response type is VIRTIO_GPU_RESP_OK_NODATA.
+
+\begin{lstlisting}
+#define VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP (1 << 0)
+struct virtio_gpu_resource_create_3d {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le32 resource_id;
+        le32 target;
+        le32 format;
+        le32 bind;
+        le32 width;
+        le32 height;
+        le32 depth;
+        le32 array_size;
+        le32 last_level;
+        le32 nr_samples;
+        le32 flags;
+        le32 padding;
+};
+\end{lstlisting}
 
 \item[VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D]
 \item[VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D]
   Transfer data from and to virtio-gpu 3d resources.
+  Request data is \field{struct virtio_gpu_transfer_host_3d}.
+  Response type is VIRTIO_GPU_RESP_OK_NODATA.
+
+\begin{lstlisting}
+struct virtio_gpu_box {
+        le32 x, y, z;
+        le32 w, h, d;
+};
+
+struct virtio_gpu_transfer_host_3d {
+        struct virtio_gpu_ctrl_hdr hdr;
+        struct virtio_gpu_box box;
+        le64 offset;
+        le32 resource_id;
+        le32 level;
+        le32 stride;
+        le32 layer_stride;
+};
+\end{lstlisting}
 
 \item[VIRTIO_GPU_CMD_SUBMIT_3D]
   Submit an opaque command stream.  The type of the command stream is
   determined when creating a context.
+  Request data is \field{struct virtio_gpu_cmd_submit}, followed by the stream bytes.
+  Response type is VIRTIO_GPU_RESP_OK_NODATA.
+
+\begin{lstlisting}
+struct virtio_gpu_cmd_submit {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le32 size;
+        le32 padding;
+};
+\end{lstlisting}
+
+\begin{description}
+  \item[\field{size}] the size of the opaque command stream in bytes.
+\end{description}
 
 \item[VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB] maps a host-only
   blob resource into an offset in the host visible memory region. Request

---
base-commit: 15f488c162107f7b52fb2e4d0f36a2349fe9d3a9
change-id: 20260304-virtio-gpu-missing-structs-dc8f75a7d370

Best regards,
-- 
Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

