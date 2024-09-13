Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966C112AAC6
	for <virtio-comment@lists.linux.dev>; Fri, 13 Sep 2024 19:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726254247; cv=none; b=iMl6VkTf4XUtcerAzHUYn1gEtM3D6O1DYRLlIEEOX690F9MwwP5QvgbeXiZ/B+zHVAy52AByaWuR91bkRexYSCcJEhc1ylOzw47ZrMX+G6Ki+PDwvZ3nLFx4hj+LV++64LQYlQRrepepUVrZO+KHXSKhWEIk+yzJmDTiWrl1Z5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726254247; c=relaxed/simple;
	bh=giZTT1NK/9OCvhRhJZAQBMZuhHqIZkRHW1F98v3Y+yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=rwWcuffPsLn/xx/7alXTkfvZwAOSeC5W/z7qrNG4sf0BzYbVP4t5CAGG/92BcU8wg47jMfK7TOVKwD1oKgTWAcwuxHmr0gbXyvPBg2QCj+HD6U1cCdpuzZ9Yz5E7wliyN75DYtGMUFTKhRdFSjZguqpR44lF/qAeD/HzNGCYU0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aH/lS3l0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aH/lS3l0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726254244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8JtbSQHINvp1VQ+fH6pmZrEkRdLF4zFhlEelNG7N4Ps=;
	b=aH/lS3l0QK2YQnyNaujm88usJeoyzWFPzB3VyOk7geCMWGYYg9T/vo10hos5Zel/PAPhIR
	fX7PpvaXit9BL+z2yfKSOVVd2XW2KxMpAkwYtwRMTDgmD+5QkwsOsog8IjSI8TWdbYLw0I
	xzISHgPN030g/QW7ye6b3bkDQxHIO6Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-0FHlCk-BOriDyhlZ5AKQ_w-1; Fri, 13 Sep 2024 15:04:02 -0400
X-MC-Unique: 0FHlCk-BOriDyhlZ5AKQ_w-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-374c9b0daf3so551759f8f.1
        for <virtio-comment@lists.linux.dev>; Fri, 13 Sep 2024 12:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726254241; x=1726859041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JtbSQHINvp1VQ+fH6pmZrEkRdLF4zFhlEelNG7N4Ps=;
        b=Vb9F23ymqawsT8bxHKilYSbP4zcQcCLXLePo2+Kr6ZaGkwrQ2yjKaeY/A0YqcubGk6
         sQFCs4QhCjHYgQNUWkQxjKcVqvEc6GfkmcLPDftr9Afd5qI4N0j0nTOgih9kKUT2EkD7
         gM1dvYj4wQ0LGw7CC36eT7+UzZQHtbQxhixmQiTvvoJ8Z+PglDHU40w3cb/7FzdmfO1d
         s16LdiAtxm05FUa6KlNrj49Fenxxd+4eDxkp73SZMdcIXG7t2ie2WXl6CiC0KbSHikK3
         5j6vgp0Ncbtu18xCOW7vAlwKW4Nvw8Aq6ShELFhCBT6OKfvDkTKd/M5EFXMxXAX42Sxf
         kR6g==
X-Forwarded-Encrypted: i=1; AJvYcCUOno6DGPNEyYUmFGS4gg6e2sVRZHSd6JvbEtJfv+7Ncrs27cIJI4z66PJ2L0TMq07KLLsEGhvGsRWzLb4hjg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa8vVJ6QKbmAuWxhbtUmNnqAsAQQc0HRHWo032H3+OcomCbn2W
	H5BnJuijS59l721AawKGz6iuCFdTjtbJsotOUvCMWSbSrhr+dSFihkvC/TA/OPcjdT1ykR2Poon
	YfHwgm3saeyP8g4CsYNf3e8274ylo+t/1qm2xtsQBrLvrzZ81APno2zlw0lkachWa
X-Received: by 2002:a5d:43c2:0:b0:374:c05a:4046 with SMTP id ffacd0b85a97d-378d61e2aebmr2221022f8f.19.1726254241317;
        Fri, 13 Sep 2024 12:04:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDUQEmFV5fPZuLmBrQWtVy/0Mr65eQS4l9M+Tj9+2rHXVU2jurEBEtAWFDN9HQx7A5ge1zpw==
X-Received: by 2002:a5d:43c2:0:b0:374:c05a:4046 with SMTP id ffacd0b85a97d-378d61e2aebmr2221001f8f.19.1726254240482;
        Fri, 13 Sep 2024 12:04:00 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1ed:ea77:491e:7d20:ef52:7bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895665babsm17749807f8f.47.2024.09.13.12.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 12:03:59 -0700 (PDT)
Date: Fri, 13 Sep 2024 15:03:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH] admin: Enable driver to send admin commands before
 DRIVER_OK
Message-ID: <20240913150033-mutt-send-email-mst@kernel.org>
References: <20240910170723.44537-1-parav@nvidia.com>
 <20240910142850-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87136FC9671ABFF7123A82CADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910162247-mutt-send-email-mst@kernel.org>
 <IA0PR12MB8713AC1D273671DF459FA254DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <8a42e214-59b1-4085-aec0-0f31be885525@amd.com>
 <IA0PR12MB871350EE73BFB2B8B60B7E97DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <CACGkMEtUvJhAq9Y-hZ8NroupJgarYhB8qz-cLXNQYrvnoGKgbQ@mail.gmail.com>
 <5d0cf855-ead0-46a4-8221-d41c0a3be15f@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <5d0cf855-ead0-46a4-8221-d41c0a3be15f@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> So Maybe it is a good chance for me to continue the "transport vq" work?

Transport over admin commands was envisioned more or less from day one.
I think it's useful.

But what Parav is asking for seems somewhat orthogonal.



-- 
MST

