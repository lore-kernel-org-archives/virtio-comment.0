Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BF41C1F22
	for <virtio-comment@lists.linux.dev>; Tue, 20 May 2025 00:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747702235; cv=none; b=kS/G60+crDy6q8ovIWwsNHUNGNO/ZZLcLe+Q294aYGw1TMORN8ZJUHym5GPm656n69isfeAroxJqLb8+A+85HqOzg70lR46z7RE/vowWgJ7MJMcGxYXQfuZheEiy1/ytM2ERCIw0l/tbHc3FbgrXzRxhXXgZxsMF8NGgpHDe0FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747702235; c=relaxed/simple;
	bh=QeG3v+Vuz/OcFb9H5C8p0MdRDXZVpbXNtYZ3tp1cqwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKhZMGjpo0cCPtA8MyIIAbnF2r+r8nl/H0AQB0rVDtZhFOny1de55aHgMTJrJ1h3+kL919X4WEQ8dcILUXkP7AgAvyTnClYGQfWp243qsCz2JZ5BbtD96OeME+a13/O8sd1GLgCAOXeLp3wDSYXGkiqp+ONl/yO/iagwOY+uc7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ODhI6QTS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ODhI6QTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747702231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iz7afip4uiYj75Gicm+DeNU/m6+GKm//ZhQELtLFQYE=;
	b=ODhI6QTS0x4QOBOUsc7Mzht5MnwC/sqChbjZSO2EGDOr5Sh/6fuh7FVxnCkNhax8+/9WLm
	whQpF8UKVafqkhY7AON9pNrDg4I12GRWpF+Ong+afftu+cfXfFFsYSkNwNbdz9xTVGBXO5
	pNCGeB2mhVkodLOuxoH0Lno49+KvS40=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-mWdCFRfTNwmIDNwmHklIkQ-1; Mon, 19 May 2025 20:50:30 -0400
X-MC-Unique: mWdCFRfTNwmIDNwmHklIkQ-1
X-Mimecast-MFC-AGG-ID: mWdCFRfTNwmIDNwmHklIkQ_1747702229
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30e82e16f7fso3124244a91.1
        for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 17:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747702229; x=1748307029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iz7afip4uiYj75Gicm+DeNU/m6+GKm//ZhQELtLFQYE=;
        b=MBO0NrYFo71z5QiRj0HfaB/hnU52t6Ce1X3ZJ+fXeVYoI26UkNLB874ZwQ++tpBz04
         l90QlKCKFfCZKF+2T593M2rppoNicjSfiOAC25sdVzqz0m6OYUbPlsfTYL1KO/V4QzBl
         W77OUd5hQP/wsLrKfWGZoOCTnj0gIMMYRfyBt1Y9CvlnaNCbUHHEsKqMKloLfN3xbixN
         AnMpka8mL3Taqd9AFlSWkwaNStey3VhId2T/u8Z0zaMEQlxzHzh+kA9UqJOuXQ8A0Tu7
         RKeOfFAxejalstczaqF+/Sf0S0CUPZGfFwe2O0Ni09ytFKrl/LqohI4hXDI24C6duW6y
         hPcA==
X-Gm-Message-State: AOJu0YxU/cySL8ISmqLDisRvA+TVsMpvtP0pu0sCN6gQbXXfOHPjllhI
	ur+MNvApT/KpzWzkWO8uCptu+ZQeVz1mGOu29d1JOshE+xU6+zE6AQJ9BViYciEA9AZ4q38+hEX
	6QcVY7VSdtAoNzCI+WLLqhvUQJH2rIoBF05iPvbt6BMWvNVz7m/NtRErPqcrVa5ejoiR2hDKeIm
	IJYYgIm1ScH5lft/iBDZrQZfmTC4hEdw2FuIOpA6WYk24=
X-Gm-Gg: ASbGncv/iJXwX97fG3LU6f8gWkQYV1PsMF09Xg8usGSnKieQjD9h4DUujRLZKGvnrfN
	WWYkB5Rfaf2BqIEkqBCeF8x5axLSY/BC+JVMmEjvRhJsk0TdUiwKWDMznrS+C8evvqkSW7Q==
X-Received: by 2002:a17:90b:35d2:b0:30e:5c74:53c9 with SMTP id 98e67ed59e1d1-30e7e77081cmr24045115a91.11.1747702229390;
        Mon, 19 May 2025 17:50:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmVXk2H9byXJp2tzhB/uymNTevhdV8wAphEjgJbSIoBrbOVup+0DUlMO9G+pZOEP2qxC2oK1ajeVB1hM3rI7I=
X-Received: by 2002:a17:90b:35d2:b0:30e:5c74:53c9 with SMTP id
 98e67ed59e1d1-30e7e77081cmr24045069a91.11.1747702228873; Mon, 19 May 2025
 17:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a30de484ff56065f56e37446e08dcdfa4850f101.1747649330.git.pabeni@redhat.com>
In-Reply-To: <a30de484ff56065f56e37446e08dcdfa4850f101.1747649330.git.pabeni@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 20 May 2025 08:50:17 +0800
X-Gm-Features: AX0GCFsq9D2THDoDWIfbCcsrQsQejpbQZGpVJN7PonP_N6VZ5nGvLy7QwK9_wnI
Message-ID: <CACGkMEvyLNKn7_-bfXAEog5vMK9yz7Ms__HUTjH6cy+tdfHA+g@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: clarify guest offloads <> features mapping
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, Willem de Bruijn <willemb@google.com>, mst@redhat.com, 
	Parav Pandit <parav@nvidia.com>, mvaralar@redhat.com, cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LBN4RP8hzOE0f11tHo-GsIGjTPcm5l4ZLmYmSbd6lJw_1747702229
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 6:12=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> The guest offloads, as specified by 'Setting Offloads State,' use a
> 64-bit wide space, while some of the corresponding virtio net features
> are in the upper 64 bits of a 128-bit wide space.
>
> Clarify the relevant mapping as somewhat implied by the current text.
> Also rename the offload definitions to avoid referring to different
> numeric values with the same name in the features table and in the
> offload table.
>
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---
>  device-types/net/description.tex | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index 1b6b54d..8c501bc 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -2186,8 +2186,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
>  #define VIRTIO_NET_F_GUEST_TSO6       8
>  #define VIRTIO_NET_F_GUEST_ECN        9
>  #define VIRTIO_NET_F_GUEST_UFO        10
> -#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
> -#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
> +#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_MAPPED  46
> +#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM_MAPPED 47

As the introduction of more offload features in the future, I wonder
if it's better to just avoid reusing feature names here.

For example, rename all here to something like

VIRTIO_NET_CTRL_GUEST_OFFLOAD_TSO6
...

Or introduce a new command to be as wide as the feature bits.

>  #define VIRTIO_NET_F_GUEST_USO4       54
>  #define VIRTIO_NET_F_GUEST_USO6       55
>
> @@ -2205,6 +2205,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
>  negotiation corresponding offload gets enabled to preserve backward
>  compatibility.
>
> +Note that device features bits in the [65 to 68] range correspond to
> +offload bits in the [46 to 49] range.
> +
>  \drivernormative{\subparagraph}{Setting Offloads State}{Device Types / N=
etwork Device / Device Operation / Control Virtqueue / Offloads State Confi=
guration / Setting Offloads State}
>
>  A driver MUST NOT enable an offload for which the appropriate feature
> --
> 2.49.0
>

Thanks

