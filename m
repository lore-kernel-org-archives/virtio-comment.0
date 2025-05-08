Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D142F4B1E45
	for <virtio-comment@lists.linux.dev>; Thu,  8 May 2025 06:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686159; cv=none; b=ZdJtG4Gh4MA2lEQBjDK8eaDDvX6y0fHbn184LRObwRIPLUlI5eFbOGonq2/1xzJw4gqfmxIHeCnybOS6JBc9+Q+okVFqKZUsuwrWMzOU6eUlwWbEweq45gG9AKa0XhX+MQpGTojSApm5kpHCocFNSGXrynHniSCfF0sVHjWILA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686159; c=relaxed/simple;
	bh=Hpaa3Sb/CBjFJ8XHNKyBBYJfCi01tNcIqIxJwAJ9H6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IxVWnl3364XqPWL1wPxBJsIQtuaGPMVsGK2pMFi3+x284KyBxScoo9xipD13TGs9EWyN4ZmUJ4efBJzPwMqOdTWSg9M2bM8g3yv42O2Ny/wmSUuNrjcnsklICMysz6z4GmStuJOMxeLP0WS2tz6jt36wnn+awZQFwktmGnNXzWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=De3g064S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="De3g064S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746686153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KMobKfCtuk0lmURIPhnjtq8ZM0ewSounpKo4tvTbTRs=;
	b=De3g064Shc2ENFPa3KrLF0aBz4YYnwr+ErjWK9MweXaAAnGQGERgS7iaoSPGogfKnAzmxk
	poo7MrZvmYlsrxatjEPFlBiNcHBKGaS/dHCgeV/toYrNOIs5WWlBc8K6/nA5b2JrbDMnA9
	tKvJBMJitmJJSsZSctgx22I+zCe32PU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-1FoNtHvLNpmCDBUb-uG1Qw-1; Thu, 08 May 2025 02:35:52 -0400
X-MC-Unique: 1FoNtHvLNpmCDBUb-uG1Qw-1
X-Mimecast-MFC-AGG-ID: 1FoNtHvLNpmCDBUb-uG1Qw_1746686151
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a07a867a4dso305474f8f.3
        for <virtio-comment@lists.linux.dev>; Wed, 07 May 2025 23:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746686151; x=1747290951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMobKfCtuk0lmURIPhnjtq8ZM0ewSounpKo4tvTbTRs=;
        b=mcXWybOd8Ivwf+M0tTUsm/gROpF9lDfkQu3FLHoGFY/7y4IIsbaSBG9q0TYLxeKUNg
         0tgvdmOzBYVogI2ba/SurZqgfAepL/IBaUUx3bFgWbLFLyJB5fBCIS4LdJkL9Py/89Jf
         ic3KVz74la4lB54YS9fwLfVO8I/2XDM2J+zuNcDujO/9mFsJTwnkLw8+dKNKal2yVyDt
         fEntkQ+MPByeSLdxy28RNVoK46vc96p0qgJK/UtpIvW2KIvpgtXOz7UxSZb7TDd8TNTM
         uuf0P/LXO/SyFd1QCT0tv1USZ4j/hyboIW0tSxcqHGbz4rkPt7PN+4h/MSWuyeLs5u/F
         eHGg==
X-Gm-Message-State: AOJu0YwsAd9kT74KkQHU2g7YAYB27i2BPh0O8RqmiXeFa/Ovho7ANZqR
	slpYiY1H9wwgwA+OVCRg7ss04a8FPtLdaY6Fqhtw9SldBFbCOUyhpqBHXk9OK3F3TxJjDp44F1c
	vIO7fsXBGGF8wdcdgSAAHubDIfOzAbeT52fjZkNblEtKFfyjn6gMMBnqEDRETiSGa
X-Gm-Gg: ASbGncuuMdFHoCeRJiAj+c5g7kPtUoIx5GNY1iBsDlGB1hMRT0/S85ayVJNnsk0YrPJ
	8ZyYCYGERveNiwEdJQ7K3TZ2zFalDRqFrhC8QTYR78Z1yzPJtsu9pofS8+qn5ipESFGQ3MBW2hx
	KIthQKpNJdFyNUfr4SQEVs0cl5m8FlJLxj3CotyY84D9Fj28SVK09yNgrwUhY83QUjrYgHynSq3
	WrnjzfN/L3A5WtqPxWzPoBmN6pDszPalqTvgBYGhL+NEQvGULOwShwSxPWjrskZ0IVRm3fmkrfS
	iHpUbg==
X-Received: by 2002:a5d:5f4f:0:b0:39c:2688:612b with SMTP id ffacd0b85a97d-3a0ba0952famr1278258f8f.7.1746686150814;
        Wed, 07 May 2025 23:35:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhiSPPCGD8GFz+M2uU2KCMtRC050eGYpVd2cMJaCOweofk+72x9SeGGHqgL0Lqicy54oI6MQ==
X-Received: by 2002:a5d:5f4f:0:b0:39c:2688:612b with SMTP id ffacd0b85a97d-3a0ba0952famr1278230f8f.7.1746686150249;
        Wed, 07 May 2025 23:35:50 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm19505443f8f.92.2025.05.07.23.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:35:49 -0700 (PDT)
Date: Thu, 8 May 2025 02:35:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: virtio-comment@lists.linux.dev, Daniel Verkamp <dverkamp@chromium.org>
Subject: Re: [PATCH v2] virtio-blk: Add a VIRTIO_BLK_T_OUT_FUA request type
Message-ID: <20250508023438-mutt-send-email-mst@kernel.org>
References: <20250508003409.426807-1-afaria@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250508003409.426807-1-afaria@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YS4TFAj8RpT6IP3y2epPHiPZtMxjc4SoEveicI4OX-c_1746686151
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 08, 2025 at 01:34:09AM +0100, Alberto Faria wrote:
> This is a variant of the VIRTIO_BLK_T_OUT request type that further
> ensures the write becomes stable once the request completes, commonly
> known as a Force Unit Access (FUA) request.
> 
> Also add a VIRTIO_BLK_F_OUT_FUA feature bit signaling support for this
> request type.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>

Thanks for the patch!
Could you pls expand on the motivation for the feature?
It's a good idea to add this info in qemu and linux patches, too.
Thanks!


> ---
> Matching kernel and qemu RFCs:
> - https://lore.kernel.org/linux-block/20250508001951.421467-1-afaria@redhat.com/
> - https://lore.kernel.org/qemu-devel/20250508002440.423776-1-afaria@redhat.com/
> 
> v2:
> - Redefine VIRTIO_BLK_T_OUT_FUA to 27 since 15 is already in use.
> - Clarify that the cache mode has no impact on VIRTIO_BLK_T_OUT_FUA
>   semantics.
> - Allow drivers to negotiate VIRTIO_BLK_F_OUT_FUA even if they are
>   incapable of sending VIRTIO_BLK_T_OUT_FUA commands.
> 
>  device-types/blk/description.tex | 114 +++++++++++++++++--------------
>  1 file changed, 64 insertions(+), 50 deletions(-)
> 
> diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
> index 2712ada..d3f4f37 100644
> --- a/device-types/blk/description.tex
> +++ b/device-types/blk/description.tex
> @@ -66,6 +66,8 @@ \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature bits}
>  	(ZNS). For brevity, these standard documents are referred as "ZBD standards"
>  	from this point on in the text.
>  
> +\item[VIRTIO_BLK_F_OUT_FUA (18)] Force Unit Access (FUA) command support.
> +
>  \end{description}
>  
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Block Device / Feature bits / Legacy Interface: Feature bits}
> @@ -395,9 +397,9 @@ \subsection{Device Initialization}\label{sec:Device Types / Block Device / Devic
>      VIRTIO_BLK_T_ZONE_APPEND requests.
>  
>  \item the \field{write_granularity} field of \field{zoned} MUST be set by the
> -    device to the offset and size alignment constraint for VIRTIO_BLK_T_OUT
> -    and VIRTIO_BLK_T_ZONE_APPEND requests issued to a sequential zone of the
> -    device.
> +    device to the offset and size alignment constraint for VIRTIO_BLK_T_OUT,
> +    VIRTIO_BLK_T_ZONE_APPEND, and VIRTIO_BLK_T_OUT_FUA requests issued to a
> +    sequential zone of the device.
>  
>  \item the device MUST initialize padding bytes \field{unused2} to 0.
>  \end{itemize}
> @@ -445,8 +447,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  (VIRTIO_BLK_T_OUT), a discard (VIRTIO_BLK_T_DISCARD), a write zeroes
>  (VIRTIO_BLK_T_WRITE_ZEROES), a flush (VIRTIO_BLK_T_FLUSH), a get device ID
>  string command (VIRTIO_BLK_T_GET_ID), a secure erase
> -(VIRTIO_BLK_T_SECURE_ERASE), or a get device lifetime command
> -(VIRTIO_BLK_T_GET_LIFETIME).
> +(VIRTIO_BLK_T_SECURE_ERASE), a get device lifetime command
> +(VIRTIO_BLK_T_GET_LIFETIME), or a Force Unit Access write
> +(VIRTIO_BLK_T_OUT_FUA).
>  
>  \begin{lstlisting}
>  #define VIRTIO_BLK_T_IN           0
> @@ -457,6 +460,7 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  #define VIRTIO_BLK_T_DISCARD      11
>  #define VIRTIO_BLK_T_WRITE_ZEROES 13
>  #define VIRTIO_BLK_T_SECURE_ERASE   14
> +#define VIRTIO_BLK_T_OUT_FUA      27
>  \end{lstlisting}
>  
>  The \field{sector} number indicates the offset (multiplied by 512) where
> @@ -464,9 +468,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  commands other than read, write and some zone operations.
>  
>  VIRTIO_BLK_T_IN requests populate \field{data} with the contents of sectors
> -read from the block device (in multiples of 512 bytes).  VIRTIO_BLK_T_OUT
> -requests write the contents of \field{data} to the block device (in multiples
> -of 512 bytes).
> +read from the block device (in multiples of 512 bytes).  VIRTIO_BLK_T_OUT and
> +VIRTIO_BLK_T_OUT_FUA requests write the contents of \field{data} to the block
> +device (in multiples of 512 bytes).
>  
>  The \field{data} used for discard, secure erase or write zeroes commands
>  consists of one or more segments. The maximum number of segments is
> @@ -566,11 +570,12 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  
>  Requests of type VIRTIO_BLK_T_OUT, VIRTIO_BLK_T_ZONE_OPEN,
>  VIRTIO_BLK_T_ZONE_CLOSE, VIRTIO_BLK_T_ZONE_FINISH, VIRTIO_BLK_T_ZONE_APPEND,
> -VIRTIO_BLK_T_ZONE_RESET or VIRTIO_BLK_T_ZONE_RESET_ALL may be completed by the
> -device with VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR or VIRTIO_BLK_S_UNSUPP
> -\field{status}, or, additionally, with  VIRTIO_BLK_S_ZONE_INVALID_CMD,
> -VIRTIO_BLK_S_ZONE_UNALIGNED_WP, VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or
> -VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE ZBD-specific status codes.
> +VIRTIO_BLK_T_ZONE_RESET, VIRTIO_BLK_T_ZONE_RESET_ALL or VIRTIO_BLK_T_OUT_FUA may
> +be completed by the device with VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR or
> +VIRTIO_BLK_S_UNSUPP \field{status}, or, additionally, with
> +VIRTIO_BLK_S_ZONE_INVALID_CMD, VIRTIO_BLK_S_ZONE_UNALIGNED_WP,
> +VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE
> +ZBD-specific status codes.
>  
>  Besides the request status, VIRTIO_BLK_T_ZONE_APPEND requests return the
>  starting sector of the appended data back to the driver. For this reason,
> @@ -672,8 +677,8 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  
>  Zones with VIRTIO_BLK_ZT_SWP can be read randomly and should be written
>  sequentially, similarly to SWR zones. However, SWP zones can accept random write
> -operations, that is, VIRTIO_BLK_T_OUT requests with a start sector different
> -from the zone write pointer position.
> +operations, that is, VIRTIO_BLK_T_OUT and VIRTIO_BLK_T_OUT_FUA requests with a
> +start sector different from the zone write pointer position.
>  
>  The field \field{z_state} of \field{virtio_blk_zone_descriptor} indicates the
>  state of the device zone.
> @@ -731,8 +736,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  equal to the sector address of the zone. In this state, the entire capacity of
>  the zone is available for writing. A zone can transition from this state to
>  \begin{itemize}
> -\item VIRTIO_BLK_ZS_IOPEN when a successful VIRTIO_BLK_T_OUT request or
> -    VIRTIO_BLK_T_ZONE_APPEND with a non-zero data size is received for the zone.
> +\item VIRTIO_BLK_ZS_IOPEN when a successful VIRTIO_BLK_T_OUT or
> +    VIRTIO_BLK_T_OUT_FUA request or VIRTIO_BLK_T_ZONE_APPEND with a non-zero
> +    data size is received for the zone.
>  
>  \item VIRTIO_BLK_ZS_EOPEN when a successful VIRTIO_BLK_T_ZONE_OPEN request is
>      received for the zone
> @@ -763,9 +769,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  \item VIRTIO_BLK_ZS_FULL when a successful VIRTIO_BLK_T_ZONE_FINISH request is
>      received for the zone.
>  
> -\item VIRTIO_BLK_ZS_FULL when a successful VIRTIO_BLK_T_OUT or
> -    VIRTIO_BLK_T_ZONE_APPEND request that causes the zone to reach its writable
> -    capacity is received for the zone.
> +\item VIRTIO_BLK_ZS_FULL when a successful VIRTIO_BLK_T_OUT,
> +    VIRTIO_BLK_T_ZONE_APPEND, or VIRTIO_BLK_T_OUT_FUA request that causes the
> +    zone to reach its writable capacity is received for the zone.
>  \end{itemize}
>  
>  Zones in the VIRTIO_BLK_ZS_EOPEN (Explicitly Open) state transition from
> @@ -788,9 +794,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  \item VIRTIO_BLK_ZS_FULL when a successful VIRTIO_BLK_T_ZONE_FINISH request is
>      received for the zone,
>  
> -\item VIRTIO_BLK_ZS_FULL when a successful VIRTIO_BLK_T_OUT or
> -    VIRTIO_BLK_T_ZONE_APPEND request that causes the zone to reach its writable
> -    capacity is received for the zone.
> +\item VIRTIO_BLK_ZS_FULL when a successful VIRTIO_BLK_T_OUT,
> +    VIRTIO_BLK_T_ZONE_APPEND, or VIRTIO_BLK_T_OUT_FUA request that causes the
> +    zone to reach its writable capacity is received for the zone.
>  \end{itemize}
>  
>  When a VIRTIO_BLK_T_ZONE_EOPEN request is issued to an Explicitly Open zone, the
> @@ -806,8 +812,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  \item VIRTIO_BLK_ZS_EMPTY when a successful VIRTIO_BLK_T_ZONE_RESET_ALL request
>      is received by the device,
>  
> -\item VIRTIO_BLK_ZS_IOPEN when a successful VIRTIO_BLK_T_OUT request or
> -    VIRTIO_BLK_T_ZONE_APPEND with a non-zero data size is received for the zone.
> +\item VIRTIO_BLK_ZS_IOPEN when a successful VIRTIO_BLK_T_OUT or
> +    VIRTIO_BLK_T_OUT_FUA request or VIRTIO_BLK_T_ZONE_APPEND with a non-zero
> +    data size is received for the zone.
>  
>  \item VIRTIO_BLK_ZS_EOPEN when a successful VIRTIO_BLK_T_ZONE_OPEN request is
>      received for the zone,
> @@ -876,8 +883,8 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  A driver MUST set \field{sector} to 0 for a VIRTIO_BLK_T_FLUSH request.
>  A driver SHOULD NOT include any data in a VIRTIO_BLK_T_FLUSH request.
>  
> -The length of \field{data} MUST be a multiple of 512 bytes for VIRTIO_BLK_T_IN
> -and VIRTIO_BLK_T_OUT requests.
> +The length of \field{data} MUST be a multiple of 512 bytes for VIRTIO_BLK_T_IN,
> +VIRTIO_BLK_T_OUT, and VIRTIO_BLK_T_OUT_FUA requests.
>  
>  The length of \field{data} MUST be a multiple of the size of struct
>  virtio_blk_discard_write_zeroes for VIRTIO_BLK_T_DISCARD,
> @@ -939,8 +946,8 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  MAY read the starting sector location of the written data from the request
>  field \field{append_sector}.
>  
> -All VIRTIO_BLK_T_OUT requests issued by the driver to sequential zones and
> -VIRTIO_BLK_T_ZONE_APPEND requests MUST have:
> +All VIRTIO_BLK_T_OUT and VIRTIO_BLK_T_OUT_FUA requests issued by the driver to
> +sequential zones and VIRTIO_BLK_T_ZONE_APPEND requests MUST have:
>  
>  \begin{enumerate}
>  \item the data size that is a multiple of the number of bytes reported
> @@ -1002,11 +1009,17 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  
>  \item\label{item:flush3} a VIRTIO_BLK_T_FLUSH request is sent \textbf{after the write is
>    completed} and is completed itself.
> +
> +\item\label{item:flush4} the write was performed using a VIRTIO_BLK_T_OUT_FUA
> +  request, regardless of whether the VIRTIO_BLK_F_FLUSH or
> +  VIRTIO_BLK_F_CONFIG_WCE features were negotiated and regardless of the current
> +  cache mode (as expressed by the value of the \field{writeback} field in
> +  configuration space).
>  \end{enumerate}
>  
>  If the device is backed by persistent storage, the device MUST ensure that
>  stable writes are committed to it, before reporting completion of the write
> -(cases~\ref{item:flush1} and~\ref{item:flush2}) or the flush
> +(cases~\ref{item:flush1}, \ref{item:flush2}, and~\ref{item:flush4}) or the flush
>  (case~\ref{item:flush3}).  Failure to do so can cause data loss
>  in case of a crash.
>  
> @@ -1098,22 +1111,22 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  sequential device zones in VIRTIO_BLK_ZS_IOPEN, VIRTIO_BLK_ZS_EOPEN,
>  VIRTIO_BLK_ZS_CLOSED and VIRTIO_BLK_ZS_FULL state to VIRTIO_BLK_ZS_EMPTY state.
>  
> -Upon receiving a VIRTIO_BLK_T_ZONE_APPEND request or a VIRTIO_BLK_T_OUT
> -request issued to a SWR zone in VIRTIO_BLK_ZS_EMPTY or VIRTIO_BLK_ZS_CLOSED
> -state, the device attempts to perform the transition of the zone to
> -VIRTIO_BLK_ZS_IOPEN state before writing data. This transition may fail due to
> -insufficient open and/or active zone resources available on the device. In this
> -case, the request MUST be completed with VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or
> -VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE value in the \field{status}.
> +Upon receiving a VIRTIO_BLK_T_ZONE_APPEND request or a VIRTIO_BLK_T_OUT or
> +VIRTIO_BLK_T_OUT_FUA request issued to a SWR zone in VIRTIO_BLK_ZS_EMPTY or
> +VIRTIO_BLK_ZS_CLOSED state, the device attempts to perform the transition of the
> +zone to VIRTIO_BLK_ZS_IOPEN state before writing data. This transition may fail
> +due to insufficient open and/or active zone resources available on the device.
> +In this case, the request MUST be completed with VIRTIO_BLK_S_ZONE_OPEN_RESOURCE
> +or VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE value in the \field{status}.
>  
>  If the \field{sector} field in the VIRTIO_BLK_T_ZONE_APPEND request does not
>  specify the lowest sector for a zone, then the request SHALL be completed with
>  VIRTIO_BLK_S_ZONE_INVALID_CMD value in \field{status}.
>  
> -A VIRTIO_BLK_T_ZONE_APPEND request or a VIRTIO_BLK_T_OUT request that has the
> -data range that exceeds the remaining writable capacity for the zone, then the
> -request SHALL be completed with VIRTIO_BLK_S_ZONE_INVALID_CMD value in
> -\field{status}.
> +A VIRTIO_BLK_T_ZONE_APPEND request or a VIRTIO_BLK_T_OUT or VIRTIO_BLK_T_OUT_FUA
> +request that has the data range that exceeds the remaining writable capacity for
> +the zone, then the request SHALL be completed with VIRTIO_BLK_S_ZONE_INVALID_CMD
> +value in \field{status}.
>  
>  If a request of the type VIRTIO_BLK_T_ZONE_APPEND is completed with
>  VIRTIO_BLK_S_OK status, the field \field{append_sector} in
> @@ -1136,22 +1149,23 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>      VIRTIO_BLK_S_ZONE_INVALID_CMD \field{status}.
>  \end{itemize}
>  
> -If a VIRTIO_BLK_T_ZONE_APPEND request, a VIRTIO_BLK_T_IN request or a
> -VIRTIO_BLK_T_OUT request issued to a SWR zone has the range that has sectors in
> -more than one zone, then the request SHALL be completed with
> +If a VIRTIO_BLK_T_ZONE_APPEND, VIRTIO_BLK_T_IN, VIRTIO_BLK_T_OUT, or
> +VIRTIO_BLK_T_OUT_FUA request issued to a SWR zone has the range that has sectors
> +in more than one zone, then the request SHALL be completed with
>  VIRTIO_BLK_S_ZONE_INVALID_CMD value in the field \field{status}.
>  
> -A VIRTIO_BLK_T_OUT request that has the \field{sector} value that is not aligned
> -with the write pointer for the zone, then the request SHALL be completed with
> -VIRTIO_BLK_S_ZONE_UNALIGNED_WP value in the field \field{status}.
> +A VIRTIO_BLK_T_OUT or VIRTIO_BLK_T_OUT_FUA request that has the \field{sector}
> +value that is not aligned with the write pointer for the zone, then the request
> +SHALL be completed with VIRTIO_BLK_S_ZONE_UNALIGNED_WP value in the field
> +\field{status}.
>  
>  In order to avoid resource-related errors while opening zones implicitly, the
>  device MAY automatically transition zones in VIRTIO_BLK_ZS_IOPEN state to
>  VIRTIO_BLK_ZS_CLOSED state.
>  
> -All VIRTIO_BLK_T_OUT requests or VIRTIO_BLK_T_ZONE_APPEND requests issued
> -to a zone in the VIRTIO_BLK_ZS_RDONLY state SHALL be completed with
> -VIRTIO_BLK_S_ZONE_INVALID_CMD \field{status}.
> +All VIRTIO_BLK_T_OUT, VIRTIO_BLK_T_OUT_FUA, and VIRTIO_BLK_T_ZONE_APPEND
> +requests issued to a zone in the VIRTIO_BLK_ZS_RDONLY state SHALL be completed
> +with VIRTIO_BLK_S_ZONE_INVALID_CMD \field{status}.
>  
>  All requests issued to a zone in the VIRTIO_BLK_ZS_OFFLINE state SHALL be
>  completed with VIRTIO_BLK_S_ZONE_INVALID_CMD value in the field \field{status}.
> -- 
> 2.49.0
> 

