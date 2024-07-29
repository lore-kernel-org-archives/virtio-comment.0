Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C769840BF2
	for <virtio-comment@lists.linux.dev>; Mon, 29 Jul 2024 21:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722287092; cv=none; b=bakSmvvKlhYg+caUR/DaCLcmpanuIDlv9HFw5oyEhiHauDHC6hfVakG8z0vx/6Wvpt//tuzLouCrK/glxxEexCcPtNXaiq1AP5elRGZ8cvZ9MTfI4/P/sk1iYhNi6/so00AKpIWO8FYATUCGs+fcmX6KafD8wPpZXMXQip7nY9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722287092; c=relaxed/simple;
	bh=kmhuZkyzNEhBOR1d0qK4q5+7vuB+ENABOpkn+oU0jn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2Xhnid8Mz0DqinuWxQz6EY5bkHH+kwju0uO0df901Ne5+i/1zZc1Kiatqb/Q1ew25+pnPCH6c611g5jedO+2RXREQmH8qY30C3ObWhhzlO5/E+jU1y1VHnVoclIuhNMhob5dPHaE8O8PZkTpNxZDOkJG0WqvV/PRppfjX2InxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YWjc4edw; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YWjc4edw"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-44fe76fa0b8so99761cf.0
        for <virtio-comment@lists.linux.dev>; Mon, 29 Jul 2024 14:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722287090; x=1722891890; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vZxDUnn+jcBNOqrA2wqV5yVtMCySodOKLcwl5jnC0w=;
        b=YWjc4edwBJktSMJ5qti6NhjwcICfCCLEoRn/QdImG2/+LeQWQIxUm7Dvxvf0I1Dx9E
         cUXw6e7zqWoIiRBasUl1GhfTzlm9t7wONnwVtLsPvKQdszD26rBAcOCF0tHj18f14ng/
         sTjmTXOHyxMQIexWu3Mjedbtna0b5KErlgMhf9cb3+6r96A8TMzu+tO77RDeiPo43OEx
         JyrmFOD/laqLTGyydOdow9LJ9ck/3DG7qdQ4fTRlX2uikee0k2NyzqVSTbsL7d+rnvI+
         aQDt2Omi2i9b9s2PA3ePrjcXZYKYAITCX0lpMBzV/9vlkHRHx0XJCMPB8VKdMMj/tkGG
         8Reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722287090; x=1722891890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vZxDUnn+jcBNOqrA2wqV5yVtMCySodOKLcwl5jnC0w=;
        b=FPQI0MuSa06EmynLa1JJJ8KkpjOPp2anNDTQ81mIeh3JdZqzdOq7iJ9YnWyIapF42Z
         DjXvugk2iKa20e7ovmilWNuay2Em7GK81876ldzT/QJJpFdw9OxVQ89k41D5jMHWX/3c
         PXxmZ3zcTh0vjpez/WjSXtG2IMVttowv2Is3FIVV+1IyMjAmC+UDu5mOGpZLTH+9DknV
         0VN4Yzw9K1s6tXfk+G94c2QSVOENZ3guRL1ViiVtyD2WdrRbj2YWE+uDgpjcTHLWVgkv
         ldRKAN6vx99Qy2hj0UDtB9UolpP5fOoCm5287mZKI6P0meYlm3IMt5fLeBw+8P82fyLq
         uRmQ==
X-Gm-Message-State: AOJu0Yw87u+INiz/rCbFgDKo4egWQo/nxfGwf61cq5BHNuglB0Hsc3OC
	h1MUKrsGQIp/6tul6qk9UMfiQWE/q7fT1lpBYvFrOEgxSFCiBNnp0n1H36n2NL8vHOtXBVpg92l
	8vKolkAyOCoWShIBOarjrF0c/Y3pC4nwK1B+8
X-Google-Smtp-Source: AGHT+IGnf2UIaxK93pEauZGuhwc2MDb4GymYybq3a14qbj5FFOwofLLk9pwgywioqxjn9mD/h1piZDoUL6fsXGygB98=
X-Received: by 2002:a05:622a:2d4:b0:447:e01a:de95 with SMTP id
 d75a77b69052e-4503614adabmr159751cf.0.1722287089514; Mon, 29 Jul 2024
 14:04:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1722252302.git.pabeni@redhat.com> <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
In-Reply-To: <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Mon, 29 Jul 2024 17:04:13 -0400
Message-ID: <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 7:30=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> The VIRTIO_NET_HDR_GSO_UDP_TUNNEL is a gso_type flag allowing GSO over
> UDP tunnel. It can be negotiated on both the host and guest sides.
>
> One constraint addressed here is that the virtio side (either device or
> driver) receiving a UDP tunneled GSO packet must be able to reconstruct
> completely the inner and outer headers offset - to allow for later GSO.
>
> To accommodate such need, new fields are introduced in the virtio_net
> header: outer_th_offset, inner_protocol_type and inner_nh_offset.
> They map directly to the corresponding header information. The inner
> transport header is implied by the (inner) checksum offload.
>
> Those fields are required because a virtio device H/W implementation
> performing segmentation for UDP tunneled packet will need to touch
> the outer transport protocol (for the UDP length filed), the
> inner network protocol (for the total length field, in the IPv4
> case).
>
> Note that segmentation will additionally need to touch
> the outer network protocol and the inner transport protocol. The first
> is implied/easily found with trivial parsing, the latter is identified
> by the existing csum_start field.
>
> Note that there is no concept of UDP tunnel type negotiation (e.g.
> vxlan, geneve, vxlan-gpe, etc.), as a virtio device H/W implementation
> can perform segmentation for every possible UDP-tunnel given the
> specified new fields.
> In the reverse direction, if a virtio device H/W implementation receives
> some traffic for an unknown or unsupported UDP tunnel, it will simply
> not aggregate the wire packet in GSO one.
>
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>

Overall this looks good to me. Thanks for splitting the patches.

You have a working software implementation, right? Will this be sent
(as RFC) to the public netdev or so mailing list before this becomes a
standard? I assume that there is a standard process for virtio that
you are following. I'd just be more confident in a thumbs up if we
also review the code that implements the text.

> @@ -423,6 +441,9 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Network Device / Device O
>          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
> +        le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O negotiated)
> +        le16 inner_protocol_type;(Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_G=
SO negotiated)
> +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O negotiated)
>  };

In relation to the above: I recall that expanding the virtio_net_hdr
was non-trivial when I last tried to add fields ("[rfc,2/3]
virtio-net: support receive timestamp"). If that is the experience
again, it might be worthwhile to expand with enough space to also
accommodate a few subsequent extensions. Headroom is not that
expensive.

> +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feat=
ure,
> +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} indicates th=
at
> +  the GSO protocol is encapsulated in a UDP tunnel.
> +  The outer UDP header must not require checksumming, e.g. the outer UDP=
 checksum
> +  must be zero.

nit: "e.g." should be "i.e.," here

and maybe must be a positive zero (0x0) checksum as defined in UDP RFC 768.

> +If the bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type} is set, the=
 outer
> +UDP header MUST NOT require checksumming. That is the, the outer UDP che=
cksum
> +value must be 0, or the valid complete checksum for such header.

MUST NOT require checksum validation. [..] or the validated complete checks=
um

(nit-picking at this point, all are suggestions, feel free to ignore).

> +
> +\begin{note}
> +The valid complete checksum of the outer UDP header of individual segmen=
ts
> +can be computed by the driver prior to segmentation only if the GSO pack=
et
> +size is a multiple of \field{gso_size}.
> +\end{note}

Might be helpful to explain why. E.g., ", because then all segments
have the same size and thus all data included in the outer UDP
checksum is the same for every segment. These pre-computed segment
length and checksum fields are different from those of the GSO
packet."
