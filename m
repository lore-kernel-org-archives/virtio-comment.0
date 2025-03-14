Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E891EB3E
	for <virtio-comment@lists.linux.dev>; Fri, 14 Mar 2025 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958762; cv=none; b=hhuJjFKcPHe7YsS7deSkx9/Jm/AhiMepmhK+ai/h0CyS8OoADkZWhWfWPSuUKf2tKSS0DOCN7TvvnSwRGt1UCIdkj4gapG2/jXcS9bbxjOqvo5BWmCtIiJbCctUJ/q42GKgQr2782HE3VkhlqVL08DcHxKujCX3EkWwJIl0EdXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958762; c=relaxed/simple;
	bh=wJwL/pgS59MHFKiJBA/phIWSGyKuCyNACzypX8Jp0nQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fzMixFCkRaadcfwxcBEBbZ1fCTfS/uxuFNum5SHXFNf6DMmO/h2L/0iKfBC6XVHUIg3ptBp222N4B/yAaktyfJ/CSOgYNud6KiG7vh1POnN7LIhNA0KwLIFPKLPF/VR4IeZ2sOyNOK2WHMDRiaSld3manZK4BssOD++m+6G7als=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaXDqJ/2; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaXDqJ/2"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2255003f4c6so37088625ad.0
        for <virtio-comment@lists.linux.dev>; Fri, 14 Mar 2025 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741958760; x=1742563560; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJwL/pgS59MHFKiJBA/phIWSGyKuCyNACzypX8Jp0nQ=;
        b=HaXDqJ/2cH2IbhWSbF0/NOcHYDZywpxMk3M3CN30+DohcB21iTJScuQMaJLadtB/F1
         +eLi/Zq7R4AWgcd1bNF9yg+X78WfQTKlyld0dOZWGG9/VOT89q7mqw1FtFlkMwSi+SCF
         8c9WmABcpsPiywClFzIJvwzL7C56Y4urAhDJwHehLawdMtwp/q59TwG/i68t8d5r4Dkh
         MGcOSgMDbw9eZPnyf0Nu8PRj16FVVcgK6jlM63A+2a/M/cdqrweVA8Q55JQnx8hN2Ltw
         9i2cr2Qaf/3YfG/nyI3Cqs5BpoGVqbHVRSOgDOfu99ZN7JKkMKdrRoXsS8k68nGSQf54
         WswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741958760; x=1742563560;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wJwL/pgS59MHFKiJBA/phIWSGyKuCyNACzypX8Jp0nQ=;
        b=nlSQ1ztNBkrXhP6+IShiEpSSGRB2Xlbaws1o9fVdRJvQIcll8jNa7zSI5OXjYIQg/W
         0tpOVVP9GwO0OtJcBAet1YWFkwb2//Ug+m9EZg0kYWk+wFfrsFZ/8mUXBjYvYb7+7x30
         4pRVH7CpfseckZNqF0fc/Ex03kqvWNqjh6Sm/y59OmDH3FOWJx4JE5PXzIlKwbM5DiNC
         rLu+fgPgINDGEs6DAFbgVkuRB5qUvzv5l+vPqN2BDCTirpAE8rMvag0S11klGit9aPEr
         o1yewYPQOEKNFjdT6+qzXwR4PtwJlUCBCwk/enz7zI2/mry9XZK849pEsKpV5oMIjmwf
         euig==
X-Forwarded-Encrypted: i=1; AJvYcCUUgahAKV2c5KkyAxK9T8Dq/uOXZimRt78SqVzY+a9IZVx+n9LvJ39TuaaCBk2Ry5llrCdBRMyH2EUZxx2DwA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz0WzF4rRgbRWKcn9YxjGmALDO0N4ubkck0eEmZm7pX9ojsC2y
	UCwwijOazGhWcv4rJ/0wf6IhLXb24e5xU8vxPlCdx5ZRvTZXhnyo
X-Gm-Gg: ASbGncuJEEKdaESWw1kCA2aE8RHJmhbx96QLu82Z2nThxoXcW9SghPkdaNGeD3eQBAs
	6XIMUNOhmZc99tU8wbVMYaGuAcqVsl71jmWtacYd+CpOGM0tIqGbzdwMfG6glDNs22GWJLVRmyS
	J6nKdYfPdf8nzVxyEGKxfnes0hBDn6WI3AfhabSvYycCEeKYlUNbA7rmFJKfyZsCFxxnfdvfuje
	ALfOnhkCFW3Gbm1suWxC3/tPcVgPIbb6MAPNrDbDstTcMubyFJBxqn4vilIl0LEKLRT76AZPI0q
	KPQaZa++7tzTUjkUR4J/nqSjoQ1lqJ9vOEK+
X-Google-Smtp-Source: AGHT+IGi4fo/Vs0vTjQxCT5gYkowvyOWbyBMrZS935KFzj2CgTTS4NPeVSyHcqsJ9/dnHuXW5bJn5A==
X-Received: by 2002:a05:6a21:7a47:b0:1f3:48d5:7303 with SMTP id adf61e73a8af0-1f5c12cd9camr4573419637.31.1741958760073;
        Fri, 14 Mar 2025 06:26:00 -0700 (PDT)
Received: from localhost ([240d:1a:f76:b500:4431:46e3:c76b:79bc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115292cbsm2856567b3a.1.2025.03.14.06.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 06:25:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Mar 2025 22:25:54 +0900
Message-Id: <D8G0UC5KFCYY.32BN79B9WOK33@gmail.com>
Cc: <nicolas.dufresne@collabora.com>, <cohuck@redhat.com>,
 <adelva@google.com>, <mvaralar@redhat.com>, <hverkuil@xs4all.nl>,
 <mst@redhat.com>, <dverkamp@chromium.org>, <gurchetansingh@google.com>,
 <alex.bennee@linaro.org>, <changyeon@google.com>,
 <daniel.almeida@collabora.com>, <agordeev@qti.qualcomm.com>,
 <eballetb@redhat.com>, <ribalda@google.com>
Subject: Re: [PATCH v8 1/1] virtio-media: Add virtio media device
 specification
From: "Alexandre Courbot" <gnurou@gmail.com>
To: "Albert Esteve" <aesteve@redhat.com>, <virtio-comment@lists.linux.dev>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250304130134.1856056-1-aesteve@redhat.com>
 <20250304130134.1856056-2-aesteve@redhat.com>
In-Reply-To: <20250304130134.1856056-2-aesteve@redhat.com>

Hello Albert,

On Tue Mar 4, 2025 at 10:01 PM JST, Albert Esteve wrote:
> Virtio-media is an encapsulation of the V4L2 UAPI into
> virtio, able to virtualize any video device supported
> by V4L2.
>
> Note that virtio-media does not require the use of a
> V4L2 device driver on the host or guest side -
> V4L2 is only used as a host-guest protocol,
> and both sides are free to convert it from/to any
> model that they wish to use.

Thank you for your patience with this. I have done a final pass on this
version and it looks great to me!

Reviewed-by: Alexandre Courbot <gnurou@gmail.com>

