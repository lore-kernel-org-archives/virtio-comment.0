Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088392C190
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 08:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718094043; cv=none; b=SAPBfrYl11tdBZegy1/Y48Y/FmpRovT17o1vqbU67Fl5loGbk9WEtON16qpp5SltFEQC/I9VRuFE931E6uw/EwuyyF5Ik6SKfdcRxeIFyLHBSnSVp7yzJUZ0/kIZxIoCsMAVm8wm5maVEQTfpW1udmcnq9i5Tkgq8cEYmMjvug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718094043; c=relaxed/simple;
	bh=KCyuzCCR3tRAYo9yfZTZ5ZEARQXtQZKgxcK0085Or20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=DpSRIDTGvmRaGbvGebwn+MeJ2C0HF2Xkm0SEqB94NV/VCW7lpSe3W3tHhY2aUr4PBp5zlvNgJwkXkHhWsnC+5BEs9P51uwUo/+hHcszYc+pBNrjssXbiiJMFmzbpkdXGVCu1d5HpqH/jAH5bmHBdFa6LnfdbxP0VJ58BrPZPte4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WWTl4nPm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WWTl4nPm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718094040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h3anCYUGtdrD+aaeW1hnq8WM4pXCWTDJeqr/oUhg0bY=;
	b=WWTl4nPmccU6E+FhwHD0vYI/Q0xliJq0EkMPQlXmRDrel+q28BLfgk74k0ojB0thCVznuZ
	sMGMKR5u2JGZy3n65XO3PaUr8eGGYne/KrGXI2tOwUEUx+1aVHXPGsHAqF7t8Cvw4IvoB3
	xaH2e7ktydlK4gqV8ippvmgNacFgRlc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-D2b0dqvGPUazkF4rADzmQA-1; Tue, 11 Jun 2024 04:20:39 -0400
X-MC-Unique: D2b0dqvGPUazkF4rADzmQA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4217104c425so23370555e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 01:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718094038; x=1718698838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3anCYUGtdrD+aaeW1hnq8WM4pXCWTDJeqr/oUhg0bY=;
        b=jPiLajJ1r6mK4xAdwGEspZ1Tjl1Ng+6ihx+ycM96SpE31u1RA0wCBoC2Gmzu70vysB
         JsH3iBiatvIQq8Al2D7YuWjg/MBPIHcJ3Yw/C0bW311q3tD6fQuxsWX7uteZ2Vmv8BXN
         TfiE7EANcEKrQYnFZsEtw3hbUEFXylwpMrQYYtFVS5N7nT/9PJxwzi90R6t/N/UekxOr
         0ezGsZQFfv/AKFF2divaG8k9PVb1AMcNlV9KRSGZ9jqadDpFlHVw/GTkCOR+tKU6Uc66
         M1azn34T8+69bT+M0JmvdEPHMINJCoA32sO6LZMm+ZJuOsnZxpVsQU6dqd5zmzp8gCk9
         EDDg==
X-Forwarded-Encrypted: i=1; AJvYcCWckyRb2rZdE568NqqSW4XIG8T+nWWvUW6no62lm6dVMDUbJSdQU3KfvfQpV3TG8q8KEqk0L7YQISQs61mjr5Uq38pidFQapDm9fMAgfhk=
X-Gm-Message-State: AOJu0YzywbSuDw5QsPod36RheiNkNFLkPlWQY+RNFtvIVy0/nbb2zinG
	omOJmzhjSX3/VXWKnBc7ADEOgUob9SP5T+YMSCrxCnZSgnH4IrW4QezRL50jwYW5eo7ao6SwTYu
	bbFqndZczQZntMqy5Fjt9tmm00ZdkKf+hkwCl8jSZfrHvj/eRYpFC0CoVWW9F8Aowzet7Ntm6
X-Received: by 2002:a05:600c:314c:b0:421:7bed:5274 with SMTP id 5b1f17b1804b1-4217bed5371mr68300355e9.10.1718094038112;
        Tue, 11 Jun 2024 01:20:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnwzx1n8ML4vw6zb03HQtntqbidPZBubZzcxGF7+exdJgBvT9QyrIsIKNcFtQwv/scm1p0kA==
X-Received: by 2002:a05:600c:314c:b0:421:7bed:5274 with SMTP id 5b1f17b1804b1-4217bed5371mr68300175e9.10.1718094037720;
        Tue, 11 Jun 2024 01:20:37 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.202.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c19e67fsm170903205e9.2.2024.06.11.01.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 01:20:37 -0700 (PDT)
Date: Tue, 11 Jun 2024 10:20:33 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: mst@redhat.com, hi@alyssa.is, virtio-comment@lists.linux.dev, 
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [RFC PATCH 1/2] virtio-vsock: Add a
 `VIRTIO_VSOCK_F_MULTI_DEVICE` feature
Message-ID: <oxsnc7lbs7m5oreu37aozu32p4kqts7ba5zciib62arz4jhurw@4we3bibx6quf>
References: <20240528054725.268173-1-niuxuewei.nxw@antgroup.com>
 <20240528054725.268173-2-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240528054725.268173-2-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 28, 2024 at 01:47:24PM GMT, Xuewei Niu wrote:
>The feature represents the users want to enable the multi-device feature
>once it is provided by device.
>
>Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>---
> device-types/vsock/description.tex | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
>index 7d91d15..3fbc02a 100644
>--- a/device-types/vsock/description.tex
>+++ b/device-types/vsock/description.tex
>@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
>+\item[VIRTIO_VSOCK_F_MULTI_DEVICE (3)] multi-device is supported.

What about "Driver supports multiple devices." ?

> \end{description}
>
> \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
>@@ -34,6 +35,9 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
> VIRTIO_VSOCK_F_STREAM has also been negotiated.
>
>+The driver SHOULD accept the VIRTIO_VSOCK_F_MULTI_DEVICE feature and allow
>+multiple devices to be registered if offered by the device.

I think we can skip this. For the previous features we added it because 
they are dependent on each other, so we had to clarify the relationship.

>+
> \devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
>
> The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
>@@ -45,6 +49,8 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the device MAY act as if
> VIRTIO_VSOCK_F_STREAM has also been negotiated.
>
>+The device SHOULD offer the VIRTIO_VSOCK_F_MULTI_DEVICE feature.
>+

Ditto.

> \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
>
> Socket device configuration uses the following layout structure:
>-- 
>2.34.1
>

