Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62DB303C8D
	for <virtio-comment@lists.linux.dev>; Mon,  1 Sep 2025 09:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756718557; cv=none; b=EHVPPxeiNWFHUpCDrMBmiDbIN9cfMOwPFqK3TCmxTcnTmLQO9q1Ku+C6Jrljcrrqb8V/kUCZnpuxGB4j90wkL5lZJMejNiMB395IQZnZOHNXXG2YXmVi5cQuO2iPUMNQSqzyEYU9dL+HVzBQvWWyi/Cc2+kivzpqZtkI7vvFxfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756718557; c=relaxed/simple;
	bh=lfqHLz7TcssLZK+KGAkWOFbE0JIGO3JxTCzm1ODLA5M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oBIRdl2f5Pwt61qlR8Ou7dGYUR3KQRBskX77VxEbPBVpz5iWWnP299Rgq0mXktaCsNE/vHaXZ6yVJ5eqqVLlggoBdAR7Drj4wRYQt/1WH8tTn7e/LfpMBBSc6MAEymWSq2TJ2LhX/dX8jx6f2jfbk0JihOq7qa+knOYZMrrJZ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E7yhFCVq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E7yhFCVq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b8e28b3c5so3205155e9.1
        for <virtio-comment@lists.linux.dev>; Mon, 01 Sep 2025 02:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756718554; x=1757323354; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfqHLz7TcssLZK+KGAkWOFbE0JIGO3JxTCzm1ODLA5M=;
        b=E7yhFCVqBQaI2l2uApLC9FliMX6hex7k+L3jJzfE7Ro+ATWXS5XK80I4Sp+AE2dGzE
         O9YVs+ZmgEGl+JdIHkXXctHr3oaXPSQV9rI70J0vyKCwr+1u55eKZRPeH6Lf5F7CilQT
         m2tlwdus5a7E/BBEmNji/8jjzjddgOgwr67n+UtHEyKABR8T8R/YeN7H96nmaY/b71hP
         GrOsjjZvyGemUVIXhA8j6r4F+qdyASzeJIrU5XGPAg00AiD/wlT0C5ns5GCzSJGujZXA
         WO0oclt5/5DGlENkoAQ7zgG5Fim9BO0DW6Cwa8wXkzuHJwLw/ez877qL9UyATlBGzdLn
         9IcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756718554; x=1757323354;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lfqHLz7TcssLZK+KGAkWOFbE0JIGO3JxTCzm1ODLA5M=;
        b=rQsHqAlxsWRx08PZ/Yi7gHe/uEeX6Ib8N0gkanqj8gqVmeXhdZa0OSYz4tXm3gsHUh
         CSGthPVVasSv3ekRL/swRRNLiqyDfJRyzyGQwqOR1+FQgWhJbRUkiY054CKwcKMVqEdt
         bLDvlwL8SHCRtuQZCooAw7rD7NSsGcHD6VZLYW+jGyC7rp7ewzPsBC4T6RqPFnBaEOvU
         B2GEmjtDfG48m5hy8XWlTnwatg0Jqky8tGOx/MZyjvScJMxdHkMX+zSZ3+4iTY5SONAr
         3vvitsqu1fi4QWSsueQTT9z8yE0enWT+iDizeAcN4RCI7woMOpQgFscNry8NFKNTn6jD
         rzgQ==
X-Gm-Message-State: AOJu0Yy1RTWgdRS1sDEG86d1/slFmLhZFieiH0c+xgPpy4SBwbV1RPQc
	rkgYhCOZ5bKwK0B6SRwXpn/DyuPnBLZDxYBaM+CmGUlZb/m5/k1XTYARX3nX8CemwBvfPB/hy/l
	h4gQUamQ=
X-Gm-Gg: ASbGncur+2jVdqgJxkQdL3sMjB4k+WJS7I7ktAQvykOTcMnObvP9KjwRjma4CcIpgrZ
	3ZiH+uuWPKuROAMjDcmQqJA9SF6CvfHQG1dski9agyEdu53Dr+SnWp/C01Zxkdcd1eTYzBk9a2v
	5/tln6yjWK4Snbd7XhlyTEcuafAqa71c9uWPbySmP+Lta2twnBbBfYrcR0YGUOUWTHuBJx4XKbH
	BObrDKl5yId5Av5OmO1Puicp0RIhFhuLw8hUuML1vntmJaRs7ZXfRy8yOLr8G2oEMCMWm5/eo09
	r6XppNE8vzoCzvilLvXp0DJaDlEVRG8U6ol6c0tOGNQZ6azqA45FTBV6UekkGAamlQxZUnpkr50
	tYHZY74xsXiKUB8P76i4Urqo=
X-Google-Smtp-Source: AGHT+IFNAxPQhB4daCdAtJdiWvNI/2ertgDf/NskLDxK2LVdrW9MZKoUH8tbW1KclPvaB7GjAaHURw==
X-Received: by 2002:a05:600c:3225:b0:45b:7d1f:98bd with SMTP id 5b1f17b1804b1-45b84c58680mr40204115e9.9.1756718554018;
        Mon, 01 Sep 2025 02:22:34 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7a9404c4sm96341935e9.10.2025.09.01.02.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 02:22:33 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 42D7E5F7F5;
	Mon, 01 Sep 2025 10:20:37 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bill Mills <bill.mills@linaro.org>
Cc: virtio-comment@lists.linux.dev,  Bertrand Marquis
 <bertrand.marquis@arm.com>,  "Edgar E . Iglesias"
 <edgar.iglesias@amd.com>,  Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>,  Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH RFC v2 1/1] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
In-Reply-To: <20250620224426.3923880-2-bill.mills@linaro.org> (Bill Mills's
	message of "Fri, 20 Jun 2025 18:44:26 -0400")
References: <20250620224426.3923880-1-bill.mills@linaro.org>
	<20250620224426.3923880-2-bill.mills@linaro.org>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Mon, 01 Sep 2025 10:20:37 +0100
Message-ID: <87iki234wq.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Bill Mills <bill.mills@linaro.org> writes:

> Add a new transport layer that is based on messages.
>
> This transport layer still uses virtqueues as the other transport layers =
do
> but implements transport layer operations by sending and receiving messag=
es
> instead of the "MMR" reads and writes used in virtio-mmio and virtio-pci.
>
> This transport is useful when the device and driver are both implemented =
in
> software but the trap and emulate operations of virtio-mmio and virtio-pci
> can not be used.
>
> This transport is intended to be used in many situations, including:
> * between a host processor and its co-processors
> * between two different systems (not SMP) connected via PCIe
> * between normal and secure worlds
> * host to vm
> * vm to vm
>
> This is an RFC and not yet intended to be merged. There are multiple
> know issues including not conforming to virtio spec standards.
>
> Signed-off-by: Bill Mills <bill.mills@linaro.org>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Ping?

I'll be around at KVM Forum if anyone has any questions about our
use-cases. We've reviewed stuff pretty thoroughly internally but
obviously we need to input from the wider VirtIO community before
proposing a vote.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
