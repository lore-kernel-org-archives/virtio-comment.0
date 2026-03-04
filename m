Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81825369999
	for <virtio-comment@lists.linux.dev>; Wed,  4 Mar 2026 07:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772610085; cv=none; b=pe71C6QXWcu3Wv9GMzdKyZjmzxFC5OG9TRHVZyUv1oux9CLHJzY+g731YB/Segk2CUiXVRvaRhk6NjggwWFzXE15t5WT454VyeL55L+9HfBqUUMzHFx8MAj8G1Xg/4cQNxu5q+CoW28KsLwWpLNkAaSgKMQOM78ORi4QsAgvBU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772610085; c=relaxed/simple;
	bh=EbQ9e3NUR0GxSy2K6vqzP8/ApU9DMGK/G7XW5oqOTKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VCknjIxMIvzxVfSr4POKTGXkLRiDOcNGfasObRXOgf7lIDpX931Dp+D7vRw7TJc7DUhooEuj4RtSeyeQbmUVUzcL+4c+tE+7xSnSG+VGSvDqMXKMJL5oyVCc829QMrwbkUwxST06yLpOt2yMEzUnHms16G5Ywawh/ZBlAPM9CBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MzZjJexc; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MzZjJexc"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439a90f194bso2925614f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 03 Mar 2026 23:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772610082; x=1773214882; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2BQIc6wYpD3bnz6QB0TVyXH5j1iBraG5YjZXyfyGUtI=;
        b=MzZjJexccGgLHD83AGDgSujuhaI3k4p0WjTJ21juVR041n2OQdZcUlUm4edxNbJjnO
         j6PyMK6ZHk1KCxdGPruZTW7o5bqVcTjrE9rHf2Bf9ONj5v+1GFZ2779tIwTHQQo4c/yl
         93YIYvzYCBNquc4RA8d65/vcEJ17SyLfy9Ep4yf67eQIgi8EfVDU/HDqcXbt+ZAN69h3
         jEng5+uQVwMNtm1W58ciCyOAIP8CrJvZmpRExZ+sm+5hHDtc6vQx7K1CD+lr2+T1u95E
         Owl32rcu2Bd+KpJRBz5ziyDC+s+goeaCIIqKlxCU+MzfzcR6zlIbShKiHzDsex5+aKmP
         iOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772610082; x=1773214882;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BQIc6wYpD3bnz6QB0TVyXH5j1iBraG5YjZXyfyGUtI=;
        b=rSoByqqi233KZdRnxy+OiERdPt3BxD/K4tNcQhcrjBohsQDbE9v0gYB9Wi/ymuTd9j
         PIHydXc2AoN3KbQrpW06t3O7byjpmDWWVbn4dmZgKEcQpmvv0/wkOd05KClNQFT90t52
         okbiV1tDb9zBnvcBn3Syb2kybVp4wPkstorL1NLe6r6AcPEWvWDX9q22Ah+ZggvNUJyO
         nVpg5Sj2XyqNXirkgaZXt+pTSbzRiZ3oz96UUar9xknhwJgrILXY1g8aSqJ0sG3uPFqy
         hAjBlH60WgNT1klf9sYCVUAplnSsg577yDQAYzayRHC5PbtB2V5MJHlITsytfA0Ok7VJ
         fZMQ==
X-Gm-Message-State: AOJu0YyggG3Mt9R3yDVDuZ6F5/oWDve8JSD5ueKuGyXLRMU3kgpbeiyZ
	LIfmKOsnxZikdNrodzZuBOMAS2WUWbjMg+43TeKRgRPmQdsZWxI+CqRg3ZWWNp1LVjJwjXClu1V
	G5uDulHQ=
X-Gm-Gg: ATEYQzwSpzqU+vNJuaVzG0pCBlRBlEBqh4Fji8WbFYl3QFqHNI07UFV3UDoV8i8xUDu
	FHsK4FUpXXFu7EcjKlg2oqsCqJG+zxFOxTQUYGtN8X3i1bx4n5OS1aciEF9y8P37P7v6QrvzWy3
	hq6kPDkSugRiMjHemFTpEaZZJMrIrOHZZaUQ0jC46dtXHbArP+V1IVXR9WGBJEytZQqyHZCPM8l
	qmEcYzRvqXoN9YZteNy1SnZf8ItZOmCMWYm6ejgFE/izPXEN/L+JpOPmlTXS5Ipd0/z/1iUtWHD
	ZXiQb49yjqzOvgMq7PavMOvYUmj4Q5aXKBgEGU493Kj0hkNmpiDUiEvp+pURdp/lgNB8UOTZIkp
	Zp/wVw3uJr7SFGgQxL5ikpG13rL7ks9YKqQXBFKGH2gWl3TP1nxGP3N48Pg6S+gUOoWHq31O29y
	PADjJOtwOJsht6kVq4vHMxyP/V+lUfl7z1+QTR2Dsod6uPAjqbgQ6NYeJbZO2B5jz3k3YvYAkc9
	xETJcIoSGmYU+LtrCAq5J+g+6YgxLQnRe3NnExwOpXMFuQ=
X-Received: by 2002:a5d:64e4:0:b0:439:c661:323b with SMTP id ffacd0b85a97d-439c7f65043mr1936614f8f.6.1772610081639;
        Tue, 03 Mar 2026 23:41:21 -0800 (PST)
Received: from satan.lan (ppp-2-86-215-248.home.otenet.gr. [2.86.215.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c4489279sm9012245f8f.20.2026.03.03.23.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:41:20 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 04 Mar 2026 09:41:17 +0200
Subject: [PATCH] gpu: add missing controlq (3d) struct listings
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-virtio-gpu-missing-structs-v1-1-654218322e6a@linaro.org>
X-B4-Tracking: v=1; b=H4sIABzip2kC/x3MTQqDMBAG0KvIrDuQ+tNIr1K6kGRMv4VRZqIUx
 Ls3dPk27yQThRg9m5NUDhjWXHG/NRQ+U07CiNXUuvbhOtfzAS1YOW07LzBDTmxF91CMYxhnP0w
 +dt5RDTaVGd9//npf1w9pmkwobAAAAA==
X-Change-ID: 20260304-virtio-gpu-missing-structs-dc8f75a7d370
To: virtio-comment@lists.linux.dev
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3761;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=EbQ9e3NUR0GxSy2K6vqzP8/ApU9DMGK/G7XW5oqOTKo=;
 b=owEBbQKS/ZANAwAKAXcpx3B/fgnQAcsmYgBpp+IgW5dmy6SU6zakaK1xCbZA1MOnLOI4lVqiu
 5lC2iP7eR2JAjMEAAEKAB0WIQTMXBtORKBW84dwHRB3Kcdwf34J0AUCaafiIAAKCRB3Kcdwf34J
 0JHZD/9oj9J7BLSDgCUYpzY47B919IXcgr17XUIkVpdwbYaUD6X5i1JuETQf6IJoTAIxXrmpzaz
 1TVzXtLi43EqBzk9vyDGx/xO/hrWVbM/mpQXueN3Zs3wxAaKT9/t5G0XRnqkBoMB77cOmPfW4bc
 h2FOFKJsfr1V86EJ+FeDcHCxg053efSOwjgp+yA1SXwNj+5BbJ6dLRloehXib/xwm/FuCOozDxS
 OPTIERJ15awmTTBL7v80asXnb09ooMuqlNZNx/yKtloOA//hCqa+KGMGvFvgBrDxYR2UINY+gYa
 B2h5VdOiamB09tfLSYAIJk37oownZ9ZROPWZnWZviErT6msqmzHhYcRX8WGOaKLSD0V7YlbVnoZ
 mfHZTWGjIwuy5L/3dJrzHTF6J6iuIBVL/iBXYD/zf0CPHtDUD3T8GQtaVpY1zijVk2uXQR3fNYs
 GtJNzsVJU4roxQuvglo5Gxlal3HcNUasjFwNLMy7TXjwVutuOLw7wyxUYopTsvAKLzDSp4NXjIK
 KE99TkIB4ADAmNYWqdFZi/2wQjE/VbnIczOvdwr5Bn8iHFD6AxrKjgDN1L151cbVlfAe9pcX8U5
 BQVFLG7t4SSzQ1GPZ8eaVdNzpZ7fvf0wO7K3IF5KWfiAYOcMuzFtudSwFno3U8rhYkx4YUzVwUq
 2sw6PjiJ9arqn0A==
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1

Lifted from include/uapi/linux/virtio_gpu.h with adjustments.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/239
Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 device-types/gpu/description.tex | 75 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index ac3b427725f6036ca069b398fdde712cab833225..5adf02c5ac9bd80fb0986bc3847cff0698f85801 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -749,21 +749,94 @@ \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / GPU Dev
 If the lower 8-bits of the \field{context_init} are zero, then the type of
 the context is determined by the device.
 
-\item[VIRTIO_GPU_CMD_CTX_DESTROY]
+\item[VIRTIO_GPU_CMD_CTX_DESTROY] destroyes a context.
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
base-commit: 1ba6e8108644d598cf9c772bac7b856fb5c7df6b
change-id: 20260304-virtio-gpu-missing-structs-dc8f75a7d370

Best regards,
-- 
Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

