Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206E7748F
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760104203; cv=none; b=UtZpgZKDnUiPkIdIo940L6tJ1Q0OWVGtvkz4x+X/ujyZTrD0AZpZ0fxYj5G14qDpgRfa7TfM0QgoBWqi+VdCHuLH+XaTu9IjbVo2Ek4OsuVJrXTOrijXIpAdq7I3VzLJUijGRd1FVFJggmoPypN+Ide7xcf6fWdNJIls7Ubla1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760104203; c=relaxed/simple;
	bh=E4U4h4UED/wiZ8pblEMBftejy/1a6Kf8ZusvpH7189g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=keyVqa5jrcVwmUV/bfqtepXBHXMD0Y473m15aYDlhSRtQb3FXcBDrUxCl8T3tdKjjt8lm+7lrzvB/+ebqY94PW/He6NCs4kHMxZzgm8bu0O3wCBwS6POqa7kpAIUVRElRx2bvAvFjxkJVrKhTH4x2p8AxKQjp7p4Vic18pFDzps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xiJjOJfM; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xiJjOJfM"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso3889110a12.0
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 06:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760104199; x=1760708999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4U4h4UED/wiZ8pblEMBftejy/1a6Kf8ZusvpH7189g=;
        b=xiJjOJfMfayAyztjxem4V+4dR/6PEYWAqEKqMFxOiYh2RZ54GoTj1NygR8lQ/+VFEq
         g6qYH9YS5vLxrajgxgVsVeF1dFCJadzInkukjELzGHxzosScvlGelMJAmCpUoTe3tjaU
         7oRxnJC+qjZ+Sybm+8muC7M8wSbBQcYTQpBXvF2TDSEh01PIy7kx0sV5veDZDh5A2DPh
         t5vZuSAk0vUAUVz/OBdtyqZ7aaHnsgrgQ8vZq01lPtw7HPwhaaWaaW615EETM3pemr+n
         pXy6QJDTqlyStcmfJEiOm5I70TvsDc1cyzet4nKZ+n/VUHr/yTm9gZjtsjmMK2RJlwHA
         oXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760104199; x=1760708999;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E4U4h4UED/wiZ8pblEMBftejy/1a6Kf8ZusvpH7189g=;
        b=KTlX4gEJU2KnUsvoffe6a6uUfpoCahlupYW1sE5h5He6nPtWH3PQlHbzGh0wH3moxt
         xzn01Q5sxWE8lbVfc1fcdpSCnL6mRf7m7Y1vReKRFkx21MQdIFZchbEJf4EENUA7kwr9
         GlR8sq4vFsQE3/Y2/Wt8i9OK7khqpFCc0k81lb0MS+fFDdWmxkXbP38oF4kNH7aZ5kUY
         +n2WfwOtUaDpqWvk/5s8m9kYimNn21Rd+CGVzmHi+JwvvLR4pmFasebtJBxXYjYlq6Ho
         ngsrz4tANGRHV/SXVn/cEaiHbpzWqs9JFWlq2Z2zdEVpawswo8ziT9Mx39g3MKf9sy0X
         wbIA==
X-Gm-Message-State: AOJu0YzRYbGxI3mNENvS0k/sWTpKPbL8GangrKasDgHFNN8a1myQ7HoL
	6yUORZJeo8fsA5Q4U28oei4opPYzDnzpbMBiZaymlunkv6uzu8FMiTXGM3bAmzydpQaOg7Is1Hc
	7AWQ/
X-Gm-Gg: ASbGnctffhiL1MOKWGNGF33zNnFjKhLm9EZmD49cnzmk3bFxIxLLppLatoSW3hb7txx
	JB/Z/JPSACQKbSOAP7Q5c2/UlLtA3mEsAi2mduvpUFi6nNKPTbPpzA1znc3V6MMvOFduexnV84P
	oxPUmHC7imBrk6rXm0a8+7Levh4mKE3Lh1dNHQnpCR89gFwEFu/IMOVRdR7vsCOYg85fUxwJiYL
	9qlRrdYxAaUcKSFT6zVtKa84XqBUCks509fp3kbi2VqonRrt91duM4GSKm6MQF9dVTREaVePkij
	3BRtHRNETlRRrm8+mVI1kFsMsdSh1BglMoGYGEk3fKBSB5cPPYaXhHoW2YvzKlbEsSvBCc/gOW3
	CuldEP9g/vg1RsbDDMuEP46YIgVZD6N04L5kn8hrP56msZA==
X-Google-Smtp-Source: AGHT+IEmem1N7sG0+TD+eCKQtzfdh0rVRBCuHdTZC7qbD/Ba+8NkznrOiB1zg3Q6LHmgNofF/NcAPA==
X-Received: by 2002:a05:6402:42d6:b0:639:dd3f:f25d with SMTP id 4fb4d7f45d1cf-639dd3ff742mr8487387a12.7.1760104198986;
        Fri, 10 Oct 2025 06:49:58 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63b616d12fesm1627806a12.24.2025.10.10.06.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 06:49:57 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 13E4E5F7F6;
	Fri, 10 Oct 2025 14:49:57 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v2 06/10] specvars.tex: properly wrap arguments to \urldef
In-Reply-To: <20251010075318-mutt-send-email-mst@kernel.org> (Michael S.
	Tsirkin's message of "Fri, 10 Oct 2025 07:53:43 -0400")
References: <20251010112010.3880438-1-alex.bennee@linaro.org>
	<20251010112010.3880438-7-alex.bennee@linaro.org>
	<20251010075318-mutt-send-email-mst@kernel.org>
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Fri, 10 Oct 2025 14:49:57 +0100
Message-ID: <875xcmx3wa.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Fri, Oct 10, 2025 at 12:20:06PM +0100, Alex Benn=C3=A9e wrote:
>> While the space in this case is probably harmless we should be using
>> non-ambiguous argument wrappers if don't want to drown linter output
>> with noise.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-ID: <20251008145916.2626143-6-alex.bennee@linaro.org>
>
>
> could you be more specfic which linter complains and how?

will do - its not the only fix though. Latex is very noisy building so
I'm sure more consequential failures are being missed. It would be a big
job to tidy it up though.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
