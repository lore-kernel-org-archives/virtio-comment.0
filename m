Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1884D346A08
	for <virtio-comment@lists.linux.dev>; Thu, 26 Mar 2026 18:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774550652; cv=none; b=ohdctKU1WunJ6cNzukY0qrDI/7YdJIVBMYzH7sGqI8O7m3VsRge2f6EO/fuKh//MgRzJx0anayHbGlXdAv5MOrycOXSOYSgojf8aL5Nn92yahY9evzn1FBb5m4tFnegA8f6R87+yfMtHqeyAlJzozbaOlTcuG4kgFo7LjoZAiIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774550652; c=relaxed/simple;
	bh=MK86ZR3TXfpGHp9L4QiavwZ6hUddEQetgtqg2VNktxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FJ1Autu2hDjTtYiojwaSe7HGenfvDrehklyYdGDmxAgXgFmBkOgHOMS3A9pT06sX4Ro39u7eA2VmkvFcHPNagJoYh+canDGG0CqC2g7Hjq18g2KfRhlP2DIpg6YqRUqDWUmBL5PaawHky7juT6KWyEcCSajNqFR6w7Kt/EjToeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xx1dQE9k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xx1dQE9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774550650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ml88Jk0HMtdTpJcEMCtYixpr9NcG+BBu98WBiZ5fkdg=;
	b=Xx1dQE9kNjenprrDcMSzyzFJFYO2ViIu1gvvrlPtefumcb0v86IWkQlftm3Q4SkFdnZi6z
	Cf/pwO88wSMHpFuRjWVYQLmbRZyb6rgboJWMYYfPdOHmURYbUIowUaJ7vJqnkWwbcZBooO
	DBXO/QsBgmJ2CkIkKgnjXDzWrzMFJkU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-BgwVd2g5M1OYl_xeQJQKjw-1; Thu, 26 Mar 2026 14:44:06 -0400
X-MC-Unique: BgwVd2g5M1OYl_xeQJQKjw-1
X-Mimecast-MFC-AGG-ID: BgwVd2g5M1OYl_xeQJQKjw_1774550645
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so11495725e9.3
        for <virtio-comment@lists.linux.dev>; Thu, 26 Mar 2026 11:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774550645; x=1775155445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ml88Jk0HMtdTpJcEMCtYixpr9NcG+BBu98WBiZ5fkdg=;
        b=jtA+5PZ12RUiLBPQFnnUWpIc184hSBqimIxWWu2RRRIxjCv7sO9DIpo/pczLa0Djdu
         QsXgT0n63aUOxGSlEWbV5JhlZWt/BEnCmyj/KNshx34hSrEZQWccIBDQhGuoAQvH4lgk
         khuafCkTPBDlZz1FO0O+TfvyW8fUggXcdIYBX5j6HrSe7SFWTMTD69Yd5ACgxPg4RhEJ
         9omJH68QuEEktf7PqHabtBfIWHvANH7m8w4F38v6gBTwN9t9v0t5wdzsRwplFo2LXAM9
         3wPvWv04jbuWXwm6IL7Dw6eNWfyX8DP7gnXXTfTKJkCq3soGSUIZe/INdbMrt9rqtcdP
         QpYw==
X-Gm-Message-State: AOJu0YyG0UzCse7p6/Jl8gsKiWxLs7YZF7wY/lvRtsvR9+W3LILuGmKQ
	rm2DBNu/Ie0Bu7xSlLpaygFAlR4KJSnNc3c+HRw7W/APwoGPdysrk1MTVIk2pgGLZc69GLOm6Pn
	6UjvzfNCcMF3K6I20sQ2s24N57nEOHFD94LqiW99kTGh19bfR4PdGXEOqHWMkp5Y6H9oL15EWEY
	Jt
X-Gm-Gg: ATEYQzyfrB4mEHkq+HbHGdyW0PivS4EwNEboiJfx9CyQYVC0dp2Bf8HIlnXlFpy5Vd4
	ypPo2Lab6J02fxUEItULfvdLf2WwIJyQBM9Yzl+NNkbh6sbglPRZc0Zw9uMWFlpi40uK9f5e54I
	0R8OGpNfxwc/IE1kxdZgDN7X3wszEBgu9EXXjsnYTzoXd65QburzCXbrEYAWWNz3JNkYNvYMnwJ
	LAE/kHl2KCxuZ+9iP6bUDmoVTWHkISKwYPpBYNWRC9cS2qBxx0WxOueVpX/9hKTZEazlt//BVNH
	80r5VJwoktTfRJmhouKF8rGav+bZccgPvgk0ad+ChJBvDUhqvcf7mpwmyin10Soa9tpM1J3kAVj
	iuhZlgRRKmLniW9Y=
X-Received: by 2002:a05:600c:a4f:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-487160350d6mr121624495e9.22.1774550644846;
        Thu, 26 Mar 2026 11:44:04 -0700 (PDT)
X-Received: by 2002:a05:600c:a4f:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-487160350d6mr121624115e9.22.1774550644314;
        Thu, 26 Mar 2026 11:44:04 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725ebe9dfsm2834035e9.4.2026.03.26.11.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:44:03 -0700 (PDT)
Date: Thu, 26 Mar 2026 19:44:01 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Peter Hilber <peter.hilber@oss.qualcomm.com>
Cc: virtio-comment@lists.linux.dev,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH 1/1] transport-mmio: Add v3, which polls for reset
 completion
Message-ID: <acV+cZ3jvru8BzIY@fedora>
References: <20260204115022.1930-1-peter.hilber@oss.qualcomm.com>
 <20260204115022.1930-2-peter.hilber@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260204115022.1930-2-peter.hilber@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fK7t4NQ9KrplBVbthxy6en5vRkS-8JYaFJax86YjYoQ_1774550645
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Peter and sorry for the delay,

I used Claude to review it and I added some comments below:

On Wed, Feb 04, 2026 at 12:50:22PM +0100, Peter Hilber wrote:
> Let devices using the MMIO transport avoid stalling the driver (virtual)
> CPU during device reset, which requires introducing a new MMIO transport
> version.
> 
> Unlike the PCI transport, the MMIO transport does not require the driver
> to poll for reset completion. This requires a device using the MMIO
> transport to complete reset during the write of 0 to the Status
> register. Device reset may take more than 100 ms if it involves
> terminating ongoing device activity which accesses driver memory. When
> the (virtual) CPU writing 0 to the Status register needs to be stalled
> during this, this may violate real-time requirements (including those
> for hypervisor trap-and-emulate).
> 
> Address this by introducing a new MMIO transport version, v3, where the
> driver must poll for reset completion, and, hence, the device reset does
> not have to complete during the write to the Status register.
> 
> For clarity, also add some related requirements for v2. These
> requirements are implied by the rest of the specification and therefore
> do not alter the v2 semantics.
> 
> With MMIO transport v3, reset essentially works as with the PCI
> transport, and the change is therefore not expected to cause problems.
> 
> Existing devices with MMIO transport v2 are not required to implement
> v3, which will not work with current drivers. Drivers have to support
> the MMIO transport versions of the used devices. Portable MMIO transport
> drivers should therefore support both v2 and v3, which is simple.
> 
> Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
> ---
>  transport-mmio.tex | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/transport-mmio.tex b/transport-mmio.tex
> index 94a93a1..6504a6b 100644
> --- a/transport-mmio.tex
> +++ b/transport-mmio.tex
> @@ -64,7 +64,8 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
>    }
>    \hline
>    \mmioreg{Version}{Device version number}{0x004}{R}{%
> -    0x2.
> +    0x2 or 0x3. With version 0x3, the driver waits until it reads 0 from the
> +    \field{Status} register before considering a reset complete.

Shall we add something in the Status register too?,e.g., the driver may
or may not block when writing to this register. 

>      \begin{note}
>        Legacy devices (see \ref{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}~\nameref{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}) used 0x1.
>      \end{note}
> @@ -262,13 +263,29 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
>  
>  The device MUST return 0x74726976 in \field{MagicValue}.
>  
> -The device MUST return value 0x2 in \field{Version}.
> +The device MUST return value 0x2 or 0x3 in \field{Version}.
>  
>  The device MUST present each event by setting the corresponding bit in \field{InterruptStatus} from the
>  moment it takes place, until the driver acknowledges the interrupt
>  by writing a corresponding bit mask to the \field{InterruptACK} register.  Bits which
>  do not represent events which took place MUST be zero.
>  
> +The device MUST reset when 0 is written to \field{Status}.
> +
> +While a reset is in progress, the device MUST retain the previous value of
> +\field{Status}.

I think this may be inconsistent with the `Device Status` section:

`The \field{device status} field starts out as 0, and is reinitialized to 0 by
the device during reset.`

I think we could change in this sentence the word `during` by `after`.
This is a minor comment though because in v2 `during` and `after` is the
same from driver pov due to the sync semantics.

> +
> +For \field{Version} 0x2, the device MUST finish a reset before the driver's
> +write of 0 to \field{Status} has completed.
> +
> +For \field{Version} 0x3, the device MAY continue with a reset after the driver's
> +write of 0 to \field{Status} has completed.
> +
> +For \field{Version} 0x3, when \field{Status} is 0, the device MUST ignore
> +further writes of 0 to \field{Status}.
> +

Is this coherent with PCI? I guess the idea is to ignore if the reset is
in progress but in that case status is not zero yet.


> +The device MUST present 0 in \field{Status} once it has finished the reset.
> +
>  Upon reset, the device MUST clear all bits in \field{InterruptStatus} and ready bits in the
>  \field{QueueReady} register for all queues in the device.
>  
> @@ -305,7 +322,7 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
>  The driver MUST ignore a device with \field{MagicValue} which is not 0x74726976,
>  although it MAY report an error.
>  
> -The driver MUST ignore a device with \field{Version} which is not 0x2,
> +The driver MUST ignore a device whose \field{Version} is neither 0x2 nor 0x3,
>  although it MAY report an error.
>  
>  The driver MUST ignore a device with \field{DeviceID} 0x0,
> @@ -331,6 +348,9 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
>  The driver MUST write a value with a bit mask describing events it handled into \field{InterruptACK} when
>  it finishes handling an interrupt and MUST NOT set any of the undefined bits in the value.
>  
> +For \field{Version} 0x3, the driver MUST NOT consider a reset complete before
> +reading back 0 in \field{Status}.
> +
>  If VIRTIO_F_RING_RESET has been negotiated, after the driver writes 1 to
>  \field{QueueReset} to reset the queue, the driver MUST NOT consider queue
>  reset to be complete until it reads back 0 in \field{QueueReset}. The driver
> -- 
> 2.43.0
> 
> 

