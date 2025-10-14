Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D44B2DEA8E
	for <virtio-comment@lists.linux.dev>; Tue, 14 Oct 2025 08:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760432363; cv=none; b=qnw3E70tc+WfChSyYZuEU/c0fUsoceuCPXst+gJebDs64NTJKXDyyLXX2C3JwFL/dAZBRxdVj4JoYob1CP60ZcsX0NF9DTpE203lxqLJ4mnxbfapLAh1zGZJvlNrokhd/4PlpMrxit8Uv1x3WVluLyONYoRbnymnOmWhWuic61k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760432363; c=relaxed/simple;
	bh=YeBonp654MCdwRgnknAz9JEwRlUK808+v12quMEM+p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UBr0MRqchDjPEG6GDo/sG96htuZSODG+G8fVqGii+TL7WAUp5hMGNpS0/5fMd3l7gtoWhHnp2xGU/4/Aih25GABCxLGbyErwpGFI2W2PdOj4yX/PoSHhy9B6UB2bTdDLv+MleFGoDfgzWW/M35ZA3O9FquwZtRdgSnYg8KkPBcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hQd315EN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hQd315EN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760432360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GzUXOyvieda3C5S5+umHT/NupHmQLK4jyTkfR6QXDUQ=;
	b=hQd315ENpgNLG8j6yekV8dlLXNnkFZCsHbl6y+cKwRrDQDwdL0CX7nYbxEZIkxPat8lBSB
	9wJ6EHQdxuVVN4B88K8kRY7T+m7flK6ZZONj9ysefobws0RMNqNgSc7Y2b9NoZ+q9ekmjn
	gTH3IQkA0EOZwTB9CR082GZ5hTz14Lg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-pSU_IUKhO9ypM54YIFLqnA-1; Tue, 14 Oct 2025 04:59:19 -0400
X-MC-Unique: pSU_IUKhO9ypM54YIFLqnA-1
X-Mimecast-MFC-AGG-ID: pSU_IUKhO9ypM54YIFLqnA_1760432358
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e3d9bf9e1so34118345e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 14 Oct 2025 01:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760432358; x=1761037158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzUXOyvieda3C5S5+umHT/NupHmQLK4jyTkfR6QXDUQ=;
        b=IVXB5ltYBGH8lk6PV7s3dpU0nfL7SATmJW4kLTjo9v1R0TwFEdy+zuoar85Pq4JcP0
         0D9ycKJpDLcscA1diq2Wr+C03yrLHkKPnddaP9sP03fmgISoaD8sTbPn4HlDoogNlwfc
         y0a5elsqlhF4Eq4/kME79w9WVclIZoRMXxONSRJuYfNLWmggQ2hO/b/piVdcxlKymQMe
         a7nXpQwumhdDk90/mwWssqM1RU66fY/4srOtnEKvSQH2n/5jB3XWKa3oImAYBKx5PZTY
         PHNq+UJrkpTs6IrOM5aMsPAYwBO+kcbqjxGsg7+47rMJaJrzlzmdDpz2EKZxLq6ZqMfM
         Mz+g==
X-Gm-Message-State: AOJu0YxiKiwN52TmIyIDi9j1+cp8PBVXYIyFi6Lm4gmW7+AzHroOYIIb
	KWlP1yrJBPufVWH7ooEZer+e7R+dt63cnNl42BQeJjjwkJWg4LvdUQapCLhkxyzDwRZhM/NmHZR
	Tu0wC8EzcbVDQsMtPs+hkJ9EAnJBtW6SemkFVH5cjx3Urt75uaDiXFjvl+PLwwkgSfmQSguBguz
	A3rz0=
X-Gm-Gg: ASbGncvt+mpFwVBuLNFyq7k8LGX5LxPb1fOOIhGVnpIWT1jx/u3MjUJaeQUWi3IppG0
	B0D1bRoalApOky2o+ofA2QVj24axk+KDMBPFem+czM5cIr8uK4B9iax3kerh2bSCO2xqMz0Bm/Y
	sfISLVEQJCnVnc2C+zVtoaVzlV6L0oSPmT3WWAx1qZaD1KQnROpU7tqc2tlaZlAzql8pZq/wqps
	n9PaOCVnQhi2fwzGQdpuLwEYvVAVpJXWMluEZb/9513TBGGERSTG8LOv0QrEs6MTq4HcfL+hJvn
	9+crlrjjyb3l6nVVZWFGh6pkWU/y97xWqA==
X-Received: by 2002:a05:600d:11:b0:46f:b43a:aedf with SMTP id 5b1f17b1804b1-46fb43aaf25mr82733565e9.38.1760432357835;
        Tue, 14 Oct 2025 01:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiSXPBWkNFcVap6lUEDtZZnkeR1qPCFyxnNTvv5JSmuFD3sNWpxdGgU3rceyOz7m0e1qM/Kw==
X-Received: by 2002:a05:600d:11:b0:46f:b43a:aedf with SMTP id 5b1f17b1804b1-46fb43aaf25mr82733405e9.38.1760432357193;
        Tue, 14 Oct 2025 01:59:17 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5d0006sm22708691f8f.34.2025.10.14.01.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 01:59:16 -0700 (PDT)
Date: Tue, 14 Oct 2025 04:59:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, lulu@redhat.com,
	nguyenlienviet@google.com
Subject: Re: [PATCH] virtio-net: introduce TSO limit feature
Message-ID: <20251014044005-mutt-send-email-mst@kernel.org>
References: <20251014042243.22087-1-jasowang@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251014042243.22087-1-jasowang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 19M1LCVCud-4PRZ1YmNDC0MphoeewEgoNlgCvm_W5-M_1760432358
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

thanks for the patch! yet something to improve.
I note issues only when encountered 1st time but please
do go and check all patch for each issue.


On Tue, Oct 14, 2025 at 12:22:43PM +0800, Jason Wang wrote:
> This patch introduces TSO limit feature which allows the device to
> advertise:
> 
> - Maximum TCP length of a TSO packet or inner TSO packet when UDP
>   tunnel is support
> - Maximum number of segment that can be produced by the device after
>   segmentation of TSO or inner TSO packet of a UDP tunnel
> 
> This is a must to implement TCP jumbogram, as networking stack needs
> to know the limitation of the device in order to produce TSO packet as
> large as possible.

I am not sure I understand the use-case. So how is it used,
exactly?

Why is TSO singled out as compared to USO?

> 
> And it would also help for the case where host has a different TSO
> limitation than the assumption (for example, Linux assumes 64K to be
> the maximum number of segs and payload length).

how does it assume it? 64K segments?

> Signed-off-by: Jason Wang <jasowang@redhat.com>




> ---
>  device-types/net/description.tex | 46 ++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 415c7fd..e56df75 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -146,6 +146,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>   when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec feature, it SHOULD
>   also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
>  
> +\item[VIRTIO_NET_F_HOST_TSO_LIMIT(71)] Device limits the maximum TCP
> +  length and the number of segments when performing TCP segmentation.
> +
>  \end{description}
>  
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
> @@ -184,6 +187,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>  \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ along with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
>  \item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL_VQ and VIRTIO_NET_F_RSS.
> +\item[VIRTIO_NET_F_HOST_TSO_LIMIT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6
>  \end{description}
>  
>  \begin{note}
> @@ -220,6 +224,8 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
>          le16 rss_max_indirection_table_length;
>          le32 supported_hash_types;
>          le32 supported_tunnel_types;
> +        le32 tso_max_size;
> +        le32 tso_max_segs;
>  };
>  \end{lstlisting}
>  
> @@ -276,6 +282,19 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
>  Encapsulation types are defined in \ref{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets /
>  Hash calculation for incoming packets / Encapsulation types supported/enabled for inner header hash}.
>  
> +The following field, \field{tso_max_size} only exists if
> +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> +It specifies the maximum TCP length

what is TCP length?

> of a TSO packet

what is a TSO packet? is length likely to be same for TCP6 and TCP4?

> that the
> +device can process.

process in which direction? you mean device can receive?

> When VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set,
> +it specifies the maximum inner TCP length of a UDP tunnel TSO packet
> +that the device can process.

Rest of spec talks of " GSO over UDP tunnels packets" is this the same?

even if it's actually unused?

this, on the assumption that the length for tunnel is smaller?

I think this kind of things should be explicit.


> +
> +The following field, \field{tso_max_segs} only exists if
> +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> +It specifies the maximum number of segments that can be produced by
> +the device after performing segmentation on TSO packet or a UDP tunnel
> +TSO packet (when VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set).

I don't get this field at all. the assumption is that all segments
are the same size, right? Then it is just based on length?



> +
>  \devicenormative{\subsubsection}{Device configuration layout}{Device Types / Network Device / Device configuration layout}
>  
>  The device MUST set \field{max_virtqueue_pairs} to between 1 and 0x8000 inclusive,
> @@ -326,6 +345,17 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
>  The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if it
>  does not offer VIRTIO_NET_F_CTRL_VQ.
>  
> +If VIRTIO_NET_F_HOST_TSO_LIMIT and VIRTIO_NET_F_MTU have been
> +negotiated, the device SHOULD set \field{tso_max_size} so that a TCP
> +segment that fully utilizes the configured MTU can be processed by TSO
> +(e.g., for IPv4 without options: at least \field{mtu} - 20; for IPv6
> +without extension headers: at least \field{mtu} - 40). This
> +recommendation does not account for IPv4 options or IPv6 extension
> +headers, which reduce the effective segment size.
> +
> +If VIRTIO_NET_F_HOST_TSO_LIMIT has been negotiated, the device MUST
> +set \field{tso_max_segs} to at least 64.

where does this 64 come from? pls document.

> +
>  \drivernormative{\subsubsection}{Device configuration layout}{Device Types / Network Device / Device configuration layout}
>  
>  The driver MUST NOT write to any of the device configuration fields.
> @@ -379,6 +409,22 @@ \subsubsection{Legacy Interface: Device configuration layout}\label{sec:Device T
>  which provided a way for drivers to update the MAC without
>  negotiating VIRTIO_NET_F_CTRL_MAC_ADDR.
>  
> +If the driver negotiates VIRTIO_NET_F_HOST_TSO_LIMIT, it MUST NOT
> +transmit TSO packets with TCP length exceeding \field{tso_max_size}.
> +
> +If the driver negotiates both VIRTIO_NET_F_HOST_TSO_LIMIT and
> +VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO, it MUST NOT transmit UDP tunnel TSO
> +packets with inner TCP length exceeding \field{tso_max_size}.
> +
> +If the driver negotiates VIRTIO_NET_F_HOST_TSO_LIMIT, it MUST NOT
> +transmit TSO packets with \field{gso_size} that would cause the device
> +to generate more than \field{tso_max_segs} segments.

and how does it know?


> +
> +If the driver negotiates both VIRTIO_NET_F_HOST_TSO_LIMIT and
> +VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO, it MUST NOT transmit UDP tunnel TSO
> +packets with \field{gso_size} that would cause the device to generate
> +more than \field{tso_max_segs} segments.
> +
>  \subsection{Device Initialization}\label{sec:Device Types / Network Device / Device Initialization}
>  
>  A driver would perform a typical initialization routine like so:
> -- 
> 2.42.0

