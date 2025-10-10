Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6D42FC00C
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 16:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113747; cv=none; b=cjmb9/tsru/IMQ+PClpRnzZ0U4VIhdRdkPT7JkEvy5TrK18peBubYL7csKhQ/5ZbTEs171x2ekYIlDf00tRV90oxuXfEWSsSjWWWg33aXEBVRgQOTr/jqqKe/mbFNTSJ64jaY86DPLxkL0IsHbCfYZjP6LzVvysDLXUZ7UVtVZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113747; c=relaxed/simple;
	bh=6TvROzo0Pjfu2C5JBls/eGPFDDPhAXjBIYajlVfETwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b+Vk4qwtmtgf4nDV0B3p6o/c1fxixcrdPVGs7l91TxLSsJZpagfQ67Xk36CZcFbfQaL4J0kfBlxm4GWXF+1ONvDb2cKEUFeBSYpDO25jDjXTSa/kYaPvK3VwpsXH19soMqr1VnxPC+wZk5UwCj4ul0ErF+0Fud+x30PzqBq8xCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s7Y62iuV; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s7Y62iuV"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-637dbabdb32so4331754a12.2
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 09:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760113744; x=1760718544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMi57zvZMSPEOre9Mu7JegMheY3kYtQB1TIW1usT/uA=;
        b=s7Y62iuVjkXhHZKA08As5vVxEFT3MP4WBPuIiU/nD57Wz53wC4uH5pkWvctDz5IYBS
         wei42YrjIoT1b5kImnbYbSZeWa0g+w0PRxg7G4SyjNWet/NB6iuA8t8lyX2VlZLw9nrw
         vq+a8PPohTPWU8Acgz4MU0dOcyV+IaVIUSCM/1jEaMbpy5Jl5/REZBet1xlRi2LTlMJC
         5/xF2nyQ5wnYiYzx5gKISkO2TU9JIXiFX5ncZJydDDDQlXurVJANuE8rYMf9OgUh8HV+
         HDuc7r+kgleuHmEBfglaqjjlFDcvENTv8lz6QRuXRN5n9qkbNTa+toQwAwd28h3uu8ml
         ivhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760113744; x=1760718544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMi57zvZMSPEOre9Mu7JegMheY3kYtQB1TIW1usT/uA=;
        b=I9BSHMP482b2JdxsVZySCw70R3HfwhU3MmVH1j49OW6y2losRy+WFVS6V3AyWxp6Os
         9Kb0MimrnLeCXetZyxvpHiu0apGKYLzX1pk6flOmOUHtVRtsEzVzmvLgCgLfSYSDYq6+
         HuTzVNEFxLBPt4DAwIrIw0m/j1VMCrR8SJIxubX/01IKSZrQfUhzVnaZe6/sp2tMghFN
         b92+9nOKmj4oOkkVwrzYQKfSu1G7nnJN/FU6MFR1mxE0kBJXkjORBDQdPHviEgBh2/bH
         PDwFUn5o8HklNGU2Z1mJ/sRlvrwHxHLfNFe5LPPAvOb7X1LJjOnhUIJvoYZAuxPU6Sbk
         uQvw==
X-Gm-Message-State: AOJu0Yzt6rF38J8OHcAI1FT0ldEG8M2RTi61rCgDYGX6rkCIFtv9qBsB
	L/QRdsL5WG1FgGvGOb934k5fapdj8argSZTMz/Q+fY9nWlaHK9v4aHxM8n2Mo8ChEFo=
X-Gm-Gg: ASbGncsD3aYsD6uk07vHWiwa/LRrmsQM+/ALidIEToRsW4jRenj2SxRq22pJx/qZ/hT
	HCBR5GKZqNHVO+dnBuimjyl3CYzirElpjO9ARckfmH3RpiS56tyKJ5OaP7XP2FuN0uAW9IY7B9q
	eaCUX2qEN+4DHbacpK+b0Sho+BMl/bAFrmRvMG/6HOjw6wqeYNDQ3gGET3iWPftGddHJTDPX8wU
	iTVjgALlpYEofbjY818BSrHqMdY2YRTHkC1sDOlbKXAKH8ZVURvfToEnenX2XxyR59EwBzsh3HV
	YTIZNlnoIgmbUyBtdBRetCLnhbyz3lJnPsdci3m0nFwbrGXvb7V4hsWcWI2ZBfzND2Il6ksfJ0h
	Myw+wEH4ukvlTXE9lxDrJD+QTdnhiigjvyUeWRFj8maZyBQ==
X-Google-Smtp-Source: AGHT+IFMk0C05KZ9pEsjb/HTDu5w/igHobuqk9vw/iwScnMVB060HaEsuSCXjMHc4ZiTb/Rl9TFBpg==
X-Received: by 2002:a05:6402:34c8:b0:638:afd9:e96d with SMTP id 4fb4d7f45d1cf-639d5b43b2cmr10472075a12.1.1760113744314;
        Fri, 10 Oct 2025 09:29:04 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c132b68sm2749738a12.31.2025.10.10.09.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:29:03 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id AAE355FA5C;
	Fri, 10 Oct 2025 17:28:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 05/11] .b4-config: add project defaults
Date: Fri, 10 Oct 2025 17:28:52 +0100
Message-ID: <20251010162858.4107388-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010162858.4107388-1-alex.bennee@linaro.org>
References: <20251010162858.4107388-1-alex.bennee@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

b4 is another tool used to apply and send patches. We might as well
set our project specific settings here.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .b4-config | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 .b4-config

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 0000000..0ac4110
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,9 @@
+#
+# Common b4 settings that can be used to send patches to virtio-comment.
+# https://b4.docs.kernel.org/
+#
+
+[b4]
+    send-series-to = virtio-comment@lists.linux.dev
+    searchmask = https://lore.kernel.org/virtio-comment/?x=m&t=1&q=%s
+    linkmask = https://lore.kernel.org/virto-comment/%s
-- 
2.47.3

