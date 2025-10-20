Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51BC1EA7F4
	for <virtio-comment@lists.linux.dev>; Mon, 20 Oct 2025 09:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760952719; cv=none; b=pmHm//aX/ZkBpUaECMd3HPRSwR9v2K5W9OADcND8y2vbX6LBNJU84nYgFUQBXHHxqKHCyYNodeYynMs4FBbcs0cv1omBnBvahCO+9UobQevNePOhwkMHSy+szk8uP/YuRj8FnyRDkCsg5wgafZNoLA8NIKdlDJ7NNsd7qtpqXxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760952719; c=relaxed/simple;
	bh=vvgcAwX1NtEUmwQz2Dtl25Sh1jIvF1rsG9TzYFjTWa4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jslB+u0rbP6LXDH0EIQdC5YDYZBrY+Cv/jyOZE7MJm0Db1m9GEi1l8I4mOAvFmOlFurzh+XDbxVlPryZVpIdDOW/sVkRcZqPgS2Eeq+Xp7VgQ/e0kFEzEwWzn3Yg5derLILZ+CMWpHzDRBdsxoRu9HYdUxczVgQaSlmF0ZFS+3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TVbG3F60; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TVbG3F60"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63c11011e01so6508228a12.2
        for <virtio-comment@lists.linux.dev>; Mon, 20 Oct 2025 02:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760952716; x=1761557516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvgcAwX1NtEUmwQz2Dtl25Sh1jIvF1rsG9TzYFjTWa4=;
        b=TVbG3F60UQbupD91C6yg79TIs1j2w5/ednQgHghT7JmW0Rn0KXdI+zLqalyKN60IV6
         BP28e2xesJ+MDOYdR+zHr2lIoKPxhXW/El5hvOqxkkMrzx6qtzq8saEzfXX5owktc161
         zO3jTIlqPeY4q0GUC+VDtR3wAJnJP778Q5VbO70p1mKdmxrUv0ymhENae2GeUpW1Pdhz
         s0XPP5OoLmFpfrn0WDREhfRd92udTPpgTOONxWSz91qYnPZbejVda6Pa0qZo4usqpjwo
         CQMYzUmLNk84C1HQ7vyzS2nHmLXJVc/sfFvOv6jq9F85OXxGRTbjRNPYOaklE5t+jpfX
         HA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760952716; x=1761557516;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vvgcAwX1NtEUmwQz2Dtl25Sh1jIvF1rsG9TzYFjTWa4=;
        b=YtIFmYiCvSlEWxk56N6RTAPn31TaMJcoAiRhC6XZjRE7Oz6ouZiqxXKXuVv03teVz5
         jAGw6OwrYmVNV6bdgJ8+8YVYeIzMxxqoLXRB/lrGdc6KJA8RD/BEvZXKzqnDnK5xARV1
         YN9HlcpqoqoAwrcDTKPmkncFq5qjZhwAhU94peO1Mk59jYs1Py1XnHeShp3uCOg+yef3
         RHZ/Lv0Fvyc1Jei5ToqFC0km98KwlK5snkGs49vdmoOwx+PvKVx0I1gGOsCPhFER6ELa
         cnavTRjdPChu37LFhvrXhcq/FHxVd/a2rXCAD/kLsVeVED42FR5Xh92c6t5JX8MK33ek
         LTEA==
X-Gm-Message-State: AOJu0Yy/fRkkEsY0rxZPd2h1bcLQizArF9KGAyrFwvCQEgcgyGKchpyP
	z3xGswj16HRJ8590gx6wyIupft9CkW+4nH7/EhdU4PIzI0o/JgEYw4aL1LuuM+C7thXTy2hxDIi
	tfioHVKQ=
X-Gm-Gg: ASbGncs/CHGiuUu+I6b6DMyjX/u77eiZtbxxK7rPQ3OD9D8QyyJSRxn1P3V4AyD1FMn
	c7ckjw1giCE2Y9BI+nadAEk5StXPXgKmTxWRLqD2655j1hZp7+guAcW4cFltUZKnHNfYGrjEN1J
	Mgal86Jc23vJCXUiJj+izuhyJTce+Jv+w128rVIEnYIgnV+4ZcxbpaEer8BPHBIbYfNjBjr9NVi
	3lwYUUuDJFRa9z8poCCcFnvXCva5xtAcSYuCfyU/ewGJep348xAe09YBZ78GpsYOWjKxPjD8PbC
	Ra1cYDC3hqrvUqk947oy4Wc+5bDy8iXRfpYFOyURp8bVmcf6iUUSneI3Bwy2QjWAH0GEXkCxAOi
	zvH/O9gwE0tCmohpt0nhBnwHlcQG27xGGPU878b2O7LGtyIjCBEyyLwS1OSyvZ94NsyQ6QZd0xb
	gR
X-Google-Smtp-Source: AGHT+IGb7w/aBRc8/A8TZ0UI73ivTii4iViVoSBirgtAwoT6FW5MsTP2B/dNNdhAlswFRvmrmgOxxQ==
X-Received: by 2002:a05:6402:1d4c:b0:63c:489f:df1 with SMTP id 4fb4d7f45d1cf-63c489f20d4mr8183803a12.16.1760952715787;
        Mon, 20 Oct 2025 02:31:55 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48a928dasm6188162a12.2.2025.10.20.02.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 02:31:54 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id EF2E55F83E;
	Mon, 20 Oct 2025 10:31:53 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v3 00/11] QoL tweaks and github action
In-Reply-To: <20251019074820-mutt-send-email-mst@kernel.org> (Michael S.
	Tsirkin's message of "Sun, 19 Oct 2025 07:49:00 -0400")
References: <20251010162858.4107388-1-alex.bennee@linaro.org>
	<87ikgdippa.fsf@draig.linaro.org>
	<20251019074820-mutt-send-email-mst@kernel.org>
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Mon, 20 Oct 2025 10:31:53 +0100
Message-ID: <87cy6h9awm.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Fri, Oct 17, 2025 at 03:10:41PM +0100, Alex Benn=C3=A9e wrote:
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>=20
>> Gentle ping.
>>=20
>> Michael are you happy with the marking of the draft now?
>
>
> Could you fix the layout in the generated pdf?
> If we are auto-generating it we better make it look sane ...

I'm not sure if this is another regression with the latest texlive.
Could you tell me what version of tex you are running on fedora?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
