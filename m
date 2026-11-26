Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722403;
	b=x3uHLiNVZclNpVG/e2fVHSBySfds96R5DCatUzkb7XvBYFXAiLdqI9tt5FbCQTN82auP
	 Sfmeo0BcocSyhZGyBj7A1E4JQD1g9vwmRx4HC4NffHbRBx5UCidAx6UAHj0n28+s/Rjbp
	 pPrfFK0u1dkl+1xxQr+p5Fz4TaKBbFgkME4K3l5hw21dYyqfex0g9yPLA+a06Pg3K90HO
	 RFH0Io/Dnvo+UHOiLUI7iOYzfxqCmvNUVPMeWh0zyGTUt0azmvy7kJMkfMXx9wmqRA0Ge
	 hRtVGNYP/BIiD4xD+IOr7vWLmjIO+9x1PkkULpAQeLtWeYjJa6pQ9Lu+io6seXTxijw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Gy9z3CLwadL3CfU5/ZQyW7RbOiSje7xMm7zT/POXpu0=;
	b=dUIPAnIkuyyfFpVHB1CDx0atFMORsG5ebLcLlI7T6zNtrK319sgcMMNlQOx7jHBAGrrx
	 FqYKbnMeJ4dz2/jyMGhBKRZyX1uJ37nbxsxeVBQC6tUaA9H3kbGxFPiGY0auCRz0t5y8U
	 bOkc6XBl66t/tAbMbNmcYOrWk7uzlXKozBso+5L1wcJ4t1J+1e4QyywOxsH/UNR5/0Pl7
	 l2PDXDsyjMIiARUYzACaL84WNVVkTgimcBNPo7SdEOP9KVrzm5CYEbuZ2v26CNTwTqiHF
	 ObabgpHZr2O+0qDFWIaLATE/OAeqI5zEaKV39gpxua2r8hTxn2zQ1z8Ii6ymiuZyy9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mC6ZNWme;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30016606A32A
	for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 19:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30016606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mC6ZNWme
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so4064198f8f.0
        for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 11:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795722402; x=1796327202; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gy9z3CLwadL3CfU5/ZQyW7RbOiSje7xMm7zT/POXpu0=;
        b=mC6ZNWmegbSKiEXjdcxrgb659iyum8wVTEaqcfDsebn3MHqXpBnDwUVatm7Mq48o+w
         SCyoKEuAKBS4RnCMrLXIfPzA33bdTfnogYimfyvdwsCTDgrleVq2S3YgB2RQA/0XI+8K
         Qp5QMvqU0CrIZT2Cm7gDekMRdNf2SM6NaM6Fw/ICLMxZ/euY165V3aCXBhM1e5zRCBxS
         qojIp6tWeFd9EVmoINZ9plBufSN3KgcR/oe2mndkJP00DyziwYZRE4AF2auJY5ozjuAW
         xnflxkM52uyRWxbWlPEiLe4XEc/p03/HOvazvoEcVyemN3aA6UXiWONbk7iEX28YBFTx
         WFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722402; x=1796327202;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gy9z3CLwadL3CfU5/ZQyW7RbOiSje7xMm7zT/POXpu0=;
        b=kp1TWyZUNLT8Ydtlh6sRurjHgfN0s+frgnoDv3hAdbi3yjvV5iUNqpPIlK4hgg5cXk
         uViuEY+z7Ll2Yd1I+bqvC0M3Wz9q2nzgyf7zD4R7Mq3sE9Rrpl4Il9OuHrrcB7UDSLTR
         Ewcd/EcrGA3uD5q/tfEzpJEDyA7MoKLnXIbf3piHC47cfzvCdp5aQC9kEfOoVs2jt8vk
         hwEZoxg6gYXXRBGhRbAcY0L1qfypNEzqlwcVaRNDOJxPiEwvEGrxPJKeNmyNbAlx08aZ
         IkY5E3UKTkKs+/T51HXKsAaKUxsglrQZyAgdOLsvnTVZUd1hgBJLGiLCI1zqgmeHC8K3
         rk9g==
X-Gm-Message-State: APuU4Z8MKxbkxD8Dvb0/XC/f9o1B0S/OeGiJUOazbx5+za0dPyui0Jxe
	YklwW4Gl1EE34Mn9RnQBDXWsk6aHJMWiFx1ZzVmRXHYttrglq8L6Ev0B/Cs32mUKVxWVMZ/POY+
	Q3wFC
X-Gm-Gg: AZFdTZeC5gWXlUM2iBE6Uv5e8UU1YNpTQB39oInplW2kcgAlbNn4x93Pr3MWL34t24H
	wusRxqLjtMlSbYCFGvZEgG9rL6FeMyoOOykGvm4p5tO6xF8DSd8DmlSsrnpDEEE9jBOeCMl0wRf
	X2g99lKyaBKrwSIFKwmyaoKnGH2rNCMgNa2uEE1UkLz3X9HMECOsGYqMINJsY58bV6Pzc/kPNSS
	HVQozU0q4WOpm+Sf+S89PE4auxDR7BRRSAFEHfb7lPoH5SUHOzgao5J6MlP3UYcMRP1tU9uJ3WM
	fbroEGg3xWlCuOrmrJXRACmoH/g9rythzE7qKMDHNFqOtDkFN7gJHR1V2kW2vm81hg+q+uvzNCH
	thPpGj1VKF4zpPXMEIJfYqs3EMcMTm9I+Hw8N1PGBfQFMTTS7PsaZzCM6R/SrfsWzHc1ZkwX0xv
	O/weCUgHRgvrOlznblIiU5YaN7LG21RamHIbJUXpJgYcJe/r/1wJyzDbpkEAN0ewfLiYfEhO7FI
	XWdBkNjn/NHNs8QEG39dy3YMXUsDyu3s1/MFwNh3PC7Cpmc8DyUQpAC5GLevCRlRy8xEL81/RVf
	Bd5CFypSPs8WGb756w/Y4SEZlSRzFrHfpnr5qRWwGYbJt/8JZA==
X-Received: by 2002:a05:6000:2886:b0:4af:9172:3238 with SMTP id ffacd0b85a97d-4af917234abmr37184250f8f.43.1795722401640;
        Thu, 26 Nov 2026 11:46:41 -0800 (PST)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm40820121f8f.36.2026.11.26.11.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:46:37 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0F5445FEA1;
	Thu, 26 Nov 2026 19:46:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Parav Pandit <parav@nvidia.com>
Subject: [PATCH v4 11/12] Makefile: add some simple make automations
Date: Thu, 26 Nov 2026 19:46:31 +0000
Message-ID: <20261126194632.2429425-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126194632.2429425-1-alex.bennee@linaro.org>
References: <20261126194632.2429425-1-alex.bennee@linaro.org>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is just a helpful shortcut, especially when editing the documents
within an IDE which will offer up make targets to build the documents.

Reviewed-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - rename local to draft to make intent clear
  - update help text
---
 Makefile | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Makefile

diff --git a/Makefile b/Makefile
new file mode 100644
index 0000000..f08f13c
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,34 @@
+# -*- Mode: makefile -*-
+#
+# Basic Makefile to aid automation of document building
+#
+
+.PHONY: all draft
+all:
+	./makeall.sh
+
+draft:
+	./makeall.sh draft
+
+.PHONY: html draft-html
+html:
+	./makehtml.sh
+
+draft-html:
+	./makehtml.sh draft
+
+.PHONY: clean
+clean:
+	git clean -fd
+
+.PHONY: help
+help:
+	@echo "Build the VIRTIO specification documents."
+	@echo ""
+	@echo "Possible operations are:"
+	@echo
+	@echo " $(MAKE)            Build everything"
+	@echo " $(MAKE) draft      Build unofficial draft"
+	@echo " $(MAKE) html       Build just html"
+	@echo " $(MAKE) draft-html Build just draft html"
+	@echo " $(MAKE) clean      Remove all intermediate files"
-- 
2.47.3

