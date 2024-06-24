Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFA313B280
	for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 11:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719230247; cv=none; b=f3BHGpr72q69kYleVqCrkoqXIWymWUpqX4FBSD/hTTuOvhbJrfBNlAVwoPuwqbvJCYTEe1Q26BKcMPmW+Mwi5uyT+foLE6Y3kRgl6u4U/99oPR/claR2lUUQdAmLK0Oa+L9RjqUZ2v8vtAvsZmOXRK0wvXUGR5vHiWXS5DbpnrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719230247; c=relaxed/simple;
	bh=9l/BgDO1yO6rapp8uWqKM0kNgEXUtQfcdiUnDNDvTBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=VdMAJ046rk0eDaDMfFi2dkNZL+WmqPDeQbVvdAnVrs26yP3fbgsFoE02E+ddckBXfE6iZkMJShmlZpKkFpe3Gw+1gBiVN6UQ1vz5W0NHCQZrwxI7FGa5/dROkkb8i9Jpi3nd0vIKdowCs6nCEwKDTiKWKBdYgu69Bh15Ni0Nzq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RO0drSeU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RO0drSeU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719230245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c+vJ+MzsX5ymi5KHxRf9n/IczCIArwQ60Q6yP0vHP2g=;
	b=RO0drSeU3akIqA6LKO3R2T4uoC6v3ap9vVLyTZexoeRbL96jgQFgu5CTpurUnGdonyhLJI
	nFpZSQzsz72bjaLGpR8Fc5icXFsJFjDp/j0jDJiVrZUG0XsO9x7gEf5JPDifu0SFTmIYk9
	1iQtlLec4YQkayEvRH+vwBXdgcq7Oi8=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-NBgzXhCPO4OvV0KeyGxKXQ-1; Mon, 24 Jun 2024 07:57:23 -0400
X-MC-Unique: NBgzXhCPO4OvV0KeyGxKXQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52cdd795cdaso1534383e87.2
        for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 04:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719230242; x=1719835042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+vJ+MzsX5ymi5KHxRf9n/IczCIArwQ60Q6yP0vHP2g=;
        b=Op0sbWhhrdncqpyR1BxS+5eisFDVyxC6j0UuyfZDE2Kdf5IwX9iO9bm4CdlUQ+BQw0
         /QHhnZHPDtql8EJK0EJroOMzydXEBO1goTrNGYJZ/jVw2c9IDE/WnCs0FIrk1x/1oNyA
         RXfWknxioS84AULmf/ihsUAvJf2PhwWhovL07oia9n27JQzVAYlkizdRRHN7tCoLkTe1
         djWowZMAxP1zcfZGYvRDxRafyGEQ3at64j1/cDM0dwc++RFaO9/uAjFlYdWoLmi6yREq
         f7TstjCNrjU9PJCiYYM9eo6LBlWAD6CtgxhqqStcGraWvfW+YwTNfXMYHCIulO45xoW+
         paVA==
X-Gm-Message-State: AOJu0YwYjjLCf6+keymIp8RL8NJI6pSI6Ikrl1HNxLhVuB0ABCAEimHs
	iaAZqJ0jVxXAnLd2biHqVlzXSBKlvEa6vmZ5Oq3gMZpeQxvtiBVpcRPAlKNCVLKS2aoHn9xZZ84
	9xGNXOqejHfOhMhFBZJqjZVxFQWJvZn4S4VPHIUbLN4wfr6z2WgtZnu2pM5RD7FNa
X-Received: by 2002:a19:5519:0:b0:52c:dbbf:c413 with SMTP id 2adb3069b0e04-52ce183b188mr2914965e87.34.1719230242265;
        Mon, 24 Jun 2024 04:57:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0O4jI5rMwhmgRAdr6egZj9VVZppwLSG3thg+pbddXAxduhGr8hfxHe+nZ8EOrk1Vu6Mc6HA==
X-Received: by 2002:a19:5519:0:b0:52c:dbbf:c413 with SMTP id 2adb3069b0e04-52ce183b188mr2914951e87.34.1719230241471;
        Mon, 24 Jun 2024 04:57:21 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724a6e4201sm165692366b.132.2024.06.24.04.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 04:57:20 -0700 (PDT)
Date: Mon, 24 Jun 2024 07:57:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: virtio-comment@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH RESEND 1/4] virtio-net: support transmit hash report
Message-ID: <20240624074613-mutt-send-email-mst@kernel.org>
References: <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
 <20240624-v1-4-topic-virtio-net-timestamping-v1-1-fa3c163e4aa9@pengutronix.de>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240624-v1-4-topic-virtio-net-timestamping-v1-1-fa3c163e4aa9@pengutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 24, 2024 at 01:09:04PM +0200, Steffen Trumtrar wrote:
> Virtio-net supports sharing the flow hash from device to driver on rx.
> Do the same in the other direction for robust routing and telemetry.
> 
> Experimental results mirror what the theory suggests: where IPv6
> FlowLabel is included in path selection (e.g., LAG/ECMP), flowlabel
> rotation on TCP timeout avoids the vast majority of TCP disconnects
> that would otherwise have occurred during link failures in long-haul
> backbones, when an alternative path is available.
> 
> Rotation can be applied to various bad connection signals, such as
> timeouts and spurious retransmissions. In aggregate, such flow level
> signals can help locate network issues.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  device-types/net/description.tex | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 61cce1f..eb2c08e 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>  
> +\item[VIRTIO_NET_F_TX_HASH(49)] Driver sends hash report
> +
>  \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level statistics
>      to the driver through the control virtqueue.
>  
> @@ -641,6 +643,34 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>  
>  If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
>  rely on the packet checksum being correct.
> +
> +\paragraph{Hash calculation for outgoing packets}
> +\label{sec:Device Types / Network Device / Device Operation / Packet Transmission / Hash calculation for outgoing packets }
> +
> +If the VIRTIO_NET_F_TX_HASH was negotiated and the packet includes a hash, the driver uses
> +the structure virtio_net_hdr_hash_ts instead of virtio_net_hdr and increases the \field{hdr_len} accordingly.

I don't get what does hdr_len have to do with it. It does not normally
include virtio net header and it does not look like your
patch changed it, either.


> +
> +\begin{lstlisting}
> +  struct virtio_net_hdr_hash_ts {
> +    struct {
> +      struct virtio_net_hdr hdr;

hdr is not part of hash, is it? why include it here?

> +      __le33 value;

le33?

> +      __le16 report;
> +      __le16 flow_state;

fields are left undocumented.

> +    } hash;
> +    __u32 reserved;

why do we need this? at least explain what it is and how is this
supposed to be handled, please.

> +  };
> +\end{lstlisting}
> +
> +The driver fills \field{hash_value} with the value of the calculated hash and \field{hash_report} with the report type of the calculated hash.

what are hash_value and hash_report?

> +
> +Possible values that the driver supports in \field{hash_report} are defined below.

considering how we have an extensive infrastructure for supported
hashes for rx, don't we want something like this for tx?

e.g. isn't there overhead associated with filling out this hash,
and doesn't driver benefit from knowing which ones can the
device use, exactly?

> +
> +\begin{lstlisting}
> +#define VIRTIO_NET_HASH_REPORT_L4             (1 << 10)
> +#define VIRTIO_NET_HASH_REPORT_OTHER          (1 << 11)
> +\end{lstlisting}
> +
>  \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Network Device / Device Operation / Packet Transmission / Packet Transmission Interrupt}
>  
>  Often a driver will suppress transmission virtqueue interrupts
> 
> -- 
> 2.42.0
> 

