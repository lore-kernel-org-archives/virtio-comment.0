Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BF2136A
	for <virtio-comment@lists.linux.dev>; Wed, 19 Feb 2025 03:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739935845; cv=none; b=CuFnycIp5SzpE4CQmvjcIvCU9D/NSgMP9h5hjbW9whbAKZWIeC7tL2tQy8XnaCZ+C9iy3v6IOSbcpZptUEXI91MRSPcjzMCF+mOyMd897rgUHrWqz+3hrRqoGSyL1vF7C9AeWpg/XKrWpCHhqjFxkf9yTzJTjIS7PcucNOqV2xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739935845; c=relaxed/simple;
	bh=6wVxkKeKMC+zw84cLlBavzFKd3xPPldqyipt1NAYfno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLF6SgBbPTW74+2h+f7eCASdSRGzCkr8wV4CLu6VpLYqyAjVxvCZ8h12KN/4NWVnwLuc/RFEuknZheBOlE9c11k9FLOtug6MCeWaAnc5EXdl5MFo9rXThPlUg9pJjrRKsg6KZr4QcAgHFTIYAq5Hsv2pUsU6AXmql+PvBsjqrbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g/Dawo57; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g/Dawo57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739935842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zigqCpy7zfwNUyikkFMtN6+3UAjPGVRrz1QTs/9pDF4=;
	b=g/Dawo57O03ZGI6bbi0QGqxGm6u1aEBe2uiq4f4pQvq1jHKqM5YUz3MixEzo5Akti72Ghm
	rNHys8I7n/iDcMSOGz9tNDYxfGQPZELxqgfurbm9Zz5c9IZndlFAVx8D9fN2UBxyKChcQb
	V7eX6INq1iIOf8ncwQTAOCWMckOXC28=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-Zbxxs2_kNJa6H14a5ioaWw-1; Tue, 18 Feb 2025 22:30:41 -0500
X-MC-Unique: Zbxxs2_kNJa6H14a5ioaWw-1
X-Mimecast-MFC-AGG-ID: Zbxxs2_kNJa6H14a5ioaWw_1739935840
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220e62c4f27so138245455ad.0
        for <virtio-comment@lists.linux.dev>; Tue, 18 Feb 2025 19:30:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739935840; x=1740540640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zigqCpy7zfwNUyikkFMtN6+3UAjPGVRrz1QTs/9pDF4=;
        b=XT6Fvip+DE+sdpA4tDkR/XCQ7QbCb/O8SbmTGk+zPZcgWchMEdunu1yfSb6AUag3Zp
         gkMjng6HKLZDQzTXWofa+n5A3qI3WOCaDPPV7nbLIcpNI84Yr6w37RTYIcdblJVA13/s
         lXTwuIZhqkT3QD+jNzW0ypCGIizQVb+E3FiABsXnoga+3+9wK6iuNXzcX/4sY0gN9+i4
         itErz4NCrBSZWpHAfrRvYYWLd/7xE1Gv6EPQThKhNR8lRjA5qa1JwrXs40uWh3daLwDN
         pllFDt6TvUA0Qk6jNdCkLpG1FKZgdn74rlxSeoozwwm7va3/qC0U6VnfrSOIFib9T28H
         7UFA==
X-Forwarded-Encrypted: i=1; AJvYcCWK4PtXVUqBQf224L8GjoRCw7uR5q63nF3MkqEiqL4GZ4W/NKWQzhvtJgr++pcAmxDLklel/6tEBtihXo5tKA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/0VNE2tkMHtSvuxqTBvHkACXEoID4Z/cLxrpkDgilfHhOrDKi
	2nZuUK/wR+imgZA+gIg4iluhOmIuX+K4/PMgorwLV6MStxK0Dwjz7TZxYEgmRMt/Nm9Y4oN7Yb2
	ZatsBoSwGth9RrX07La7rGoVvEjYcNWp3QBHbPuDTHMZBx2W8IZplZArMi97n+jZuHf10nJjEtT
	40sRPsNNtKzzaBkHUnZ5EIUGbX7LP4/33lSzjxYko=
X-Gm-Gg: ASbGncu4mMENIp11n3KWQaWqtswb9n6aEq1aBrn00GbA4n5+w5D5WU8FwGfU24Mfn5L
	jBtMixr+3Id+wCIvY66Q2GbGotBj0gFvTVIShp1XKmDjM3gxWV7IBM8lS1OFY1Zg=
X-Received: by 2002:a17:902:dac2:b0:220:ff93:e12e with SMTP id d9443c01a7336-2217055f596mr37409995ad.1.1739935840262;
        Tue, 18 Feb 2025 19:30:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQm/FFqhzscEOAF8OuS4cxoIEeNMbPBpCWWNG/dqr2qdHZ24LENRRX3nh4t5WcAM8Gtg8JDC00d3nYO8KwO9Y=
X-Received: by 2002:a17:902:dac2:b0:220:ff93:e12e with SMTP id
 d9443c01a7336-2217055f596mr37409675ad.1.1739935839880; Tue, 18 Feb 2025
 19:30:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217172509.107212-1-kshankar@marvell.com>
In-Reply-To: <20250217172509.107212-1-kshankar@marvell.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 19 Feb 2025 11:30:28 +0800
X-Gm-Features: AWEUYZmoihJML-W3ZrUwwCFmLbBQHdsnXmKkIQeOdEOFxuCSJ1SLI7WQMtrZa6I
Message-ID: <CACGkMEubUH6YtZHK7sEjj6fvWZ5_k0rQ9H6U2Li4GP0Txi-yJA@mail.gmail.com>
Subject: Re: [PATCH v3] virtio-net: Introduce a new field to indicate outer
 network header offset
To: Kommula Shiva Shankar <kshankar@marvell.com>
Cc: pabeni@redhat.com, willemb@google.com, parav@nvidia.com, 
	virtio-comment@lists.linux.dev, ndabilpuram@marvell.com, jerinj@marvell.com, 
	rbhansali@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u6rY8_z7t_Ust9DN8Q6UvBvkravh7NtFWBhpIEu7Z8g_1739935840
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 1:25=E2=80=AFAM Kommula Shiva Shankar
<kshankar@marvell.com> wrote:
>
> This patch introduces a new field in the virtio_net_header called out_nh_=
offset, along with a new net device feature, VIRTIO_NET_F_OUT_NET_HEADER.
>
> Currently, drivers lack a dedicated field to signal the start of the netw=
ork header to the device when performing checksum offload
> and segmentation offload. This requires reading packet, which significant=
ly affects performance in datapath.
> Additionally, some hardware implementations requrie knowledege of the out=
er L3 offset (aka L2 length) for inline IPSec hardware acceleration.
>
> To address this limitation, we propose splitting the csum_offset field in=
to two 8-bit fields named csum_offset and out_nh_offset.
> The csum_offset indicates the offset value from the csum_start and  may n=
ot exceed 256B bits(2^8) for protocols that use a 16-bit one's complement c=
hecksum
>
> Following table lists such protocols and their checksum offset fields wit=
hin their headers
>
> +-----+--------+
> |Proto|csum_off|
> +-----+--------+
> | IPV4| 10B    |
> | ICMP| 2B     |
> | IGMP| 2B     |
> |  TCP| 16B    |
> |  UDP| 6B     |
> +-----+--------+
>
> The out_nh_offset represents the start byte offset of the outer network h=
eader from the beginning of the packet
>
> This issue was briefly discussed on the mailing list in a different threa=
d, which can be found here
> https://lore.kernel.org/all/DM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2@DM4PR1=
8MB4269.namprd18.prod.outlook.com/
>
> v2 -> v3:
>  - Rebase to virtio-1.4
>  - Addressed pending review commnets related to wording.
>
> v2 - https://lore.kernel.org/all/20250128142152.3662988-1-kshankar@marvel=
l.com/
>
> v1 -> v2:
>  - explicitly state that the out_nh_offset can be set only when a valid n=
etwork header is present.
>  - updated out_nh_offset usage in the RX direction.
>  - minor word cleanup.
>
> v1 - https://lore.kernel.org/virtio-comment/20250114171636.3175670-1-ksha=
nkar@marvell.com/
>
> Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
> ---
>  device-types/net/description.tex | 37 ++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index b546cd7..2a4aa66 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -136,6 +136,10 @@ \subsection{Feature bits}\label{sec:Device Types / N=
etwork Device / Feature bits
>
>  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
>    carried by a UDP tunnel with partial csum for the outer header.
> +
> +\item[VIRTIO_NET_F_OUT_NET_HEADER(69)] Driver can provide the start of \=
field{out_nh_offset}
> + value. Device gains advantage by not reading packet to calculate outer =
network
> + header offset
>  \end{description}
>
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Networ=
k Device / Feature bits / Feature bit requirements}
> @@ -592,6 +596,13 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Network Device / Device O
>          le16 hdr_len;
>          le16 gso_size;
>          le16 csum_start;
> +        union {
> +                le16 csum_offset;
> +                struct {        /* Only if VIRTIO_NET_F_OUT_NET_HEADER n=
egotiated */
> +                        le8 csum_offset;
> +                        le8 out_nh_offset;

Need some explanation why reusing csum_offset is better than
introducing new fields.

> +                };
> +        };
>          le16 csum_offset;

It seems like it needs to be removed.

>          le16 num_buffers;
>          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)

Thanks

