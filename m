Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B342192F9
	for <virtio-comment@lists.linux.dev>; Tue,  8 Jul 2025 04:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751950231; cv=none; b=Ahc3E6qedWMft+UYDsyDkb84mxmPNZvrapbPoOV5V3r3BiUrrdOlLKh8V6x3Z3xzYX/1VkhR6La7msk0UQI4gnz9TjHAIx/nZlAyj76ExSZk6cG84Xch/hylg7f3wXW/zkwS/XWWjGFhZam0mAzKqX/4sRTCkr/BrAoTGYud7BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751950231; c=relaxed/simple;
	bh=6758M9V7ixwyQpTEYiZFtIc6N1fWp41wIuZ3CM3ZgCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OTBtUIRjE9TBVyYA0iBWlwcE6MdFueEhD9YbdupilbtaYNJdjYEEKkGD73VL4wutrkvlpUFazxqPE3YV/edBlP9J5UmzSF1e6gXTtO75Y8w5M3PI4F/MspUvSlET06gN76BdhlFZ0az0Tmxb3ENtwOiqd6Rgw56eo8rnbLrvsFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I59qkwRc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I59qkwRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751950228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6758M9V7ixwyQpTEYiZFtIc6N1fWp41wIuZ3CM3ZgCo=;
	b=I59qkwRcxWWl7bc364VirXbX28iAhhRqEP7LJzPunIW2dq4RU240XUJQz6OplqEV3QrlnN
	YFcbwSLdMmEK+ah9/ATKrV2JJ2G+o8g8AnJwCIVwCkNnN1kgghcvpTFGLdewi3VxBoT7Bu
	JcKfLEj+bNz2FAHosgMWRapspu6vevw=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-yvzciswxPryqbetxpdQP-g-1; Tue, 08 Jul 2025 00:50:27 -0400
X-MC-Unique: yvzciswxPryqbetxpdQP-g-1
X-Mimecast-MFC-AGG-ID: yvzciswxPryqbetxpdQP-g_1751950226
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31bc3128fcso5612791a12.0
        for <virtio-comment@lists.linux.dev>; Mon, 07 Jul 2025 21:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751950226; x=1752555026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6758M9V7ixwyQpTEYiZFtIc6N1fWp41wIuZ3CM3ZgCo=;
        b=Yz8JlTYz+osL0bH853QNr45LzNtNwy5wCuscZGG4pVJnR1RFIu4aHy1DmLk5j92HaK
         NhbTb6jbADUmS5b8z8K5exI33rqdgpEYfmdxgnCOELzKQSm1SRMeMqKwWFl7T+9hynZ6
         TuJtzDk0Bptm+BnMKhKGb2LDI46I9h1/sThjMc9CbbNhRwpuAvV1ls/5tFTHvbh6mvxT
         5d3veUKQuqN1op8fCPnnX8KwdFcnILfaj51qW3G7cdlp1BixRDHCJ5VkpLyBiIyY0Jhk
         9fJTzqa6abYKO/XR74oUM3Nfik35OAgS78fcVWIHi0omfMQykqqh+ZddzHHgL1snNJvx
         NM7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUCLcBEH5JC+xideCMz2rK91VCV6++QmDFbJ//8N1+gl8yN7WWKr/J7ao0n/0FblMZnWwSiH6BZxyCxBidnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBDvvKnVXV0FLkVB4hf6BXxRLKx/4/D0mkVoDN4yvTckDHZeGn
	E/hEf9ud0h8dPUahrQDcVTfNoki6M33VMjf3No4W9IBJ42rP5qzmaMDSeDT7i8yc1f/0PQpkrni
	AgD7NushE/m3Wfxr/x5aQoH/QqX81lhk9Wlp29jjuOMy4XDydWg3OoUpKs84IKaYH62Kp5FsL60
	RgZQ7dpejMXDH5O5dkbf4SCmAEqfdO6xTdHL3ahoV3w08=
X-Gm-Gg: ASbGncvgwb1AwsfSX1Kzu2upu0riULCSmX8aR0p/Cmo2HkvbeTsassXoOZXjVk0rUGY
	h3Syahcv2cWb1YLhAXXjvGJ7xJr29pDPIoCjOpI2ICeLwvSXTB5qwHf3jPuiPmY/qONBHKeHUvA
	pbbw5P
X-Received: by 2002:a17:90b:1e09:b0:31a:9004:899d with SMTP id 98e67ed59e1d1-31aac4b30edmr23599857a91.18.1751950226049;
        Mon, 07 Jul 2025 21:50:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWPVs/uZOI3RzA0UP4GAsCGaQbmYkoPW4qSX4nRH6qXKPjkvmVnDkFi4rqo/9V4gZll1t6XnXvtyNDX03KQ54=
X-Received: by 2002:a17:90b:1e09:b0:31a:9004:899d with SMTP id
 98e67ed59e1d1-31aac4b30edmr23599823a91.18.1751950225673; Mon, 07 Jul 2025
 21:50:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250704101739.354522-1-lingshan.zhu@amd.com> <20250704101739.354522-3-lingshan.zhu@amd.com>
In-Reply-To: <20250704101739.354522-3-lingshan.zhu@amd.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 8 Jul 2025 12:50:13 +0800
X-Gm-Features: Ac12FXwjfu7qzT9ykAjxHpTuY8zgrYs_30pZIcBtUVoRfYyajDxxtOuNDYBU4oE
Message-ID: <CACGkMEsPAZTYMTFHHpveOQE0wXtgZSost7BjXaHcrrbF4eXb4A@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] virtio: document feature bit 42
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: mst@redhat.com, cohuck@redhat.com, virtio-comment@lists.linux.dev, 
	Ray.Huang@amd.com, Parav Pandit <parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bMzZBS-U9sEIzbsdPSvPBCYTnMtnx5_UvIwlEzU19xk_1751950226
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 6:18=E2=80=AFPM Zhu Lingshan <lingshan.zhu@amd.com> =
wrote:
>
> This commit documents feture bit 42
> VIRTIO_NET_F_GUEST_RSC6
>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> Fixes: 94384142 ("content: Declare virtio-net legacy feature bits 41-42")
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/229
> ---

Reviewed-by: Jason Wang <jasowang@redhat.com>

Thanks

