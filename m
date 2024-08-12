Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41F51494B8
	for <virtio-comment@lists.linux.dev>; Mon, 12 Aug 2024 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723460110; cv=none; b=L60IS6l+y0FVBppzrbhZJVy2v5hqws/x1cHMme+2zLgzr58wk/kTN8yPVj2W0Z20kcGJ4ud1wFjHPohb3gdm6Uf1U57sRET1PbrY4+1sYSO0578x9AVpcLOX2trivX0YCalmseRwTtt6z3AyLDf7A7opeS2DiBlN35ePyNwRLkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723460110; c=relaxed/simple;
	bh=gFBLMiM4LMWX85E2bzA/oG34VEWXbIYltiJvwKDXjtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=NOxUnsab3q8Ajo1KCcHiLk4zgWaq2oq1vw3E/uOb3WFg8LU8jroQFo02/Si3RYknNT7bnue+3Z0oh59AJU6CIc4fEWNJfWUXu5MhU/kSg9G+yjRjxilceBdsSZFXlYcYLPbV90vlx1m58iyMSoC7zzxv+bYAzcTvPXyh1DQL3ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S0kFwde3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S0kFwde3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723460107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wsi/HZQFW83+DH9QSwY9az9BO8htl1tHYOmZg7nnZLA=;
	b=S0kFwde3/TBpy31vPkmQ3BRFQ9tU/3Su0ha4MfLVfTmi62mxMRUxyAxpIIFRoGSSRcIQRJ
	sPlwg3kFuPc9nDIbrtDSdrrWCJ14qYnCaQ43XMmQdTdQkRBZnQM6ZGLAcAo5Z83FqscQKc
	Wrx3X7L5jEWGJY0JdrX06r4u0YaW59c=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-ZkxVHV5MOduLHL3TiADXww-1; Mon, 12 Aug 2024 06:55:06 -0400
X-MC-Unique: ZkxVHV5MOduLHL3TiADXww-1
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-4f51c29a610so733820e0c.1
        for <virtio-comment@lists.linux.dev>; Mon, 12 Aug 2024 03:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723460106; x=1724064906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wsi/HZQFW83+DH9QSwY9az9BO8htl1tHYOmZg7nnZLA=;
        b=OPCuP8iyFxjJLM73Rgu+QYu3tOd/dzbojawvd0FKrDfXXEuCIaE9X9i9ObRZQMbwI6
         1hsJErfcLAK3FeWqMyreB6mW9R0sKoCBZ3lcZzjR8PvBwKvadqzS+m1Ilwg4/UlTrj+u
         pA9OgrWv8nv7CsHjJ2XHU25cVyIHwgB8FY0y9HM/uz60p1JO8Shsti3b7WZIJIp/NCOM
         3fi3iYmkawRI2+4cv4cYjGOOPrA+c/RsRYrKSRs3724Kq51n1itEK9T4bKzYT76k9lRG
         USf+xEq4bLl0VHxHB/8Tow91lbQLx+Lt3cWTSEes5ucymYDb+zMDys2y6RW1Y8K76r30
         KXYA==
X-Gm-Message-State: AOJu0YzYeyKuNKkQrH0/q6exkWOyFsZgS5RX8nv6nOtY/KrhyEG0Qf/F
	TDlAQagIOT8tU8Wvnmmfrm9dXcqYMpRUVJB5yQ4WTFAh32W5rgHL60QHcf8TXzQzaBR9Jbc74HB
	gFUABnzrJQBh/3XRkNsnBRqsEoOIZVMrYs+6zSOVj2jc9f9LZ3p/M9e2oWhdouuW/
X-Received: by 2002:a05:6122:3197:b0:4ec:f6f2:f1cd with SMTP id 71dfb90a1353d-4f912eb140dmr6902557e0c.9.1723460105863;
        Mon, 12 Aug 2024 03:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtI011hPTvtvWPuzSAjbS/KSZSMETkTbAr6zZ/6SUazd6qupZVvmao2F+Nq1f8buddIZXAGw==
X-Received: by 2002:a05:6122:3197:b0:4ec:f6f2:f1cd with SMTP id 71dfb90a1353d-4f912eb140dmr6902525e0c.9.1723460105425;
        Mon, 12 Aug 2024 03:55:05 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82e35785sm23290866d6.81.2024.08.12.03.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 03:55:05 -0700 (PDT)
Date: Mon, 12 Aug 2024 12:55:01 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V9] virtio-transport: Add a section to define mandatory
 transport requirements
Message-ID: <ZrnqBewNnZu5xmJ9@fedora>
References: <b8b964a8a3e6eba7461bbe7e10876c34e1e313a5.1723198845.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b8b964a8a3e6eba7461bbe7e10876c34e1e313a5.1723198845.git.viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I have some minor comments:

On Fri, Aug 09, 2024 at 03:52:28PM +0530, Viresh Kumar wrote:
> The current Virtio documentation lacks a set of generic requirements
> applicable to all transports. Defining these generic requirements could
> be beneficial when integrating support for a new transport.
> 
> This section outlines the essential requirements that any transport
> method must adhere to.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V8->V9:
> - Change order of the statements.
> - Specify DEVICE_NEEDS_RESET and FEATURES_OK bits.
> - Language improvements.
> 
> V7->V8:
> - Remove separate sections for device/driver requirements.
> - Remove optional requirements.
> - Other generic improvements.
> 
> V6->V7:
> - Remove parts that talk about accessing content of the virtqueue.
> 
> V5->V6:
> - Move the changes to a new appendix section.
> - Clarify the requirements a bit more based on review comments.
> 
> V4->V5:
> - s/The transport/A transport/
> - s/MUST provide/provides/
> - Added some text for transport requirements.
> 
> V3->V4:
> - Remove the normative sections and use direct speech.
> - Change wording at few places.
> 
> V2->V3:
> - Minor fixes.
> - Added Reviewed by from Alex.
> 
> V1->V2:
> - Lot of changes after discussions with Alex and Cornelia.
> - Almost a rewrite of the first commit.
> - Add Transport normative sections.
> 
>  main.tex         |  2 ++
>  newtransport.tex | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 newtransport.tex
> 
> diff --git a/main.tex b/main.tex
> index b1913d65e964..6d337217a3d1 100644
> --- a/main.tex
> +++ b/main.tex
> @@ -42,6 +42,8 @@
>  
>  \input{newdevice.tex}
>  
> +\input{newtransport.tex}
> +
>  % acknowledgements
>  \input{acknowledgements.tex} 
>  
> diff --git a/newtransport.tex b/newtransport.tex
> new file mode 100644
> index 000000000000..af6c42c75a60
> --- /dev/null
> +++ b/newtransport.tex
> @@ -0,0 +1,44 @@
> +\chapter{Creating New Transports}\label{sec:Creating New Transports}
> +
> +Devices and drivers utilize various transport methods to facilitate
> +communication, such as PCI, MMIO, or Channel I/O. These transport
> +methods determine multiple aspects of the interaction between the device

Maybe remove `multiple` here. I think it does not add much but I do not
have an strong opinion about this.

> +and the driver, including device discovery, capability exchange,
> +interrupt handling, and data transfer. For instance, in a host/guest
> +architecture, the host might expose a device to the guest via a virtual
> +PCI bus, and the guest would employ a PCI device driver to interface
> +with the device.
> +

Maybe a verb different than `employ`? But I do not have an strong
opinion about this.

> +This section outlines the mandatory requirements that a transport method
> +implements.
> +
> +A transport provides a mechanism to implement configuration space for
> +the device.
> +
> +A transport provides a mechanism for the driver to identify the device
> +type.
> +
> +A transport provides a mechanism for the driver to read the device's
> +FEATURES_OK and DEVICE_NEEDS_RESET status bits.
> +
> +A transport provides a mechanism for the driver to modify the device's
> +status.
> +
> +A transport provides a mechanism for the driver to read and modify the
> +device's feature bits.
> +
> +A transport allows one or more virtqueues to be implemented by the
> +device. The number of virtqueues is device specific and not specified by
> +the transport.
> +
> +A transport provides a mechanism for the driver to communicate virtqueue
> +configuration and memory location to the device.
> +
> +A transport provides a mechanism for the device to send device
> +notifications to the driver, such as used buffer notifications.
> +
> +A transport provides a mechanism for the driver to send driver
> +notifications to the device, such as available buffer notifications.
> +
> +A transport provides a mechanism for the driver to initiate a device
> +reset.

LGTM!

Matias.

