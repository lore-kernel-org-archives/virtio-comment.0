Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B901F4266
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 16:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729268694; cv=none; b=CbaJ5jRqzTOzin2YHlx8BfzpiYqo1rgnH+qO3IIzuO1SJnlOtRUN4rOE2XZzZLPr1dMT6Q29S89jmas/nX9HdKPVd4eIZNU5DYV5kzngNvGUErEORbUXMZbxLTIbp74XMPEXb8LPn0a3iJ18OnP3iU9W2WL2gRGqGJZxkFeSguw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729268694; c=relaxed/simple;
	bh=L+b2laQkmebY0BPk1pV5HcBGGfiIPOn/GPffJoE/JNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=h1+91SPZmuDfAQD1z3v8d3WgAOTEd99irbt6T/zepX2BbR24a2JqQq7B+AhKyv5O6GYMJpXUNzqSpAc3yNk2ABCKHCFzlhZkda8K7D0Xi0Xp+gMwmdPGd155fKO0xiqhl43lHlGkBH5JSZq7tWupcRNDw0Je+FUwGYIcfO50GD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dlCneDoF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dlCneDoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729268691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/fQ4qYgbwKJpXWt/TUBJ8u5wH0/yW3i86kbGis4WWgQ=;
	b=dlCneDoFtKzB/iCY2am68M7bsKMVsvYPX+mqvw3Rtk0daGRtw+gLBNpPUrlbTH/acT6oaQ
	0/85zQoo9J/jPO4usHkD0N3kXyGbn9VfJlEw3c5QjsNU6wsOhYEbNdlxV6dLm80nt5QBbj
	Zi6ekv50mHbsDq3rqvcZqLfgUqGrfaI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-SynE9_aUMVKLfnVIi5Eabg-1; Fri, 18 Oct 2024 12:24:49 -0400
X-MC-Unique: SynE9_aUMVKLfnVIi5Eabg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37d5ca5bfc8so1169872f8f.0
        for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 09:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729268689; x=1729873489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fQ4qYgbwKJpXWt/TUBJ8u5wH0/yW3i86kbGis4WWgQ=;
        b=nKvqXrCmXF/s0iWbif/J2o1YBqjGK09LRHWKhHiqnMXmHWKBcaZCV+BUyJ01+/GpuR
         IutiZmWeh+HpInz92LHwWc/RrII8Y4QqYhm4XbRusm3VeWidXh1B1yCHktOEHhyeLVds
         /5XsQ48Bx9dZG2qPRhzOI4bfyaQiXqwiX69uMb8SE+6bh6f3Vu6U26j0DDGzokQ5Bq28
         tzMEQ9g4G7yyIPLkQrom4I1UB92LTL9vyqRmLXhyziWKTJGNOhPU4wV8eMvnTfcxBJH4
         kDpVH0Y0D2RbVpBej4rp3Wd2S15Kkm6Fm7NhLn4riL7PKfCj0jsrbwdkeL21rzzbHfM8
         +j5Q==
X-Gm-Message-State: AOJu0YzYk04f6FIXVW2lwKeSJV/HhobhiqY7eRcsiyKw3k1/Q8ula37r
	5TL4ODa4MHYbnl6qQp7GrDN+X+vsjWwh6dZr43ySUp8h8pO3yZJo0/IkArFtLURLxGd5m8HfsH3
	qhaP9J3rPmHoJWH6bnOUFct0YGxzUvtc1qnQvjGd/f1YeVhSm5sI0+22Q92C3xbzk
X-Received: by 2002:adf:cd0c:0:b0:375:c4c7:c7ac with SMTP id ffacd0b85a97d-37eab710fbbmr2312263f8f.49.1729268688561;
        Fri, 18 Oct 2024 09:24:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuanJyn0VhFfH2bf8T/c/LkAcgiCUrRlgwcslUiuWTwiB0QxZ2JW/ckHmi8xtbxpVtRs3vmQ==
X-Received: by 2002:adf:cd0c:0:b0:375:c4c7:c7ac with SMTP id ffacd0b85a97d-37eab710fbbmr2312248f8f.49.1729268688121;
        Fri, 18 Oct 2024 09:24:48 -0700 (PDT)
Received: from fedora ([78.242.166.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf027b58sm2344474f8f.6.2024.10.18.09.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:24:47 -0700 (PDT)
Date: Fri, 18 Oct 2024 18:24:45 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	shahafs@nvidia.com
Subject: Re: [PATCH 3/3] virtio-net: Define cvq configuration related device
 parts
Message-ID: <ZxKLzVV94VW3utAh@fedora>
References: <20241018131741.443635-1-parav@nvidia.com>
 <20241018131741.443635-4-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241018131741.443635-4-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 18, 2024 at 04:17:41PM +0300, Parav Pandit wrote:
> virtio net driver sends the control virtqueue commands for
> device configuration. Such driver configuration is currently
> not captured in the device parts.
> 
> This series adds several of such device parts which represents
> the network device specific configuration.
> 
> It is done by utilizing the existing device parts structure.
> A new generic selector format is added to enable device type
> specific device parts.
> 
> This series also reuses the existing control virtqueue command
> structures, fields, and values to define the network device parts.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/209
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-types/net/description.tex | 90 ++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index e45ecbd..a5c6975 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -433,6 +433,96 @@ \subsection{Device resource objects}\label{sec:Device Types / Network Device / D
>  \hline
>  \end{tabularx}
>  
> +\subsection{Device parts}\label{sec:Device Types / Network Device / Device parts}
> +
> +Network device parts represent the configuration done by the driver using control
> +virtqueue commands. Network device part is in the format of
> +\field{struct virtio_dev_part}.
> +
> +\begin{tabularx}{\textwidth}{ |l||l|X| }
> +\hline
> +Type & Name & Description \\
> +\hline \hline
> +0x200 & VIRTIO_NET_DEV_PART_CVQ_CFG_PART & Represents device configuration done through a control virtqueue command, see \ref{sec:Device Types / Network Device / Device parts / VIRTIO-NET-DEV-PART-CVQ-CFG-PART} \\
> +\hline
> +0x201 - 0x5FF & - & reserved for future \\
> +\hline
> +\hline
> +\end{tabularx}
> +
> +\subsubsection{VIRTIO_NET_DEV_PART_CVQ_CFG_PART}\label{sec:Device Types / Network Device / Device parts / VIRTIO-NET-DEV-PART-CVQ-CFG-PART}
> +
> +For VIRTIO_NET_DEV_PART_CVQ_CFG_PART, \field{part_type} is set to 0x200. The
> +VIRTIO_NET_DEV_PART_CVQ_CFG_PART part indicates configuration performed by the
> +driver using a control virtqueue command.
> +
> +\begin{lstlisting}
> +struct virtio_net_dev_part_cvq_selector {
> +        u8 class;
> +        u8 command;
> +        u8 reserved[6];
> +};
> +\end{lstlisting}
> +
> +There is one device part of type VIRTIO_NET_DEV_PART_CVQ_CFG_PART for each
> +individual configuration. Each part is identified by a unique selector value.
> +The selector, \field{device_type_raw}, is in the format
> +\field{struct virtio_net_dev_part_cvq_selector}.
> +
> +The selector consists of two fields: \field{class} and \field{command}. These
> +fields correspond to the \field{class} and \field{command} defined in
> +\field{struct virtio_net_ctrl}, as described in the relevant sections of
> +\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue}.
> +
> +The value corresponding to each part’s selector follows the same format as the
> +respective \field{command-specific-data} described in the relevant sections of
> +\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue}.
> +
> +For example, when the \field{class} is VIRTIO_NET_CTRL_MAC, the \field{command}
> +can be either VIRTIO_NET_CTRL_MAC_TABLE_SET or VIRTIO_NET_CTRL_MAC_ADDR_SET;
> +when \field{command} is set to VIRTIO_NET_CTRL_MAC_TABLE_SET, \field{value}
> +is in the format of \field{struct virtio_net_ctrl_mac}.
> +
> +Supported selctors are listed in the table:

s/selctors/selectors

> +
> +\begin{tabularx}{\textwidth}{ |l|X| }
> +\hline
> +Class selector & Command selector \\
> +\hline \hline
> +VIRTIO_NET_CTRL_RX & VIRTIO_NET_CTRL_RX_PROMISC \\
> +\hline
> +VIRTIO_NET_CTRL_RX & VIRTIO_NET_CTRL_RX_ALLMULTI \\
> +\hline
> +VIRTIO_NET_CTRL_RX & VIRTIO_NET_CTRL_RX_ALLUNI \\
> +\hline
> +VIRTIO_NET_CTRL_RX & VIRTIO_NET_CTRL_RX_NOMULTI \\
> +\hline
> +VIRTIO_NET_CTRL_RX & VIRTIO_NET_CTRL_RX_NOUNI \\
> +\hline
> +VIRTIO_NET_CTRL_RX & VIRTIO_NET_CTRL_RX_NOBCAST \\
> +\hline
> +VIRTIO_NET_CTRL_MAC & VIRTIO_NET_CTRL_MAC_TABLE_SET \\
> +\hline
> +VIRTIO_NET_CTRL_MAC & VIRTIO_NET_CTRL_MAC_ADDR_SET \\
> +\hline
> +VIRTIO_NET_CTRL_VLAN & VIRTIO_NET_CTRL_VLAN_ADD \\
> +\hline
> +VIRTIO_NET_CTRL_ANNOUNCE & VIRTIO_NET_CTRL_ANNOUNCE_ACK \\
> +\hline
> +VIRTIO_NET_CTRL_MQ & VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET \\
> +\hline
> +VIRTIO_NET_CTRL_MQ & VIRTIO_NET_CTRL_MQ_RSS_CONFIG \\
> +\hline
> +VIRTIO_NET_CTRL_MQ & VIRTIO_NET_CTRL_MQ_HASH_CONFIG \\
> +\hline
> +\hline
> +\end{tabularx}
> +
> +For command selector VIRTIO_NET_CTRL_VLAN_ADD, device part consists of a whole
> +VLAN table.
> +
> +\field{reserved} is reserved and set to zero.
> +
>  \subsection{Device Operation}\label{sec:Device Types / Network Device / Device Operation}
>  
>  Packets are transmitted by placing them in the
> -- 
> 2.34.1
> 

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

