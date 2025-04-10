Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AD71D5CE8
	for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 17:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744305177; cv=none; b=SAT/AnIHymmeVrPEgYYcm3ezvWztdSvV5TAz7tSBbe8exMflyB4xMDDWCziz6l7dUKyUkDvQwqMmC8PGJccfFextqGqyPbtuxgQV6cuE0XySST80vvrc47cJiV6zEECpCQdmJp+0yuKuYDHM/HYqgDoeLnlnbydkRZ/UNJo4XbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744305177; c=relaxed/simple;
	bh=I1r9lK/8nHXBvGYYobvWwGDcMW11uFd79pq5+3+KNMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kzZcimcL3C4BRs5nnrHI/HhZjTgSbQ1EO6xQNZ+nOEud4271ExrGQ1r0v4gibAkB/0qOT3kJZVT+BSpOu4W2LOxbioZyaumww8f7WyXarUcIEx8XB1Ml7VWT36IJwCfUdBZOiEv1JCwceQ+wmrdQ7Ac8CraaXgH2+CsL+Oh6N0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HTk0qcgz; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HTk0qcgz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-225887c7265so1177645ad.0
        for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 10:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744305175; x=1744909975; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rwcxh6ODPmUQPOVpqhzXrRlJZ0hyXnP1QguHdFenIuM=;
        b=HTk0qcgzI9YcfxJAUQV7Tv7qi/8GjN33VR31Q3J7AzzikKn5tnjQM5n+glhmk1kVpp
         1NNqe7tTY3xpLRiPFWse464EmziBZIn1qDCYQWNzmRi59xAJyMDrAlLXy3KYYPgEcV9C
         WOctQrEb71r7kHXzWIkpoGYG6RAfV3XYsdNiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744305175; x=1744909975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rwcxh6ODPmUQPOVpqhzXrRlJZ0hyXnP1QguHdFenIuM=;
        b=u6NXrkiYVmDzkSbIXNJQsMr58QoNVQ0aBZY3S7T+HnQ7YPJrSaoQpPbm/qzlbJ11Cu
         P6M/dajQytKaq/3hUUyiRqE4/ob1I1FWOMSTAG/pvm35R890sYe8exok0zFtA91XPRCd
         TxJxSru+GMq3V4R6kMbVb1Lg4njOcGicAV5GovCccJKHBQPftuNunwKv4r4GcELNn/cD
         bObAvBBwy5bxeAqqEzQAEXtkD7v2Rl5UeDVC0Hx//G9KrA/O/jvi7/MFXoEiFukGX5ie
         ftQScJcmGVtLPZOGbuSQlQadJDnQIZU0GtstIgqvppV4fkA/J5J42caEpeFBWwPB528+
         Cmsg==
X-Gm-Message-State: AOJu0YxAi+GpyxevUT/3Unjkl4Iz6AGmzK3FMEiMxwEmXxKXqFamtDpZ
	zP1tWOOuyJNk/mcUV7uiGnaXfNCOCFVx1PnsY54zbPbw0EDnhNrGjMUUpi7+hnLpSu+LYpHbOrg
	=
X-Gm-Gg: ASbGncuX7vEWn/fXLP94ihpNkzmZBBhQfeO3VKkpmLtGoFXIhAUaVqpA71rmloox4qr
	tqTL9gBOIAnW3NJ2M21eCw5T3ZhfpMcaQkdC3rUN14lO+fplp5/0WJGKUW1dTDFN2bdY1ekrkSR
	lLEwYFVcqXe2KUjELz2sly+AkTK+6AeVyvCCYn2DjmgIzBDpeSTS/DQ+988HmUMWLqyO5J6E7EM
	6cytuvAybxIECgLdUDs83esauIAhHPbedJlBzVs53/4/wozvMD0Gb6dZy2g6NWU7mKxtLqVA8xk
	YWXwIpRzVjCt/U9N4BRxqQhmir9Jf2Ia/SMw4LgFsVLipFzc55pg/mltmA8h9Af3KTgsC+A5GaI
	vbpy7BJjP
X-Google-Smtp-Source: AGHT+IH1XWhnAvYHn6ZansV5REwbdjxGGpJWm0z72kRSL9mgdmJq82U5RrDclWKdu9HVjbZ5xCCHGw==
X-Received: by 2002:a17:902:f547:b0:224:2717:7974 with SMTP id d9443c01a7336-22ac3e75898mr41841195ad.4.1744305175209;
        Thu, 10 Apr 2025 10:12:55 -0700 (PDT)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com. [209.85.214.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95ce8sm33117855ad.107.2025.04.10.10.12.53
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 10:12:54 -0700 (PDT)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22548a28d0cso16250975ad.3
        for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 10:12:53 -0700 (PDT)
X-Received: by 2002:a17:902:ef4e:b0:21b:b3c9:38ff with SMTP id
 d9443c01a7336-22be03cf8b0mr43986535ad.37.1744305173177; Thu, 10 Apr 2025
 10:12:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250409212324.18134-1-slp@redhat.com>
In-Reply-To: <20250409212324.18134-1-slp@redhat.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Thu, 10 Apr 2025 10:12:26 -0700
X-Gmail-Original-Message-ID: <CABVzXAkYKCYLgEgPctc6MV71_UOYCDJ37YFirRoThKC6=576Dw@mail.gmail.com>
X-Gm-Features: ATxdqUG1BiKxdtCJqxtL1dIQ9CNvzrzzzbzQ_7NVmyfkjs3_-_GJluS2h2pc1UY
Message-ID: <CABVzXAkYKCYLgEgPctc6MV71_UOYCDJ37YFirRoThKC6=576Dw@mail.gmail.com>
Subject: Re: [PATCH v2] virtio-gpu: support blob alignment information
To: Sergio Lopez <slp@redhat.com>
Cc: virtio-comment@lists.linux.dev, gurchetansingh@chromium.org, 
	dmitry.osipenko@collabora.com, parav@nvidia.com, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 6:38=E2=80=AFAM Sergio Lopez <slp@redhat.com> wrote=
:
>
> Allow the device to require certain alignment constrains for blob
> resources by extending the device configuration with the field
> "blob_alignment" and introducing the VIRTIO_GPU_F_BLOB_ALIGNMENT
> feature.
>
> v2:
>  - Clarify blob_alignment valid values (thanks Michael).
>  - Rephrase feature negotiation (thanks Michael).
[...]
> +If VIRTIO_GPU_F_BLOB_ALIGNMENT has been negotiated, \field{padding} and
> +\field{offset} must be aligned to \field{blob_alignment} as defined in t=
he
> +device configuration.

What does it mean for padding to be aligned? It seems like the padding
field in struct virtio_gpu_resource_map_blob is only present so that
the following 64-bit offset field is naturally aligned; the existing
spec doesn't assign any meaning to the value of padding itself. (It
should probably be specified as "caller must fill with 0" or just
reserved, but that's a separate issue.)

Thanks,
-- Daniel
