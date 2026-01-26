Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24C42D738E
	for <virtio-comment@lists.linux.dev>; Mon, 26 Jan 2026 16:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445157; cv=none; b=egHDpEr1V/8t7rRtuua8l2qL5JcoWOgN+hsbbvk6O2vRzIBNZ2OH+OwcZ1DjTaZoyRw3HHLeWyvLNtwPHJ0DRtWGc63MCqp6jU5GfF9PFmHvOPz3VSpSuG7rMtWYsmvSzF1fc9D//J+sAAXnhK2LrdVIfsQ4uWBs2dMoTXit/q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445157; c=relaxed/simple;
	bh=HtDTKdJjDruSGzhucK3Z3Xz+TPcnSxlDzsPWYMRqgTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PfkUd4H52FwI8WUsvVSvbn7+EWscsZfbAD7HZxQnxE2lHzDbBlWLJ0n44FiNYZ9XSK0bmZR9dCM7jHHyRO8E5H5HzCkYSL9zR2qgd/annIHXUwIAgYzTqzUYGFRXxzcn6GJTuoCU2KS0bzw/5sLY+pea8BCM5nyQFzVIx77a6R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ouVoNE/4; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ouVoNE/4"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8c655e0ee70so595868385a.3
        for <virtio-comment@lists.linux.dev>; Mon, 26 Jan 2026 08:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769445155; x=1770049955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ey+2/gwDds+yqbukQ7bEwLFGvb26xRb1MO02etGDGQ=;
        b=ouVoNE/4UVIn6bpMCivUUABMvv9ExxinOjt5/kosm512anmxDCkHwngwswF0XGUdpT
         sMWtBLfbyRBM6VOuLyLVPSwsHMohxOQUNhmlcT+/texrMl2JQxOdO2Jbz5khqMCXYDI3
         4UQkzWT0eQBkMcExrbj9YlzIHLjWzjeF8mGnfRj+/YEYJYD+1JyC6l5S91t3KBBCQl2m
         dk0OpC/G3MxjGA1JYJ+dCt1Q4KaOnF5cUKFxrMZY26R7Z2/jazeE42NbvieewBrwUbNw
         zEOJCWRS1FvsptaNK4q1PEImtPxqarWTTmtdBQUt6XZ7iPHiwZxh9OVU1iz1PHABufm6
         r4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769445155; x=1770049955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ey+2/gwDds+yqbukQ7bEwLFGvb26xRb1MO02etGDGQ=;
        b=UTQY8JtNKPIlTAHCIKsW7Q3IUbd4cqYepEUdaSWzG1gMOsvBmQFkA3wnqpvfoFwaE0
         0ZIjZ9Exq7+ZhzSfPTTHsXj+iE004pvnk/h+W3ZNVqHr0Fpii6kFbs0lWq1MEgw2gP/U
         z1Yk0SZ9pzIgQLYz+2ezqOxuXiOQWW+VC2zFe6qA/IJcb4+0OdHkZsCceML2ba7SEj4U
         aIIzDz9gfUdglI8aaWH440JMX/J+ugKNQFiNjmeZgS72J50QwPB80RG0/I5INxUMYe7Y
         1Vf4F2wtpp3MK5+IKuYmKjQpWSEI9rajcRfhzvJz4+1O3WAAkRHcMhx85uvMQrPxoKf3
         agdw==
X-Gm-Message-State: AOJu0YzmBykMqAYxei5QLKKySGDT5rgis+4t2dCHVhd5zL6J9UjOQffp
	RFUihT0TfYBWsjgMw7epP9sq2Ugo77zeosoE7tfr0Ujkj5dv88qIgmw0nwVxwi7UKw05/1GDO/9
	kvCfg
X-Gm-Gg: AZuq6aIz/xc1Fz5g6urydL8QC+m/zVzJWXvy1Nb9x6FJ8ejnrVZPAANUaU0Obt2ILEu
	Plnpw23VIyBItSUTJ4x9YRFMDRoOPuSH482rZcrMlQbBt4e0lALhHHZO4c55UsKyJ0oR4PMTu3V
	Z8oEi4IF0LhXD90hMla+LzUOwWztP5ji83w1ZZd7VKDBkQK37C/AXjhHBwLJHk38ntGWfbr12Zr
	NJAfNDuVaFLDWjXOMocDGc5qceu2Bt/0dO9I9QVoGs8yxalQZZzR5QUcHZ0+DdaoAZeNO1B6+K7
	ho13UN40wEzcz2093Ggabxt8JqbL7HuYvduOYuslsAEOt2nMc5V/xiu22tkpNnYWg3uX/7h1/nw
	SfGRPd1y9Nbijyw4IpZNPklhGRo8rkxik8WEdHkZhuycITacqHJUc2Mv1MQaPdgG62cg5mK/6FF
	+lQd2MAIhOz++3fqlQpJPZjZD1GSsNXERHbA8XJjALQI5B3HtXg0WpaWA=
X-Received: by 2002:a05:620a:4409:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8c6f9619dcdmr530248785a.38.1769445154702;
        Mon, 26 Jan 2026 08:32:34 -0800 (PST)
Received: from rocky.home (pool-108-48-78-67.washdc.fios.verizon.net. [108.48.78.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e37d1d6dsm1042321285a.17.2026.01.26.08.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:32:34 -0800 (PST)
From: Bill Mills <bill.mills@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>,
	Bill Mills <bill.mills@linaro.org>
Subject: [PATCH v1 1/4] virtio-msg: add new command for bus normative
Date: Mon, 26 Jan 2026 11:32:27 -0500
Message-Id: <20260126163230.1122685-2-bill.mills@linaro.org>
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

From: Bertrand Marquis <bertrand.marquis@arm.com>

Add a new command to have a standard way to define virtio-msg bus
normative statements.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Bill Mills <bill.mills@linaro.org>
---
 commands.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/commands.tex b/commands.tex
index 25ea8ee..122a97f 100644
--- a/commands.tex
+++ b/commands.tex
@@ -7,9 +7,10 @@
 % How we format a field name
 \newcommand{\field}[1]{\emph{#1}}
 
-% Mark a normative section (driver or device)
+% Mark a normative section (driver, device, or bus)
 \newcommand{\drivernormative}[3]{#1{Driver Requirements: #2}\label{drivernormative:#3}}
 \newcommand{\devicenormative}[3]{#1{Device Requirements: #2}\label{devicenormative:#3}}
+\newcommand{\busnormative}[3]{#1{Bus Requirements: #2}\label{busnormative:#3}}
 \newcounter{clausecounter}
 \newcommand{\conformance}[2]{
 	\stepcounter{clausecounter}
-- 
2.34.1

