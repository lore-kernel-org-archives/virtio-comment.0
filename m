Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2254F21D
	for <virtio-comment@lists.linux.dev>; Thu, 28 Nov 2024 03:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732762928; cv=none; b=QIkSR4Wp8J2xPQ3aFFQJmpvRxzA4z/femp4LypF09l2xr1obxKpEeCxlZlAUNWYPzV/PspRnLRFi8dQwKrX8z8yJwzSCHqgz3wxi232QPItHWL281yZxSRGnVDEbfostciR3owV1BwNkeDBIDexshtTmgzesScwX/stF29eosPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732762928; c=relaxed/simple;
	bh=Z/k6YQxJaFpCQFSbGhk0u8r6TD1YHw9Z4LD+wvpnsiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tpl4BYX7Mc3+kMvRiDiv/z+2x9/b82ex2FiRCQx/OraaMwJSMVAgqJC7a4yN0a9d7AHXTYFZDN17QoO9FLqoRCkUwHlOdAMvoXmcMdFetXKMcwnoEUxHD1YNvXwAplXv6xv4+2tRwp/D8vquATCVYDeZSDzcrqaro1GZmkJ2CPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h2wP7yCH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h2wP7yCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732762925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0LM8CspGZTTgwEt6q9059jxeNRs92R2n2Lk2JmLeGXY=;
	b=h2wP7yCHViKHl6kfuvjNcabXvlOB/Ndz9SCnzD8KqRN0QCtejyBXG2p3PZvJVittSc7L7G
	1LR46Nt8u/UWqRsxlROom/ava9JdKTdM7fcmzib7WWW8EPhuMkhMRr15/JLMXY5p6IZTmv
	UAR2YcYKEyVqyHyVONkD4JJmSPrzB1A=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-69OEk32UO7SV0r-XkzWPeA-1; Wed, 27 Nov 2024 22:02:04 -0500
X-MC-Unique: 69OEk32UO7SV0r-XkzWPeA-1
X-Mimecast-MFC-AGG-ID: 69OEk32UO7SV0r-XkzWPeA
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2edba08c89bso462465a91.1
        for <virtio-comment@lists.linux.dev>; Wed, 27 Nov 2024 19:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732762923; x=1733367723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LM8CspGZTTgwEt6q9059jxeNRs92R2n2Lk2JmLeGXY=;
        b=gd+GVgoFAX/0D5fMepAsgyajbgPdNT4zKi1/vjWUPbwDFq4QQQPs5iB8p8hcUy3kam
         piutE49v8lRa1s8sEwLlmjva4pzFc/u/we6dcnwxs/IX01D0PzeWO5FS7eP4zZ8J/1Bw
         SE3NyIrDi8/2loEpuYPsmqXPv+jy7vBlee2hA7t4YbdpShkTu38A5EiLXnmSK5XUr0v5
         XEL6GpinPgjUZuoDuuGvJpJ3bRIfp457LXq54zt/JAGdsThBYh/GGS51dHENYJG+e4ak
         7K3iBD1iKFHuGRS0dnsKyZiiMkW857u0sgMfZojdBedhrtLB1niAcV9dSp/1oXP6WGwJ
         JuIQ==
X-Gm-Message-State: AOJu0YzQHBROIaYikzJxHNy81cGoOEr8aDKHxY3y3UHNOXSLf9Ap95lM
	O/Yu3FpBoht9TDTxCJ9ma4GxzEUimN+AIbV0vQAKWCKiJIDwzhBCeza/C5k4K3wc8eRiof7lyW+
	9hADPJxOTeuXzEHc+FuJ0hdvyh6istu2TYYEGyIjuFEMHGrK0fI+j3sGb27rZkFtBtxLTzff9TT
	HxkTr4sPO8GG8DOf4X4zvhAe2ydzZTNjRF1tIcTu4=
X-Gm-Gg: ASbGnctSuXqOdnb0sTuKpqE8AYA6PWmWwXfoSQUqUTnd7PCghJmc/PmuudQMMlCjfv4
	PEo/qYa3xd0/NwEoQHcctTC3cJU/nGY7d
X-Received: by 2002:a17:90b:3b87:b0:2ea:83a0:4792 with SMTP id 98e67ed59e1d1-2ee097bdd2emr5847965a91.28.1732762923416;
        Wed, 27 Nov 2024 19:02:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF61e8tXqmGTMDeOdiTmY5+G+yoOujMCp/hx7hL7WJjbLSkw5Rt5QpQtN9rWFO/qN+8le3/RRv6FXJa2Ji6OVw=
X-Received: by 2002:a17:90b:3b87:b0:2ea:83a0:4792 with SMTP id
 98e67ed59e1d1-2ee097bdd2emr5847942a91.28.1732762923006; Wed, 27 Nov 2024
 19:02:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1732699986.git.pabeni@redhat.com> <e87cf0c61f5ea3783cea0bcc4ea74f6e73f453d7.1732699986.git.pabeni@redhat.com>
In-Reply-To: <e87cf0c61f5ea3783cea0bcc4ea74f6e73f453d7.1732699986.git.pabeni@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Nov 2024 11:01:51 +0800
Message-ID: <CACGkMEt1BErtNXZTFUSOK5VSfZewY-56yN1=dFW7Vf-vhBMdNQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/4] virtio-net: define UDP tunnel checksum offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y4_AJCxpRuecyxvU-9z1h7BZzGkOAwSqUO7XCCoA6o8_1732762923
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 5:37=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> This complements the previous change, additionally
> introducing the UDP tunnel checksum offload feature.
>
> Differently from the plain checksum offload feature, this
> depends on UDP tunnel segmentation being available, as outer checksum
> computation for non GSO packets is cheap and H/W implementation of
> such a feature is complex.
>
> UDP tunnel checksum offload does not introduce additional fields,
> instead it leverages the outer transport offset introduced by the
> UDP tunnel segmentation feature to locate the outer checksum
> inside the packet.
>
> When UDP tunnel checksum offload is negotiated:
> - the driver requests the outer UDP checksum offload setting the
> VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the flag field. Such bit
> is not allocated inside the gso_type field to prevent space
> exhaustion there.
> - in the device -> driver direction, the VIRTIO_NET_HDR_F_DATA_VALID
> bit semantic is extended, covering both the inner and the outer
> checksum validation.
>
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---
> v10 -> v11:
>  - 'to the outer UDP pseudo header' -> 'to the outer UDP pseudo header
>    checksum'
>  - rebased on top of patch 2/4
>  - dropped trailing spaces
>
> v9 -> v10:
>  - DATA_VALID is not allowed for GSO over UDP tunnel packets
>  - fixed more typos:
>    VIRTIO_NET_HDR_GSO_UDP_TUNNEL -> either
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 or VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
>
> v8 -> v9:
>  - rebased on top of virtio-1.4, changed udp-tunnel features number
>    to avoid conflicts/duplications
>  - fixed typos:
>    VIRTIO_NET_HDR_F_UDP_TUNNEL -> VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM
>    VIRTIO_NET_HDR_GSO_UDP_TUNNEL -> either
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 or VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
>  - specified strict validation for the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM
>    bit, only allowed with UDP tunnel GSO packets.
>  - specified that VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM describe the outer
>    header csum offload for both in presence and absence of
>    VIRTIO_NET_HDR_F_DATA_VALID
>
> v7 -> v8:
>  - dropped confusing wording around csum validation
>  - clarified VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM allocation
>
> v6 -> v7:
>  - rebased
>  - VIRTIO_NET_F_{HOST,GUEST}_UDP_TUNNEL_CSUM -> ...UDP_TUNNEL_GSO_CSUM
>  - dropped unintended change to existing TCP gso spec
> ---
>  device-types/net/description.tex | 143 ++++++++++++++++++++++++++++---
>  1 file changed, 131 insertions(+), 12 deletions(-)
>

Reviewed-by: Jason Wang <jasowang@redhat.com>

Thanks

