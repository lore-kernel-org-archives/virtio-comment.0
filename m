Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A334B54654
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 11:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095216; cv=none; b=TEPBvaQM2hHc2JMBxCSkSHaD0/GLZUtk8qMbMHzq+OSLdmTDMTUOmEQ//dn84QX/U8HBjylIX1iiV8luIf2Lw9718Eu98tYA8A16NqoBvFVKmJmrW0I1rksxbmf/yF4pIIOtcULxppPL+KzgmQn/46tPNywJ//yKG0T4DSPOPo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095216; c=relaxed/simple;
	bh=M6zQlWF/Yuxz0gvY4Yeg6XV8O+yzA86I2PuzOgwPkdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=by2dVWA9tLTMpR6hajV3XDojyxB5quwCVSqrMKcurBqu1XKHQUYlKXMcgrOWxr5j7cNNjbjpp62Jml0r7ozdDRDTDpLeBU7Srb/wrj7tmXa+jKO0QMoaYroG2mbH7fq0dYlrWYMmh2HHZhbihnwiDvurppBXpmkfuRMEzLCUK1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QKUAV8Xi; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QKUAV8Xi"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3ee18913c0so305557066b.3
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 04:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760095213; x=1760700013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvxEIhMaSOM6dkGLfp1OP6jMfdEbmdhdtDs+2MwElaI=;
        b=QKUAV8XiwsRaSDPWexkr2TbHAHCnkjlY0gc5eFYB1kLiC7qz8lOr25gSqz8pI7zeiR
         1d8CXU1h+0Lu1XJ3FMvoAxzIwYQ9pxAFDDsAXBCebqSmVP/1VnLdIFqUMLSh3N5dTCpZ
         bolEa95bJRK22/7IO7TXScuDPtGswZLYQzQn+BULkrmI/jUkNorNQB6awTkpf70U87Yu
         e3Wtm5N4mYb/pstfOjfgSeWSNhW9CH8KSWrdAnIDfUdbSkiZTSxs4/s4dMBFQ/0kT+mj
         PF6HxCgtzTHdEJEJ0q/nymmkK7t3L/T2a8EtlFA0vli30ZEhYvz49hLjqP0RAUg740o7
         Moxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095213; x=1760700013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvxEIhMaSOM6dkGLfp1OP6jMfdEbmdhdtDs+2MwElaI=;
        b=jDNjzjNWVGPdodXFJ75HkpVAG+IOmMWPun73iOUnSIcK31gIT9X1Ey1bA09sAhp6Oz
         A7rz1tqfUfDUX5uDrAgmEeT3k01v8zIoSt7KuTn7F+TXyt50kT33LPksfWbZC/eNtkM1
         c062uLY8SZRfEwCes38+BDzckYSk70hMckQgXGzbuc42nVNc33pfLqHEUmRe/M7VQRXQ
         of61bWP0YwDCGuAH9hU0xF3Yl9uUKsypkZeJbfgMKijSEnYzspH9iy3dS9HxpJ2Ixya/
         iwfQjLxAlgd0OMCWR+43aICcZbhvsVjL7g+E6m7FaGcT+GCCtHOmFWDZlWUfIoSQakfQ
         cTjg==
X-Gm-Message-State: AOJu0YxqImpfh+9ahKEDf+lfB6Ri4Pi+W/694q3LSo0ybPeoiv+EvBSy
	um2FDy2+Cs2iD5S16RO841kwVtwuIIsfG040cjEA4ObwwyulvcQl8OFNmLqqylnOYQU=
X-Gm-Gg: ASbGnctmJXMiNLr92SUWuK05xT1Df7nCogd+07jaEHNI+IK5IPG8DnBQ+7es+0iOX26
	4+wrZFgwTwyazdBCeL80O34nwnkSdN9i4I1TIQk0Knugxa31WnPhdD+nzeLiNEoH0QD6trqW3E5
	5jbnInaE90igWQ6tHNx+pyjM9NIQL8fnWibxDiCb0py/HD8jNSGePwQbEP6bL+M6q/wynZPH3kf
	ia8zCzHFL5npUaI9AwcM6kGXpnsjy/0srPi92fvblvgoqmPHwQIaCE/HVrsgr3lB3/N3YiLmpmi
	JFlVOA6grsZctr3zBFmP/Ej+ueK3XuWXGp1A1HGO1RLvJchx9GrErnkwxorKg1W00w89XZZP5N2
	/wVJsT/o6K2vqGUUu4GyjL9XRo0z8Uq78tlKKRRbpT9JIbEgCebmYp7CI
X-Google-Smtp-Source: AGHT+IGO5fSXVxeK6M1qB1OqrHa+22WAi86Pwzg94L1DDCyBybo73ak8PXFTG4MCLBNbrOBCivLqYQ==
X-Received: by 2002:a17:907:948f:b0:b07:c90a:8ade with SMTP id a640c23a62f3a-b50aa08f896mr1218591566b.20.1760095212896;
        Fri, 10 Oct 2025 04:20:12 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d65d6d74sm208820966b.29.2025.10.10.04.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:20:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B43ED5FA42;
	Fri, 10 Oct 2025 12:20:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Parav Pandit <parav@nvidia.com>
Subject: [PATCH v2 03/10] REVISION: update to 1.4-wd01
Date: Fri, 10 Oct 2025 12:20:03 +0100
Message-ID: <20251010112010.3880438-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010112010.3880438-1-alex.bennee@linaro.org>
References: <20251010112010.3880438-1-alex.bennee@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The state of the repo is currently working on the 1.4 specification so
anything we generate should reflect that. It will be updated again on
the official release.

Reviewed-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20251008145916.2626143-3-alex.bennee@linaro.org>
---
 REVISION | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/REVISION b/REVISION
index ba56baf..e3c043e 100644
--- a/REVISION
+++ b/REVISION
@@ -1 +1 @@
-virtio-v1.3-csd01
+virtio-v1.4-wd01
-- 
2.47.3

