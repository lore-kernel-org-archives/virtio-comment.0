Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF6F1C07CB
	for <virtio-comment@lists.linux.dev>; Mon, 10 Feb 2025 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190295; cv=none; b=O3+iiBrKyXpObiEevOFXIGjnH9ZgiTmK+Iov/OUBnN0Hhp+2BThfsrPfsgmPXxrL4uwcNAAAZVWcMQwa3KI4oKpU88/XXJqkN7QcL5nO4yhz1JOigEwOxpnEc2Os69rHr2R0FEECWCXKH7d0mH6n0d3UZspkL9g9nA7KpR05j+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190295; c=relaxed/simple;
	bh=Snd6hcNVQmY7DLnA5M+WL3aZHC5Xvo3+n3Oot8TBMH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Tou98eJ/2pTSgHfsS7J5EEghdvGMwRkPgpT/3N8v6ONVzB+SB0u4THmbYfXjllOy02J+G18D0qAoLnSoBkd5wK037EFTQbmL8EbTjwJ4uoypabVHpR5318kZRxXT/xWtAY4zFL/jywJHOND73WxtoG/vNSlgXuYj5g7ZtGeTrrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LVjO8cU1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LVjO8cU1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739190292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vHZA/tD2f+gFTeDmaKywlX6WdXkWoLPuGo+u1FW6Ttw=;
	b=LVjO8cU1eTlTLkb9E5/GTNnu39qR0i2K9UCjr70LFfeQI2f697RxJ8PGeUKvmpK/zTg1kT
	Yhhc1bZ2cq3+AWxywx0VG1PfpYs7ZCcVLIVI4Hw1+SpWEKnOv/QPWdVIKa4k4RArxlKLqN
	s9b+WJd1DXyXZFnizoWpYZmw98d4X0c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-C2D2Gye3OE-oZAtUuJrw3w-1; Mon, 10 Feb 2025 07:24:51 -0500
X-MC-Unique: C2D2Gye3OE-oZAtUuJrw3w-1
X-Mimecast-MFC-AGG-ID: C2D2Gye3OE-oZAtUuJrw3w
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38dd91cd38cso856511f8f.3
        for <virtio-comment@lists.linux.dev>; Mon, 10 Feb 2025 04:24:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739190290; x=1739795090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHZA/tD2f+gFTeDmaKywlX6WdXkWoLPuGo+u1FW6Ttw=;
        b=vYlID/ZGarNgCBzzarMDQr6HJUHOSby5e8YHSQr9BYN+M/uRRGsfXOhbItu8d3qcVA
         3negX4G0r9vmC78zfmVGFpVdKrgOYVgqpDrYB+1VDHwk/7MeuBRAMSvtgzs7Pn4gTZZF
         2VFrkypo/4d/ctpV/qwflIgjRh8E+Dz7XRYL5KCOIvH3fA5bIOQ5Sh8lO/YPFbeLkOFD
         Y3ctsAv5PoWWNuTDWYqMjmQG+4qoafLzJPDIFoJJVYJjRh+Z+ElRQRi3u1607DGNs5Wf
         vdRMX13wyX2pTbacnm+PLIgpAQcLggTxj//2erDMU5RUgM6VWu/mNIZ6p0SLzfmx95NO
         28Yw==
X-Gm-Message-State: AOJu0Yyka58EsATiWigUtPD16/rYSBY/+0Oio6VgORHX3vfSGwHKkrln
	YU2Fd9mc6UH4ths4jjbAaDivZ9ZlkLxg6U0Rwc4K0081Exw9zxQ+YE62y3td0Rzd34glS585FbA
	Lc2lxAoCwBaE228w643SfJpNPHXX61Dh0q7BsGrGmDAqDVSQofyTAyXvJ+1Pb+mmb
X-Gm-Gg: ASbGncuEq0RGY4rVI7pA/H4hyUTM/O4YhYz/pEitwM08MlGOQl7PObaoDQFVyGpqD5q
	AXteGd8sGNu5pXVk5TVYgHiBdXUFDdoBulZCykSbHkQvtwU7h4RYH9jQ0lDJ0TR9uv1uEqINeo1
	67XlvrI1QwS1+ebDSeJv8MQKSK3Z0jO0q+R4+7rFsBm5Yc9K0+g8Oyued8vluETwED/Ngdq8pKv
	bjagtoyGpRB59/A2LaChpqQno/3pG9rULO7RQtTOsVkF+jJ6NUYrirZ9+5snEkgX0JyuFSNKE8=
X-Received: by 2002:adf:f109:0:b0:385:faaa:9d1d with SMTP id ffacd0b85a97d-38dc935f9b5mr8904215f8f.35.1739190289864;
        Mon, 10 Feb 2025 04:24:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMGipR0h9pABXrRsI+029h7W8RVlcU/KujrZTvL94EZ27sJ+E2BSZRmS7gedy+UAHZvxk0kA==
X-Received: by 2002:adf:f109:0:b0:385:faaa:9d1d with SMTP id ffacd0b85a97d-38dc935f9b5mr8904186f8f.35.1739190289436;
        Mon, 10 Feb 2025 04:24:49 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd34f2af5sm7041326f8f.78.2025.02.10.04.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:24:49 -0800 (PST)
Date: Mon, 10 Feb 2025 13:24:47 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: virtio-comment@lists.linux.dev, eballetb@redhat.com, adelva@google.com,
	gnurou@gmail.com, cohuck@redhat.com, daniel.almeida@collabora.com,
	ribalda@google.com, dverkamp@chromium.org,
	agordeev@qti.qualcomm.com, alex.bennee@linaro.org,
	nicolas.dufresne@collabora.com, gurchetansingh@google.com,
	changyeon@google.com, hverkuil@xs4all.nl, mst@redhat.com
Subject: Re: [PATCH v6 1/1] virtio-media: Add virtio media device
 specification
Message-ID: <Z6nwDxbNZ6ZAPbGQ@fedora>
References: <20250205153301.133040-1-aesteve@redhat.com>
 <20250205153301.133040-2-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250205153301.133040-2-aesteve@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J6C97-ZysTGtjNghbbxSEONnMcIxj2o4lgHoqwXRe08_1739190290
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 05, 2025 at 04:33:01PM +0100, Albert Esteve wrote:
> Virtio-media is an encapsulation of the V4L2 UAPI into
> virtio, able to virtualize any video device supported
> by V4L2.
> 
> Note that virtio-media does not require the use of a
> V4L2 device driver on the host or guest side -
> V4L2 is only used as a host-guest protocol,
> and both sides are free to convert it from/to any
> model that they wish to use.
> 
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  conformance.tex                           |  13 +-
>  content.tex                               |   1 +
>  device-types/media/description.tex        | 617 ++++++++++++++++++++++
>  device-types/media/device-conformance.tex |  12 +
>  device-types/media/driver-conformance.tex |  10 +
>  5 files changed, 649 insertions(+), 4 deletions(-)

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

