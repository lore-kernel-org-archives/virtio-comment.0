Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118731D54EE
	for <virtio-comment@lists.linux.dev>; Wed,  6 Nov 2024 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883349; cv=none; b=n0vb1A6we2QzjB8EC9T5sylIGfd90ulpJBZMIxgGPKBO/TjXAe5WM6MVMFvz44+rNZDE9S/RWSTmyvk+m+L1kyihzvsuUsIN2w+G5gyCNptg+xPVVro4TgaCncc1e+QdG8mhLGkuWDMt/lvUxqgLIxs3lSp4bu9vD9N+JXWvn/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883349; c=relaxed/simple;
	bh=MRjVK7MLtZC7TVYmf8ZZ/Zp4brqabUmCdzeXX6wMgC8=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=knTklVSxuTo/tMLv33RWPBw3S7UwIXO1+lL6Bih2Ld+ZAmgZIlKNg2CydEV7o/Lo6TEYDuugrqj4R2dm7rKdcFMHjph3Dbke1KKsVSEB9O1wdG10RHfCWIeR8SSni9xaUvqqLmK+wAElOxb9ckqrg4WRn86sxRTvTxjiF+Zj+eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=cC2u3NRf; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="cC2u3NRf"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1730883343; h=Message-ID:Subject:Date:From:To;
	bh=hoYdsCQ2cyxXmgOk8cjJdXDOmWirIXxcAe/R2HOg8Xw=;
	b=cC2u3NRf/Zqre4z8FCAhmyUTW9f+I/dxjzdELsBiQU/+z30ichFvUAeDBncI/P+mcbew4rPFdrmTNpr+9ey1v3IIXvkRZ07srHl11cumJRwrnnE3M7PFnIEXFAUdi0EuN0nIWZqWutJYfQVs3IPNlLpBopQPPz/uXz9Ipp6ergk=
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0WIqZpgO_1730883342 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 06 Nov 2024 16:55:42 +0800
Message-ID: <1730883117.586029-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH RESEND 2/4] virtio-net: support receive ptp timestamps
Date: Wed, 6 Nov 2024 16:51:57 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 virtio-comment@lists.linux.dev,
 kernel@pengutronix.de
References: <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
 <20240624-v1-4-topic-virtio-net-timestamping-v1-2-fa3c163e4aa9@pengutronix.de>
In-Reply-To: <20240624-v1-4-topic-virtio-net-timestamping-v1-2-fa3c163e4aa9@pengutronix.de>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Mon, 24 Jun 2024 13:09:05 +0200, Steffen Trumtrar <s.trumtrar@pengutronix.de> wrote:
> Accurate RTT measurement requires timestamps close to the wire.
> Introduce virtio feature VIRTIO_NET_F_RX_TSTAMP. If negotiated, the
> virtio-net header is expanded with room for a timestamp.
>
> A device may pass receive timestamps for all or some packets. Flag
> VIRTIO_NET_HDR_F_TSTAMP signals whether a timestamp is recorded.
>
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  device-types/net/description.tex | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index eb2c08e..09d9c28 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>
> +\item[VIRTIO_NET_F_RX_TSTAMP(48)] Device sends TAI receive time
> +
>  \item[VIRTIO_NET_F_TX_HASH(49)] Driver sends hash report
>
>  \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level statistics
> @@ -415,6 +417,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
>  #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
>  #define VIRTIO_NET_HDR_F_DATA_VALID    2
>  #define VIRTIO_NET_HDR_F_RSC_INFO      4
> +#define VIRTIO_NET_HDR_F_TSTAMP        8
>          u8 flags;
>  #define VIRTIO_NET_HDR_GSO_NONE        0
>  #define VIRTIO_NET_HDR_GSO_TCPV4       1
> @@ -659,6 +662,7 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>        __le16 flow_state;
>      } hash;
>      __u32 reserved;
> +    __le64 tstamp;
>    };
>  \end{lstlisting}
>
> @@ -1177,6 +1181,13 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  #define VIRTIO_NET_HASH_REPORT_UDPv6_EX        9
>  \end{lstlisting}
>
> +\paragraph{Timestamping for incoming packets}
> +\label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets / Timestamping for incoming packets}
> +
> +If the feature VIRTIO_NET_F_RX_TSTAMP is negotiated, the \field{hdr_len} is set to the size of the virtio_net_hdr_hash_ts struct.
> +The device may pass receive timestamps for incoming packets via \field{tstamp} and signals this with the
> +VIRTIO_NET_HDR_F_TSTAMP flag.
> +
>  \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue}
>
>  The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is


This has not been updated for quite some time, but for us, the RX HW timestamp
feature has always been crucial. The TX HW timestamp feature, however, has not
progressed due to reasons we all know about.

Could we make a compromise in this area? First, let's complete the RX HW
timestamp feature. For us, the RX HW timestamp is much more important than the
TX HW timestamp.

@Jason @Michael @Parav

Thanks.


>
> --
> 2.42.0
>
>
