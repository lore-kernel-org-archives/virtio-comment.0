Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9112B377EDA
	for <virtio-comment@lists.linux.dev>; Mon, 20 Apr 2026 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678028; cv=none; b=YMT/mXYHpMrb7WGoM5JKWoU1V19XUVoFfQuEejrAw3FWryBXBIrEPrY539+ULBC+IAQmmSdzaB5OkpqpvryB/QP5Q5FCU027P7YlUClUSITSLwtKUo3MG2xKgvIgPO2zVeJY4KtI8Eq/GDhoYQXUUy4pUWHEy0yfmuC0kzLBJCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678028; c=relaxed/simple;
	bh=Rd9PpT+0MjGf3wYlqqS5FGa51EjzKmNrJ9PaPWSuIm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=AW8avkpljj+2GzDF6aDtPaHLztY2+DFG6kSsvxQm3bAa61LrAp7o1k6xWYOly2RUE6C1SAT/yGsY8WD3wYh8KrglW6Rs5vRbDwTvTsUbG2d6gtfpsU6D0rsQeWxhSvP87f/eaEs5+c1BNZzvkNTPjzndIt2jzd/tX1SI5SxqLN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CeNsaiGa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CeNsaiGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776678025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qx3j2PbvZ/2IpQgFNHG2/75KQg05XNu1rVQFAcvDG0E=;
	b=CeNsaiGawIklYpSTxuMP0gY7bLh6LEuTBtRqbQTd88r5//FccxKJXwWlk0/5fDSp7tqkhW
	V/RDEu9/832RXmbC+nhJytYnNUuTHiCw5cVkFrjFwnalmq21Y4bE7b2aOSIDH1Qb0XbJ0P
	6PN6UQTIW8FXu/2Zv+sLgIe5jdCzqOA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-TD8SAJUqMLOsT4LqVo8j-w-1; Mon, 20 Apr 2026 05:40:24 -0400
X-MC-Unique: TD8SAJUqMLOsT4LqVo8j-w-1
X-Mimecast-MFC-AGG-ID: TD8SAJUqMLOsT4LqVo8j-w_1776678023
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43d7730e9e3so2043814f8f.2
        for <virtio-comment@lists.linux.dev>; Mon, 20 Apr 2026 02:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776678023; x=1777282823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qx3j2PbvZ/2IpQgFNHG2/75KQg05XNu1rVQFAcvDG0E=;
        b=ImVirVftcg7+5EjG8efLPwKpiSVhkDS7Ih26Q9BfS5ePguJcFYQKoF+QEGHyVNdx3L
         jOqvgo6uYVyA/UUnpYRlxJxKcqEpZbHDfZIk1JkGbCsRsFtLYUxHBjYd4MUCx0DKYLaX
         kh/DPVFE6iHPoom4yoHByIEWFUu+hlPJ+p/3EWwrEMGnJdEA52nzSuQQsjj61jp+wjC5
         nk+bfCDKjsYueq+/l09SFP74jya7gVdBSh4AgbHA/aqkF4OdvzB7qQPSjjOfSBwj787f
         GW/92fCxdklydtMRx9joEuqzOYHikeViwSLqrkDow9dUza1lZH6ot0dJmvbk6kqA2xAs
         DJeg==
X-Gm-Message-State: AOJu0YzKM7NH+A7CLe7Tl9XOmeMtp+TdrsuyFH1spNAyKxDFOdh2Oo5z
	SOewlPG+vbsSu/bPle7ZIALbiAFMCj5Oa+XhXQMtC8xnYYeQWWYqKE9pLbyENRvRjDSixNMh23v
	KZgKRzj9ZhodfdkfhzWsoGATFZDeH42YtM0skJnIFz6ZLG9QJRpQOvfQfWrQ6JGsQ1Tme
X-Gm-Gg: AeBDieurFOqwYUY1Ylot3QI+ZSLEaLUK7EFO7TgFtgXib4bPzw0DSOaEIzJIo9STfZO
	zwL2ogvYMtu/9rUA38SdplrK+OdO2PgNeQdXGpdUXiTmQPddgmegmB/6nqWR7AGNyBGtiS1Idek
	Dxm97R2Q8szccfgxFMxQyjggYKLlQK9HHaU8nPFcObOV8eoRFf2nnYsy90RRhrWI+U8u+ZAJ8zC
	Ba3tX7E0ev/XTpyWhcoKY+NUtpfAwBPl2x4ic4Dk+NXy80VHdOvn1xd0Nu83ngoAJvAVfrW1aGO
	3JCnt9IkU8ccRXvZiQ9YKIvMCepANqfT4zFc3BKi15YAbd/XGJqZtaLnx+8AAwJMPEqWOChxzUb
	3w6GZ2JO7G+eZUTU4TPf+1W4ZNQ==
X-Received: by 2002:a05:6000:1886:b0:43d:7e11:1b72 with SMTP id ffacd0b85a97d-43fe3dbece0mr17867913f8f.9.1776678022969;
        Mon, 20 Apr 2026 02:40:22 -0700 (PDT)
X-Received: by 2002:a05:6000:1886:b0:43d:7e11:1b72 with SMTP id ffacd0b85a97d-43fe3dbece0mr17867842f8f.9.1776678022285;
        Mon, 20 Apr 2026 02:40:22 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1249sm24721925f8f.5.2026.04.20.02.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 02:40:21 -0700 (PDT)
Date: Mon, 20 Apr 2026 11:40:20 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Peter Hilber <peter.hilber@oss.qualcomm.com>
Cc: virtio-comment@lists.linux.dev,
	Trilok Soni <trilok.soni@oss.qualcomm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 1/1] transport-mmio: Add v3, which polls for reset
 completion
Message-ID: <aeX0hPTBQh/tgLOp@fedora>
References: <20260416165256.4351-1-peter.hilber@oss.qualcomm.com>
 <20260416165256.4351-2-peter.hilber@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260416165256.4351-2-peter.hilber@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6okJozFx0TI6kBxu-EnhsV5B5ljons016VIhQYucpU8_1776678023
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2026 at 06:52:56PM +0200, Peter Hilber wrote:
> Let devices using the MMIO transport avoid stalling the driver (virtual)
> CPU during device reset, which requires introducing a new MMIO transport
> version.
> 
> Unlike the PCI transport, the MMIO transport does not require the driver
> to poll for reset completion. This requires a device using the MMIO
> transport to complete reset during the write of zero to the Status
> register. Device reset may take more than 100 ms if it involves
> terminating ongoing device activity which accesses driver memory. When
> the (virtual) CPU writing zero to the Status register needs to be
> stalled during this, this may violate real-time requirements (including
> those for hypervisor trap-and-emulate).
> 
> Address this by introducing a new MMIO transport version, v3, where the
> driver must poll for reset completion, and, hence, the device reset does
> not have to complete during the write to the Status register. Add a
> requirement that resetting a device which already has Status zero is
> synchronous to avoid ambiguity when such a reset would finish.
> 
> For clarity, also add some related requirements for v2. These
> requirements are implied by the rest of the specification and therefore
> do not alter the v2 semantics.
> 
> With MMIO transport v3, reset essentially works as with the PCI
> transport, and the change is therefore not expected to cause problems.
> 
> Existing devices with MMIO transport v2 are not required to implement
> v3, which will not work with current drivers. Only devices which require
> asynchronous reset need to report MMIO transport v3, and therefore
> require an updated driver.
> 
> Drivers have to support the MMIO transport versions of the used devices.
> Portable MMIO transport drivers should therefore support both v2 and v3,
> which is simple.
> 
> Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
> ---


Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

Matias

> 
> Notes:
>     v2:
>     
>     - Add summary of MMIO v3 to Version register description (Matias)
>     
>     - Align requirements on Status register transition to zero with transport-
>       independent requirements (Matias)
>     
>     - Change requirements relating to reset when status is already zero
>       (Matias)
>     
>     - In the commit message, document when v3 devices may be incompatible with
>       v2 drivers (as per reply to Michael)
>     
>     - Improve wording; refer to "zero" rather than "0"
> 
>  transport-mmio.tex | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/transport-mmio.tex b/transport-mmio.tex
> index 94a93a1..cddbcc9 100644
> --- a/transport-mmio.tex
> +++ b/transport-mmio.tex
> @@ -64,7 +64,8 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
>    }
>    \hline
>    \mmioreg{Version}{Device version number}{0x004}{R}{%
> -    0x2.
> +    0x2 or 0x3. With version 0x3, the driver waits until it reads zero from the
> +    \field{Status} register before considering a reset complete.
>      \begin{note}
>        Legacy devices (see \ref{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}~\nameref{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}) used 0x1.
>      \end{note}
> @@ -185,6 +186,11 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
>      Writing non-zero values to this register sets the status flags,
>      indicating the driver progress. Writing zero (0x0) to this
>      register triggers a device reset.
> +
> +    Starting with \field{Version} 0x3, the device reset need not
> +    complete before the write returns, and the driver waits until it
> +    reads back zero before considering a reset complete.
> +
>      See also p. \ref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Device Initialization}~\nameref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Device Initialization}.
>    }
>    \hline
> @@ -262,13 +268,31 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
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
> +The device MUST reset when zero is written to \field{Status}.
> +
> +The device MUST present zero in \field{Status} once it has finished the reset.
> +
> +For \field{Version} 0x2, the device MUST finish a reset before the driver's
> +write of zero to \field{Status} has completed.
> +
> +For \field{Version} 0x3, if \field{Status} is non-zero before a reset, the
> +device MAY continue with the reset after the driver's write of zero to
> +\field{Status} has completed.
> +
> +For \field{Version} 0x3, if \field{Status} is zero before a reset, the device
> +MUST finish the reset before the driver's write of zero to \field{Status} has
> +completed.
> +
> +For \field{Version} 0x3, the device MUST change \field{Status} to zero as the
> +last step of the reset.
> +
>  Upon reset, the device MUST clear all bits in \field{InterruptStatus} and ready bits in the
>  \field{QueueReady} register for all queues in the device.
>  
> @@ -305,7 +329,7 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
>  The driver MUST ignore a device with \field{MagicValue} which is not 0x74726976,
>  although it MAY report an error.
>  
> -The driver MUST ignore a device with \field{Version} which is not 0x2,
> +The driver MUST ignore a device whose \field{Version} is neither 0x2 nor 0x3,
>  although it MAY report an error.
>  
>  The driver MUST ignore a device with \field{DeviceID} 0x0,
> @@ -331,6 +355,9 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
>  The driver MUST write a value with a bit mask describing events it handled into \field{InterruptACK} when
>  it finishes handling an interrupt and MUST NOT set any of the undefined bits in the value.
>  
> +For \field{Version} 0x3, the driver MUST NOT consider a reset complete before
> +reading back zero in \field{Status}.
> +
>  If VIRTIO_F_RING_RESET has been negotiated, after the driver writes 1 to
>  \field{QueueReset} to reset the queue, the driver MUST NOT consider queue
>  reset to be complete until it reads back 0 in \field{QueueReset}. The driver
> -- 
> 2.43.0
> 

