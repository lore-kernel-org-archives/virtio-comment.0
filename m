Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5874C70
	for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 07:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739775667; cv=none; b=IpatNcf+ahult5iEcNOEx4t/2BuV9jP+1S/RHdi+/ysvCCCDlrUYaG/MVBGafkKdQpUPjB8kOEJdrEPMQTxlNGZUkNEtvYSd5EeliDpTVwrFPeIOdCMHIqtI1LXG46EEozHj1/oDlVHQ6ZNvlNelD1TPqXWd1VYrWBwHQocG8r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739775667; c=relaxed/simple;
	bh=LHw7YCEb3AiPhDLk7Qe0Y5qxZ18GBcd1J+gzdCtKYew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=vE7WvbRgdBOmp30iOGDt8gmdUsj5n1xb18qDU3JBbX0PYAU2bgcGC5v03u0bn1QGTVYFDtyCvk8bmLW5S+iPQ9ImysOh30zIrGJHxaEEhN12ehLXVH4vO6aQirmoIudo6zB5ILb8NgF1EnWcSG5CLrXHneFfPSUZY3TZVmkE4is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1tjv7e-0008LR-U7; Mon, 17 Feb 2025 08:00:55 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: virtio-comment@lists.linux.dev
Cc: Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH] virtio-net: Fix receive buffer size typo
In-Reply-To: <20250207-v1-4-topic-virtio-net-receive-buffer-fix-v1-1-efcef167d6bc@pengutronix.de>
	(Steffen Trumtrar's message of "Fri, 07 Feb 2025 08:48:47 +0100")
References: <20250207-v1-4-topic-virtio-net-receive-buffer-fix-v1-1-efcef167d6bc@pengutronix.de>
User-Agent: mu4e 1.12.8; emacs 30.0.93
Date: Mon, 17 Feb 2025 08:00:53 +0100
Message-ID: <87o6z1gimy.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: virtio-comment@lists.linux.dev

On 2025-02-07 at 08:48 +01, Steffen Trumtrar <s.trumtrar@pengutronix.de> wrote:

> The commit 00806815385340dd411cc67df3f6837935bb5e26 introduced a slight
> typo in the struct virtio_net_hdr size calculation depending on
> VIRTIO_NET_F_HASH_REPORT negotiation.
>
> Without VIRTIO_NET_F_HASH_REPORT the struct is smaller than with the
> feature. This mix up only occurs in one instance; sizes are correct in
> all other occurences.
>
> Fix this typo.
>
> Fixes: 008068153853 ("virtio-net: Fix receive buffer size calculation text")
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-types/net/description.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 4e4ffdb6e04e346af491edf65886fa096e506abc..08736b6804eafb303a5cfb2f27ec200cec8bd942 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -789,10 +789,10 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
>  the IPv6 header, plus 65535 bytes of maximum IPv6 payload including any
>  extension header), otherwise 1514 bytes.
>  When VIRTIO_NET_F_HASH_REPORT is not negotiated, the required receive buffer
> -size is either 65601 or 1526 bytes accounting for 20 bytes of
> +size is either 65601 or 1526 bytes accounting for 12 bytes of
>  \field{struct virtio_net_hdr} followed by receive packet.
>  When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive buffer
> -size is either 65609 or 1534 bytes accounting for 12 bytes of
> +size is either 65609 or 1534 bytes accounting for 20 bytes of
>  \field{struct virtio_net_hdr} followed by receive packet.
>
>  \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
>
> ---
> base-commit: b2990c8a6642e696d6f269d1db991b2c928d3a9f
> change-id: 20250207-v1-4-topic-virtio-net-receive-buffer-fix-b6487b58813c
>

This small typo is reviewed now. Please raise a vote for this issue:

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/216

--
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
