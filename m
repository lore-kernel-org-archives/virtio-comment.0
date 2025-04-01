Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066A29461
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525791; cv=none; b=FPpYhRkY60KvavcCvB+vi8/SlY5J89pdnx2VFcffC1Yq1Qvsb5wIKYO8IbKL69Jr8IzDkge8dzpABBwlUM7hD6amVN5/kf4GtzW7ZqUbe1xhqXKU4RCBSaZsw3l0abTJBX87PeUT49J+++JGhQ+6hIbPkHsbHuKM9y/NKoxXFMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525791; c=relaxed/simple;
	bh=FQ3+J4d9jDNzVwCMbTG31ZmOxcH97v+AB2KmJC9k6PE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvIKYXc/IM3uPRPyhS5LCExuNEpwdHB1EGQV+QApfS2tm+nWUoKGNV2VTNpnlRvs6eAtrNVu0sR26mnmeNsX/kvSTPXh1FmeBh2w6BhJGCWtAKUzpw5XcTKBVOu8lGl8Mx6U6WyZbViHN85x0IpFLZorf/OyB3W1HYXMa073L/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VSEjigcC; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VSEjigcC"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff53b26af2so1263255a91.0
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 09:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743525789; x=1744130589; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4CXjET3mGzQKHZSDId0amenUA1LOnAXRdJq7+qg/B8=;
        b=VSEjigcCsOzg4ogMpIz79eGm1QcQSr9lWQ/djWDVkDreP8Zi//lEmd/Eht7pd5IYRe
         4EJqXgqiqBQZxvKIqrw8fgj/xtcH2QNNQTCKgF7q15BM56UXcfn9eb43lVbbITVR43+1
         wjWCJeSd6AghmSAdNWymAqOVRsi5ghtanDftU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525789; x=1744130589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4CXjET3mGzQKHZSDId0amenUA1LOnAXRdJq7+qg/B8=;
        b=Tl51ObAbZiMCddDQT3EneYSdctvsKa1XZdckbJaI7N893OI0lLPAWOIJiS+ju48nfw
         sqwW9/5Zldx5+fTGBbyNcCnbKn9yx5ZHQla44vX/i1ODw2f9fM3EVvQKiedg8ne37/Lc
         STtDc8iWsKGgAaN0+UIaMuAtTu2/VMjQaVJK8SaRl02aCAqpip4HDIuT7nvLOEjuZxzm
         RqNXUIuG2yz/gBvXy7+eveb8mBM5+wzu/8/rEAOH+DsCb1DSEBSCAFAyHg4WwZG41e7X
         aURQvLUQFCnC9O/raGjeyA+5ooUFwwuPV5U+nsHVdte1D3v967za5Ey489NOgZwHuYFH
         jGpA==
X-Gm-Message-State: AOJu0YwQRdZ23MCQs9q5h3n/YAjSKf7doR+TUkKVsCpKOKnIHirVMFjG
	P864zaPaHE+hrmmgQIPF0JcI4Rcv1lMbhrUphWm0SheNSY4O/AMEBB6gQ+FdGFNoXqPG/duolIM
	=
X-Gm-Gg: ASbGncu3shyqBjhErMYoGldYUND4Hwii3BEndFJ5iNXhF0yQs0OaezuS47JXR4x4YdG
	PYb7B/sGMJF4rbrK21D8u9UIiWKzeEex2uV76DNX3ntKC5BLhiSHF2Kg4AIZ9DdJvyaUISmpZ1A
	GqoyN9rwxu/3pYUZi1wbC5Oe4dl0RzsVwGuhAqaYQg1ROCZelhtqMsHvXICKDo0oKbR2LcszxEW
	bdvELm22BNcRIJRbYJv1qEV9Xx0Rr66WVSdNeUu3y9DSI7wt5cXV8UzS1AJ/uwVz8NSqNGW0gDL
	kluEgcvbWIGFpVYN/iQmIkc7fzcWNcWRthASoXhP3LBObw0lduEsDqQEbrpP3zTp8Nf3jri3b00
	QAFlPqLM+XSk8
X-Google-Smtp-Source: AGHT+IHmakIWMaFIh6Z5OaqRpC2RI7Bd05XrJRsVrdXeDqUkHQ7p+YjKcLJ5/RN5/AcP7baJKn/qBg==
X-Received: by 2002:a17:90b:1b0e:b0:2ee:6563:20b5 with SMTP id 98e67ed59e1d1-30562d10d31mr1929452a91.0.1743525789202;
        Tue, 01 Apr 2025 09:43:09 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com. [209.85.214.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039e119e36sm11955114a91.28.2025.04.01.09.43.08
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:43:08 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22548a28d0cso156187545ad.3
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 09:43:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:14c1:b0:736:520a:58f9 with SMTP id
 d2e1a72fcca58-73980462e7dmr15063733b3a.17.1743525787751; Tue, 01 Apr 2025
 09:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250331213711.63398-1-slp@redhat.com> <20250331213711.63398-2-slp@redhat.com>
In-Reply-To: <20250331213711.63398-2-slp@redhat.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Tue, 1 Apr 2025 09:42:40 -0700
X-Gmail-Original-Message-ID: <CABVzXAmpnR+6aW0H=YuBwk2FE6K8g0dnrVSC=ax2qZXTBKQ5ug@mail.gmail.com>
X-Gm-Features: AQ5f1JoQPjc1_LoX2DoQCcEj7M7QF4UHtP7QhhDQ0mT4_ZQesaCPKNqju3xK4H8
Message-ID: <CABVzXAmpnR+6aW0H=YuBwk2FE6K8g0dnrVSC=ax2qZXTBKQ5ug@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] shared-mem: introduce page alignment restrictions
To: Sergio Lopez <slp@redhat.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, 
	dmitry.osipenko@collabora.com, parav@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 4:29=E2=80=AFAM Sergio Lopez <slp@redhat.com> wrote:
>
> Add a subsection for page alignment restrictions and introduce the
> VIRTIO_F_SHM_PAGE_SIZE feature bit.
>
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
[...]
> +  \item[VIRTIO_F_SHM_PAGE_SIZE(42)] This feature indicates that the devi=
ce
> +  transport provides information about the supported page size and expec=
ts the
> +  driver to honor the alignment restrictions derived from it when reques=
ting
> +  mappings on the corresponding shared memory region.
> +  See also \ref {sec:Basic Facilities of a Virtio Device / Shared Memory=
 Regions / Page alignment restrictions}.

This wording seems reasonable, although I wonder if it would make
sense to avoid "page size" and instead use "minimum mapping
granularity" or something along those lines; there may be no actual
"page size" shared between the device and driver. That's just my
opinion, though, and I don't have a strong opinion about it, so if
"page size" has consensus, that's fine.

> +\subsection{Page alignment restrictions}\label{sec:Basic Facilities of a=
 Virtio Device / Shared Memory Regions / Page alignment restrictions}
> +
> +If VIRTIO_F_SHM_PAGE_SIZE has been negotiated, when requesting
> +the device to map memory into a shared memory region, the driver
> +MUST obtain the page size information from the transport and honor
> +the page alignment constrains derived from that page size.

nit: "contrains" -> "constraints"

Thanks,
-- Daniel
