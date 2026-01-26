Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AE62D738E
	for <virtio-comment@lists.linux.dev>; Mon, 26 Jan 2026 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445159; cv=none; b=mFgqtI2ICetIxf0INckmAqAmAZis8+M7HaJEoEIIwExoUgJjr/cma3Raih+Wa+10FUTDBp5S2N5lFpPZKQgARtustFkoh02Vk2pXbPsIDCbyZMnWMNJBLHuPjlrKYPv1E/bO1bruCP5pEG6W8oeMODUg85DDgyaf5SqoqmxIn7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445159; c=relaxed/simple;
	bh=nv8A7p7wTcKtsKE4Jgv3S5WqaEImWSbeinitU3u4Iyw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lBDtzBAKnMpYycK4uQHDu/EK9hCWWeVRxuIZkm4GvJS6kgMiCQaMqYiYQC7/h0p+44H3iDTI4KlFXWGJScU9ku5GgjGpag2MbjiR8sS5QVTWx4Qg2uZwPWT79lkfsGjwGmQDOTurlIDD4IQkYonCP6ahV8HQCYIgb7L2ldZWkxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bToxlPxz; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bToxlPxz"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c59bce68a1so321047685a.0
        for <virtio-comment@lists.linux.dev>; Mon, 26 Jan 2026 08:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769445156; x=1770049956; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjBw6F/faesGwK+X5MaAAKo62uAYT1veWQcXNS5SRu4=;
        b=bToxlPxzD1XBq3epa88h4sHyRUKsoEDo6iJHfnDOB+AJg9vPYWaIS0Cyzr5LkDXBTH
         MTy/YVzsRksCpvW5tLR1vL3FpFK0Ii5W6V8Zvxwic2/VZ0cS+NoXG2w4MT/FtS8QAtCL
         9rPprjWQ6SObnULjrwDFaDR02+43PyitbX0I5KaKkWYH/6mo8WALCnjW49fhyslNH5Hl
         aD3AcN0wR4XTfKW4CAbDZ2blshBbL8y9r4RRTTK8Ybil8gvfxwvscHmyyCa98mA/s+1w
         QD08nEUEvXV8ykvChDiTL/R1Gj+PBlQBvFDF4atQe9VPxRnHfwPU2pCRPQVQUMqNkxIC
         hlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769445156; x=1770049956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KjBw6F/faesGwK+X5MaAAKo62uAYT1veWQcXNS5SRu4=;
        b=s8EAIW2k1EgAhID3QZG4s5GMEZi1vipB0nZlEXO1wEBBakpbpMnl+ZvKVw7GkpaVZe
         6b2cZXo0Tv4bpmekXuVigSh0Exls1u93gxt8fNMsQv5MXkOkMXDZ9RldiOmVLXFIFRgW
         CjWaKtDY6m6vO1zkVUmsHq8TkD9UeRrUnh2atFsrj8XMqDvfew08qNQWvOiXhYjwYjVs
         aPpoKHDhhizP0yX/i49Exo2ixrgl6m1m77ERNmBr9M7O+pUdfaw243MuEEiCMHwOQglv
         uxL9hgx3KRl0Qi8+EEMfkpWzvv2Vq8B1MCamUorZcruj20oJIUKKY1kC7Hnv66PQOTtZ
         BCfg==
X-Gm-Message-State: AOJu0YwEjQA8H7hvuu6lO9Jp0h54y93fdDyYO6X1BzYlRj/5I9phIJvF
	vR141UzQpfoHyuz6v1cKX5nzMqtWxIuiY0WvD8IOHCX6KLLYO3J4BRkHvwvd6ieocIwlk2O3ajG
	oWV3S
X-Gm-Gg: AZuq6aLbIga+ojpsXgzWALOyYFr4Tm4x9QgWT65rF4up80N17XaeUEkCSkbcm0jMw7J
	tWu3F2GxEyW9JRX0OPVF4pceIGCQ4pkslXEK5XmgqsTjgT6WLXG0YDVhe8tsvPPC5RHCHZFpKJt
	gVbSmMIq7IsDv0+dgkj+PDIVA4UtBbUBrLG6YMUYC7RNoiyel7PKtjwa4KHvBaa/haBPjc3d21k
	H7eoRX72+FiujeEQlPRd20gnCgk6RKAzVGC8oM5s0/n3TBiCS2gn740uPveqGM+Ejbk4fGJ2J/X
	oaPYFE7MfUqhEJhSzpPRRL+n7IDtSGkN1A+EQFrAjHj5b0hK2hJnuVe0X4xJYChGkIfqj0xEt+C
	3T5s94Naf2+Z2n7QjCoiQbyfqhhKZDmKYcfVJLnXepwQkB2lkm6IgHcgR1JHGEMhoj41QRWBZZG
	VKc5LzmtEPlslOK0+92RhETIn6jnswpb9TP62Tunm1cja5MHwYk9Up2Jg=
X-Received: by 2002:a05:620a:2981:b0:8c6:e37f:ec2c with SMTP id af79cd13be357-8c6f9565d4dmr624712785a.1.1769445156405;
        Mon, 26 Jan 2026 08:32:36 -0800 (PST)
Received: from rocky.home (pool-108-48-78-67.washdc.fios.verizon.net. [108.48.78.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e37d1d6dsm1042321285a.17.2026.01.26.08.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:32:35 -0800 (PST)
From: Bill Mills <bill.mills@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>,
	Bill Mills <bill.mills@linaro.org>
Subject: [PATCH v1 3/4] virtio-msg: link virtio-msg content
Date: Mon, 26 Jan 2026 11:32:29 -0500
Message-Id: <20260126163230.1122685-4-bill.mills@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126163230.1122685-1-bill.mills@linaro.org>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the new transport layer into the content table

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Bill Mills <bill.mills@linaro.org>
---
 content.tex | 1 +
 1 file changed, 1 insertion(+)

diff --git a/content.tex b/content.tex
index 5de811f..c785c5c 100644
--- a/content.tex
+++ b/content.tex
@@ -693,6 +693,7 @@ \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
 \input{transport-pci.tex}
 \input{transport-mmio.tex}
 \input{transport-ccw.tex}
+\input{transport-msg.tex}
 
 \chapter{Device Types}\label{sec:Device Types}
 
-- 
2.34.1

