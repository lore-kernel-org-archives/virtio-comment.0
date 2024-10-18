Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114CE20E31E
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729261922; cv=none; b=ZwbVzbHBATQhXK2ID3ZeK/3XIyO1Dm00+IPHkk6Ado69RyImrZJDnH3U0NSxVvZHToXmbHUqtevao4+DP/PXqBd/hmqpcOnmTgd6X+jGvwv+ojE8hyWYswY3CxG0AAgFqGDNOYInEOzDBtYKL2k9Shr3qr19neLapCfnnoZ+Ag8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729261922; c=relaxed/simple;
	bh=CEo+NSLcc0FhZjUWLMPbMJpG4bld+tY4j4xoqgYBIKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iDYuH3i0uGw33VCL6GLiWUdjvkq6Mp/HSIFDkOZcVb7Cam6c4QebWan2qpUrtil/brSImTINSugyqpEJxdYwmUOb3iHKFkpLZGIX9BYcvwnlYogYa6a58oAZwNzTTNGYeZkZjeLGKQfmoZkWqIW5HDXCkB/HXoV1AvDnRWYO8Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=heZLxmaA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="heZLxmaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729261919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sy1HTZaqhVfNJv9Nss3114h1Aq7kusAyS7WaXtr2cGc=;
	b=heZLxmaACRqptrlvbQL3LOv84GJbVZitGAIeFrIrcavUphqVM5ovYXtGwjx9tFq/8ZreRf
	i2zCracgF+AEi240QxLfgE5Hq+cqPbolR8h1lGWUODmrmEMQZwYMhUAlevPATsm3DekrsA
	I88yfmW9W7+xIlB2zxIGygmSSciwXEo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-dtNy9ZLVMReGsPQ-vBJ2sA-1; Fri, 18 Oct 2024 10:31:58 -0400
X-MC-Unique: dtNy9ZLVMReGsPQ-vBJ2sA-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-460a9be4e82so22963441cf.0
        for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 07:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729261917; x=1729866717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sy1HTZaqhVfNJv9Nss3114h1Aq7kusAyS7WaXtr2cGc=;
        b=J+TVZ6siXyw1u+9fn29VK6N70ztTpoQ2ZMxWXbnoct0ZcwV2mddASeBBkyWGikGo4q
         gO5FgSOwnKDkRWIT7IZIACkSA9krUVzlxQY2Grdh09j7YsMRbGnJGIobp6ZOQYBW9kVJ
         2nMLktx5Gh0V39XinTPJrUQd0bZmwiOHUjHE6sFo5Z/XwfopJmPaRecuuZsAWFGxjPZP
         RfhiHuW1TvkFrX5WVylUjVfVapyxk9HQ+ofeIkxz3TAb0YjFUslVdzk2BgGBZ+MoFcSa
         03YDtt+KdP+iYZMJuJ3iLsI9R8CQDo3gJ6/T9etZ1hFWNSF3Sjb2IUg1kPzqGuYUnizV
         d4Ig==
X-Gm-Message-State: AOJu0YwppZhsj9r8d6q2QkVe3FgUgxEsUrqSPSN1EiTQMAWiTxZZfT26
	6mUvq6ZNWAdVJFi1y8JGF5jX1Kh/LzxHwb0WqAMeubL2v7//9wiLtKbyvmYWlQ1JC9QdgscV3QQ
	x6QXdUUAGSuWxrDtoqoJfJvRJ4WpEiVWuPBVcnL0GHgizY4UQTbmXOb1RHQzKC21p
X-Received: by 2002:a05:622a:315:b0:458:2fe1:943d with SMTP id d75a77b69052e-460aedf92f0mr31793061cf.49.1729261917431;
        Fri, 18 Oct 2024 07:31:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwADiMMS4UKyAMg6ABZzd0C+pNcl/+//JTLal7TRJ52eu62wDUobHa7Uw+QEoVe1tChEJb2Q==
X-Received: by 2002:a05:622a:315:b0:458:2fe1:943d with SMTP id d75a77b69052e-460aedf92f0mr31792751cf.49.1729261916930;
        Fri, 18 Oct 2024 07:31:56 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-231.retail.telecomitalia.it. [79.46.200.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460ae9975a9sm7789701cf.51.2024.10.18.07.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:31:56 -0700 (PDT)
Date: Fri, 18 Oct 2024 16:31:52 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com, 
	mvaralar@redhat.com, shahafs@nvidia.com
Subject: Re: [PATCH v1] virtio-net: editorial: Annotate structure field
Message-ID: <52kxkqpvoqycgs5qy2hy4qvmqoejrdfo2fxiia6uusbn4oyfls@jtz3lnm7bqwx>
References: <20241018123501.432708-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241018123501.432708-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Fri, Oct 18, 2024 at 03:35:01PM +0300, Parav Pandit wrote:
>Field command-specific-data is a structure field. Annotate it
>as a field so that generated pdf shows it accordingly.
>
>Signed-off-by: Parav Pandit <parav@nvidia.com>
>
>---
>changelog:
>v0->v1:
>- addressed comments from Stefano
>- fixed more places which were missing the annotation
>---
> device-types/net/description.tex | 25 +++++++++++++------------
> 1 file changed, 13 insertions(+), 12 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>index b2a0d39..e45ecbd 100644
>--- a/device-types/net/description.tex
>+++ b/device-types/net/description.tex
>@@ -1217,7 +1217,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> #define VIRTIO_NET_ERR    1
> \end{lstlisting}
>
>-The \field{class}, \field{command} and command-specific-data are set by the
>+The \field{class}, \field{command} and \field{command-specific-data} are set by the
> driver, and the device sets the \field{ack} byte and optionally
> \field{command-specific-result}. There is little the driver can
> do except issue a diagnostic if \field{ack} is not VIRTIO_NET_OK.
>@@ -1255,13 +1255,13 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> commands:
> \begin{itemize}
> \item VIRTIO_NET_CTRL_RX_PROMISC turns promiscuous mode on and
>-off. The command-specific-data is one byte containing 0 (off) or
>+off. The \field{command-specific-data} is one byte containing 0 (off) or
> 1 (on). If promiscuous mode is on, the device SHOULD receive all
> incoming packets.
> This SHOULD take effect even if one of the other modes set by
> a VIRTIO_NET_CTRL_RX class command is on.
> \item VIRTIO_NET_CTRL_RX_ALLMULTI turns all-multicast receive on and
>-off. The command-specific-data is one byte containing 0 (off) or
>+off. The \field{command-specific-data} is one byte containing 0 (off) or
> 1 (on). When all-multicast receive is on the device SHOULD allow
> all incoming multicast packets.
> \end{itemize}
>@@ -1271,24 +1271,24 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> commands:
> \begin{itemize}
> \item VIRTIO_NET_CTRL_RX_ALLUNI turns all-unicast receive on and
>-off. The command-specific-data is one byte containing 0 (off) or
>+off. The \field{command-specific-data} is one byte containing 0 (off) or
> 1 (on). When all-unicast receive is on the device SHOULD allow
> all incoming unicast packets.
> \item VIRTIO_NET_CTRL_RX_NOMULTI suppresses multicast receive.
>-The command-specific-data is one byte containing 0 (multicast
>+The \field{command-specific-data} is one byte containing 0 (multicast
> receive allowed) or 1 (multicast receive suppressed).
> When multicast receive is suppressed, the device SHOULD NOT
> send multicast packets to the driver.
> This SHOULD take effect even if VIRTIO_NET_CTRL_RX_ALLMULTI is on.
> This filter SHOULD NOT apply to broadcast packets.
> \item VIRTIO_NET_CTRL_RX_NOUNI suppresses unicast receive.
>-The command-specific-data is one byte containing 0 (unicast
>+The \field{command-specific-data} is one byte containing 0 (unicast
> receive allowed) or 1 (unicast receive suppressed).
> When unicast receive is suppressed, the device SHOULD NOT
> send unicast packets to the driver.
> This SHOULD take effect even if VIRTIO_NET_CTRL_RX_ALLUNI is on.
> \item VIRTIO_NET_CTRL_RX_NOBCAST suppresses broadcast receive.
>-The command-specific-data is one byte containing 0 (broadcast
>+The \field{command-specific-data} is one byte containing 0 (broadcast
> receive allowed) or 1 (broadcast receive suppressed).
> When broadcast receive is suppressed, the device SHOULD NOT
> send broadcast packets to the driver.
>@@ -1330,7 +1330,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> many addresses.
> }. This table is set using the class
> VIRTIO_NET_CTRL_MAC and the command VIRTIO_NET_CTRL_MAC_TABLE_SET. The
>-command-specific-data is two variable length tables of 6-byte MAC
>+\field{command-specific-data} is two variable length tables of 6-byte MAC
> addresses (as described in struct virtio_net_ctrl_mac). The first table contains unicast addresses, and the second
> contains multicast addresses.
>
>@@ -1339,7 +1339,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> accepts (and if VIRTIO_NET_F_MAC has been negotiated,
> this will be reflected in \field{mac} in config space).
>
>-The command-specific-data for VIRTIO_NET_CTRL_MAC_ADDR_SET is
>+The \field{command-specific-data} for VIRTIO_NET_CTRL_MAC_ADDR_SET is
> the 6-byte MAC address.
>
> \devicenormative{\subparagraph}{Setting MAC Address Filtering}{Device Types / Network Device / Device Operation / Control Virtqueue / Setting MAC Address Filtering}
>@@ -1406,7 +1406,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> \end{lstlisting}
>
> Both the VIRTIO_NET_CTRL_VLAN_ADD and VIRTIO_NET_CTRL_VLAN_DEL
>-command take a little-endian 16-bit VLAN id as the command-specific-data.
>+command take a little-endian 16-bit VLAN id as the
>+\field{command-specific-data}.
>
> VIRTIO_NET_CTRL_VLAN_ADD command adds the specified VLAN to the
> VLAN filter table.
>@@ -3036,10 +3037,10 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
> \item for all commands, use a single 2-byte descriptor including the first two
> fields: \field{class} and \field{command}
> \item for all commands except VIRTIO_NET_CTRL_MAC_TABLE_SET
>-use a single descriptor including command-specific-data
>+use a single descriptor including \field{command-specific-data}
> with no padding.
> \item for the VIRTIO_NET_CTRL_MAC_TABLE_SET command use exactly
>-two descriptors including command-specific-data with no padding:
>+two descriptors including \field{command-specific-data} with no padding:
> the first of these descriptors MUST include the
> virtio_net_ctrl_mac table structure for the unicast addresses with no padding,
> the second of these descriptors MUST include the
>-- 
>2.34.1
>
>

